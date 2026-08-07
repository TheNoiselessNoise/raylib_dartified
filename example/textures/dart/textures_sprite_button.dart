// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_button.c
// Run it: dart run textures_sprite_button.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int NUM_FRAMES = 3;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_sprite_button");
  SetTargetFPS(60);

  InitAudioDevice();

  final fxButton = LoadSound("../resources/buttonfx.wav");
  final button = LoadTexture("../resources/button.png");

  final frameHeight = button.height/NUM_FRAMES;
  final RectangleD sourceRec = .rect(
    0, 0, button.width, frameHeight
  );

  final RectangleD btnBounds = .rect(
    screenWidth/2.0 - button.width/2.0,
    screenHeight/2.0 - button.height/NUM_FRAMES/2.0,
    button.width,
    frameHeight
  );

  int btnState = 0;
  bool btnAction = false;

  Vector2D mousePoint = .zero();

  while (!WindowShouldClose())
  {
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
  }

  UnloadTexture(button);
  UnloadSound(fxButton);

  CloseAudioDevice();

  CloseWindowAndDispose();
}