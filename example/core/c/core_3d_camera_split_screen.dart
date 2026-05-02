// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_split_screen.c
// Run it: dart run core_3d_camera_split_screen.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_3d_camera_split_screen'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final cameraPlayer1 = rl.Temp.Camera3D$.At('cameraPlayer1');
  cameraPlayer1.ref.fovy = 45.0;
  cameraPlayer1.ref.up.y = 1.0;
  cameraPlayer1.ref.target.y = 1.0;
  cameraPlayer1.ref.position.z = -3.0;
  cameraPlayer1.ref.position.y = 1.0;

  final screenPlayer1 = rl.Core.LoadRenderTexture(screenWidth~/2, screenHeight);

  final cameraPlayer2 = rl.Temp.Camera3D$.At('cameraPlayer2');
  cameraPlayer2.ref.fovy = 45.0;
  cameraPlayer2.ref.up.y = 1.0;
  cameraPlayer2.ref.target.y = 3.0;
  cameraPlayer2.ref.position.x = -3.0;
  cameraPlayer2.ref.position.y = 3.0;

  final screenPlayer2 = rl.Core.LoadRenderTexture(screenWidth~/2, screenHeight);

  final splitScreenRect = rl.Temp.Rectangle$.At('splitScreenRect')
    .set(0.0, 0.0, screenPlayer1.texture.width, -screenPlayer1.texture.height);
  
  int count = 5;
  double spacing = 4;

  while (!rl.Core.WindowShouldClose()) {
    double offsetThisFrame = 10.0*rl.Core.GetFrameTime();

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_W.value))
    {
      cameraPlayer1.ref.position.z += offsetThisFrame;
      cameraPlayer1.ref.target.z += offsetThisFrame;
    }
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_S.value))
    {
      cameraPlayer1.ref.position.z -= offsetThisFrame;
      cameraPlayer1.ref.target.z -= offsetThisFrame;
    }

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_UP.value))
    {
      cameraPlayer2.ref.position.x += offsetThisFrame;
      cameraPlayer2.ref.target.x += offsetThisFrame;
    }
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_DOWN.value))
    {
      cameraPlayer2.ref.position.x -= offsetThisFrame;
      cameraPlayer2.ref.target.x -= offsetThisFrame;
    }

    rl.Core.BeginTextureMode(screenPlayer1);
      rl.Core.ClearBackground(rl.C.SKYBLUE);
      
      rl.Core.BeginMode3D(cameraPlayer1.ref);
      
        rl.Core.DrawPlane(
          rl.Temp.vec31(0, 0, 0),
          rl.Temp.vec21(50, 50),
          rl.C.BEIGE
        );

        for (double x = -count*spacing; x <= count*spacing; x += spacing)
        {
          for (double z = -count*spacing; z <= count*spacing; z += spacing)
          {
            rl.Core.DrawCube(rl.Temp.vec31(x, 1.5, z), 1, 1, 1, rl.C.LIME);
            rl.Core.DrawCube(rl.Temp.vec31(x, 0.5, z), 0.25, 1, 0.25, rl.C.BROWN);
          }
        }

        rl.Core.DrawCube(cameraPlayer1.ref.position, 1, 1, 1, rl.C.RED);
        rl.Core.DrawCube(cameraPlayer2.ref.position, 1, 1, 1, rl.C.BLUE);
          
      rl.Core.EndMode3D();
      
      rl.Core.DrawRectangle(0, 0, rl.Core.GetScreenWidth()~/2, 40, rl.Core.Fade(rl.C.RAYWHITE, 0.8));
      rl.Core.DrawText("PLAYER1: W/S to move".toC, 10, 10, 20, rl.C.MAROON);
        
    rl.Core.EndTextureMode();

    rl.Core.BeginTextureMode(screenPlayer2);
      rl.Core.ClearBackground(rl.C.SKYBLUE);
      
      rl.Core.BeginMode3D(cameraPlayer2.ref);

        rl.Core.DrawPlane(
          rl.Temp.vec31(0, 0, 0),
          rl.Temp.vec21(50, 50),
          rl.C.BEIGE
        );
      
        for (double x = -count*spacing; x <= count*spacing; x += spacing)
        {
          for (double z = -count*spacing; z <= count*spacing; z += spacing)
          {
            rl.Core.DrawCube(rl.Temp.vec31(x, 1.5, z), 1, 1, 1, rl.C.LIME);
            rl.Core.DrawCube(rl.Temp.vec31(x, 0.5, z), 0.25, 1, 0.25, rl.C.BROWN);
          }
        }

        rl.Core.DrawCube(cameraPlayer1.ref.position, 1, 1, 1, rl.C.RED);
        rl.Core.DrawCube(cameraPlayer2.ref.position, 1, 1, 1, rl.C.BLUE);
          
      rl.Core.EndMode3D();
      
      rl.Core.DrawRectangle(0, 0, rl.Core.GetScreenWidth()~/2, 40, rl.Core.Fade(rl.C.RAYWHITE, 0.8));
      rl.Core.DrawText("PLAYER2: UP/DOWN to move".toC, 10, 10, 20, rl.C.DARKBLUE);
        
    rl.Core.EndTextureMode();

    rl.Core.BeginDrawing();
      rl.Core.ClearBackground(rl.C.BLACK);
      
      rl.Core.DrawTextureRec(
        screenPlayer1.texture,
        splitScreenRect.ref,
        rl.Temp.vec21(0, 0),
        rl.C.WHITE
      );

      rl.Core.DrawTextureRec(
        screenPlayer2.texture,
        splitScreenRect.ref,
        rl.Temp.vec21(screenWidth/2.0, 0),
        rl.C.WHITE
      );
      
      rl.Core.DrawRectangle(rl.Core.GetScreenWidth()~/2 - 2, 0, 4, rl.Core.GetScreenHeight(), rl.C.LIGHTGRAY);
    rl.Core.EndDrawing();
  }

  rl.Core.UnloadRenderTexture(screenPlayer1);
  rl.Core.UnloadRenderTexture(screenPlayer2);

  rl.CloseWindowAndDispose();
}