// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_smooth_pixelperfect.c
// Run it: dart run core_smooth_pixelperfect.dart
import 'dart:math' as math;
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int virtualScreenWidth = 160;
const int virtualScreenHeight = 90; 
const double virtualRatio = screenWidth/virtualScreenWidth;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_smooth_pixelperfect");
  SetTargetFPS(60);

  final worldSpaceCamera = Camera2DD();
  worldSpaceCamera.zoom = 1.0;

  final screenSpaceCamera = Camera2DD();
  screenSpaceCamera.zoom = 1.0;

  final target = LoadRenderTexture(virtualScreenWidth, virtualScreenHeight);

  final RectangleD rec01 = .rect(70.0, 35.0, 20.0, 20.0);
  final RectangleD rec02 = .rect(90.0, 55.0, 30.0, 10.0);
  final RectangleD rec03 = .rect(80.0, 65.0, 15.0, 25.0);

  final RectangleD sourceRec = .rect(0.0, 0.0, target.texture.width, -target.texture.height);
  final RectangleD destRec = .rect(-virtualRatio, -virtualRatio, screenWidth + (virtualRatio*2), screenHeight + (virtualRatio*2));

  final Vector2D origin = .vec2(0.0, 0.0);

  double rotation = 0.0;

  double cameraX = 0.0;
  double cameraY = 0.0;

  while (!WindowShouldClose()) {
    rotation += 60.0*GetFrameTime();

    cameraX = (math.sin(GetTime())*50.0) - 10.0;
    cameraY = math.cos(GetTime())*30.0;

    screenSpaceCamera.target.set(cameraX, cameraY);

    worldSpaceCamera.target.x = screenSpaceCamera.target.x.truncateToDouble();
    screenSpaceCamera.target.x -= worldSpaceCamera.target.x;
    screenSpaceCamera.target.x *= virtualRatio;

    worldSpaceCamera.target.y = screenSpaceCamera.target.y.truncateToDouble();
    screenSpaceCamera.target.y -= worldSpaceCamera.target.y;
    screenSpaceCamera.target.y *= virtualRatio;

    BeginTextureMode(target);
      ClearBackground(.RAYWHITE);

      BeginMode2D(worldSpaceCamera);
        DrawRectanglePro(rec01, origin, rotation, .BLACK);
        DrawRectanglePro(rec02, origin, -rotation, .RED);
        DrawRectanglePro(rec03, origin, rotation + 45.0, .BLUE);
      EndMode2D();
    EndTextureMode();

    BeginDrawing();
      ClearBackground(.RED);

      BeginMode2D(screenSpaceCamera);
        DrawTexturePro(target.texture, sourceRec, destRec, origin, 0.0, .WHITE);
      EndMode2D();

      DrawText(
        "Screen resolution: ${screenWidth}x$screenHeight",
        10, 10, 20, .DARKBLUE
      );
      DrawText(
        "World resolution: ${virtualScreenWidth}x$virtualScreenHeight",
        10, 40, 20, .DARKGREEN
      );
      DrawFPS(GetScreenWidth() - 95, 10);
    EndDrawing();
  }

  UnloadRenderTexture(target);

  CloseWindowAndDispose();
}