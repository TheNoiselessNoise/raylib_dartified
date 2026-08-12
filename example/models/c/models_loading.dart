// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading.c
// Run it: dart run models_loading.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_loading".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(50, 50, 50);
  camera.ref.target.set(0, 10, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  var model = LoadModel("../resources/models/obj/castle.obj".toC);
  var texture = LoadTexture("../resources/models/obj/castle_diffuse.png".toC);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final position = Vector3$.val.At('position');
  var bounds = GetMeshBoundingBox(model.meshes[0]);

  bool selected = false;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

    if (IsFileDropped()) {
      final droppedFiles = LoadDroppedFiles();

      if (droppedFiles.count == 1) {
        if (
          IsFileExtension(droppedFiles.paths[0], ".obj".toC) ||
          IsFileExtension(droppedFiles.paths[0], ".gltf".toC) ||
          IsFileExtension(droppedFiles.paths[0], ".glb".toC) ||
          IsFileExtension(droppedFiles.paths[0], ".vox".toC) ||
          IsFileExtension(droppedFiles.paths[0], ".iqm".toC) ||
          IsFileExtension(droppedFiles.paths[0], ".m3d".toC)
        ) {
          UnloadModel(model);
          model = LoadModel(droppedFiles.paths[0]);
          model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
          bounds = GetMeshBoundingBox(model.meshes[0]);
        } else if (
          IsFileExtension(droppedFiles.paths[0], ".png".toC)
        ) {
          UnloadTexture(texture);
          texture = LoadTexture(droppedFiles.paths[0]);
          model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
        }
      }

      UnloadDroppedFiles(droppedFiles);
    }

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      final mousePos = GetMousePosition();
      final ray = GetScreenToWorldRay(mousePos, camera.ref);
      final collision = GetRayCollisionBox(ray, bounds);
      if (collision.hit) {
        selected = !selected;
      } else {
        selected = false;
      }
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawModel(model, position.ref, 1.0, WHITE);
        DrawGrid(20, 10.0);
        if (selected) {
          DrawBoundingBox(bounds, GREEN);
        }

      EndMode3D();

      DrawText(
        "Drag & drop model to load mesh/texture.".toC,
        10, screenHeight - 20, 10, DARKGRAY
      );

      if (selected) {
        DrawText(
          "MODEL SELECTED".toC,
          screenWidth - 110, 10, 10, GREEN
        );
      }

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadModel(model);
  
  CloseWindowAndDispose();
}