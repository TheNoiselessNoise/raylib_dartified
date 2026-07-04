export 'package:raylib_dartified/raylib_dartified.dart';

import 'dart:ffi';
import 'package:raylib_dartified/raylib_dartified.dart';

extension StringToRaylibC on String {
  Pointer<Char> get toC => Raylib.instance.Temp.String$.Value(this);
}