// Draws a semi-transparent circle that follows the cursor, with live coordinates
// displayed at the center of the screen. Demonstrates window setup, the render
// loop, mouse input, text measurement, and basic drawing via the D-layer API.
import 'package:raylib_dartified/api/dart.dart';

final width = 800, height = 450;

void main() => runRaylib(
  nativeLibPath: 'raylib-6.0_linux_amd64/lib',
  init: (_) {
    InitWindow(width, height, 'pub.dev example');
  },
  loop: (_) async {
    BeginDrawing();

      ClearBackground(.BLACK);
      final mouse = GetMousePosition();
      final text = '$mouse'; // Vector2(x: <x>, y: <y>)
      final textWidth = MeasureText(text, 32);
      DrawText(text, width / 2 - (textWidth / 2), height / 2, 32, .WHITE);
      DrawCircleV(mouse, 32, Fade(.RED, .5));

    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);