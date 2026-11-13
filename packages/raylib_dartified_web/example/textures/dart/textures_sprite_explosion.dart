// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_explosion.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int NUM_FRAMES_PER_LINE = 5;
const int NUM_LINES = 5;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "textures_sprite_explosion");
  SetTargetFPS(60);

  InitAudioDevice();

  final fxBoom = LoadSound("../resources/boom.wav");

  final explosion = LoadTexture("../resources/explosion.png");

  final frameWidth = explosion.width/NUM_FRAMES_PER_LINE;
  final frameHeight = explosion.height/NUM_LINES;
  int currentFrame = 0;
  int currentLine = 0;

  final Rectangle frameRec = .rect(0, 0, frameWidth, frameHeight);
  Vector2 position = .vec2(0.0, 0.0);

  bool active = false;
  int framesCounter = 0;

  rl.setMainLoop(() {
    if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT) && !active)
    {
      position = GetMousePosition();
      active = true;

      position.x -= frameWidth/2.0;
      position.y -= frameHeight/2.0;

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

    frameRec.x = frameWidth*currentFrame;
    frameRec.y = frameHeight*currentLine;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      if (active)
        DrawTextureRec(explosion, frameRec, position, .WHITE);

    EndDrawing();
  });
});