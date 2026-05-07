part of 'raylib.dart';

class Raylib {
  static Raylib? _instance;
  static Raylib get instance {
    if (_instance == null) throw StateError('Raylib not initialized.');
    return _instance!;
  }

  Logger logger = Logger.detached('Raylib');

  void logInfo(String message) => logger.info('[Raylib] $message');

  late RaylibTemp Temp;

  late RaylibQuaternions Q;
  late RaylibMatrices Matrix;
  late RaylibVectors Vec;
  late RaylibColors C;
  late RaylibEasings Ease;

  late RaylibCore Core;
  late RaylibCoreD CoreD;
  late RaylibAudio Audio;
  late RaylibAudioD AudioD;
  late RaylibRlgl Rlgl;
  late RaylibRlglD RlglD;
  late RaylibCamera Cam;
  late RaylibCameraD CamD;
  late RaylibLight Light;
  late RaylibLightD LightD;

  // NOTE: external modules may not be initialized at all
  //       If you try to use anything from rl.Gui.* and your dynamic library was not loaded:
  //       LateInitializationError: Field 'Gui' has not been initialized.
  //       That's expected behavior!
  late RaylibGui Gui;
  late RaylibGuiD GuiD;

  late final DynamicLibrary _dynCore;
  late final DynamicLibrary? _dynGui;

