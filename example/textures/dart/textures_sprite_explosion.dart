// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_explosion.c
// Run it: dart run textures_sprite_explosion.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int NUM_FRAMES_PER_LINE = 5;
const int NUM_LINES = 5;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_sprite_explosion");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  rl.AudioD.InitAudioDevice();

  final fxBoom = rl.AudioD.LoadSound("../resources/boom.wav");

  final explosion = rl.CoreD.LoadTexture("../resources/explosion.png");

  final frameWidth = explosion.width/NUM_FRAMES_PER_LINE;
  final frameHeight = explosion.height/NUM_LINES;
  int currentFrame = 0;
  int currentLine = 0;

  final RectangleD frameRec = .rect(0, 0, frameWidth, frameHeight);
  Vector2D position = .vec2(0.0, 0.0);

  bool active = false;
  int framesCounter = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT) && !active)
    {
      position = rl.CoreD.GetMousePosition();
      active = true;

      position.x -= frameWidth/2.0;
      position.y -= frameHeight/2.0;

      rl.AudioD.PlaySound(fxBoom);
    }

    if (active)
    {
      framesCounter++;

      if (framesCounter > 2)
      {
        currentFrame++;

        if (currentFrame >= NUM_FRAMES_PER_LINE)
        {
          currentFrame = 0;
          currentLine++;

          if (currentLine >= NUM_LINES)
          {
            currentLine = 0;
            active = false;
          }
        }

        framesCounter = 0;
      }
    }

    frameRec.x = frameWidth*currentFrame;
    frameRec.y = frameHeight*currentLine;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      if (active)
        rl.CoreD.DrawTextureRec(explosion, frameRec, position, .WHITE);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(explosion);
  rl.AudioD.UnloadSound(fxBoom);

  rl.AudioD.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}