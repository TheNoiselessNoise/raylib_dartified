// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_split_screen.c
// Run it: dart run core_3d_camera_split_screen.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_3d_camera_split_screen".toC);
  SetTargetFPS(60);

  final cameraPlayer1 = Camera3D$.At('cameraPlayer1');
  cameraPlayer1.ref.fovy = 45.0;
  cameraPlayer1.ref.up.y = 1.0;
  cameraPlayer1.ref.target.y = 1.0;
  cameraPlayer1.ref.position.z = -3.0;
  cameraPlayer1.ref.position.y = 1.0;

  final screenPlayer1 = LoadRenderTexture(screenWidth~/2, screenHeight);

  final cameraPlayer2 = Camera3D$.At('cameraPlayer2');
  cameraPlayer2.ref.fovy = 45.0;
  cameraPlayer2.ref.up.y = 1.0;
  cameraPlayer2.ref.target.y = 3.0;
  cameraPlayer2.ref.position.x = -3.0;
  cameraPlayer2.ref.position.y = 3.0;

  final screenPlayer2 = LoadRenderTexture(screenWidth~/2, screenHeight);

  final splitScreenRect = Rectangle$.At('splitScreenRect')
    .set(0.0, 0.0, screenPlayer1.texture.width, -screenPlayer1.texture.height);
  
  int count = 5;
  double spacing = 4;

  while (!WindowShouldClose()) {
    double offsetThisFrame = 10.0*GetFrameTime();

    if (IsKeyDown(KeyboardKey.KEY_W.value))
    {
      cameraPlayer1.ref.position.z += offsetThisFrame;
      cameraPlayer1.ref.target.z += offsetThisFrame;
    }
    else if (IsKeyDown(KeyboardKey.KEY_S.value))
    {
      cameraPlayer1.ref.position.z -= offsetThisFrame;
      cameraPlayer1.ref.target.z -= offsetThisFrame;
    }

    if (IsKeyDown(KeyboardKey.KEY_UP.value))
    {
      cameraPlayer2.ref.position.x += offsetThisFrame;
      cameraPlayer2.ref.target.x += offsetThisFrame;
    }
    else if (IsKeyDown(KeyboardKey.KEY_DOWN.value))
    {
      cameraPlayer2.ref.position.x -= offsetThisFrame;
      cameraPlayer2.ref.target.x -= offsetThisFrame;
    }

    BeginTextureMode(screenPlayer1);
      ClearBackground(SKYBLUE);
      
      BeginMode3D(cameraPlayer1.ref);
      
        DrawPlane(
          Vector3$.$1.set(0, 0, 0),
          Vector2$.$1.set(50, 50),
          BEIGE
        );

        for (double x = -count*spacing; x <= count*spacing; x += spacing)
        {
          for (double z = -count*spacing; z <= count*spacing; z += spacing)
          {
            DrawCube(Vector3$.$1.set(x, 1.5, z), 1, 1, 1, LIME);
            DrawCube(Vector3$.$1.set(x, 0.5, z), 0.25, 1, 0.25, BROWN);
          }
        }

        DrawCube(cameraPlayer1.ref.position, 1, 1, 1, RED);
        DrawCube(cameraPlayer2.ref.position, 1, 1, 1, BLUE);
          
      EndMode3D();
      
      DrawRectangle(0, 0, GetScreenWidth()~/2, 40, Fade(RAYWHITE, 0.8));
      DrawText("PLAYER1: W/S to move".toC, 10, 10, 20, MAROON);
        
    EndTextureMode();

    BeginTextureMode(screenPlayer2);
      ClearBackground(SKYBLUE);
      
      BeginMode3D(cameraPlayer2.ref);

        DrawPlane(
          Vector3$.$1.set(0, 0, 0),
          Vector2$.$1.set(50, 50),
          BEIGE
        );
      
        for (double x = -count*spacing; x <= count*spacing; x += spacing)
        {
          for (double z = -count*spacing; z <= count*spacing; z += spacing)
          {
            DrawCube(Vector3$.$1.set(x, 1.5, z), 1, 1, 1, LIME);
            DrawCube(Vector3$.$1.set(x, 0.5, z), 0.25, 1, 0.25, BROWN);
          }
        }

        DrawCube(cameraPlayer1.ref.position, 1, 1, 1, RED);
        DrawCube(cameraPlayer2.ref.position, 1, 1, 1, BLUE);
          
      EndMode3D();
      
      DrawRectangle(0, 0, GetScreenWidth()~/2, 40, Fade(RAYWHITE, 0.8));
      DrawText("PLAYER2: UP/DOWN to move".toC, 10, 10, 20, DARKBLUE);
        
    EndTextureMode();

    BeginDrawing();
      ClearBackground(BLACK);
      
      DrawTextureRec(
        screenPlayer1.texture,
        splitScreenRect.ref,
        Vector2$.$1.set(0, 0),
        WHITE
      );

      DrawTextureRec(
        screenPlayer2.texture,
        splitScreenRect.ref,
        Vector2$.$1.set(screenWidth/2.0, 0),
        WHITE
      );
      
      DrawRectangle(GetScreenWidth()~/2 - 2, 0, 4, GetScreenHeight(), LIGHTGRAY);
    EndDrawing();
  }

  UnloadRenderTexture(screenPlayer1);
  UnloadRenderTexture(screenPlayer2);

  CloseWindowAndDispose();
}