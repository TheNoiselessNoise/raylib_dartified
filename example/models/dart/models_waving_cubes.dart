// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_waving_cubes.c
// Run it: dart run models_waving_cubes.dart
import '../../base_dart.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;
const int NUM_BLOCKS = 15;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_waving_cubes");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3DD(
    position: .vec3(30, 20, 30),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 70,
    projection: .CAMERA_PERSPECTIVE,
  );

  while (!WindowShouldClose())
  {
    final time = GetTime();
    final scale = (2.0 + math.sin(time))*0.7;

    final cameraTime = time*0.3;
    camera.position.x = math.cos(cameraTime)*40.0;
    camera.position.z = math.sin(cameraTime)*40.0;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawGrid(10, 5.0);

        for (int x = 0; x < NUM_BLOCKS; x++)
        {
          for (int y = 0; y < NUM_BLOCKS; y++)
          {
            for (int z = 0; z < NUM_BLOCKS; z++)
            {
              final blockScale = (x + y + z)/30.0;
              final scatter = math.sin(blockScale*20.0 + (time*4.0));

              final Vector3D cubePos = .vec3(
                (x - NUM_BLOCKS/2)*(scale*3.0) + scatter,
                (y - NUM_BLOCKS/2)*(scale*2.0) + scatter,
                (z - NUM_BLOCKS/2)*(scale*3.0) + scatter
              );

              final cubeColor = ColorFromHSV((((x + y + z)*18)%360), 0.75, 0.9);
              final cubeSize = (2.4 - scale)*blockScale;

              DrawCube(cubePos, cubeSize, cubeSize, cubeSize, cubeColor);
            }
          }
        }

      EndMode3D();

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}