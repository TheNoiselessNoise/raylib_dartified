// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_split_screen.c
// Run it: dart run core_3d_camera_split_screen.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_3d_camera_split_screen');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final cameraPlayer1 = Camera3DD();
  cameraPlayer1.fovy = 45.0;
  cameraPlayer1.up.y = 1.0;
  cameraPlayer1.target.y = 1.0;
  cameraPlayer1.position.z = -3.0;
  cameraPlayer1.position.y = 1.0;

  final screenPlayer1 = rl.CoreD.LoadRenderTexture(screenWidth~/2, screenHeight);

  final cameraPlayer2 = Camera3DD();
  cameraPlayer2.fovy = 45.0;
  cameraPlayer2.up.y = 1.0;
  cameraPlayer2.target.y = 3.0;
  cameraPlayer2.position.x = -3.0;
  cameraPlayer2.position.y = 3.0;

  final screenPlayer2 = rl.CoreD.LoadRenderTexture(screenWidth~/2, screenHeight);

  final RectangleD splitScreenRect = .rect(0.0, 0.0, screenPlayer1.texture.width, -screenPlayer1.texture.height);
  
  int count = 5;
  double spacing = 4;

  while (!rl.CoreD.WindowShouldClose()) {
    double offsetThisFrame = 10.0*rl.CoreD.GetFrameTime();

    if (rl.CoreD.IsKeyDown(.KEY_W))
    {
      cameraPlayer1.position.z += offsetThisFrame;
      cameraPlayer1.target.z += offsetThisFrame;
    }
    else if (rl.CoreD.IsKeyDown(.KEY_S))
    {
      cameraPlayer1.position.z -= offsetThisFrame;
      cameraPlayer1.target.z -= offsetThisFrame;
    }

    if (rl.CoreD.IsKeyDown(.KEY_UP))
    {
      cameraPlayer2.position.x += offsetThisFrame;
      cameraPlayer2.target.x += offsetThisFrame;
    }
    else if (rl.CoreD.IsKeyDown(.KEY_DOWN))
    {
      cameraPlayer2.position.x -= offsetThisFrame;
      cameraPlayer2.target.x -= offsetThisFrame;
    }

    rl.CoreD.BeginTextureMode(screenPlayer1);
      rl.CoreD.ClearBackground(.SKYBLUE);
      
      rl.CoreD.BeginMode3D(cameraPlayer1);
      
        rl.CoreD.DrawPlane(.vec3(0, 0, 0), .vec2(50, 50), .BEIGE);

        for (double x = -count*spacing; x <= count*spacing; x += spacing)
        {
          for (double z = -count*spacing; z <= count*spacing; z += spacing)
          {
            rl.CoreD.DrawCube(.vec3(x, 1.5, z), 1, 1, 1, .LIME);
            rl.CoreD.DrawCube(.vec3(x, 0.5, z), 0.25, 1, 0.25, .BROWN);
          }
        }

        rl.CoreD.DrawCube(cameraPlayer1.position, 1, 1, 1, .RED);
        rl.CoreD.DrawCube(cameraPlayer2.position, 1, 1, 1, .BLUE);
          
      rl.CoreD.EndMode3D();
      
      rl.CoreD.DrawRectangle(0, 0, rl.CoreD.GetScreenWidth()~/2, 40, rl.CoreD.Fade(.RAYWHITE, 0.8));
      rl.CoreD.DrawText("PLAYER1: W/S to move", 10, 10, 20, .MAROON);
        
    rl.CoreD.EndTextureMode();

    rl.CoreD.BeginTextureMode(screenPlayer2);
      rl.CoreD.ClearBackground(.SKYBLUE);
      
      rl.CoreD.BeginMode3D(cameraPlayer2);

        rl.CoreD.DrawPlane(.vec3(0, 0, 0), .vec2(50, 50), .BEIGE);
      
        for (double x = -count*spacing; x <= count*spacing; x += spacing)
        {
          for (double z = -count*spacing; z <= count*spacing; z += spacing)
          {
            rl.CoreD.DrawCube(.vec3(x, 1.5, z), 1, 1, 1, .LIME);
            rl.CoreD.DrawCube(.vec3(x, 0.5, z), 0.25, 1, 0.25, .BROWN);
          }
        }

        rl.CoreD.DrawCube(cameraPlayer1.position, 1, 1, 1, .RED);
        rl.CoreD.DrawCube(cameraPlayer2.position, 1, 1, 1, .BLUE);
          
      rl.CoreD.EndMode3D();
      
      rl.CoreD.DrawRectangle(0, 0, rl.CoreD.GetScreenWidth()~/2, 40, rl.CoreD.Fade(.RAYWHITE, 0.8));
      rl.CoreD.DrawText("PLAYER2: UP/DOWN to move", 10, 10, 20, .DARKBLUE);
        
    rl.CoreD.EndTextureMode();

    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.BLACK);
      
      rl.CoreD.DrawTextureRec(
        screenPlayer1.texture,
        splitScreenRect,
        .vec2(0, 0),
        .WHITE
      );

      rl.CoreD.DrawTextureRec(
        screenPlayer2.texture,
        splitScreenRect,
        .vec2(screenWidth/2.0, 0),
        .WHITE
      );
      
      rl.CoreD.DrawRectangle(rl.CoreD.GetScreenWidth()~/2 - 2, 0, 4, rl.CoreD.GetScreenHeight(), .LIGHTGRAY);
    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadRenderTexture(screenPlayer1);
  rl.CoreD.UnloadRenderTexture(screenPlayer2);

  rl.CloseWindowAndDispose();
}