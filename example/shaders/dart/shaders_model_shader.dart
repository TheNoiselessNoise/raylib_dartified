// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_model_shader.c
// Run it: dart run shaders_model_shader.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shaders_model_shader");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3DD(
    position: .vec3(4, 4, 4),
    target: .vec3(0, 1, -1),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = LoadModel("../resources/models/watermill.obj");
  final texture = LoadTexture("../resources/models/watermill_diffuse.png");

  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/grayscale.fs",
  );

  model.materials[0].shader = shader;
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_FREE);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawModel(model, .zero(), 0.2, .WHITE);

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText(
        "(c) Watermill 3D model by Alberto Cano",
        screenWidth - 210, screenHeight - 20, 10, .GRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadShader(shader);
  UnloadTexture(texture);
  UnloadModel(model);
  
  CloseWindowAndDispose();
}