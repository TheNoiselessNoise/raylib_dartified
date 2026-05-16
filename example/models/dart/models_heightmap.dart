// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_heightmap.c
// Run it: dart run models_heightmap.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_heightmap");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = Camera3DD(
    position: .vec3(18, 21, 18),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final image = rl.CoreD.LoadImage("../resources/heightmap.png");
  final texture = rl.CoreD.LoadTextureFromImage(image);

  final Vector3D meshSize = .vec3(16, 8, 16);
  final mesh = rl.CoreD.GenMeshHeightmap(image, meshSize);
  final model = rl.CoreD.LoadModelFromMesh(mesh);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final Vector3D mapPosition = .vec3(-8, 0, -8);
  
  rl.CoreD.UnloadImage(image);

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawModel(model, mapPosition, 1.0, .RED);
        rl.CoreD.DrawGrid(20, 1.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawTexture(texture, screenWidth - texture.width - 20, 20, .WHITE);
      rl.CoreD.DrawRectangleLines(screenWidth - texture.width - 20, 20, texture.width, texture.height, .GREEN);

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}