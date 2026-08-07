// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading.c
// Run it: dart run models_loading.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_loading");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3DD(
    position: .vec3(50, 50, 50),
    target: .vec3(0, 10, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  var model = LoadModel("../resources/models/obj/castle.obj");
  var texture = LoadTexture("../resources/models/obj/castle_diffuse.png");
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  var bounds = GetMeshBoundingBox(model.meshes[0]);

  bool selected = false;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_FIRST_PERSON);

    if (IsFileDropped()) {
      final droppedFiles = LoadDroppedFiles();

      if (droppedFiles.count == 1) {
        if (
          IsFileExtension(droppedFiles.paths[0], ".obj") ||
          IsFileExtension(droppedFiles.paths[0], ".gltf") ||
          IsFileExtension(droppedFiles.paths[0], ".glb") ||
          IsFileExtension(droppedFiles.paths[0], ".vox") ||
          IsFileExtension(droppedFiles.paths[0], ".iqm") ||
          IsFileExtension(droppedFiles.paths[0], ".m3d")
        ) {
          UnloadModel(model);
          model = LoadModel(droppedFiles.paths[0]);
          model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
          bounds = GetMeshBoundingBox(model.meshes[0]);
        } else if (
          IsFileExtension(droppedFiles.paths[0], ".png")
        ) {
          UnloadTexture(texture);
          texture = LoadTexture(droppedFiles.paths[0]);
          model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
        }
      }
    }

    if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) {
      final mousePos = GetMousePosition();
      final ray = GetScreenToWorldRay(mousePos, camera);
      final collision = GetRayCollisionBox(ray, bounds);
      if (collision.hit) {
        selected = !selected;
      } else {
        selected = false;
      }
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawModel(model, .zero(), 1.0, .WHITE);
        DrawGrid(20, 10.0);
        if (selected) {
          DrawBoundingBox(bounds, .GREEN);
        }

      EndMode3D();

      DrawText(
        "Drag & drop model to load mesh/texture.",
        10, screenHeight - 20, 10, .DARKGRAY
      );

      if (selected) {
        DrawText(
          "MODEL SELECTED",
          screenWidth - 110, 10, 10, .GREEN
        );
      }

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadModel(model);
  
  CloseWindowAndDispose();
}