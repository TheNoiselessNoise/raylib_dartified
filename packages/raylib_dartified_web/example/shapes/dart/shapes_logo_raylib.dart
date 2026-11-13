// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_logo_raylib.c
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "shapes_logo_raylib");
  SetTargetFPS(60);

  rl.setMainLoop(() {
    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawRectangle(screenWidth/2 - 128, screenHeight/2 - 128, 256, 256, .BLACK);
      DrawRectangle(screenWidth/2 - 112, screenHeight/2 - 112, 224, 224, .RAYWHITE);
      DrawText("raylib", screenWidth/2 - 44, screenHeight/2 + 48, 50, .BLACK);

      DrawText("this is NOT a texture!", 350, 370, 10, .GRAY);

      DrawFPS(10, 10);

    EndDrawing();
  });
});