// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_heightmap_rendering.c
// Run it: dart run models_heightmap_rendering.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_heightmap_rendering");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3DD(
    position: .vec3(18, 21, 18),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final image = LoadImage("../resources/heightmap.png");
  final texture = LoadTextureFromImage(image);

  final Vector3D meshSize = .vec3(16, 8, 16);
  final mesh = GenMeshHeightmap(image, meshSize);
  final model = LoadModelFromMesh(mesh);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final Vector3D mapPosition = .vec3(-8, 0, -8);
  
  UnloadImage(image);

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawModel(model, mapPosition, 1.0, .RED);
        DrawGrid(20, 1.0);

      EndMode3D();

      DrawTexture(texture, screenWidth - texture.width - 20, 20, .WHITE);
      DrawRectangleLines(screenWidth - texture.width - 20, 20, texture.width, texture.height, .GREEN);

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadModel(model);
  
  CloseWindowAndDispose();
}