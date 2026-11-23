export 'package:raylib_dartified/raylib_dartified.dart';
export 'core/backend.dart';
export 'package:xffi_native/xffi_native.dart';

import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:raylib_dartified/api/ffi.dart';

RaylibBackendImplementation createBackend() => NativeBackend();

String _platformLib(String lib) {
  if (currentMemoryPlatform == .windows) return "$lib.dll";
  if (currentMemoryPlatform == .linux) return "lib$lib.so";
  if (currentMemoryPlatform == .macOS) return "lib$lib.dylib";
  throw Exception("Unsupported platform: $currentMemoryPlatform");
}

XLibrarySource? _platformLibSourcePath(String directory, String name) {
  String? tmpPath = path.join(directory, _platformLib(name));
  return File(tmpPath).existsSync() ? .path(tmpPath) : null;
}

/// Walks up from the CWD to find [folder]; returns the platform libs inside.
Map<RaylibSupportedLibs, XLibrarySource?> resolveRaylibLibs(String? folder) {
  if (folder == null) throw ArgumentError.notNull('nativeLibPath');
  var dir = Directory.current;
  while (true) {
    final raylibPath = path.join(dir.path, folder);
    if (Directory(raylibPath).existsSync()) {
      return {
        for (final lib in RaylibSupportedLibs.values)
          lib: _platformLibSourcePath(raylibPath, lib.id),
      };
    }
    final parent = dir.parent;
    if (parent.path == dir.path) throw Exception('Could not find $folder directory');
    dir = parent;
  }
}

final class NativeBackend implements RaylibBackendImplementation {
  final Map<Type, DynamicLibrary> customDynLibs = {};

  @override
  void start(Raylib rl, Map<RaylibSupportedLibs, XLibrarySource?> libs, void Function() ready) {
    final registrars = <RaylibSupportedLibs, void Function(XLibrarySource)>{
      .raylib: (p) => XExternalLibs.register<RaylibCore>(p),
      .raygui: (p) => XExternalLibs.register<RaylibGui>(p),
      .msf_gif: (p) => XExternalLibs.register<RaylibMsfGif>(p),
    };
    for (final l in libs.entries) {
      if (l.value case XLibrarySource path) registrars[l.key]!(path);
    }
    allocateRaylibColors(rl);
    ready();
  }

  @override
  void registerModules(Raylib rl) {
    // extensions
    rl.registerModule(RaylibMatrixExt(rl));
    rl.registerModule<RaylibMatrixFlatExt>(RaylibMatrixFlatExtNative(rl));

    rl.registerModule(RaylibQuaternionExt(rl));
    rl.registerModule<RaylibQuaternionFlatExt>(RaylibQuaternionFlatExtNative(rl));

    rl.registerModule(RaylibVector2Ext(rl));
    rl.registerModule<RaylibVector2FlatExt>(RaylibVector2FlatExtNative(rl));

    rl.registerModule(RaylibVector3Ext(rl));
    rl.registerModule<RaylibVector3FlatExt>(RaylibVector3FlatExtNative(rl));

    rl.registerModule(RaylibVector4Ext(rl));
    rl.registerModule<RaylibVector4FlatExt>(RaylibVector4FlatExtNative(rl));

    // modules
    rl.registerModule(RaylibAudio(rl));
    rl.registerModule<RaylibAudioFlat>(RaylibAudioFlatNative(rl));

    rl.registerModule(RaylibCamera(rl));
    rl.registerModule<RaylibCameraFlat>(RaylibCameraFlatNative(rl));
    
    rl.registerModule(RaylibCore(rl));
    rl.registerModule<RaylibCoreFlat>(RaylibCoreFlatNative(rl));
    
    rl.registerModule(RaylibGui(rl));
    rl.registerModule<RaylibGuiFlat>(RaylibGuiFlatNative(rl));

    rl.registerModule(RaylibLight(rl));
    rl.registerModule<RaylibLightFlat>(RaylibLightFlatNative(rl));

    rl.registerModule(RaylibMsfGif(rl));
    rl.registerModule<RaylibMsfGifFlat>(RaylibMsfGifFlatNative(rl));
    
    rl.registerModule(RaylibRlgl(rl));
    rl.registerModule<RaylibRlglFlat>(RaylibRlglFlatNative(rl));
  }

  @override
  Future<void> loop(Future<bool> Function() tick) async {
    while (await tick()) {}
  }
}

extension RaylibNative on Raylib {
  NativeBackend get _native => backend as NativeBackend;

  (T, DynamicLibrary) registerDynLib<T extends XPackageModule<Raylib>>(
    T module, DynamicLibrary dynLib,
  ) {
    XOutput.logInfo('Registering DynamicLibrary for $T');
    if (_native.customDynLibs.containsKey(T)) {
      throw StateError("A DynamicLibrary for $T is already registered.");
    }
    _native.customDynLibs[T] = dynLib;
    return (registerModule(module), dynLib);
  }

  DynamicLibrary dynLib<T extends XPackageModule<Raylib>>() => _native.customDynLibs[T] ?? (throw StateError("No DynamicLibrary registered for $T."));
}