export '_shared.dart';
export 'package:xffi_core/abbr/abbr.dart';
import 'package:raylib_dartified/raylib_dartified.dart';

// Exports everything that can be shared across Dart and Flat layers.

Raylib get _rl => Raylib.instance;

/// See [Raylib.rand].
double rand() => _rl.rand();

/// See [Raylib.randC].
double randC() => _rl.randC();

Color get LIGHTGRAY => .LIGHTGRAY;
Color get GRAY => .GRAY;
Color get DARKGRAY => .DARKGRAY;
Color get YELLOW => .YELLOW;
Color get GOLD => .GOLD;
Color get ORANGE => .ORANGE;
Color get PINK => .PINK;
Color get RED => .RED;
Color get MAROON => .MAROON;
Color get GREEN => .GREEN;
Color get LIME => .LIME;
Color get DARKGREEN => .DARKGREEN;
Color get SKYBLUE => .SKYBLUE;
Color get BLUE => .BLUE;
Color get DARKBLUE => .DARKBLUE;
Color get PURPLE => .PURPLE;
Color get VIOLET => .VIOLET;
Color get DARKPURPLE => .DARKPURPLE;
Color get BEIGE => .BEIGE;
Color get BROWN => .BROWN;
Color get DARKBROWN => .DARKBROWN;
Color get WHITE => .WHITE;
Color get BLACK => .BLACK;
Color get BLANK => .BLANK;
Color get MAGENTA => .MAGENTA;
Color get RAYWHITE => .RAYWHITE;
Color get TRANSPARENT => .TRANSPARENT;