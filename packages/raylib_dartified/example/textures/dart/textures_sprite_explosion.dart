// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_explosion.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int NUM_FRAMES_PER_LINE = 5;
const int NUM_LINES = 5;

late Sound fxBoom;
late Texture explosion;
late double frameWidth;
late double frameHeight;
int currentFrame = 0;
int currentLine = 0;
late Rectangle frameRec;
late Vector2 position;
bool active = false;
int framesCounter = 0;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "textures_sprite_explosion");
    InitAudioDevice();
    SetTargetFPS(60);

    fxBoom = LoadSound("../resources/boom.wav");
    explosion = LoadTexture("../resources/explosion.png");
    frameWidth = explosion.width/NUM_FRAMES_PER_LINE;
    frameHeight = explosion.height/NUM_LINES;
    frameRec = .rect(0, 0, frameWidth, frameHeight);
    position = .vec2(0.0, 0.0);
  },
  loop: (_) async {
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
  },
  close: (_) {
    UnloadTexture(explosion);
    UnloadSound(fxBoom);
    CloseAudioDevice();
    CloseWindow();
  },
);