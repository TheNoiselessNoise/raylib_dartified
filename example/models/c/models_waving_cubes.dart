// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_waving_cubes.c
// Run it: dart run models_waving_cubes.dart
import 'dart:ffi';
import '../../base.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;
const int NUM_BLOCKS = 15;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_waving_cubes".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(30.0, 20.0, 30.0);
  camera.ref.target.set(0.0, 0.0, 0.0);
  camera.ref.up.set(0.0, 1.0, 0.0);
  camera.ref.fovy = 70;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  while (!rl.Core.WindowShouldClose())
  {
    final time = rl.Core.GetTime();
    final scale = (2.0 + math.sin(time))*0.7;

    final cameraTime = time*0.3;
    camera.ref.position.x = math.cos(cameraTime)*40.0;
    camera.ref.position.z = math.sin(cameraTime)*40.0;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawGrid(10, 5.0);

        for (int x = 0; x < NUM_BLOCKS; x++)
        {
          for (int y = 0; y < NUM_BLOCKS; y++)
          {
            for (int z = 0; z < NUM_BLOCKS; z++)
            {
              final blockScale = (x + y + z)/30.0;
              final scatter = math.sin(blockScale*20.0 + (time*4.0));

              final cubePos = rl.Temp.vec31(
                (x - NUM_BLOCKS/2)*(scale*3.0) + scatter,
                (y - NUM_BLOCKS/2)*(scale*2.0) + scatter,
                (z - NUM_BLOCKS/2)*(scale*3.0) + scatter
              );

              final cubeColor = rl.Core.ColorFromHSV((((x + y + z)*18)%360), 0.75, 0.9);
              final cubeSize = (2.4 - scale)*blockScale;

              rl.Core.DrawCube(cubePos, cubeSize, cubeSize, cubeSize, cubeColor);
            }
          }
        }

      rl.Core.EndMode3D();

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}