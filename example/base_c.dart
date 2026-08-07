export 'package:raylib_dartified/raylib_dartified.dart';
export 'package:raylib_dartified/abbr/c.dart';

import 'dart:ffi';
import 'package:raylib_dartified/raylib_dartified.dart';

extension StringToRaylibC on String {
  Pointer<Char> get toC => Raylib.instance.Temp.String$.Value(this);
}