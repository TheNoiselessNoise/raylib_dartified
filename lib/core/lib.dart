part of 'raylib_dartified.dart';

class Raylib extends RaylibBase {
  static Raylib? _instance;
  static Raylib get instance {
    if (_instance == null) throw StateError('Raylib not initialized.');
    return _instance!;
  }

  Logger logger = Logger.detached('Raylib');

  @override
  void logInfo(Object? message) => logger.info('[Raylib] $message');
  
  @override
  void logWarn(Object? message) => logger.warning('[Raylib] $message');
  
  @override
  void logError(Object? message) => logger.severe('[Raylib] $message');

  @override late RaylibTemp Temp;
  @override late RaylibColors Color;
  @override late RaylibEasings Ease;
  @override late RaylibQuaternions Quat;
  @override late RaylibMatrices Matrix;
  @override late RaylibVectors Vector;

  late RaylibAudio Audio;
  @override late RaylibAudioD AudioD;
  late RaylibCamera Camera;
  @override late RaylibCameraD CameraD;
  late RaylibCore Core;
  @override late RaylibCoreD CoreD;
  
  // NOTE: external modules may not be initialized at all
  //       If you try to use anything from rl.Gui.* and your dynamic library was not loaded:
  //       LateInitializationError: Field 'Gui' has not been initialized.
  //       That's expected behavior!
  late RaylibGui Gui;
  @override late RaylibGuiD GuiD;
  
  late RaylibLight Light;
  @override late RaylibLightD LightD;
  late RaylibRlgl Rlgl;
  @override late RaylibRlglD RlglD;
  @override late RaylibUtils Utils;

  late final DynamicLibrary _dynCore;
  RaylibLookup get coreLookup => _dynCore.lookup;

  late final DynamicLibrary? _dynGui;
  RaylibLookup get guiLookup => _dynGui!.lookup;

  Raylib({
    required String core,
    String? gui,
    super.tempOptions,
    super.random,
  }) {
    _dynCore = .open(core);
    _dynGui = gui != null ? .open(gui) : null;

    if (_instance != null) {
      throw StateError("There can only be one instance of a $runtimeType!");
    }

    _instance = this;

    _init();
  }

  void _init() {
    logger.level = Level.ALL;
    logger.onRecord.listen((record) {
      if (record.level >= Level.WARNING) {
        stderr.writeln(record.message);
      } else {
        stdout.writeln(record.message);
      }
      if (record.error != null) {
        stderr.writeln(record.error);
      }
      if (record.stackTrace != null) {
        stderr.writeln(record.stackTrace);
      }
    });

    RaylibMatrixFactories.createFactory = MatrixD.mat4;
    RaylibMatrixFactories.zeroFactory = MatrixD.zero;
    RaylibQuaternionFactories.createFactory = QuaternionD.quat;
    RaylibQuaternionFactories.zeroFactory = QuaternionD.zero;
    RaylibVector2Factories.createFactory = Vector2D.vec2;
    RaylibVector2Factories.zeroFactory = Vector2D.zero;
    RaylibVector3Factories.createFactory = Vector3D.vec3;
    RaylibVector3Factories.zeroFactory = Vector3D.zero;
    RaylibVector4Factories.createFactory = Vector4D.vec4;
    RaylibVector4Factories.zeroFactory = Vector4D.zero;

    // extensions
    registerModule(RaylibTemp(this, options: tempOptions)); Temp = module();
    registerModule(RaylibColors(this)); Color = module();
    registerModule(RaylibEasings(this)); Ease = module();
    registerModule(RaylibQuaternions(this)); Quat = module();
    registerModule(RaylibMatrices(this)); Matrix = module();
    registerModule(RaylibVectors(this)); Vector = module();

    // modules
    registerModule(RaylibAudio(this)); Audio = module();
    registerModule(RaylibAudioD(this)); AudioD = module();
    registerModule(RaylibCamera(this)); Camera = module();
    registerModule(RaylibCameraD(this)); CameraD = module();
    registerModule(RaylibCore(this)); Core = module();
    registerModule(RaylibCoreD(this)); CoreD = module();
    registerModule(RaylibGui(this)); Gui = module();
    registerModule(RaylibGuiD(this)); GuiD = module();
    registerModule(RaylibLight(this)); Light = module();
    registerModule(RaylibLightD(this)); LightD = module();
    registerModule(RaylibRlgl(this)); Rlgl = module();
    registerModule(RaylibRlglD(this)); RlglD = module();
    registerModule(RaylibUtils(this)); Utils = module();
  }

  // Custom dynamic libraries
  final Map<Type, DynamicLibrary> _customDynLibs = {};
  (T, DynamicLibrary) registerDynLib<T extends RaylibModule>(
    T module,
    DynamicLibrary dynLib,
  ) {
    logInfo('Registering DynamicLibrary for $T');

    final key = module.runtimeType;
    if (_customDynLibs.containsKey(key)) {
      throw StateError("A DynamicLibrary for $key is already registered.");
    }

    _customDynLibs[key] = dynLib;
    return (registerModule(module), dynLib);
  }

  DynamicLibrary dynLib<T extends RaylibModule>() {
    final lib = _customDynLibs[T];
    if (lib == null) {
      throw StateError("No DynamicLibrary registered for $T.");
    }
    return lib;
  }

  void CloseWindowAndDispose() {
    Core.CloseWindow();
    dispose();
  }
}

abstract class RaylibGame extends RaylibGameBase<Raylib> {}

void runRaylib(RaylibGame game, {String? nativeLibPath}) {
  final rl = findRaylib(nativeLibPath ?? 'raylib');
  game.init(rl);
  while (!game.shouldClose(rl)) {
    game.loop(rl);
  }
  game.close(rl);
  game.dispose(rl);
}

String _platformLib(String lib) {
  if (Platform.isWindows) return "$lib.dll";
  if (Platform.isLinux) return "lib$lib.so";
  if (Platform.isMacOS) return "lib$lib.dylib";
  throw Exception("Unsupported platform '${Platform.operatingSystem}'");
}

String? _platformLibPath(String directory, String name) {
  String? tmpGuiPath = path.join(directory, _platformLib(name));
  return File(tmpGuiPath).existsSync() ? tmpGuiPath : null;
}

Raylib findRaylib(String folder, [RaylibTempBaseOptions? tempOptions]) {
  var dir = Directory.current;

  while (true) {
    final raylibPath = path.join(dir.path, folder);

    if (Directory(raylibPath).existsSync()) {
      final corePath = _platformLibPath(raylibPath, 'raylib');

      if (corePath == null) {
        throw Exception('Could not find ${_platformLib('raylib')} file');
      }

      return Raylib(
        core: corePath,
        gui: _platformLibPath(raylibPath, 'raygui'),
        tempOptions: tempOptions,
      );
    }

    final parent = dir.parent;
    if (parent.path == dir.path) {
      throw Exception('Could not find $folder directory');
    }
    dir = parent;
  }
}
