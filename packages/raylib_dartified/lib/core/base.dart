part of 'raylib_dartified.dart';

/// Global configuration for `raylib_dartified` package family.
///
/// Provides configurable limits and defaults used by the library's temporary
/// memory allocators, struct handling, and Raylib integration.
///
/// Unless otherwise documented, values should be configured before initializing `Raylib`.
final class RaylibConfig {
  /// Maximum vertex buffers (VBO) per mesh.
  ///
  /// **MUST MATCH** `MAX_MESH_VERTEX_BUFFERS` in the compiled raylib.
  ///
  /// Defaults to `7`, which means GPU skinning is not supported.
  static int maxMeshVertexBuffers = SUPPORT_GPU_SKINNING ? 9 : 7;

  /// Whether GPU skinning is supported by the configured mesh vertex buffer
  /// limit.
  static bool SUPPORT_GPU_SKINNING = false;
}

enum RaylibSupportedLibs {
  raylib('raylib'), // core (raylib repo)
  raygui('raygui'), // external (different repo)
  msf_gif('msf_gif'); // external (file within raylib repo)

  const RaylibSupportedLibs(this.id);
  final String id;

  static RaylibSupportedLibs? byId(String id)
    => values.where((e) => e.id == id).firstOrNull;
}

/// What differs per platform.
abstract interface class RaylibBackendImplementation {
  /// Native: calls [ready] immediately. Web: calls it once `dartMain` fires.
  void start(Raylib rl, Map<RaylibSupportedLibs, XLibrarySource?> libs, void Function() ready);

  /// Register platform-specific modules (after boot).
  void registerModules(Raylib rl);

  /// Drives [tick] until it returns false.
  Future<void> loop(Future<bool> Function() tick);
}

/// Root class for a fully initialized Raylib context, exposing all modules,
/// extensions, lifecycle management, and forwarded constants and functions.
final class Raylib extends XPackage {
  static Raylib? _instance;

  static Raylib get instance
    => _instance ?? (throw StateError('Raylib not initialized.'));

  final RaylibBackendImplementation backend;

  /// Random number generator used by [rand] and [randC].
  math.Random random;

  Raylib({
    math.Random? random,
    super.silent = false,
    Map<RaylibSupportedLibs, XLibrarySource?> libs = const {},
    void Function(Raylib)? main,
  }) :
    random = random ?? .new(),
    backend = createBackend()
  {
    if (_instance != null) throw StateError("There can only be one instance of $runtimeType!");
    _instance = this;

    onBoot = () {
      bootMemoryBackend();
      _registerStructs();
      _registerSharedModules();
    };

    backend.start(this, libs, () {
      boot();
      backend.registerModules(this);
      main?.call(this);
    });

    listenOnDispose(() => XTemp.instance.dispose());
  }

  void _registerSharedModules() {
    // extensions
    registerModule(RaylibEaseExtDart(this));
    registerModule(RaylibQuaternionExtDart(this));
    registerModule(RaylibMatrixExtDart(this));
    registerModule(RaylibVector2ExtDart(this));
    registerModule(RaylibVector3ExtDart(this));
    registerModule(RaylibVector4ExtDart(this));

    // core modules
    registerModule(RaylibAudioDart(this));
    registerModule(RaylibCameraDart(this));
    registerModule(RaylibCoreDart(this));
    registerModule(RaylibLightDart(this));
    registerModule(RaylibRlglDart(this));

    // external modules
    registerModule(RaylibGuiDart(this));
    registerModule(RaylibMsfGifDart(this));
  }

  void _registerStructs() {
    XStructDefinitions.register(float3.struct);
    XStructDefinitions.register(float16.struct);

    XStructDefinitions.register(AutomationEventList.struct);
    XStructDefinitions.register(AutomationEvent.struct);
    XStructDefinitions.register(AudioStream.struct);
    XStructDefinitions.register(BoneInfo.struct);
    XStructDefinitions.register(BoundingBox.struct);
    XStructDefinitions.register(Camera2D.struct);
    XStructDefinitions.register(Camera3D.struct);
    XStructDefinitions.register(Color.struct);
    XStructDefinitions.register(FilePathList.struct);
    XStructDefinitions.register(Font.struct);
    XStructDefinitions.register(GestureEvent.struct);
    XStructDefinitions.register(GlyphInfo.struct);
    XStructDefinitions.register(Image.struct);
    XStructDefinitions.register(Light.struct);
    XStructDefinitions.register(MaterialMap.struct);
    XStructDefinitions.register(Material.struct);
    XStructDefinitions.register(Matrix.struct);
    XStructDefinitions.register(Mesh.struct);
    XStructDefinitions.register(ModelAnimation.struct);
    XStructDefinitions.register(ModelSkeleton.struct);
    XStructDefinitions.register(Model.struct);
    XStructDefinitions.register(Music.struct);
    XStructDefinitions.register(NPatchInfo.struct);
    XStructDefinitions.register(Quaternion.struct);
    XStructDefinitions.register(RayCollision.struct);
    XStructDefinitions.register(Ray.struct);
    XStructDefinitions.register(Rectangle.struct);
    XStructDefinitions.register(RenderTexture.struct);
    XStructDefinitions.register(RlDrawCall.struct);
    XStructDefinitions.register(RlRenderBatch.struct);
    XStructDefinitions.register(RlVertexBuffer.struct);
    XStructDefinitions.register(Shader.struct);
    XStructDefinitions.register(Sound.struct);
    XStructDefinitions.register(Texture.struct);
    XStructDefinitions.register(Transform.struct);
    XStructDefinitions.register(Vector2.struct);
    XStructDefinitions.register(Vector3.struct);
    XStructDefinitions.register(Vector4.struct);
    XStructDefinitions.register(VrDeviceInfo.struct);
    XStructDefinitions.register(VrStereoConfig.struct);
    XStructDefinitions.register(Wave.struct);

    XStructDefinitions.register(MsfGifResult.struct);
    XStructDefinitions.register(MsfGifState.struct);
  }