  late final RaylibTempOptions tempOptions;
  late Random random;

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
      throw StateError("Raylib expects at least 4 preallocated String slots, got ${this.tempOptions.stringCount}");
    }

    _instance = this;

    _init();
  }

  RaylibLookup get coreLookup => _dynCore.lookup;
  RaylibLookup get guiLookup => _dynGui!.lookup;

  List<Function()> get _moduleLoaders => [
    // NOTE: no Temp

    () => _loadModule(RaylibQuaternions.new, (m) => Q = m),
    () => _loadModule(RaylibMatrices.new, (m) => Matrix = m),
    () => _loadModule(RaylibVectors.new, (m) => Vec = m),
    () => _loadModule(RaylibColors.new, (m) => C = m),
    () => _loadModule(RaylibEasings.new, (m) => Ease = m),

    () => _loadModule(RaylibCore.new, (m) => Core = m),
    () => _loadModule(RaylibCoreD.new, (m) => CoreD = m),
    () => _loadModule(RaylibAudio.new, (m) => Audio = m),
    () => _loadModule(RaylibAudioD.new, (m) => AudioD = m),
    () => _loadModule(RaylibRlgl.new, (m) => Rlgl = m),
    () => _loadModule(RaylibRlglD.new, (m) => RlglD = m),
    () => _loadModule(RaylibCamera.new, (m) => Cam = m),
    () => _loadModule(RaylibCameraD.new, (m) => CamD = m),
    () => _loadModule(RaylibLight.new, (m) => Light = m),
    () => _loadModule(RaylibLightD.new, (m) => LightD = m),

    if (_dynGui != null) ...[
      () => _loadModule(RaylibGui.new, (m) => Gui = m),
      () => _loadModule(RaylibGuiD.new, (m) => GuiD = m),
    ],
  ];

  List<BaseRaylibModule> get _allModules => [
    Temp,

    Q, Matrix, Vec, C, Ease,

    Core,  CoreD,
    Audio, AudioD,
    Rlgl,  RlglD,
    Cam,   CamD,
    Light, LightD,

    if (_dynGui != null) ...[
      Gui, GuiD,
    ],

    ..._customModules.values,
  ];

  // Custom modules

  final Map<Type, BaseRaylibModule> _customModules = {};
  T registerModule<T extends BaseRaylibModule>(T module) {
    logInfo('Registering $T');
    final key = module.runtimeType;
    if (_customModules.containsKey(key)) {
      throw StateError("Module '$key' is already registered!");
    }
    _customModules[key] = module;
    module._doLoad();
    return module;
  }

  T module<T extends BaseRaylibModule>()
    => _customModules.values.whereType<T>().first;

  void debugEverything(bool debug) {
    _allModules.forEach((d) => d.debug(debug));
    Temp.debugFree(debug);
    Temp.debugSync(debug);
  }

  // Custom dynamic libraries
  final Map<Type, DynamicLibrary> _customDynLibs = {};
  (T, DynamicLibrary) registerDynLib<T extends RaylibModule>(T module, DynamicLibrary dynLib) {
    logInfo('Registering DynamicLibrary for $T');

    final key = module.runtimeType;
    if (_customDynLibs.containsKey(key)) {
      throw StateError(
        "A DynamicLibrary for $key is already registered."
      );
    }
    
    _customDynLibs[key] = dynLib;
    return (registerModule(module), dynLib);
  }

  DynamicLibrary dynLib<T extends RaylibModule>() {
    final lib = _customDynLibs[T];
    if (lib == null) {
      throw StateError(
        "No DynamicLibrary registered for $T."
      );
    }
    return lib;
  }

  void _loadModule<T extends BaseRaylibModule>(
    RaylibModuleConstructor<T> constructor,
    void Function(T) loader,
  ) {
    logInfo('Loading $T');
    final module = constructor(this);
    loader(module);
    module._doLoad();
  }

  void _disposeModule(BaseRaylibModule module) {
    logInfo('Disposing ${module.runtimeType}');
    module.dispose();
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

    logInfo('Loading rl.Temp');
    Temp = RaylibTemp(this, options: tempOptions);

    _moduleLoaders.forEach((f) => f());
  }

  void dispose() => _allModules.forEach(_disposeModule);

  // Functions

  double Clamp(num value, num min, num max) {
    num result = (value < min) ? min : value;
    if (result > max) result = max;
    return result.toDouble();
  }
  double Lerp(num start, num end, num amount) {
    return (start + amount*(end - start)).toDouble();
  }
  double Normalize(num value, num start, num end) {
    return (value - start)/(end - start);
  }
  double Remap(num value, num inputStart, num inputEnd, num outputStart, num outputEnd) {
    return (value - inputStart)/(inputEnd - inputStart)*(outputEnd - outputStart) + outputStart;
  }
  double Wrap(num value, num min, num max) {
    return value - (max - min)*((value - min)/(max - min)).floorToDouble();
  }
  bool FloatEquals(double x, double y) {
    return ((x - y).abs()) <= (EPSILON*math.max(1.0, math.max(x.abs(), y.abs())));
  }

  // Constants

  final int RAYLIB_VERSION_MAJOR = 5;
  final int RAYLIB_VERSION_MINOR = 5;
  final int RAYLIB_VERSION_PATCH = 0;
  final String RAYLIB_VERSION = '5.5.0';
  final double PI = 3.1415927410125732;
  final double DEG2RAD = 0.01745329238474369;
  final double RAD2DEG = 57.2957763671875;
  final MaterialMapIndex MATERIAL_MAP_DIFFUSE = .MATERIAL_MAP_ALBEDO;
  final MaterialMapIndex MATERIAL_MAP_SPECULAR = .MATERIAL_MAP_METALNESS;
  final int MAX_MATERIAL_MAPS = 12;
  final int SHADER_LOC_MAP_DIFFUSE = 15;
  final int SHADER_LOC_MAP_SPECULAR = 16;
  final double EPSILON = 9.999999974752427e-7;
  final double M_E = 2.718281828459045;
  final double M_LOG2E = 1.4426950408889634;
  final double M_LOG10E = 0.4342944819032518;
  final double M_LN2 = 0.6931471805599453;
  final double M_LN10 = 2.302585092994046;
  final double M_PI = 3.141592653589793;
  final double M_PI_2 = 1.5707963267948966;
  final double M_PI_4 = 0.7853981633974483;
  final double M_1_PI = 0.3183098861837907;
  final double M_2_PI = 0.6366197723675814;
  final double M_2_SQRTPI = 1.1283791670955126;
  final double M_SQRT2 = 1.4142135623730951;
  final double M_SQRT1_2 = 0.7071067811865476;
  final int RAND_MAX = 2147483647;

  double rand() => random.nextDouble();
  double randC() => rand() * RAND_MAX;

  T timeIt<T>(String label, T Function() fn) {
    logger.info(label);
    final sw = Stopwatch()..start();
    final result = fn();
    sw.stop();
    logger.info('${sw.elapsedMilliseconds}ms (${sw.elapsedMicroseconds}µs)');
    return result;
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
