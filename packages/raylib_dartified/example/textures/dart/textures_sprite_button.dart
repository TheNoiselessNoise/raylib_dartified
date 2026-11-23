// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_button.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int NUM_FRAMES = 3;

late Sound fxButton;
late Texture button;
late double frameHeight;
late Rectangle sourceRec;
late Rectangle btnBounds;
int btnState = 0;
bool btnAction = false;
late Vector2 mousePoint;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "textures_sprite_button");
    InitAudioDevice();
    SetTargetFPS(60);

    fxButton = LoadSound("../resources/buttonfx.wav");
    button = LoadTexture("../resources/button.png");
    frameHeight = button.height/NUM_FRAMES;
    sourceRec = .rect(0, 0, button.width, frameHeight);
    btnBounds = .rect(
      screenWidth/2.0 - button.width/2.0, screenHeight/2.0 - button.height/NUM_FRAMES/2.0,
      button.width, frameHeight
    );
    mousePoint = .zero();
  },
  loop: (_) async {
    mousePoint = GetMousePosition();
    btnAction = false;

    if (CheckCollisionPointRec(mousePoint, btnBounds))
    {
      if (IsMouseButtonDown(.MOUSE_BUTTON_LEFT))
        btnState = 2;
      else
        btnState = 1;

      if (IsMouseButtonReleased(.MOUSE_BUTTON_LEFT))
        btnAction = true;
    }
    else btnState = 0;

    if (btnAction)
    {
      PlaySound(fxButton);
    }

    sourceRec.y = btnState*frameHeight;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawTextureRec(
        button,
        sourceRec,
        .vec2(btnBounds.x, btnBounds.y),
        .WHITE
      );

    EndDrawing();
  },
  close: (_) {
    UnloadTexture(button);
    UnloadSound(fxButton);
    CloseAudioDevice();
    CloseWindow();
  },
);