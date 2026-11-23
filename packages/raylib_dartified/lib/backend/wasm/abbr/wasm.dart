export 'package:xffi_core/abbr/abbr.dart';
export '../api.dart';
export '../core/extensions/wasm/abbr.dart';
export '../core/modules/wasm/abbr.dart';

import 'dart:js_interop';
import '';

extension StringToRaylibC on String {
  @Deprecated('Leaks memory if not freed!')
  JSNumber get toC => WasmMemory.allocString(this).toJS;
}