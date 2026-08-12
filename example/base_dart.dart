export 'package:raylib_dartified/raylib_dartified.dart';
export 'package:raylib_dartified/abbr/dart.dart';

import 'dart:ffi';
import 'package:raylib_dartified/abbr/dart.dart' show String$;

extension StringToRaylibC on String {
  Pointer<Char> get toC => String$.Value(this);
}