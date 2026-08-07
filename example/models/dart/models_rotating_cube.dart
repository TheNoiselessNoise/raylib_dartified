// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_rotating_cube.c
// Run it: dart run models_rotating_cube.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_rotating_cube");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(0.0, 3.0, 3.0),
    target: .vec3(0.0, 0.0, 0.0),
    up: .vec3(0.0, 1.0, 0.0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = LoadModelFromMesh(GenMeshCube(1.0, 1.0, 1.0));
  final img = LoadImage("../resources/cubicmap_atlas.png");
  final crop = ImageFromImage(img, .rect(0, img.height/2.0, img.width/2.0, img.height/2.0));
  final texture = LoadTextureFromImage(crop);
  UnloadImage(img);
  UnloadImage(crop);

  model.materials[0].maps[MATERIAL_MAP_DIFFUSE.value].texture = texture;

  double rotation = 0.0;

  while (!WindowShouldClose())
  {
    rotation += 1.0;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera);

        DrawModelEx(
          model,
          .vec3(0.0, 0.0, 0.0),
          .vec3(0.5, 1.0, 0.0),
          rotation,
          .vec3(1.0, 1.0, 1.0),
          WHITE
        );

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadModel(model);

  CloseWindowAndDispose();
}