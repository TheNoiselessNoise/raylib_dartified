// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_explosion.c
// Run it: dart run textures_sprite_explosion.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int NUM_FRAMES_PER_LINE = 5;
const int NUM_LINES = 5;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_sprite_explosion".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  rl.Audio.InitAudioDevice();

  final fxBoom = rl.Audio.LoadSound("../resources/boom.wav".toC);

  final explosion = rl.Core.LoadTexture("../resources/explosion.png".toC);

  final frameWidth = explosion.width/NUM_FRAMES_PER_LINE;
  final frameHeight = explosion.height/NUM_LINES;
  int currentFrame = 0;
  int currentLine = 0;

  final frameRec = rl.Temp.Rectangle$.At('frameRec').set(0, 0, frameWidth, frameHeight);
  final position = rl.Temp.Vector2$.At('position').set(0.0, 0.0);

  bool active = false;
  int framesCounter = 0;

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value) && !active)
    {
      position.setC(rl.Core.GetMousePosition());
      active = true;

      position.ref.x -= frameWidth/2.0;
      position.ref.y -= frameHeight/2.0;

      rl.Audio.PlaySound(fxBoom);
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

    frameRec.ref.x = frameWidth*currentFrame;
    frameRec.ref.y = frameHeight*currentLine;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      if (active)
        rl.Core.DrawTextureRec(explosion, frameRec.ref, position.ref, rl.Color.WHITE);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(explosion);
  rl.Audio.UnloadSound(fxBoom);

  rl.Audio.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}