// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_animation.c
// Run it: dart run textures_sprite_animation.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_FRAME_SPEED = 15;
const int MIN_FRAME_SPEED = 1;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_sprite_animation");
  SetTargetFPS(60);

  final scarfy = LoadTexture("../resources/scarfy.png");

  final Vector2D position = .vec2(350.0, 280.0);
  final RectangleD frameRec = .rect(0.0, 0.0, scarfy.width/6, scarfy.height);
  int currentFrame = 0;

  int framesCounter = 0;
  int framesSpeed = 8;

  while (!WindowShouldClose())
  {
    framesCounter++;

    if (framesCounter >= (60/framesSpeed))
    {
      framesCounter = 0;
      currentFrame++;

      if (currentFrame > 5) currentFrame = 0;

      frameRec.x = currentFrame*scarfy.width/6;
    }

    if (IsKeyPressed(.KEY_RIGHT)) framesSpeed++;
    else if (IsKeyPressed(.KEY_LEFT)) framesSpeed--;

    if (framesSpeed > MAX_FRAME_SPEED) framesSpeed = MAX_FRAME_SPEED;
    else if (framesSpeed < MIN_FRAME_SPEED) framesSpeed = MIN_FRAME_SPEED;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawTexture(scarfy, 15, 40, .WHITE);
      DrawRectangleLines(15, 40, scarfy.width, scarfy.height, .LIME);
      DrawRectangleLines(
        15 + frameRec.x,
        40 + frameRec.y,
        frameRec.width,
        frameRec.height,
        .RED
      );

      DrawText(
        "FRAME SPEED: ",
        165, 210, 10, .DARKGRAY
      );
      
      DrawText(
        "$framesSpeed FPS",
        575, 210, 10, .DARKGRAY
      );
      
      DrawText(
        "PRESS RIGHT/LEFT KEYS to CHANGE SPEED!",
        290, 240, 10, .DARKGRAY
      );

      for (int i = 0; i < MAX_FRAME_SPEED; i++)
      {
        if (i < framesSpeed) {
          DrawRectangle(250 + 21*i, 205, 20, 20, .RED);
        }
        DrawRectangleLines(250 + 21*i, 205, 20, 20, .MAROON);
      }

      DrawTextureRec(scarfy, frameRec, position, .WHITE);

      DrawText(
        "(c) Scarfy sprite by Eiden Marsal",
        screenWidth - 200, screenHeight - 20, 10, .GRAY
      );

    EndDrawing();
  }

  UnloadTexture(scarfy);

  CloseWindowAndDispose();
}