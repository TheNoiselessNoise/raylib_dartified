// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_2d_camera.c
// Run it: dart run core_2d_camera.dart
import 'dart:math' as math;
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_BUILDINGS = 100;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_2d_camera");
  SetTargetFPS(60);

  final RectangleD player = .rect(400, 280, 40, 40);
  final buildings = <RectangleD>[];
  final colors = <ColorD>[];

  int spacing = 0;
  for (int i = 0; i < MAX_BUILDINGS; i++) {
    final width = GetRandomValue(50, 200);
    final height = GetRandomValue(100, 800);
    final y = screenHeight - 130 - height;
    final x = -6000 + spacing;

    buildings.add(.rect(x, y, width, height));

    spacing += width.toInt();

    colors.add(.color(
      GetRandomValue(200, 240),
      GetRandomValue(200, 240),
      GetRandomValue(200, 240),
      255,
    ));
  }

  final camera = Camera2DD(
    offset: .vec2(screenWidth / 2, screenHeight / 2),
    target: .vec2(player.x + 20, player.y + 20),
    rotation: 0,
    zoom: 1,
  );

  while (!WindowShouldClose()) {
    if (IsKeyDown(.KEY_RIGHT)) {
      player.x += 2;
    } else if (IsKeyDown(.KEY_LEFT)) {
      player.x -= 2;
    }

    camera.target.set(player.x + 20, player.y + 20);

    if (IsKeyDown(.KEY_A)) {
      camera.rotation--;
    } else if (IsKeyDown(.KEY_S)) {
      camera.rotation++;
    }

    if (camera.rotation > 40) {
      camera.rotation = 40;
    } else if (camera.rotation < -40) {
      camera.rotation = -40;
    }

    camera.zoom = math.exp(math.log(camera.zoom) + (GetMouseWheelMove()*0.1));

    if (camera.zoom > 3.0) {
      camera.zoom = 3.0;
    } else if (camera.zoom < 0.1) {
      camera.zoom = 0.1;
    }

    if (IsKeyPressed(.KEY_R)) {
      camera.zoom = 1;
      camera.rotation = 0;
    }

    BeginDrawing();

    ClearBackground(.RAYWHITE);

      BeginMode2D(camera);
        DrawRectangle(-6000, 320, 13000, 8000, .DARKGRAY);

        for (int i = 0; i < MAX_BUILDINGS; i++) {
          DrawRectangleRec(buildings[i], colors[i]);
        }

        DrawRectangleRec(player, .RED);

        DrawLine(
          camera.target.x, -screenHeight*10,
          camera.target.x, screenHeight*10,
          .GREEN,
        );

        DrawLine(
          -screenWidth*10, camera.target.y,
          screenWidth*10, camera.target.y,
          .GREEN,
        );

      EndMode2D();

    DrawText("SCREEN AREA", 640, 10, 20, .RED);

    DrawRectangle(0, 0, screenWidth, 5, .RED);
    DrawRectangle(0, 5, 5, screenHeight - 10, .RED);
    DrawRectangle(screenWidth - 5, 5, 5, screenHeight - 10, .RED);
    DrawRectangle(0, screenHeight - 5, screenWidth, 5, .RED);

    DrawRectangle(10, 10, 250, 113, Fade(.SKYBLUE, 0.5));
    DrawRectangleLines(10, 10, 250, 113, .BLUE);

    DrawText("Free 2D camera controls:", 20, 20, 10, .BLACK);
    DrawText("- Right/Left to move player", 40, 40, 10, .DARKGRAY);
    DrawText("- Mouse Wheel to Zoom in-out", 40, 60, 10, .DARKGRAY);
    DrawText("- A / S to Rotate", 40, 80, 10, .DARKGRAY);
    DrawText("- R to reset Zoom and Rotation", 40, 100, 10, .DARKGRAY);

    EndDrawing();
  }

  CloseWindowAndDispose();
}