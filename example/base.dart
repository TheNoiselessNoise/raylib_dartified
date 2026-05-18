export 'package:raylib_dartified/raylib.dart';

import 'dart:ffi';
import 'package:raylib_dartified/raylib.dart';

extension StringToRaylibC on String {
  Pointer<Char> get toC => Raylib.instance.Temp.str(this);
}