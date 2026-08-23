part of 'raylib_dartified.dart';

enum RaylibSupportedLibs {
  gui('raygui'),
  msfGif('msf_gif');

  const RaylibSupportedLibs(this.id);
  final String id;
}

typedef RaylibLookup = Pointer<T> Function<T extends NativeType>(String symbolName);

class RaylibExternalLibs {
  final Map<Type, DynamicLibrary> _libs = {};

  void register<T extends RaylibModule>(String path) {
    if (_libs.containsKey(T)) {
      throw StateError("A dynamic library for $T is already registered.");
    }

    _libs[T] = .open(path);
  }

  RaylibLookup lookup<T extends RaylibModule>() {
    final lib = _libs[T];
    if (lib == null) {
      throw StateError("No dynamic library registered for $T.");
    }
    return lib.lookup;
  }
}

// NOTE: external modules may not be initialized at all
//       If you try to use anything from rl.Gui.* and your dynamic library was not loaded:
//       LateInitializationError: Field 'Gui' has not been initialized.
//       That's expected behavior!
class Raylib extends RaylibBase {
  static Raylib get instance => RaylibBase.getInstance();

  Logger logger = Logger.detached('Raylib');

  @override
  void logInfo(Object? message) => logger.info('[Raylib] $message');
  
  @override
  void logWarn(Object? message) => logger.warning('[Raylib] $message');
  
  @override
  void logError(Object? message) => logger.severe('[Raylib] $message');

  late RaylibAudio Audio;
  @override late RaylibAudioFlat AudioFlat;
  @override late RaylibAudioD AudioD;
  
  late RaylibCamera Camera;
  @override late RaylibCameraFlat CameraFlat;
  @override late RaylibCameraD CameraD;
  
  late RaylibCore Core;
  @override late RaylibCoreFlat CoreFlat;
  @override late RaylibCoreD CoreD;

  late RaylibGui Gui;
  @override late RaylibGuiFlat GuiFlat;
  @override late RaylibGuiD GuiD;
  
  late RaylibLight Light;
  @override late RaylibLightFlat LightFlat;
  @override late RaylibLightD LightD;

  late RaylibMsfGif MsfGif;
  @override late RaylibMsfGifFlat MsfGifFlat;
  @override late RaylibMsfGifD MsfGifD;

  late RaylibRlgl Rlgl;
  @override late RaylibRlglFlat RlglFlat;
  @override late RaylibRlglD RlglD;

  final _externalLibs = RaylibExternalLibs();

  Map<RaylibSupportedLibs, void Function(String)> get _moduleRegistrars => {
    .gui: (p) => _externalLibs.register<RaylibGui>(p),
    .msfGif: (p) => _externalLibs.register<RaylibMsfGif>(p),
  };

  RaylibLookup lookup<T extends RaylibModule>() => _externalLibs.lookup<T>();

  Raylib({
    required String core,
    Map<RaylibSupportedLibs, String?> libs = const {},
    super.tempOptions,
    super.random,
  }) : super(
    initializer: () => RType.nativeWordSize = sizeOf<IntPtr>(),
  ) {
    _initBase();
    _initLibs(core, libs);
    _init();
  }

  NativeMemoryPointer<RVoid> _defaultFromBytes<T extends TypedDataList>(T data) {
    final byteLength = data.buffer.lengthInBytes - data.offsetInBytes;
    final ptr = ffi.malloc<Uint8>(byteLength);
    final asBytes = (data as TypedData).buffer.asUint8List(data.offsetInBytes, byteLength);
    ptr.asTypedList(byteLength).setAll(0, asBytes);
    return .new(ptr.cast());
  }

  NativeMemoryPointer<Y> _defaultNullptrFactory<Y extends RType>() => .new(nullptr);

  NativeMemoryPointer<RUint8> _defaultFromString(String text, [int? bufferSize]) {
    final bytes = utf8.encode(text);
    final len = bytes.length + 1;
    final bufSize = bufferSize != null ? (bufferSize > len ? bufferSize : len) : len;
    final ptr = calloc<Uint8>(bufSize);
    ptr.asTypedList(bufSize).setRange(0, bytes.length, bytes);
    return .new(ptr);
  }

  NativeMemoryPointer<Y> _defaultMalloc<Y extends RType>(int size)
    => .new(ffi.malloc.allocate(size));

  void _initBase() {
    MemoryPointer.fromBytes = _defaultFromBytes;
    MemoryPointer.fromString = _defaultFromString;
    MemoryPointer.nullptrFactory = _defaultNullptrFactory;
    MemoryPointer.malloc = _defaultMalloc;
  }

  void _initLibs(String core, Map<RaylibSupportedLibs, String?> libs) {
    _externalLibs.register<RaylibCore>(core);

    final registrars = _moduleRegistrars;

    for (final l in libs.entries) {
      final path = l.value;
      if (path != null) registrars[l.key]!(path);
    }
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

    // modules
    registerModule(RaylibAudio(this)); Audio = module();
    registerModule(RaylibAudioFlat(this)); AudioFlat = module();
    registerModule(RaylibAudioD(this)); AudioD = module();

    registerModule(RaylibCamera(this)); Camera = module();
    registerModule(RaylibCameraFlat(this)); CameraFlat = module();
    registerModule(RaylibCameraD(this)); CameraD = module();
    
    registerModule(RaylibCore(this)); Core = module();
    registerModule(RaylibCoreFlat(this)); CoreFlat = module();
    registerModule(RaylibCoreD(this)); CoreD = module();
    
    registerModule(RaylibGui(this)); Gui = module();
    registerModule(RaylibGuiFlat(this)); GuiFlat = module();
    registerModule(RaylibGuiD(this)); GuiD = module();

    registerModule(RaylibLight(this)); Light = module();
    registerModule(RaylibLightFlat(this)); LightFlat = module();
    registerModule(RaylibLightD(this)); LightD = module();

    registerModule(RaylibMsfGif(this)); MsfGif = module();
    registerModule(RaylibMsfGifFlat(this)); MsfGifFlat = module();
    registerModule(RaylibMsfGifD(this)); MsfGifD = module();
    
    registerModule(RaylibRlgl(this)); Rlgl = module();
    registerModule(RaylibRlglFlat(this)); RlglFlat = module();
    registerModule(RaylibRlglD(this)); RlglD = module();
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
}

abstract class RaylibGame extends RaylibGameBase<Raylib> {}

Future<void> runRaylib(RaylibGame game, {String? nativeLibPath}) async {
  final rl = findRaylib(nativeLibPath ?? 'raylib');
  game.init(rl);
  while (!game.shouldClose(rl)) {
    await game.loop(rl);
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

Raylib findRaylib(String folder, [RaylibTempOptions? tempOptions]) {
  final raylibId = 'raylib';
  var dir = Directory.current;

  while (true) {
    final raylibPath = path.join(dir.path, folder);

    if (Directory(raylibPath).existsSync()) {
      final corePath = _platformLibPath(raylibPath, raylibId);

      if (corePath == null) {
        throw Exception('Could not find ${_platformLib(raylibId)} file');
      }

      final Map<RaylibSupportedLibs, String?> libs = {};
      for (final lib in RaylibSupportedLibs.values) {
        libs[lib] = _platformLibPath(raylibPath, lib.id);
      }

      return Raylib(
        core: corePath,
        libs: libs,
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
