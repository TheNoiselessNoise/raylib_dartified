export 'package:raylib_dartified/raylib.dart';

import 'dart:ffi';
import 'package:raylib_dartified/raylib.dart';

final String _RAYLIB_DIR = 'raylib-5.5_linux_amd64/lib';

extension StringToRaylibC on String {
  Pointer<Char> get toC => Raylib.instance.Temp.str(this);
}

Raylib loadBaseRaylib({
  String? raylibDir,
  RaylibTempOptions? tempOptions
}) => findRaylib(raylibDir ?? _RAYLIB_DIR, tempOptions);