part of '../raylib_dartified.dart';

// NOTE: we don't use rl.Temp on purpose to not make the logs *suspicious*

class RaylibColors extends RaylibColorExtensionBase<
  Raylib,
  
  ColorC
> {
  late Pointer<ColorC> _LIGHTGRAY_ptr;
  late Pointer<ColorC> _GRAY_ptr;
  late Pointer<ColorC> _DARKGRAY_ptr;
  late Pointer<ColorC> _YELLOW_ptr;
  late Pointer<ColorC> _GOLD_ptr;
  late Pointer<ColorC> _ORANGE_ptr;
  late Pointer<ColorC> _PINK_ptr;
  late Pointer<ColorC> _RED_ptr;
  late Pointer<ColorC> _MAROON_ptr;
  late Pointer<ColorC> _GREEN_ptr;
  late Pointer<ColorC> _LIME_ptr;
  late Pointer<ColorC> _DARKGREEN_ptr;
  late Pointer<ColorC> _SKYBLUE_ptr;
  late Pointer<ColorC> _BLUE_ptr;
  late Pointer<ColorC> _DARKBLUE_ptr;
  late Pointer<ColorC> _PURPLE_ptr;
  late Pointer<ColorC> _VIOLET_ptr;
  late Pointer<ColorC> _DARKPURPLE_ptr;
  late Pointer<ColorC> _BEIGE_ptr;
  late Pointer<ColorC> _BROWN_ptr;
  late Pointer<ColorC> _DARKBROWN_ptr;
  late Pointer<ColorC> _WHITE_ptr;
  late Pointer<ColorC> _BLACK_ptr;
  late Pointer<ColorC> _BLANK_ptr;
  late Pointer<ColorC> _MAGENTA_ptr;
  late Pointer<ColorC> _RAYWHITE_ptr;
  late Pointer<ColorC> _TRANSPARENT_ptr;

  @override ColorC get LIGHTGRAY => _LIGHTGRAY_ptr.ref;
  @override ColorC get GRAY => _GRAY_ptr.ref;
  @override ColorC get DARKGRAY => _DARKGRAY_ptr.ref;
  @override ColorC get YELLOW => _YELLOW_ptr.ref;
  @override ColorC get GOLD => _GOLD_ptr.ref;
  @override ColorC get ORANGE => _ORANGE_ptr.ref;
  @override ColorC get PINK => _PINK_ptr.ref;
  @override ColorC get RED => _RED_ptr.ref;
  @override ColorC get MAROON => _MAROON_ptr.ref;
  @override ColorC get GREEN => _GREEN_ptr.ref;
  @override ColorC get LIME => _LIME_ptr.ref;
  @override ColorC get DARKGREEN => _DARKGREEN_ptr.ref;
  @override ColorC get SKYBLUE => _SKYBLUE_ptr.ref;
  @override ColorC get BLUE => _BLUE_ptr.ref;
  @override ColorC get DARKBLUE => _DARKBLUE_ptr.ref;
  @override ColorC get PURPLE => _PURPLE_ptr.ref;
  @override ColorC get VIOLET => _VIOLET_ptr.ref;
  @override ColorC get DARKPURPLE => _DARKPURPLE_ptr.ref;
  @override ColorC get BEIGE => _BEIGE_ptr.ref;
  @override ColorC get BROWN => _BROWN_ptr.ref;
  @override ColorC get DARKBROWN => _DARKBROWN_ptr.ref;
  @override ColorC get WHITE => _WHITE_ptr.ref;
  @override ColorC get BLACK => _BLACK_ptr.ref;
  @override ColorC get BLANK => _BLANK_ptr.ref;
  @override ColorC get MAGENTA => _MAGENTA_ptr.ref;
  @override ColorC get RAYWHITE => _RAYWHITE_ptr.ref;
  @override ColorC get TRANSPARENT => _TRANSPARENT_ptr.ref;

  RaylibColors(super.lib) {
    _LIGHTGRAY_ptr = _CreateRGBA(200, 200, 200);
    _GRAY_ptr = _CreateRGBA(130, 130, 130);
    _DARKGRAY_ptr = _CreateRGBA(80, 80, 80);
    _YELLOW_ptr = _CreateRGBA(253, 249, 0);
    _GOLD_ptr = _CreateRGBA(255, 203, 0);
    _ORANGE_ptr = _CreateRGBA(255, 161, 0);
    _PINK_ptr = _CreateRGBA(255, 109, 194);
    _RED_ptr = _CreateRGBA(230, 41, 55);
    _MAROON_ptr = _CreateRGBA(190, 33, 55);
    _GREEN_ptr = _CreateRGBA(0, 228, 48);
    _LIME_ptr = _CreateRGBA(0, 158, 47);
    _DARKGREEN_ptr = _CreateRGBA(0, 117, 44);
    _SKYBLUE_ptr = _CreateRGBA(102, 191, 255);
    _BLUE_ptr = _CreateRGBA(0, 121, 241);
    _DARKBLUE_ptr = _CreateRGBA(0, 82, 172);
    _PURPLE_ptr = _CreateRGBA(200, 122, 255);
    _VIOLET_ptr = _CreateRGBA(135, 60, 190);
    _DARKPURPLE_ptr = _CreateRGBA(112, 31, 126);
    _BEIGE_ptr = _CreateRGBA(211, 176, 131);
    _BROWN_ptr = _CreateRGBA(127, 106, 79);
    _DARKBROWN_ptr = _CreateRGBA(76, 63, 47);
    _WHITE_ptr = _CreateRGBA(255, 255, 255);
    _BLACK_ptr = _CreateRGBA(0, 0, 0);
    _BLANK_ptr = _CreateRGBA(0, 0, 0, 0);
    _MAGENTA_ptr = _CreateRGBA(255, 0, 255);
    _RAYWHITE_ptr = _CreateRGBA(245, 245, 245);
    _TRANSPARENT_ptr = _CreateRGBA(255, 255, 255, 0);
  }

  Pointer<ColorC> _CreateRGBA(int r, int g, int b, [int? a]) {
    final c = calloc<ColorC>();
    c.ref.r = r;
    c.ref.g = g;
    c.ref.b = b;
    c.ref.a = a ?? 255;
    return c;
  }

  @override
  void dispose() {
    super.dispose();
    calloc.free(_LIGHTGRAY_ptr);
    calloc.free(_GRAY_ptr);
    calloc.free(_DARKGRAY_ptr);
    calloc.free(_YELLOW_ptr);
    calloc.free(_GOLD_ptr);
    calloc.free(_ORANGE_ptr);
    calloc.free(_PINK_ptr);
    calloc.free(_RED_ptr);
    calloc.free(_MAROON_ptr);
    calloc.free(_GREEN_ptr);
    calloc.free(_LIME_ptr);
    calloc.free(_DARKGREEN_ptr);
    calloc.free(_SKYBLUE_ptr);
    calloc.free(_BLUE_ptr);
    calloc.free(_DARKBLUE_ptr);
    calloc.free(_PURPLE_ptr);
    calloc.free(_VIOLET_ptr);
    calloc.free(_DARKPURPLE_ptr);
    calloc.free(_BEIGE_ptr);
    calloc.free(_BROWN_ptr);
    calloc.free(_DARKBROWN_ptr);
    calloc.free(_WHITE_ptr);
    calloc.free(_BLACK_ptr);
    calloc.free(_BLANK_ptr);
    calloc.free(_MAGENTA_ptr);
    calloc.free(_RAYWHITE_ptr);
    calloc.free(_TRANSPARENT_ptr);
  }
}