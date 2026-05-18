part of 'raylib_dartified.dart';

class Raylib with RaylibBase {
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

  @override RaylibTemp get Temp => module();
  @override RaylibColors get Color => module();
  @override RaylibEasings get Ease => module();
  @override RaylibQuaternions get Quat => module();
  @override RaylibMatrices get Matrix => module();
  @override RaylibVectors get Vector => module();

  RaylibAudio get Audio => module();
  @override RaylibAudioD get AudioD => module();
  RaylibCamera get Camera => module();
  @override RaylibCameraD get CameraD => module();
  RaylibCore get Core => module();
  @override RaylibCoreD get CoreD => module();
  
  // NOTE: external modules may not be initialized at all
  //       If you try to use anything from rl.Gui.* and your dynamic library was not loaded:
  //       LateInitializationError: Field 'Gui' has not been initialized.
  //       That's expected behavior!
  RaylibGui get Gui => module();
  @override RaylibGuiD get GuiD => module();
  
  RaylibLight get Light => module();
  @override RaylibLightD get LightD => module();
  RaylibRlgl get Rlgl => module();
  @override RaylibRlglD get RlglD => module();
  @override RaylibUtils get Utils => module();

  late final DynamicLibrary _dynCore;
  RaylibLookup get coreLookup => _dynCore.lookup;

  late final DynamicLibrary? _dynGui;
  RaylibLookup get guiLookup => _dynGui!.lookup;

  late final RaylibTempOptions tempOptions;
  @override late Random random;

  Raylib({
    required String core,
    String? gui,
    RaylibTempOptions? tempOptions,
    Random? random,
  }) {
    _dynCore = .open(core);
    _dynGui = gui != null ? .open(gui) : null;
    this.tempOptions = tempOptions ?? .new();
    this.random = random ?? .new();

    if (_instance != null) {
      throw StateError("There can only be one instance of a $runtimeType!");
    }

    if (this.tempOptions.stringCount < 4) {
      throw StateError(
        "Raylib expects at least 4 preallocated String slots, got ${this.tempOptions.stringCount}",
      );
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
    registerModule(RaylibTemp(this, options: tempOptions));
    registerModule(RaylibColors(this));
    registerModule(RaylibEasings(this));
    registerModule(RaylibQuaternions(this));
    registerModule(RaylibMatrices(this));
    registerModule(RaylibVectors(this));

    // modules
    registerModule(RaylibAudio(this));
    registerModule(RaylibAudioD(this));
    registerModule(RaylibCamera(this));
    registerModule(RaylibCameraD(this));
    registerModule(RaylibCore(this));
    registerModule(RaylibCoreD(this));
    registerModule(RaylibGui(this));
    registerModule(RaylibGuiD(this));
    registerModule(RaylibLight(this));
    registerModule(RaylibLightD(this));
    registerModule(RaylibRlgl(this));
    registerModule(RaylibRlglD(this));
    registerModule(RaylibUtils(this));
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

Directory? findDirectory(String folder) {
  var dir = Directory.current;

  while (true) {
    final current = Directory(path.join(dir.path, folder));
    if (current.existsSync()) return current;

    final parent = dir.parent;
    if (parent.path == dir.path) return null;
    dir = parent;
  }
}

Raylib findRaylib(String folder, [RaylibTempOptions? tempOptions]) {
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
