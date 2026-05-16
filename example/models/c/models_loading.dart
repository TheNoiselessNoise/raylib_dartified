// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading.c
// Run it: dart run models_loading.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_loading".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(50, 50, 50);
  camera.ref.target.set(0, 10, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  var model = rl.Core.LoadModel("../resources/models/obj/castle.obj".toC);
  var texture = rl.Core.LoadTexture("../resources/models/obj/castle_diffuse.png".toC);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final position = rl.Temp.Vector3$.At('position');
  var bounds = rl.Core.GetMeshBoundingBox(model.meshes[0]);

  bool selected = false;

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

    if (rl.Core.IsFileDropped()) {
      final droppedFiles = rl.Core.LoadDroppedFiles();

      if (droppedFiles.count == 1) {
        if (
          rl.Core.IsFileExtension(droppedFiles.paths[0], ".obj".toC) ||
          rl.Core.IsFileExtension(droppedFiles.paths[0], ".gltf".toC) ||
          rl.Core.IsFileExtension(droppedFiles.paths[0], ".glb".toC) ||
          rl.Core.IsFileExtension(droppedFiles.paths[0], ".vox".toC) ||
          rl.Core.IsFileExtension(droppedFiles.paths[0], ".iqm".toC) ||
          rl.Core.IsFileExtension(droppedFiles.paths[0], ".m3d".toC)
        ) {
          rl.Core.UnloadModel(model);
          model = rl.Core.LoadModel(droppedFiles.paths[0]);
          model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
          bounds = rl.Core.GetMeshBoundingBox(model.meshes[0]);
        } else if (
          rl.Core.IsFileExtension(droppedFiles.paths[0], ".png".toC)
        ) {
          rl.Core.UnloadTexture(texture);
          texture = rl.Core.LoadTexture(droppedFiles.paths[0]);
          model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
        }
      }

      rl.Core.UnloadDroppedFiles(droppedFiles);
    }

    if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      final mousePos = rl.Core.GetMousePosition();
      final ray = rl.Core.GetScreenToWorldRay(mousePos, camera.ref);
      final collision = rl.Core.GetRayCollisionBox(ray, bounds);
      if (collision.hit) {
        selected = !selected;
      } else {
        selected = false;
      }
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawModel(model, position.ref, 1.0, rl.Color.WHITE);
        rl.Core.DrawGrid(20, 10.0);
        if (selected) {
          rl.Core.DrawBoundingBox(bounds, rl.Color.GREEN);
        }

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Drag & drop model to load mesh/texture.".toC,
        10, screenHeight - 20, 10, rl.Color.DARKGRAY
      );

      if (selected) {
        rl.Core.DrawText(
          "MODEL SELECTED".toC,
          screenWidth - 110, 10, 10, rl.Color.GREEN
        );
      }

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texture);
  rl.Core.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}