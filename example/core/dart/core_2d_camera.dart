// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_2d_camera.c
// Run it: dart run core_2d_camera.dart
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_BUILDINGS = 100;

void main() {
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_2d_camera');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final RectangleD player = .rect(400, 280, 40, 40);
  final buildings = <RectangleD>[];
  final colors = <ColorD>[];

  int spacing = 0;
  for (int i = 0; i < MAX_BUILDINGS; i++) {
    final width = rl.CoreD.GetRandomValue(50, 200);
    final height = rl.CoreD.GetRandomValue(100, 800);
    final y = screenHeight - 130 - height;
    final x = -6000 + spacing;

    buildings.add(.rect(x, y, width, height));

    spacing += width.toInt();

    colors.add(.color(
      rl.CoreD.GetRandomValue(200, 240),
      rl.CoreD.GetRandomValue(200, 240),
      rl.CoreD.GetRandomValue(200, 240),
      255,
    ));
  }

  final camera = Camera2DD(
    offset: .vec2(screenWidth / 2, screenHeight / 2),
    target: .vec2(player.x + 20, player.y + 20),
    rotation: 0,
    zoom: 1,
  );

  while (!rl.CoreD.WindowShouldClose()) {
    if (rl.CoreD.IsKeyDown(.KEY_RIGHT)) {
      player.x += 2;
    } else if (rl.CoreD.IsKeyDown(.KEY_LEFT)) {
      player.x -= 2;
    }

    camera.target.set(player.x + 20, player.y + 20);

    if (rl.CoreD.IsKeyDown(.KEY_A)) {
      camera.rotation--;
    } else if (rl.CoreD.IsKeyDown(.KEY_S)) {
      camera.rotation++;
    }

    if (camera.rotation > 40) {
      camera.rotation = 40;
    } else if (camera.rotation < -40) {
      camera.rotation = -40;
    }

    camera.zoom = math.exp(math.log(camera.zoom) + (rl.CoreD.GetMouseWheelMove()*0.1));

    if (camera.zoom > 3.0) {
      camera.zoom = 3.0;
    } else if (camera.zoom < 0.1) {
      camera.zoom = 0.1;
    }

    if (rl.CoreD.IsKeyPressed(.KEY_R)) {
      camera.zoom = 1;
      camera.rotation = 0;
    }

    rl.CoreD.BeginDrawing();

    rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode2D(camera);
        rl.CoreD.DrawRectangle(-6000, 320, 13000, 8000, .DARKGRAY);

        for (int i = 0; i < MAX_BUILDINGS; i++) {
          rl.CoreD.DrawRectangleRec(buildings[i], colors[i]);
        }

        rl.CoreD.DrawRectangleRec(player, .RED);

        rl.CoreD.DrawLine(
          camera.target.x, -screenHeight*10,
          camera.target.x, screenHeight*10,
          .GREEN,
        );

        rl.CoreD.DrawLine(
          -screenWidth*10, camera.target.y,
          screenWidth*10, camera.target.y,
          .GREEN,
        );

      rl.CoreD.EndMode2D();

    rl.CoreD.DrawText("SCREEN AREA", 640, 10, 20, .RED);

    rl.CoreD.DrawRectangle(0, 0, screenWidth, 5, .RED);
    rl.CoreD.DrawRectangle(0, 5, 5, screenHeight - 10, .RED);
    rl.CoreD.DrawRectangle(screenWidth - 5, 5, 5, screenHeight - 10, .RED);
    rl.CoreD.DrawRectangle(0, screenHeight - 5, screenWidth, 5, .RED);

    rl.CoreD.DrawRectangle(10, 10, 250, 113, rl.CoreD.Fade(.SKYBLUE, 0.5));
    rl.CoreD.DrawRectangleLines(10, 10, 250, 113, .BLUE);

    rl.CoreD.DrawText("Free 2D camera controls:", 20, 20, 10, .BLACK);
    rl.CoreD.DrawText("- Right/Left to move player", 40, 40, 10, .DARKGRAY);
    rl.CoreD.DrawText("- Mouse Wheel to Zoom in-out", 40, 60, 10, .DARKGRAY);
    rl.CoreD.DrawText("- A / S to Rotate", 40, 80, 10, .DARKGRAY);
    rl.CoreD.DrawText("- R to reset Zoom and Rotation", 40, 100, 10, .DARKGRAY);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}