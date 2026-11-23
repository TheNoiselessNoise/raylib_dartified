export 'stub/api.dart'
  if (dart.library.io) 'ffi/api.dart'
  if (dart.library.js_interop) 'wasm/api.dart';