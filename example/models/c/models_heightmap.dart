// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_heightmap.c
// Run it: dart run models_heightmap.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "models_heightmap".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(18, 21, 18);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final image = rl.Core.LoadImage("../resources/heightmap.png".toC);
  final texture = rl.Core.LoadTextureFromImage(image);

  final meshSize = rl.Temp.vec31(16, 8, 16);
  final mesh = rl.Core.GenMeshHeightmap(image, meshSize);
  final model = rl.Core.LoadModelFromMesh(mesh);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final mapPosition = rl.Temp.vec32(-8, 0, -8);
  
  rl.Core.UnloadImage(image);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawModel(model, mapPosition, 1.0, rl.Color.RED);
        rl.Core.DrawGrid(20, 1.0);

      rl.Core.EndMode3D();

      rl.Core.DrawTexture(texture, screenWidth - texture.width - 20, 20, rl.Color.WHITE);
      rl.Core.DrawRectangleLines(screenWidth - texture.width - 20, 20, texture.width, texture.height, rl.Color.GREEN);

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texture);
  rl.Core.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}