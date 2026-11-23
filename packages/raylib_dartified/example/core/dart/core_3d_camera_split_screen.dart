// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_split_screen.c
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Camera3D cameraPlayer1;
late RenderTexture screenPlayer1;
late Camera3D cameraPlayer2;
late RenderTexture screenPlayer2;
late Rectangle splitScreenRect;
final int count = 5;
final double spacing = 4;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "core_3d_camera_split_screen");
    SetTargetFPS(60);

    cameraPlayer1 = .new(
      position: .vec3(0, 1.0, -3.0),
      target: .vec3(0, 1.0, 0),
      up: .vec3(0, 1.0, 0),
      fovy: 45.0,
    );

    screenPlayer1 = LoadRenderTexture(screenWidth~/2, screenHeight);

    cameraPlayer2 = .new(
      position: .vec3(-3.0, 3.0, 0),
      target: .vec3(0, 3.0, 0),
      up: .vec3(0, 1.0, 0),
      fovy: 45.0,
    );

    screenPlayer2 = LoadRenderTexture(screenWidth~/2, screenHeight);

    splitScreenRect = .rect(0.0, 0.0, screenPlayer1.texture.width, -screenPlayer1.texture.height);
  },
  loop: (_) async {
    double offsetThisFrame = 10.0*GetFrameTime();

    if (IsKeyDown(.KEY_W))
    {
      cameraPlayer1.position.z += offsetThisFrame;
      cameraPlayer1.target.z += offsetThisFrame;
    }
    else if (IsKeyDown(.KEY_S))
    {
      cameraPlayer1.position.z -= offsetThisFrame;
      cameraPlayer1.target.z -= offsetThisFrame;
    }

    if (IsKeyDown(.KEY_UP))
    {
      cameraPlayer2.position.x += offsetThisFrame;
      cameraPlayer2.target.x += offsetThisFrame;
    }
    else if (IsKeyDown(.KEY_DOWN))
    {
      cameraPlayer2.position.x -= offsetThisFrame;
      cameraPlayer2.target.x -= offsetThisFrame;
    }

    BeginTextureMode(screenPlayer1);
      ClearBackground(.SKYBLUE);
      
      BeginMode3D(cameraPlayer1);
      
        DrawPlane(.vec3(0, 0, 0), .vec2(50, 50), .BEIGE);

        for (double x = -count*spacing; x <= count*spacing; x += spacing)
        {
          for (double z = -count*spacing; z <= count*spacing; z += spacing)
          {
            DrawCube(.vec3(x, 1.5, z), 1, 1, 1, .LIME);
            DrawCube(.vec3(x, 0.5, z), 0.25, 1, 0.25, .BROWN);
          }
        }

        DrawCube(cameraPlayer1.position, 1, 1, 1, .RED);
        DrawCube(cameraPlayer2.position, 1, 1, 1, .BLUE);
          
      EndMode3D();
      
      DrawRectangle(0, 0, GetScreenWidth()~/2, 40, Fade(.RAYWHITE, 0.8));
      DrawText("PLAYER1: W/S to move", 10, 10, 20, .MAROON);
        
    EndTextureMode();

    BeginTextureMode(screenPlayer2);
      ClearBackground(.SKYBLUE);
      
      BeginMode3D(cameraPlayer2);

        DrawPlane(.vec3(0, 0, 0), .vec2(50, 50), .BEIGE);
      
        for (double x = -count*spacing; x <= count*spacing; x += spacing)
        {
          for (double z = -count*spacing; z <= count*spacing; z += spacing)
          {
            DrawCube(.vec3(x, 1.5, z), 1, 1, 1, .LIME);
            DrawCube(.vec3(x, 0.5, z), 0.25, 1, 0.25, .BROWN);
          }
        }

        DrawCube(cameraPlayer1.position, 1, 1, 1, .RED);
        DrawCube(cameraPlayer2.position, 1, 1, 1, .BLUE);
          
      EndMode3D();
      
      DrawRectangle(0, 0, GetScreenWidth()~/2, 40, Fade(.RAYWHITE, 0.8));
      DrawText("PLAYER2: UP/DOWN to move", 10, 10, 20, .DARKBLUE);
        
    EndTextureMode();

    BeginDrawing();
      ClearBackground(.BLACK);
      
      DrawTextureRec(
        screenPlayer1.texture,
        splitScreenRect,
        .vec2(0, 0),
        .WHITE
      );

      DrawTextureRec(
        screenPlayer2.texture,
        splitScreenRect,
        .vec2(screenWidth/2.0, 0),
        .WHITE
      );
      
      DrawRectangle(GetScreenWidth()~/2 - 2, 0, 4, GetScreenHeight(), .LIGHTGRAY);
    EndDrawing();
  },
  close: (_) {
    UnloadRenderTexture(screenPlayer1);
    UnloadRenderTexture(screenPlayer2);

    CloseWindow();
  },
);