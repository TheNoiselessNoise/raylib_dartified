part of 'raylib_dartified.dart';

typedef RaylibLookup = Pointer<T> Function<T extends NativeType>(String symbolName);

class RaylibExternalLibs {
  final Map<Type, DynamicLibrary> _libs = {};

  void register<T extends RaylibModule<Raylib>>(String path) {
    if (_libs.containsKey(T)) {
      throw StateError("A dynamic library for $T is already registered.");
    }

    _libs[T] = .open(path);
  }

  RaylibLookup lookup<T extends RaylibModule<Raylib>>() {
    final lib = _libs[T];
    if (lib == null) {
      throw StateError("No dynamic library registered for $T.");
    }
    return lib.lookup;
  }
}

NativeMemoryPointer<RVoid> _nativeFromBytes<T extends TypedDataList>(T data) {
  final byteLength = data.buffer.lengthInBytes - data.offsetInBytes;
  final ptr = ffi.malloc<Uint8>(byteLength);
  final asBytes = (data as TypedData).buffer.asUint8List(data.offsetInBytes, byteLength);
  ptr.asTypedList(byteLength).setAll(0, asBytes);
  return .new(ptr.cast());
}

NativeMemoryPointer<Y> _nativeNullptrFactory<Y extends RType>() => .new(nullptr);

NativeMemoryPointer<RUint8> _nativeFromString(String text, [int? bufferSize]) {
  final bytes = utf8.encode(text);
  final len = bytes.length + 1;
  final bufSize = bufferSize != null ? (bufferSize > len ? bufferSize : len) : len;
  final ptr = calloc<Uint8>(bufSize);
  ptr.asTypedList(bufSize).setRange(0, bytes.length, bytes);
  return .new(ptr);
}

NativeMemoryPointer<Y> _nativeMalloc<Y extends RType>(int size)
  => .new(ffi.malloc.allocate(size));

// NOTE: external modules may not be initialized at all
//       If you try to use anything from rl.Gui.* and your dynamic library was not loaded:
//       LateInitializationError: Field 'Gui' has not been initialized.
//       That's expected behavior!
class Raylib extends RaylibBase<Raylib> {
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
  
  late RaylibCamera Camera;
  @override late RaylibCameraFlat CameraFlat;
  
  late RaylibCore Core;
  @override late RaylibCoreFlat CoreFlat;

  late RaylibGui Gui;
  @override late RaylibGuiFlat GuiFlat;
  
  late RaylibLight Light;

  late RaylibMsfGif MsfGif;
  @override late RaylibMsfGifFlat MsfGifFlat;

  late RaylibRlgl Rlgl;
  @override late RaylibRlglFlat RlglFlat;

  final _externalLibs = RaylibExternalLibs();

  Map<RaylibSupportedLibs, void Function(String)> get _moduleRegistrars => {
    .gui: (p) => _externalLibs.register<RaylibGui>(p),
    .msf_gif: (p) => _externalLibs.register<RaylibMsfGif>(p),
  };

  RaylibLookup lookup<T extends RaylibModule<Raylib>>() => _externalLibs.lookup<T>();

  Raylib({
    required String core,
    Map<RaylibSupportedLibs, String?> libs = const {},
    super.tempOptions,
    super.random,
    super.silent,
  }) {
    RType.nativeWordSize = sizeOf<IntPtr>();
    MemoryPointer.fromBytes = _nativeFromBytes;
    MemoryPointer.fromString = _nativeFromString;
    MemoryPointer.nullptrFactory = _nativeNullptrFactory;
    MemoryPointer.malloc = _nativeMalloc;
    boot();
    
    _initLibs(core, libs);
    _init();
  }

  void _initLibs(String core, Map<RaylibSupportedLibs, String?> libs) {
    _externalLibs.register<RaylibCore>(core);

    final registrars = _moduleRegistrars;

    for (final l in libs.entries.skip(1)) {
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
    registerModule(Audio = RaylibAudio(this));
    registerModule(AudioFlat = RaylibAudioFlat(this));

    registerModule(Camera = RaylibCamera(this));
    registerModule(CameraFlat = RaylibCameraFlat(this));
    
    registerModule(Core = RaylibCore(this));
    registerModule(CoreFlat = RaylibCoreFlat(this));
    
    registerModule(Gui = RaylibGui(this));
    registerModule(GuiFlat = RaylibGuiFlat(this));

    registerModule(Light = RaylibLight(this));

    registerModule(MsfGif = RaylibMsfGif(this));
    registerModule(MsfGifFlat = RaylibMsfGifFlat(this));
    
    registerModule(Rlgl = RaylibRlgl(this));
    registerModule(RlglFlat = RaylibRlglFlat(this));
  }

  // Custom dynamic libraries
  final Map<Type, DynamicLibrary> _customDynLibs = {};
  (T, DynamicLibrary) registerDynLib<T extends RaylibModule<Raylib>>(
    T module,
    DynamicLibrary dynLib,
  ) {
    logInfo('Registering DynamicLibrary for $T');

    if (_customDynLibs.containsKey(T)) {
      throw StateError("A DynamicLibrary for $T is already registered.");
    }

    _customDynLibs[T] = dynLib;
    return (registerModule(module), dynLib);
  }

  DynamicLibrary dynLib<T extends RaylibModule<Raylib>>() {
    final lib = _customDynLibs[T];
    if (lib == null) {
      throw StateError("No DynamicLibrary registered for $T.");
    }
    return lib;
  }
}

Future<void> runRaylib(RaylibGameBase<Raylib> game, {
  String? nativeLibPath,
  bool silent = false,
}) async {
  final rl = findRaylib(
    nativeLibPath ?? 'raylib',
    silent: silent,
  );
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

Raylib findRaylib(String folder, {
  RaylibTempOptions? tempOptions,
  bool silent = false,
}) {
  final raylibId = RaylibSupportedLibs.raylib.id;
  var dir = Directory.current;

  while (true) {
    final raylibPath = path.join(dir.path, folder);

    if (Directory(raylibPath).existsSync()) {
      final corePath = _platformLibPath(raylibPath, raylibId);

      if (corePath == null) {
        throw Exception('Could not find ${_platformLib(raylibId)} file');
      }

      final Map<RaylibSupportedLibs, String?> libs = {};
      for (final lib in RaylibSupportedLibs.values.skip(1)) {
        libs[lib] = _platformLibPath(raylibPath, lib.id);
      }

      return Raylib(
        core: corePath,
        libs: libs,
        tempOptions: tempOptions,
        silent: silent,
      );
    }

    final parent = dir.parent;
    if (parent.path == dir.path) {
      throw Exception('Could not find $folder directory');
    }
    dir = parent;
  }
}
