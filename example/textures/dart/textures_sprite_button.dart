// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_sprite_button.c
// Run it: dart run textures_sprite_button.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int NUM_FRAMES = 3;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_sprite_button");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  rl.AudioD.InitAudioDevice();

  final fxButton = rl.AudioD.LoadSound("../resources/buttonfx.wav");
  final button = rl.CoreD.LoadTexture("../resources/button.png");

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

  while (!rl.CoreD.WindowShouldClose())
  {
    mousePoint = rl.CoreD.GetMousePosition();
    btnAction = false;

    if (rl.CoreD.CheckCollisionPointRec(mousePoint, btnBounds))
    {
      if (rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT))
        btnState = 2;
      else
        btnState = 1;

      if (rl.CoreD.IsMouseButtonReleased(.MOUSE_BUTTON_LEFT))
        btnAction = true;
    }
    else btnState = 0;

    if (btnAction)
    {
      rl.AudioD.PlaySound(fxButton);
    }

    sourceRec.y = btnState*frameHeight;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawTextureRec(
        button,
        sourceRec,
        .vec2(btnBounds.x, btnBounds.y),
        .WHITE
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(button);
  rl.AudioD.UnloadSound(fxButton);

  rl.AudioD.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}