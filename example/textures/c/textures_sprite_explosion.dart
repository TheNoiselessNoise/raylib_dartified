// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_explosion.c
// Run it: dart run textures_sprite_explosion.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int NUM_FRAMES_PER_LINE = 5;
const int NUM_LINES = 5;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_sprite_explosion".toC);
  SetTargetFPS(60);

  InitAudioDevice();

  final fxBoom = LoadSound("../resources/boom.wav".toC);

  final explosion = LoadTexture("../resources/explosion.png".toC);

  final frameWidth = explosion.width/NUM_FRAMES_PER_LINE;
  final frameHeight = explosion.height/NUM_LINES;
  int currentFrame = 0;
  int currentLine = 0;

  final frameRec = Rectangle$.At('frameRec').set(0, 0, frameWidth, frameHeight);
  final position = Vector2$.At('position').set(0.0, 0.0);

  bool active = false;
  int framesCounter = 0;

  while (!WindowShouldClose())
  {
    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value) && !active)
    {
      position.setC(GetMousePosition());
      active = true;

      position.ref.x -= frameWidth/2.0;
      position.ref.y -= frameHeight/2.0;

      PlaySound(fxBoom);
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

    BeginDrawing();

      ClearBackground(RAYWHITE);

      if (active)
        DrawTextureRec(explosion, frameRec.ref, position.ref, WHITE);

    EndDrawing();
  }

  UnloadTexture(explosion);
  UnloadSound(fxBoom);

  CloseAudioDevice();

  CloseWindowAndDispose();
}