// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_anim.c
// Run it: dart run textures_sprite_anim.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_FRAME_SPEED = 15;
const int MIN_FRAME_SPEED = 1;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_sprite_anim");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final scarfy = rl.CoreD.LoadTexture("../resources/scarfy.png");

  final Vector2D position = .vec2(350.0, 280.0);
  final RectangleD frameRec = .rect(0.0, 0.0, scarfy.width/6, scarfy.height);
  int currentFrame = 0;

  int framesCounter = 0;
  int framesSpeed = 8;

  while (!rl.CoreD.WindowShouldClose())
  {
    framesCounter++;

    if (framesCounter >= (60/framesSpeed))
    {
      framesCounter = 0;
      currentFrame++;

      if (currentFrame > 5) currentFrame = 0;

      frameRec.x = currentFrame*scarfy.width/6;
    }

    if (rl.CoreD.IsKeyPressed(.KEY_RIGHT)) framesSpeed++;
    else if (rl.CoreD.IsKeyPressed(.KEY_LEFT)) framesSpeed--;

    if (framesSpeed > MAX_FRAME_SPEED) framesSpeed = MAX_FRAME_SPEED;
    else if (framesSpeed < MIN_FRAME_SPEED) framesSpeed = MIN_FRAME_SPEED;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawTexture(scarfy, 15, 40, .WHITE);
      rl.CoreD.DrawRectangleLines(15, 40, scarfy.width, scarfy.height, .LIME);
      rl.CoreD.DrawRectangleLines(
        15 + frameRec.x,
        40 + frameRec.y,
        frameRec.width,
        frameRec.height,
        .RED
      );

      rl.CoreD.DrawText(
        "FRAME SPEED: ",
        165, 210, 10, .DARKGRAY
      );
      
      rl.CoreD.DrawText(
        "$framesSpeed FPS",
        575, 210, 10, .DARKGRAY
      );
      
      rl.CoreD.DrawText(
        "PRESS RIGHT/LEFT KEYS to CHANGE SPEED!",
        290, 240, 10, .DARKGRAY
      );

      for (int i = 0; i < MAX_FRAME_SPEED; i++)
      {
        if (i < framesSpeed) {
          rl.CoreD.DrawRectangle(250 + 21*i, 205, 20, 20, .RED);
        }
        rl.CoreD.DrawRectangleLines(250 + 21*i, 205, 20, 20, .MAROON);
      }

      rl.CoreD.DrawTextureRec(scarfy, frameRec, position, .WHITE);

      rl.CoreD.DrawText(
        "(c) Scarfy sprite by Eiden Marsal",
        screenWidth - 200, screenHeight - 20, 10, .GRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(scarfy);

  rl.CloseWindowAndDispose();
}