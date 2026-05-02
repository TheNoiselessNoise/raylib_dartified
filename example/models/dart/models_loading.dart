// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading.c
// Run it: dart run models_loading.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_loading");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = CameraD(
    position: .vec3(50, 50, 50),
    target: .vec3(0, 10, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  var model = rl.CoreD.LoadModel("../resources/models/obj/castle.obj");
  var texture = rl.CoreD.LoadTexture("../resources/models/obj/castle_diffuse.png");
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  var bounds = rl.CoreD.GetMeshBoundingBox(model.meshes[0]);

  bool selected = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_FIRST_PERSON);

    if (rl.CoreD.IsFileDropped()) {
      final droppedFiles = rl.CoreD.LoadDroppedFiles();

      if (droppedFiles.count == 1) {
        if (
          rl.CoreD.IsFileExtension(droppedFiles.paths[0], ".obj") ||
          rl.CoreD.IsFileExtension(droppedFiles.paths[0], ".gltf") ||
          rl.CoreD.IsFileExtension(droppedFiles.paths[0], ".glb") ||
          rl.CoreD.IsFileExtension(droppedFiles.paths[0], ".vox") ||
          rl.CoreD.IsFileExtension(droppedFiles.paths[0], ".iqm") ||
          rl.CoreD.IsFileExtension(droppedFiles.paths[0], ".m3d")
        ) {
          rl.CoreD.UnloadModel(model);
          model = rl.CoreD.LoadModel(droppedFiles.paths[0]);
          model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
          bounds = rl.CoreD.GetMeshBoundingBox(model.meshes[0]);
        } else if (
          rl.CoreD.IsFileExtension(droppedFiles.paths[0], ".png")
        ) {
          rl.CoreD.UnloadTexture(texture);
          texture = rl.CoreD.LoadTexture(droppedFiles.paths[0]);
          model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
        }
      }
    }

    if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) {
      final mousePos = rl.CoreD.GetMousePosition();
      final ray = rl.CoreD.GetScreenToWorldRay(mousePos, camera);
      final collision = rl.CoreD.GetRayCollisionBox(ray, bounds);
      if (collision.hit) {
        selected = !selected;
      } else {
        selected = false;
      }
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawModel(model, .zero(), 1.0, .WHITE);
        rl.CoreD.DrawGrid(20, 10.0);
        if (selected) {
          rl.CoreD.DrawBoundingBox(bounds, .GREEN);
        }

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Drag & drop model to load mesh/texture.",
        10, screenHeight - 20, 10, .DARKGRAY
      );

      if (selected) {
        rl.CoreD.DrawText(
          "MODEL SELECTED",
          screenWidth - 110, 10, 10, .GREEN
        );
      }

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}