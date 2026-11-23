export 'package:raylib_dartified/raylib_dartified.dart';
export 'core/backend.dart';
export 'package:xffi_core/xffi_core.dart';

import 'package:raylib_dartified/core/raylib_dartified.dart';

RaylibBackendImplementation createBackend() => throw UnsupportedError('No platform implementation available for: createBackend');

/// Walks up from the CWD to find [folder]; returns the platform libs inside.
Map<RaylibSupportedLibs, XLibrarySource?> resolveRaylibLibs(String? folder) => throw UnsupportedError('No platform implementation available for: resolveRaylibLibs');