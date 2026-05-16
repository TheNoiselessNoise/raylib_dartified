// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_cubicmap.c
// Run it: dart run models_cubicmap.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_cubicmap");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(16, 14, 16),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final image = rl.CoreD.LoadImage("../resources/cubicmap.png");
  final cubicmap = rl.CoreD.LoadTextureFromImage(image);

  final mesh = rl.CoreD.GenMeshCubicmap(image, .vec3(1.0, 1.0, 1.0));
  final model = rl.CoreD.LoadModelFromMesh(mesh);

  final texture = rl.CoreD.LoadTexture("../resources/cubicmap_atlas.png");
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final Vector3D mapPosition = .vec3(-16.0, 0.0, -8.0);

  rl.CoreD.UnloadImage(image);

  bool pause = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyPressed(.KEY_P)) pause = !pause;

    if (!pause) rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawModel(model, mapPosition, 1.0, .WHITE);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawTextureEx(cubicmap, .vec2(screenWidth - cubicmap.width*4.0 - 20, 20.0), 0.0, 4.0, .WHITE);
      rl.CoreD.DrawRectangleLines(screenWidth - cubicmap.width*4 - 20, 20, cubicmap.width*4, cubicmap.height*4, .GREEN);

      rl.CoreD.DrawText("cubicmap image used to", 658, 90, 10, .GRAY);
      rl.CoreD.DrawText("generate map 3d model", 658, 104, 10, .GRAY);

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(cubicmap);
  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}