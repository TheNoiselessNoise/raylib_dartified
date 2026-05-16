// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_2d_camera_split_screen.c
// Run it: dart run core_2d_camera_split_screen.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 440;
const int PLAYER_SIZE = 40;

void main() {
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_2d_camera_split_screen'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final player1 = rl.Temp.Rectangle$.At('player1').set(200, 200, PLAYER_SIZE, PLAYER_SIZE);
  final player2 = rl.Temp.Rectangle$.At('player2').set(250, 200, PLAYER_SIZE, PLAYER_SIZE);

  final camera1 = rl.Temp.Camera2D$.At('camera1');
  camera1.ref.target.set(player1.ref.x, player1.ref.y);
  camera1.ref.offset.set(200.0, 200.0);
  camera1.ref.rotation = 0.0;
  camera1.ref.zoom = 1.0;

  final camera2 = rl.Temp.Camera2D$.At('camera2');
  camera2.ref.target.set(player2.ref.x, player2.ref.y);
  camera2.ref.offset.set(200.0, 200.0);
  camera2.ref.rotation = 0.0;
  camera2.ref.zoom = 1.0;

  final screenCamera1 = rl.Core.LoadRenderTexture(screenWidth~/2, screenHeight);
  final screenCamera2 = rl.Core.LoadRenderTexture(screenWidth~/2, screenHeight);

  final splitScreenRect = rl.Temp.Rectangle$.At('splitScreenRect')
    .set(0.0, 0.0, screenCamera1.texture.width, -screenCamera1.texture.height);

  while (!rl.Core.WindowShouldClose()) {
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_S.value)) player1.ref.y += 3.0;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_W.value)) player1.ref.y -= 3.0;
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_D.value)) player1.ref.x += 3.0;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_A.value)) player1.ref.x -= 3.0;

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_UP.value)) player2.ref.y -= 3.0;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_DOWN.value)) player2.ref.y += 3.0;
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_RIGHT.value)) player2.ref.x += 3.0;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT.value)) player2.ref.x -= 3.0;

    camera1.ref.target.set(player1.ref.x, player1.ref.y);
    camera2.ref.target.set(player2.ref.x, player2.ref.y);

    rl.Core.BeginTextureMode(screenCamera1);
      rl.Core.ClearBackground(rl.Color.RAYWHITE);
      
      rl.Core.BeginMode2D(camera1.ref);
      
        for (int i = 0; i < screenWidth/PLAYER_SIZE + 1; i++)
        {
          rl.Core.DrawLineV(
            rl.Temp.vec21(PLAYER_SIZE*i, 0),
            rl.Temp.vec22(PLAYER_SIZE*i, screenHeight),
            rl.Color.LIGHTGRAY
          );
        }

        for (int i = 0; i < screenHeight/PLAYER_SIZE + 1; i++)
        {
          rl.Core.DrawLineV(
            rl.Temp.vec21(0, PLAYER_SIZE*i),
            rl.Temp.vec22(screenWidth, PLAYER_SIZE*i),
            rl.Color.LIGHTGRAY
          );
        }

        for (int i = 0; i < screenWidth/PLAYER_SIZE; i++)
        {
          for (int j = 0; j < screenHeight/PLAYER_SIZE; j++)
          {
            rl.Core.DrawText(
              "[$i,$j]".toC,
              10 + PLAYER_SIZE*i, 15 + PLAYER_SIZE*j,
              10, rl.Color.LIGHTGRAY
            );
          }
        }

        rl.Core.DrawRectangleRec(player1.ref, rl.Color.RED);
        rl.Core.DrawRectangleRec(player2.ref, rl.Color.BLUE);
      rl.Core.EndMode2D();
      
      rl.Core.DrawRectangle(0, 0, rl.Core.GetScreenWidth()~/2, 30, rl.Core.Fade(rl.Color.RAYWHITE, 0.6));
      rl.Core.DrawText("PLAYER1: W/S/A/D to move".toC, 10, 10, 10, rl.Color.MAROON);
        
    rl.Core.EndTextureMode();

    rl.Core.BeginTextureMode(screenCamera2);
      rl.Core.ClearBackground(rl.Color.RAYWHITE);
      
      rl.Core.BeginMode2D(camera2.ref);
      
        for (int i = 0; i < screenWidth/PLAYER_SIZE + 1; i++)
        {
          rl.Core.DrawLineV(
            rl.Temp.vec21(PLAYER_SIZE*i, 0),
            rl.Temp.vec22(PLAYER_SIZE*i, screenHeight),
            rl.Color.LIGHTGRAY
          );
        }

        for (int i = 0; i < screenHeight/PLAYER_SIZE + 1; i++)
        {
          rl.Core.DrawLineV(
            rl.Temp.vec21(0, PLAYER_SIZE*i),
            rl.Temp.vec22(screenWidth, PLAYER_SIZE*i),
            rl.Color.LIGHTGRAY
          );
        }

        for (int i = 0; i < screenWidth/PLAYER_SIZE; i++)
        {
          for (int j = 0; j < screenHeight/PLAYER_SIZE; j++)
          {
            rl.Core.DrawText(
              "[$i,$j]".toC,
              10 + PLAYER_SIZE*i, 15 + PLAYER_SIZE*j,
              10, rl.Color.LIGHTGRAY
            );
          }
        }

        rl.Core.DrawRectangleRec(player1.ref, rl.Color.RED);
        rl.Core.DrawRectangleRec(player2.ref, rl.Color.BLUE);
          
      rl.Core.EndMode2D();
      
      rl.Core.DrawRectangle(0, 0, rl.Core.GetScreenWidth()~/2, 30, rl.Core.Fade(rl.Color.RAYWHITE, 0.6));
      rl.Core.DrawText("PLAYER2: UP/DOWN/LEFT/RIGHT to move".toC, 10, 10, 10, rl.Color.DARKBLUE);
        
    rl.Core.EndTextureMode();

    rl.Core.BeginDrawing();
      rl.Core.ClearBackground(rl.Color.BLACK);
      
      rl.Core.DrawTextureRec(
        screenCamera1.texture,
        splitScreenRect.ref,
        rl.Temp.vec21(0, 0),
        rl.Color.WHITE
      );

      rl.Core.DrawTextureRec(
        screenCamera2.texture,
        splitScreenRect.ref,
        rl.Temp.vec21(screenWidth/2.0, 0),
        rl.Color.WHITE
      );
      
      rl.Core.DrawRectangle(rl.Core.GetScreenWidth()~/2 - 2, 0, 4, rl.Core.GetScreenHeight(), rl.Color.LIGHTGRAY);
    rl.Core.EndDrawing();
  }

  rl.Core.UnloadRenderTexture(screenCamera1);
  rl.Core.UnloadRenderTexture(screenCamera2);

  rl.CloseWindowAndDispose();
}