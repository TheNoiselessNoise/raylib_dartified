export 'package:raylib_dartified_base/abbr.dart';
export '../core/modules/dart/audio/abbr_dart.dart';
export '../core/modules/dart/camera/abbr_dart.dart';
export '../core/modules/dart/core/abbr_dart.dart';
export '../core/modules/dart/gui/abbr_dart.dart';
export '../core/modules/dart/light/abbr_dart.dart';
export '../core/modules/dart/msf_gif/abbr_dart.dart';
export '../core/modules/dart/rlgl/abbr_dart.dart';
export '_base.dart';

import '';

extension StringToRaylibC on String {
  MemoryPointer<RChar> get toC => String$.Value(this);
}

ColorD get LIGHTGRAY => .LIGHTGRAY;
ColorD get GRAY => .GRAY;
ColorD get DARKGRAY => .DARKGRAY;
ColorD get YELLOW => .YELLOW;
ColorD get GOLD => .GOLD;
ColorD get ORANGE => .ORANGE;
ColorD get PINK => .PINK;
ColorD get RED => .RED;
ColorD get MAROON => .MAROON;
ColorD get GREEN => .GREEN;
ColorD get LIME => .LIME;
ColorD get DARKGREEN => .DARKGREEN;
ColorD get SKYBLUE => .SKYBLUE;
ColorD get BLUE => .BLUE;
ColorD get DARKBLUE => .DARKBLUE;
ColorD get PURPLE => .PURPLE;
ColorD get VIOLET => .VIOLET;
ColorD get DARKPURPLE => .DARKPURPLE;
ColorD get BEIGE => .BEIGE;
ColorD get BROWN => .BROWN;
ColorD get DARKBROWN => .DARKBROWN;
ColorD get WHITE => .WHITE;
ColorD get BLACK => .BLACK;
ColorD get BLANK => .BLANK;
ColorD get MAGENTA => .MAGENTA;
ColorD get RAYWHITE => .RAYWHITE;
ColorD get TRANSPARENT => .TRANSPARENT;