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

NativeMemoryPointer<Y> _nativeFromAddress<Y extends RType>(int address) => .new(.fromAddress(address));

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

NativeMemoryPointer<Y> _nativeCalloc<Y extends RType>(int nmemb, int size)
  => .new(ffi.calloc.allocate(nmemb * size));

void bootMemoryBackend() {
  RType.nativeWordSize = sizeOf<IntPtr>();
  MemoryPointer.fromAddress = _nativeFromAddress;
  MemoryPointer.fromBytes = _nativeFromBytes;
  MemoryPointer.fromString = _nativeFromString;
  MemoryPointer.nullptr = _nativeNullptrFactory;
  MemoryPointer.malloc = _nativeMalloc;
  MemoryPointer.calloc = _nativeCalloc;
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

  final _externalLibs = RaylibExternalLibs();

  Map<RaylibSupportedLibs, void Function(String)> get _moduleRegistrars => {
    .raylib: (p) => _externalLibs.register<RaylibCore>(p),
    .raygui: (p) => _externalLibs.register<RaylibGui>(p),
    .msf_gif: (p) => _externalLibs.register<RaylibMsfGif>(p),
  };

  RaylibLookup lookup<T extends RaylibModule<Raylib>>() => _externalLibs.lookup<T>();

  Raylib({
    Map<RaylibSupportedLibs, String?> libs = const {},
    super.random,
    super.silent,
  }) {
    bootMemoryBackend();
    boot();
    
    _initLibs(libs);
    _init();
  }

  void _initLibs(Map<RaylibSupportedLibs, String?> libs) {
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

    // extensions
    registerModule(RaylibMatrixExt(this));
    registerModule<RaylibMatrixFlatExt>(RaylibMatrixExtFlat(this));

    registerModule(RaylibQuaternionExt(this));
    registerModule<RaylibQuaternionFlatExt>(RaylibQuaternionExtFlat(this));

    registerModule(RaylibVector2Ext(this));
    registerModule<RaylibVector2FlatExt>(RaylibVector2ExtFlat(this));

    registerModule(RaylibVector3Ext(this));
    registerModule<RaylibVector3FlatExt>(RaylibVector3ExtFlat(this));

    registerModule(RaylibVector4Ext(this));
    registerModule<RaylibVector4FlatExt>(RaylibVector4ExtFlat(this));

    // modules
    registerModule(RaylibAudio(this));
    registerModule<RaylibAudioFlatModule>(RaylibAudioFlat(this));

    registerModule(RaylibCamera(this));
    registerModule<RaylibCameraFlatModule>(RaylibCameraFlat(this));
    
    registerModule(RaylibCore(this));
    registerModule<RaylibCoreFlatModule>(RaylibCoreFlat(this));
    
    registerModule(RaylibGui(this));
    registerModule<RaylibGuiFlatModule>(RaylibGuiFlat(this));

    registerModule(RaylibLight(this));
    registerModule<RaylibLightFlatModule>(RaylibLightFlat(this));

    registerModule(RaylibMsfGif(this));
    registerModule<RaylibMsfGifFlatModule>(RaylibMsfGifFlat(this));
    
    registerModule(RaylibRlgl(this));
    registerModule<RaylibRlglFlatModule>(RaylibRlglFlat(this));
  }

  // Custom dynamic libraries
  final Map<Type, DynamicLibrary> _customDynLibs = {};

  /// Register [DynamicLibrary] at [T] for a given [module].
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

  /// Gets a [DynamicLibrary] based on module [T].
  DynamicLibrary dynLib<T extends RaylibModule<Raylib>>() {
    final lib = _customDynLibs[T];
    if (lib == null) {
      throw StateError("No DynamicLibrary registered for $T.");
    }
    return lib;
  }
}

/// Runs [app] on the native raylib backend until it closes.
///
/// Loads the native raylib shared library, searching upward from the
/// current working directory for a folder named [nativeLibPath] (defaults
/// to `'raylib-6.0/lib'`).
///
/// Set [silent] to suppress raylib's init/dispose log output.
Future<void> runRaylib(RaylibAppBase<Raylib> app, {
  String? nativeLibPath,
  bool silent = false,
}) async {
  final rl = findRaylib(nativeLibPath ?? 'raylib-6.0/lib', silent: silent);
  app.init(rl);
  while (!app.shouldClose(rl)) {
    await app.loop(rl);
  }
  app.close(rl);
  app.dispose(rl);
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

/// Locates the native raylib library by walking up from the current
/// working directory until a directory named [folder] is found.
///
/// For each [RaylibSupportedLibs] entry, resolves the platform-specific
/// library file inside that directory and returns a bound [Raylib]
/// instance wrapping all of them.
///
/// Set [silent] to suppress [Raylib]'s init/dispose log output.
///
/// Throws an [Exception] if [folder] can't be found before reaching the
/// filesystem root, or if the current platform isn't supported.
Raylib findRaylib(String folder, { bool silent = false }) {
  var dir = Directory.current;

  while (true) {
    final raylibPath = path.join(dir.path, folder);

    if (Directory(raylibPath).existsSync()) {
      final Map<RaylibSupportedLibs, String?> libs = {};
      for (final lib in RaylibSupportedLibs.values) {
        libs[lib] = _platformLibPath(raylibPath, lib.id);
      }

      return Raylib(libs: libs, silent: silent);
    }

    final parent = dir.parent;
    if (parent.path == dir.path) throw Exception('Could not find $folder directory');
    dir = parent;
  }
}
