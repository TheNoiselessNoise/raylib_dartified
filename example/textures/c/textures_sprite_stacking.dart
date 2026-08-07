// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_polygon_drawing.c
// Run it: dart run textures_sprite_stacking.dart
// WARNING: expects resources from the raylib source
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_sprite_stacking".toC);
  SetTargetFPS(60);

  final booth = LoadTexture("../resources/booth.png".toC);

  double stackScale = 3.0;
  double stackSpacing = 2.0;
  int stackCount = 122;
  double rotationSpeed = 30.0;
  double rotation = 0.0;
  const double speedChange = 0.25;

  while (!WindowShouldClose())
  {
    stackSpacing += GetMouseWheelMove()*0.1;
    stackSpacing = Clamp(stackSpacing, 0.0, 5.0);

    if (IsKeyDown(KeyboardKey.KEY_LEFT.value) || IsKeyDown(KeyboardKey.KEY_A.value))
      rotationSpeed -= speedChange;
    if (IsKeyDown(KeyboardKey.KEY_RIGHT.value) || IsKeyDown(KeyboardKey.KEY_D.value))
      rotationSpeed += speedChange;

    rotation += rotationSpeed*GetFrameTime();

    BeginDrawing();

      ClearBackground(RAYWHITE);

      final frameWidth = booth.width;
      final frameHeight = booth.height/stackCount;

      final scaledWidth = frameWidth*stackScale;
      final scaledHeight = frameHeight*stackScale;

      for (int i = stackCount - 1; i >= 0; i--)
      {
        DrawTexturePro(
          booth,
          Rectangle$.$1.set(0.0, i*frameHeight, frameWidth, frameHeight),
          Rectangle$.$2.set(screenWidth/2.0, (screenHeight/2.0) + (i*stackSpacing) - (stackSpacing*stackCount/2.0), scaledWidth, scaledHeight),
          Vector2$.$1.set(scaledWidth/2.0, scaledHeight/2.0),
          rotation,
          WHITE
        );
      }

      DrawText("A/D to spin\nmouse wheel to change separation (aka 'angle')".toC, 10, 10, 20, DARKGRAY);
      DrawText("current spacing: ${stackSpacing.f1}".toC, 10, 50, 20, DARKGRAY);
      DrawText("current speed: ${rotationSpeed.f2}".toC, 10, 70, 20, DARKGRAY);
      DrawText("redbooth model (c) kluchek under cc 4.0".toC, 10, 420, 20, DARKGRAY);

    EndDrawing();
  }

  UnloadTexture(booth);

  CloseWindowAndDispose();
}
