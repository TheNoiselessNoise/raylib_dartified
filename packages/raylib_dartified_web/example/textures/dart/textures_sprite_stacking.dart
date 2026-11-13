// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_stacking.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "textures_sprite_stacking");
  SetTargetFPS(60);

  final booth = LoadTexture("../resources/booth.png");

  double stackScale = 3.0;
  double stackSpacing = 2.0;
  int stackCount = 122;
  double rotationSpeed = 30.0;
  double rotation = 0.0;
  const double speedChange = 0.25;

  rl.setMainLoop(() {
    stackSpacing += GetMouseWheelMove()*0.1;
    stackSpacing = Clamp(stackSpacing, 0.0, 5.0);

    if (IsKeyDown(.KEY_LEFT) || IsKeyDown(.KEY_A))
      rotationSpeed -= speedChange;
    if (IsKeyDown(.KEY_RIGHT) || IsKeyDown(.KEY_D))
      rotationSpeed += speedChange;

    rotation += rotationSpeed*GetFrameTime();

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      final frameWidth = booth.width;
      final frameHeight = booth.height/stackCount;

      final scaledWidth = frameWidth*stackScale;
      final scaledHeight = frameHeight*stackScale;

      for (int i = stackCount - 1; i >= 0; i--)
      {
        DrawTexturePro(
          booth,
          .rect(0.0, i*frameHeight, frameWidth, frameHeight),
          .rect(screenWidth/2.0, (screenHeight/2.0) + (i*stackSpacing) - (stackSpacing*stackCount/2.0), scaledWidth, scaledHeight),
          .vec2(scaledWidth/2.0, scaledHeight/2.0),
          rotation,
          .WHITE
        );
      }

      DrawText("A/D to spin\nmouse wheel to change separation (aka 'angle')", 10, 10, 20, .DARKGRAY);
      DrawText("current spacing: ${stackSpacing.f1}", 10, 50, 20, .DARKGRAY);
      DrawText("current speed: ${rotationSpeed.f2}", 10, 70, 20, .DARKGRAY);
      DrawText("redbooth model (c) kluchek under cc 4.0", 10, 420, 20, .DARKGRAY);

    EndDrawing();
  });
});