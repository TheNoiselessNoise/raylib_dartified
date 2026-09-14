export 'package:raylib_dartified_base/abbr.dart';
export 'package:raylib_dartified/raylib_dartified.dart';
export '../core/extensions/ffi/abbr.dart';
export '../core/modules/ffi/abbr.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';

import '';

Raylib get rl => Raylib.instance;

extension StringToRaylibC on String {
  @Deprecated('Leaks memory if not freed!')
  Pointer<Char> get toC => toNativeUtf8().cast();
}

late ColorC LIGHTGRAY;
late ColorC GRAY;
late ColorC DARKGRAY;
late ColorC YELLOW;
late ColorC GOLD;
late ColorC ORANGE;
late ColorC PINK;
late ColorC RED;
late ColorC MAROON;
late ColorC GREEN;
late ColorC LIME;
late ColorC DARKGREEN;
late ColorC SKYBLUE;
late ColorC BLUE;
late ColorC DARKBLUE;
late ColorC PURPLE;
late ColorC VIOLET;
late ColorC DARKPURPLE;
late ColorC BEIGE;
late ColorC BROWN;
late ColorC DARKBROWN;
late ColorC WHITE;
late ColorC BLACK;
late ColorC BLANK;
late ColorC MAGENTA;
late ColorC RAYWHITE;
late ColorC TRANSPARENT;

final List<Pointer<ColorC>> _colorPtrs = [];

ColorC _CreateRGBA(int r, int g, int b, [int? a]) {
  final c = calloc<ColorC>();
  c.ref.r = r;
  c.ref.g = g;
  c.ref.b = b;
  c.ref.a = a ?? 255;
  _colorPtrs.add(c);
  return c.ref;
}

void allocateRaylibColors() {
  try {
    Raylib.instance;
  } catch (_) {
    throw StateError('Initialize Raylib before calling allocateRaylibColors()');
  }

  LIGHTGRAY = _CreateRGBA(200, 200, 200);
  GRAY = _CreateRGBA(130, 130, 130);
  DARKGRAY = _CreateRGBA(80, 80, 80);
  YELLOW = _CreateRGBA(253, 249, 0);
  GOLD = _CreateRGBA(255, 203, 0);
  ORANGE = _CreateRGBA(255, 161, 0);
  PINK = _CreateRGBA(255, 109, 194);
  RED = _CreateRGBA(230, 41, 55);
  MAROON = _CreateRGBA(190, 33, 55);
  GREEN = _CreateRGBA(0, 228, 48);
  LIME = _CreateRGBA(0, 158, 47);
  DARKGREEN = _CreateRGBA(0, 117, 44);
  SKYBLUE = _CreateRGBA(102, 191, 255);
  BLUE = _CreateRGBA(0, 121, 241);
  DARKBLUE = _CreateRGBA(0, 82, 172);
  PURPLE = _CreateRGBA(200, 122, 255);
  VIOLET = _CreateRGBA(135, 60, 190);
  DARKPURPLE = _CreateRGBA(112, 31, 126);
  BEIGE = _CreateRGBA(211, 176, 131);
  BROWN = _CreateRGBA(127, 106, 79);
  DARKBROWN = _CreateRGBA(76, 63, 47);
  WHITE = _CreateRGBA(255, 255, 255);
  BLACK = _CreateRGBA(0, 0, 0);
  BLANK = _CreateRGBA(0, 0, 0, 0);
  MAGENTA = _CreateRGBA(255, 0, 255);
  RAYWHITE = _CreateRGBA(245, 245, 245);
  TRANSPARENT = _CreateRGBA(255, 255, 255, 0);

  rl.onDispose(() => _colorPtrs.forEach(calloc.free));
}