// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_2d_camera_split_screen.c
// Run it: dart run core_2d_camera_split_screen.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 440;
const int PLAYER_SIZE = 40;

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_2d_camera_split_screen');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final RectangleD player1 = .rect(200, 200, PLAYER_SIZE, PLAYER_SIZE);
  final RectangleD player2 = .rect(250, 200, PLAYER_SIZE, PLAYER_SIZE);

  final camera1 = Camera2DD(
    target: .vec2(player1.x, player1.y),
    offset: .vec2(200.0, 200.0),
    rotation: 0.0,
    zoom: 1.0,
  );

  final camera2 = Camera2DD(
    target: .vec2(player2.x, player2.y),
    offset: .vec2(200.0, 200.0),
    rotation: 0.0,
    zoom: 1.0,
  );

  final screenCamera1 = rl.CoreD.LoadRenderTexture(screenWidth~/2, screenHeight);
  final screenCamera2 = rl.CoreD.LoadRenderTexture(screenWidth~/2, screenHeight);

  final RectangleD splitScreenRect = .rect(0.0, 0.0, screenCamera1.texture.width, -screenCamera1.texture.height);

  while (!rl.CoreD.WindowShouldClose()) {
    if (rl.CoreD.IsKeyDown(.KEY_S)) player1.y += 3.0;
    else if (rl.CoreD.IsKeyDown(.KEY_W)) player1.y -= 3.0;
    if (rl.CoreD.IsKeyDown(.KEY_D)) player1.x += 3.0;
    else if (rl.CoreD.IsKeyDown(.KEY_A)) player1.x -= 3.0;

    if (rl.CoreD.IsKeyDown(.KEY_UP)) player2.y -= 3.0;
    else if (rl.CoreD.IsKeyDown(.KEY_DOWN)) player2.y += 3.0;
    if (rl.CoreD.IsKeyDown(.KEY_RIGHT)) player2.x += 3.0;
    else if (rl.CoreD.IsKeyDown(.KEY_LEFT)) player2.x -= 3.0;

    camera1.target.set(player1.x, player1.y);
    camera2.target.set(player2.x, player2.y);

    rl.CoreD.BeginTextureMode(screenCamera1);
      rl.CoreD.ClearBackground(.RAYWHITE);
      
      rl.CoreD.BeginMode2D(camera1);
      
        for (int i = 0; i < screenWidth/PLAYER_SIZE + 1; i++)
        {
          rl.CoreD.DrawLineV(
            .vec2(PLAYER_SIZE*i, 0),
            .vec2(PLAYER_SIZE*i, screenHeight),
            .LIGHTGRAY
          );
        }

        for (int i = 0; i < screenHeight/PLAYER_SIZE + 1; i++)
        {
          rl.CoreD.DrawLineV(
            .vec2(0, PLAYER_SIZE*i),
            .vec2(screenWidth, PLAYER_SIZE*i),
            .LIGHTGRAY
          );
        }

        for (int i = 0; i < screenWidth/PLAYER_SIZE; i++)
        {
          for (int j = 0; j < screenHeight/PLAYER_SIZE; j++)
          {
            rl.CoreD.DrawText(
              "[$i,$j]",
              10 + PLAYER_SIZE*i,
              15 + PLAYER_SIZE*j,
              10,
              .LIGHTGRAY
            );
          }
        }

        rl.CoreD.DrawRectangleRec(player1, .RED);
        rl.CoreD.DrawRectangleRec(player2, .BLUE);
      rl.CoreD.EndMode2D();
      
      rl.CoreD.DrawRectangle(0, 0, rl.CoreD.GetScreenWidth()~/2, 30, rl.CoreD.Fade(.RAYWHITE, 0.6));
      rl.CoreD.DrawText("PLAYER1: W/S/A/D to move", 10, 10, 10, .MAROON);
        
    rl.CoreD.EndTextureMode();

    rl.CoreD.BeginTextureMode(screenCamera2);
      rl.CoreD.ClearBackground(.RAYWHITE);
      
      rl.CoreD.BeginMode2D(camera2);
      
        for (int i = 0; i < screenWidth/PLAYER_SIZE + 1; i++)
        {
          rl.CoreD.DrawLineV(
            .vec2(PLAYER_SIZE*i, 0),
            .vec2(PLAYER_SIZE*i, screenHeight),
            .LIGHTGRAY
          );
        }

        for (int i = 0; i < screenHeight/PLAYER_SIZE + 1; i++)
        {
          rl.CoreD.DrawLineV(
            .vec2(0, PLAYER_SIZE*i),
            .vec2(screenWidth, PLAYER_SIZE*i),
            .LIGHTGRAY
          );
        }

        for (int i = 0; i < screenWidth/PLAYER_SIZE; i++)
        {
          for (int j = 0; j < screenHeight/PLAYER_SIZE; j++)
          {
            rl.CoreD.DrawText(
              "[$i,$j]",
              10 + PLAYER_SIZE*i,
              15 + PLAYER_SIZE*j,
              10, 
              .LIGHTGRAY
            );
          }
        }

        rl.CoreD.DrawRectangleRec(player1, .RED);
        rl.CoreD.DrawRectangleRec(player2, .BLUE);
          
      rl.CoreD.EndMode2D();
      
      rl.CoreD.DrawRectangle(0, 0, rl.CoreD.GetScreenWidth()~/2, 30, rl.CoreD.Fade(.RAYWHITE, 0.6));
      rl.CoreD.DrawText("PLAYER2: UP/DOWN/LEFT/RIGHT to move", 10, 10, 10, .DARKBLUE);
        
    rl.CoreD.EndTextureMode();

    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.BLACK);
      
      rl.CoreD.DrawTextureRec(
        screenCamera1.texture,
        splitScreenRect,
        .vec2(0, 0),
        .WHITE
      );

      rl.CoreD.DrawTextureRec(
        screenCamera2.texture,
        splitScreenRect,
        .vec2(screenWidth/2.0, 0),
        .WHITE
      );
      
      rl.CoreD.DrawRectangle(rl.CoreD.GetScreenWidth()~/2 - 2, 0, 4, rl.CoreD.GetScreenHeight(), .LIGHTGRAY);
    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadRenderTexture(screenCamera1);
  rl.CoreD.UnloadRenderTexture(screenCamera2);

  rl.CloseWindowAndDispose();
}