// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_smooth_pixelperfect.c
// Run it: dart run core_smooth_pixelperfect.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int virtualScreenWidth = 160;
const int virtualScreenHeight = 90; 
const double virtualRatio = screenWidth/virtualScreenWidth;

void main() {
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_smooth_pixelperfect'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final worldSpaceCamera = rl.Temp.Camera2D$.At('worldSpaceCamera');
  worldSpaceCamera.ref.zoom = 1.0;

  final screenSpaceCamera = rl.Temp.Camera2D$.At('screenSpaceCamera');
  screenSpaceCamera.ref.zoom = 1.0;

  final target = rl.Core.LoadRenderTexture(virtualScreenWidth, virtualScreenHeight);

  final rec01 = rl.Temp.Rectangle$.At('rec01').set(70.0, 35.0, 20.0, 20.0);
  final rec02 = rl.Temp.Rectangle$.At('rec02').set(90.0, 55.0, 30.0, 10.0);
  final rec03 = rl.Temp.Rectangle$.At('rec03').set(80.0, 65.0, 15.0, 25.0);

  final sourceRec = rl.Temp.Rectangle$.At('sourceRec')
    .set(0.0, 0.0, target.texture.width, -target.texture.height);
  final destRec = rl.Temp.Rectangle$.At('destRec')
    .set(-virtualRatio, -virtualRatio, screenWidth + (virtualRatio*2), screenHeight + (virtualRatio*2));

  final origin = rl.Temp.Vector2$.At('origin').set(0.0, 0.0);

  double rotation = 0.0;

  double cameraX = 0.0;
  double cameraY = 0.0;

  while (!rl.Core.WindowShouldClose()) {
    rotation += 60.0*rl.Core.GetFrameTime();

    cameraX = (math.sin(rl.Core.GetTime())*50.0) - 10.0;
    cameraY = math.cos(rl.Core.GetTime())*30.0;

    screenSpaceCamera.ref.target.set(cameraX, cameraY);

    worldSpaceCamera.ref.target.x = screenSpaceCamera.ref.target.x.truncateToDouble();
    screenSpaceCamera.ref.target.x -= worldSpaceCamera.ref.target.x;
    screenSpaceCamera.ref.target.x *= virtualRatio;

    worldSpaceCamera.ref.target.y = screenSpaceCamera.ref.target.y.truncateToDouble();
    screenSpaceCamera.ref.target.y -= worldSpaceCamera.ref.target.y;
    screenSpaceCamera.ref.target.y *= virtualRatio;

    rl.Core.BeginTextureMode(target);
      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode2D(worldSpaceCamera.ref);
        rl.Core.DrawRectanglePro(rec01.ref, origin.ref, rotation, rl.Color.BLACK);
        rl.Core.DrawRectanglePro(rec02.ref, origin.ref, -rotation, rl.Color.RED);
        rl.Core.DrawRectanglePro(rec03.ref, origin.ref, rotation + 45.0, rl.Color.BLUE);
      rl.Core.EndMode2D();
    rl.Core.EndTextureMode();

    rl.Core.BeginDrawing();
      rl.Core.ClearBackground(rl.Color.RED);

      rl.Core.BeginMode2D(screenSpaceCamera.ref);
        rl.Core.DrawTexturePro(target.texture, sourceRec.ref, destRec.ref, origin.ref, 0.0, rl.Color.WHITE);
      rl.Core.EndMode2D();

      rl.Core.DrawText(
        "Screen resolution: ${screenWidth}x$screenHeight".toC,
        10, 10, 20, rl.Color.DARKBLUE
      );
      rl.Core.DrawText(
        "World resolution: ${virtualScreenWidth}x$virtualScreenHeight".toC,
        10, 40, 20, rl.Color.DARKGREEN
      );
      rl.Core.DrawFPS(rl.Core.GetScreenWidth() - 95, 10);
    rl.Core.EndDrawing();
  }

  rl.Core.UnloadRenderTexture(target);

  rl.CloseWindowAndDispose();
}