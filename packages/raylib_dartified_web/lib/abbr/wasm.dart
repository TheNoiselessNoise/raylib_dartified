export 'package:raylib_dartified_base/abbr/generic.dart';
export 'package:raylib_dartified_web/raylib_dartified_web.dart';
export '../core/extensions/wasm/abbr.dart';
export '../core/modules/wasm/abbr.dart';

import 'dart:js_interop';
import '';

Raylib get rl => Raylib.instance;

extension StringToRaylibC on String {
  @Deprecated('Leaks memory if not freed!')
  JSNumber get toC => WasmMemory.allocString(this).toJS;
}