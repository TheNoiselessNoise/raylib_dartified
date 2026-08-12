export 'package:raylib_dartified/raylib_dartified.dart';
export 'package:raylib_dartified/abbr/c.dart';

import 'dart:ffi';
import 'package:raylib_dartified/abbr/c.dart' show String$;

extension StringToRaylibC on String {
  Pointer<Char> get toC => String$.Value(this);
}