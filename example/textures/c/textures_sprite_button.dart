// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_button.c
// Run it: dart run textures_sprite_button.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int NUM_FRAMES = 3;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_sprite_button".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  rl.Audio.InitAudioDevice();

  final fxButton = rl.Audio.LoadSound("../resources/buttonfx.wav".toC);
  final button = rl.Core.LoadTexture("../resources/button.png".toC);

  final frameHeight = button.height/NUM_FRAMES;
  final sourceRec = rl.Temp.Rectangle$.At('sourceRec').set(
    0, 0, button.width, frameHeight
  );

  final btnBounds = rl.Temp.Rectangle$.At('btnBounds').set(
    screenWidth/2.0 - button.width/2.0,
    screenHeight/2.0 - button.height/NUM_FRAMES/2.0,
    button.width,
    frameHeight
  );

  int btnState = 0;
  bool btnAction = false;

  final mousePoint = rl.Temp.Vector2$.At('mousePoint');

  while (!rl.Core.WindowShouldClose())
  {
    mousePoint.setC(rl.Core.GetMousePosition());
    btnAction = false;

    if (rl.Core.CheckCollisionPointRec(mousePoint.ref, btnBounds.ref))
    {
      if (rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value))
        btnState = 2;
      else
        btnState = 1;

      if (rl.Core.IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value))
        btnAction = true;
    }
    else btnState = 0;

    if (btnAction)
    {
      rl.Audio.PlaySound(fxButton);
    }

    sourceRec.ref.y = btnState*frameHeight;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.DrawTextureRec(
        button,
        sourceRec.ref,
        rl.Temp.vec21(btnBounds.ref.x, btnBounds.ref.y),
        rl.C.WHITE
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(button);
  rl.Audio.UnloadSound(fxButton);

  rl.Audio.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}