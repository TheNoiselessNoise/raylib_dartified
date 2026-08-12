// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_smooth_pixelperfect.c
// Run it: dart run core_smooth_pixelperfect.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int virtualScreenWidth = 160;
const int virtualScreenHeight = 90; 
const double virtualRatio = screenWidth/virtualScreenWidth;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_smooth_pixelperfect".toC);
  SetTargetFPS(60);

  final worldSpaceCamera = Camera2D$.val.At('worldSpaceCamera');
  worldSpaceCamera.ref.zoom = 1.0;

  final screenSpaceCamera = Camera2D$.val.At('screenSpaceCamera');
  screenSpaceCamera.ref.zoom = 1.0;

  final target = LoadRenderTexture(virtualScreenWidth, virtualScreenHeight);

  final rec01 = Rectangle$.val.At('rec01').set(70.0, 35.0, 20.0, 20.0);
  final rec02 = Rectangle$.val.At('rec02').set(90.0, 55.0, 30.0, 10.0);
  final rec03 = Rectangle$.val.At('rec03').set(80.0, 65.0, 15.0, 25.0);

  final sourceRec = Rectangle$.val.At('sourceRec')
    .set(0.0, 0.0, target.texture.width, -target.texture.height);
  final destRec = Rectangle$.val.At('destRec')
    .set(-virtualRatio, -virtualRatio, screenWidth + (virtualRatio*2), screenHeight + (virtualRatio*2));

  final origin = Vector2$.val.At('origin').set(0.0, 0.0);

  double rotation = 0.0;

  double cameraX = 0.0;
  double cameraY = 0.0;

  while (!WindowShouldClose()) {
    rotation += 60.0*GetFrameTime();

    cameraX = (math.sin(GetTime())*50.0) - 10.0;
    cameraY = math.cos(GetTime())*30.0;

    screenSpaceCamera.ref.target.set(cameraX, cameraY);

    worldSpaceCamera.ref.target.x = screenSpaceCamera.ref.target.x.truncateToDouble();
    screenSpaceCamera.ref.target.x -= worldSpaceCamera.ref.target.x;
    screenSpaceCamera.ref.target.x *= virtualRatio;

    worldSpaceCamera.ref.target.y = screenSpaceCamera.ref.target.y.truncateToDouble();
    screenSpaceCamera.ref.target.y -= worldSpaceCamera.ref.target.y;
    screenSpaceCamera.ref.target.y *= virtualRatio;

    BeginTextureMode(target);
      ClearBackground(RAYWHITE);

      BeginMode2D(worldSpaceCamera.ref);
        DrawRectanglePro(rec01.ref, origin.ref, rotation, BLACK);
        DrawRectanglePro(rec02.ref, origin.ref, -rotation, RED);
        DrawRectanglePro(rec03.ref, origin.ref, rotation + 45.0, BLUE);
      EndMode2D();
    EndTextureMode();

    BeginDrawing();
      ClearBackground(RED);

      BeginMode2D(screenSpaceCamera.ref);
        DrawTexturePro(target.texture, sourceRec.ref, destRec.ref, origin.ref, 0.0, WHITE);
      EndMode2D();

      DrawText(
        "Screen resolution: ${screenWidth}x$screenHeight".toC,
        10, 10, 20, DARKBLUE
      );
      DrawText(
        "World resolution: ${virtualScreenWidth}x$virtualScreenHeight".toC,
        10, 40, 20, DARKGREEN
      );
      DrawFPS(GetScreenWidth() - 95, 10);
    EndDrawing();
  }

  UnloadRenderTexture(target);

  CloseWindowAndDispose();
}