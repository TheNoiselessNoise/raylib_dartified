// Draws a semi-transparent circle that follows the cursor, with live coordinates
// displayed at the center of the screen. Demonstrates window setup, the render
// loop, mouse input, text measurement, and basic drawing via the D-layer API.
import 'package:raylib_dartified/abbr/dart.dart';

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  final width = 800, height = 450;

  InitWindow(width, height, 'pub.dev example');

  while(!WindowShouldClose()) {
    BeginDrawing();

      ClearBackground(.BLACK);

      final mouse = GetMousePosition();

      final text = '$mouse'; // Vector2D(x: <x>, y: <y>)
      final textWidth = MeasureText(text, 32);
      DrawText(text, width / 2 - (textWidth / 2), height / 2, 32, .WHITE);

      DrawCircleV(mouse, 32, Fade(.RED, .5));

    EndDrawing();
  }

  CloseWindowAndDispose();
}