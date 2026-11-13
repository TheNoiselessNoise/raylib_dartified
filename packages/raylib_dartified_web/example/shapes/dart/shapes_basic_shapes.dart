// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_basic_shapes.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "shapes_basic_shapes");
  SetTargetFPS(60);

  double rotation = 0.0;

  rl.setMainLoop(() {
    rotation += 0.2;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText(
        "some basic shapes available on raylib",
        20, 20, 20, .DARKGRAY
      );

      DrawCircle((screenWidth/5).toInt(), 120, 35, .DARKBLUE);
      DrawCircleGradient(.vec2(screenWidth/5, 220), 60, .GREEN, .SKYBLUE);
      DrawCircleLines((screenWidth/5).toInt(), 340, 80, .DARKBLUE);

      DrawRectangle((screenWidth/4 * 2 - 60).toInt(), 100, 120, 60, .RED);
      DrawRectangleGradientH((screenWidth/4 * 2 - 90).toInt(), 170, 180, 130, .MAROON, .GOLD);
      DrawRectangleLines((screenWidth/4 * 2 - 40).toInt(), 320, 80, 60, .ORANGE);

      DrawTriangle(
        .vec2(screenWidth/4.0 * 3.0, 80.0),
        .vec2(screenWidth/4.0 * 3.0 - 60.0, 150.0),
        .vec2(screenWidth/4.0 * 3.0 + 60.0, 150.0),
        .VIOLET
      );

      DrawTriangleLines(
        .vec2(screenWidth/4.0 * 3.0, 160.0),
        .vec2(screenWidth/4.0 * 3.0 - 20.0, 230.0),
        .vec2(screenWidth/4.0 * 3.0 + 20.0, 230.0),
        .DARKBLUE
      );

      DrawPoly(.vec2(screenWidth/4.0 * 3, 330), 6, 80, rotation, .BROWN);
      DrawPolyLines(.vec2(screenWidth/4.0 * 3, 330), 6, 90, rotation, .BROWN);
      DrawPolyLinesEx(.vec2(screenWidth/4.0 * 3, 330), 6, 85, rotation, 6, .BEIGE);

      DrawLine(18, 42, screenWidth - 18, 42, .BLACK);

    EndDrawing();
  });
});