  /// Calls [RaylibCoreDart.CloseWindow] and [dispose].
  void CloseWindowAndDispose() {
    module<RaylibCoreDart>().CloseWindow();
    dispose();
  }

  /// Returns a random `double` in `[0.0, 1.0)`.
  double rand() => random.nextDouble();

  /// Returns a random `double` in `[0.0, RAND_MAX)`, mirroring C's `rand()` range.
  double randC() => rand() * RaylibConstants.RAND_MAX;

  static String glslVersion = switch (currentMemoryPlatformType) {
    .native => '330',
    .web => '330es',
  };
}

/// Platform-agnostic app lifecycle interface for Raylib applications.
///
/// Implement this to define your app logic independently of the backend.
/// Each backend provides its own [RaylibApp] subclass
/// and [runRaylib] function that drives the lifecycle in a platform-appropriate way.
///
/// The expected call order is:
/// 1. [init] = set up your app state and call [RaylibCoreDart.InitWindow]
/// 2. [loop] = called every frame
/// 3. [close] = called when [shouldClose] returns `true`; call [RaylibCoreDart.CloseWindow] here
/// 4. [dispose] = release Dart-side resources
abstract class RaylibApp {

  /// Called once before the app loop starts.
  ///
  /// Use this to initialize app state and open the window via
  /// [RaylibCoreDart.InitWindow].
  void init(Raylib rl);

  /// Returns `true` when the app loop should stop.
  /// 
  /// Branches on `currentMemoryPlatformType`.
  /// WASM has no exit condition of its own (the browser owns the loop) and `WindowShouldClose`
  /// should not be called in WASM backend, so this one check is the honest boundary
  /// of "agnostic" rather than a leak in the abstraction.
  ///
  /// Defaults to
  ///   - [RaylibCoreDart.WindowShouldClose] (on native)
  ///   - `false` (on web)
  /// 
  /// Override to implement custom exit conditions.
  bool shouldClose(Raylib rl) => switch (currentMemoryPlatformType) {
    .native => rl.module<RaylibCoreDart>().WindowShouldClose(),
    .web => false,
  };

  /// Called once per frame while [shouldClose] returns `false`.
  Future<void> loop(Raylib rl);

  /// Called once after [shouldClose] returns `true`.
  ///
  /// Defaults to [RaylibCoreDart.CloseWindow]; override to perform
  /// additional cleanup before the window closes.
  void close(Raylib rl) => rl.module<RaylibCoreDart>().CloseWindow();

  /// Called after [close] to release any remaining Dart-side resources.
  ///
  /// Defaults to [Raylib.dispose].
  void dispose(Raylib rl) => rl.dispose();
}

/// Runs [app] on the active raylib backend until it closes.
///
/// [nativeLibPath] is only used on native; ignored on web.
/// Set [silent] to suppress raylib's init/dispose log output.
Future<void> runRaylibApp(RaylibApp app, {
  String? nativeLibPath,
  bool silent = false,
}) {
  final done = Completer<void>();

  Raylib(
    silent: silent,
    libs: resolveRaylibLibs(nativeLibPath),
    main: (rl) async {
      try {
        app.init(rl);
        await rl.backend.loop(() async {
          if (app.shouldClose(rl)) return false;
          await app.loop(rl);
          return true;
        });
        app.close(rl);
        app.dispose(rl);
        done.complete();
      } catch (e, s) {
        done.completeError(e, s);
      }
    },
  );

  return done.future;
}

final class _RaylibAppDirect extends RaylibApp {
  final void Function(Raylib rl) initFn;
  final bool Function(Raylib rl)? shouldCloseFn;
  final Future<void> Function(Raylib rl) loopFn;
  final void Function(Raylib rl)? closeFn;
  _RaylibAppDirect(this.initFn, this.shouldCloseFn, this.loopFn, this.closeFn);
  @override void init(Raylib rl) => initFn(rl);
  @override bool shouldClose(Raylib rl) => shouldCloseFn?.call(rl) ?? super.shouldClose(rl);
  @override Future<void> loop(Raylib rl) async => loopFn(rl);
  @override void close(Raylib rl) { if (closeFn != null) { closeFn!(rl); return; } super.close(rl); }
}

Future<void> runRaylib({
  required void Function(Raylib rl) init,
  bool Function(Raylib rl)? shouldClose,
  required Future<void> Function(Raylib rl) loop,
  void Function(Raylib rl)? close,
  String? nativeLibPath,
  bool silent = false,
}) {
  final done = Completer<void>();

  Raylib(
    silent: silent,
    libs: resolveRaylibLibs(nativeLibPath),
    main: (rl) async {
      final app = _RaylibAppDirect(init, shouldClose, loop, close);
      try {
        app.init(rl);
        await rl.backend.loop(() async {
          if (app.shouldClose(rl)) return false;
          await app.loop(rl);
          return true;
        });
        app.close(rl);
        app.dispose(rl);
        done.complete();
      } catch (e, s) {
        done.completeError(e, s);
      }
    },
  );

  return done.future;
}