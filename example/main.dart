// Draws a semi-transparent circle that follows the cursor, with live coordinates
// displayed at the center of the screen. Demonstrates window setup, the render
// loop, mouse input, text measurement, and basic drawing via the D-layer API.
import 'package:raylib_dartified/raylib.dart';

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  final width = 800, height = 450;

  rl.CoreD.InitWindow(width, height, 'pub.dev example');

  while(!rl.CoreD.WindowShouldClose()) {
    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.BLACK);

      final mouse = rl.CoreD.GetMousePosition();

      final text = '$mouse'; // Vector2D(x: <x>, y: <y>)
      final textWidth = rl.CoreD.MeasureText(text, 32);
      rl.CoreD.DrawText(text, width / 2 - (textWidth / 2), height / 2, 32, .WHITE);

      rl.CoreD.DrawCircleV(mouse, 32, rl.CoreD.Fade(.RED, .5));

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}