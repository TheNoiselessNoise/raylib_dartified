// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_heightmap_rendering.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "models_heightmap_rendering");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D(
    position: .vec3(18, 21, 18),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final image = LoadImage("../resources/heightmap.png");
  final texture = LoadTextureFromImage(image);

  final Vector3 meshSize = .vec3(16, 8, 16);
  final mesh = GenMeshHeightmap(image, meshSize);
  final model = LoadModelFromMesh(mesh);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final Vector3 mapPosition = .vec3(-8, 0, -8);
  
  UnloadImage(image);

  rl.setMainLoop(() {
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
  });
});