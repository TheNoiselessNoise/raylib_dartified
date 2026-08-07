// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_button.c
// Run it: dart run textures_sprite_button.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int NUM_FRAMES = 3;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_sprite_button".toC);
  SetTargetFPS(60);

  InitAudioDevice();

  final fxButton = LoadSound("../resources/buttonfx.wav".toC);
  final button = LoadTexture("../resources/button.png".toC);

  final frameHeight = button.height/NUM_FRAMES;
  final sourceRec = Rectangle$.At('sourceRec').set(
    0, 0, button.width, frameHeight
  );

  final btnBounds = Rectangle$.At('btnBounds').set(
    screenWidth/2.0 - button.width/2.0,
    screenHeight/2.0 - button.height/NUM_FRAMES/2.0,
    button.width,
    frameHeight
  );

  int btnState = 0;
  bool btnAction = false;

  final mousePoint = Vector2$.At('mousePoint');

  while (!WindowShouldClose())
  {
    mousePoint.setC(GetMousePosition());
    btnAction = false;

    if (CheckCollisionPointRec(mousePoint.ref, btnBounds.ref))
    {
      if (IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value))
        btnState = 2;
      else
        btnState = 1;

      if (IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value))
        btnAction = true;
    }
    else btnState = 0;

    if (btnAction)
    {
      PlaySound(fxButton);
    }

    sourceRec.ref.y = btnState*frameHeight;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTextureRec(
        button,
        sourceRec.ref,
        Vector2$.$1.set(btnBounds.ref.x, btnBounds.ref.y),
        WHITE
      );

    EndDrawing();
  }

  UnloadTexture(button);
  UnloadSound(fxButton);

  CloseAudioDevice();

  CloseWindowAndDispose();
}