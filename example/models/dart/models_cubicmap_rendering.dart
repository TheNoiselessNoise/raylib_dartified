// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_cubicmap_rendering.c
// Run it: dart run models_cubicmap_rendering.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_cubicmap_rendering");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(16, 14, 16),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final image = LoadImage("../resources/cubicmap.png");
  final cubicmap = LoadTextureFromImage(image);

  final mesh = GenMeshCubicmap(image, .vec3(1.0, 1.0, 1.0));
  final model = LoadModelFromMesh(mesh);

  final texture = LoadTexture("../resources/cubicmap_atlas.png");
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final Vector3D mapPosition = .vec3(-16.0, 0.0, -8.0);

  UnloadImage(image);

  bool pause = false;

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(.KEY_P)) pause = !pause;

    if (!pause) UpdateCamera(camera, .CAMERA_ORBITAL);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawModel(model, mapPosition, 1.0, .WHITE);

      EndMode3D();

      DrawTextureEx(cubicmap, .vec2(screenWidth - cubicmap.width*4.0 - 20, 20.0), 0.0, 4.0, .WHITE);
      DrawRectangleLines(screenWidth - cubicmap.width*4 - 20, 20, cubicmap.width*4, cubicmap.height*4, .GREEN);

      DrawText("cubicmap image used to", 658, 90, 10, .GRAY);
      DrawText("generate map 3d model", 658, 104, 10, .GRAY);

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadTexture(cubicmap);
  UnloadTexture(texture);
  UnloadModel(model);
  
  CloseWindowAndDispose();
}