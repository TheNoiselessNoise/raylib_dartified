// Draws a semi-transparent circle that follows the cursor, with live coordinates
// displayed at the center of the screen. Demonstrates window setup, the render
// loop, mouse input, text measurement, and basic drawing via the D-layer API.
import 'package:raylib_dartified_base/raylib_dartified_base.dart';
import 'package:raylib_dartified_base/abbr/dart.dart';

final class BackendAgnosticRaylibExample<R extends RaylibBase> extends RaylibAppBase<R> {
  final width = 800, height = 450;

  @override
  void init(_) {
    InitWindow(width, height, 'pub.dev example');
  }

  @override
  Future<void> loop(_) async {
    BeginDrawing();

      ClearBackground(.BLACK);
      final mouse = GetMousePosition();
      final text = '$mouse'; // Vector2(x: <x>, y: <y>)
      final textWidth = MeasureText(text, 32);
      DrawText(text, width / 2 - (textWidth / 2), height / 2, 32, .WHITE);
      DrawCircleV(mouse, 32, Fade(.RED, .5));

    EndDrawing();
  }
}