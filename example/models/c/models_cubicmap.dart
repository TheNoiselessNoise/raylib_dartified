// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_cubicmap.c
// Run it: dart run models_cubicmap.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_cubicmap".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(16, 14, 16);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final image = rl.Core.LoadImage("../resources/cubicmap.png".toC);
  final cubicmap = rl.Core.LoadTextureFromImage(image);

  final mesh = rl.Core.GenMeshCubicmap(image, rl.Temp.vec31(1.0, 1.0, 1.0));
  final model = rl.Core.LoadModelFromMesh(mesh);

  final texture = rl.Core.LoadTexture("../resources/cubicmap_atlas.png".toC);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final mapPosition = rl.Temp.Vector3$.At('mapPosition').set(-16.0, 0.0, -8.0);

  rl.Core.UnloadImage(image);

  bool pause = false;

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_P.value)) pause = !pause;

    if (!pause) rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawModel(model, mapPosition.ref, 1.0, rl.Color.WHITE);

      rl.Core.EndMode3D();

      rl.Core.DrawTextureEx(cubicmap, rl.Temp.vec21(screenWidth - cubicmap.width*4.0 - 20, 20.0), 0.0, 4.0, rl.Color.WHITE);
      rl.Core.DrawRectangleLines(screenWidth - cubicmap.width*4 - 20, 20, cubicmap.width*4, cubicmap.height*4, rl.Color.GREEN);

      rl.Core.DrawText("cubicmap image used to".toC, 658, 90, 10, rl.Color.GRAY);
      rl.Core.DrawText("generate map 3d model".toC, 658, 104, 10, rl.Color.GRAY);

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(cubicmap);
  rl.Core.UnloadTexture(texture);
  rl.Core.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}