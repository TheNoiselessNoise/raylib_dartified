// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_model_shader.c
// Run it: dart run shaders_model_shader.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shaders_model_shader".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(4, 4, 4);
  camera.ref.target.set(0, 1, -1);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = LoadModel("../resources/models/watermill.obj".toC);
  final texture = LoadTexture("../resources/models/watermill_diffuse.png".toC);

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/grayscale.fs".toC,
  );

  model.materials[0].shader = shader;
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_FREE.value);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawModel(model, Vector3$.val.$zero, 0.2, WHITE);

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText(
        "(c) Watermill 3D model by Alberto Cano".toC,
        screenWidth - 210, screenHeight - 20, 10, GRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadShader(shader);
  UnloadTexture(texture);
  UnloadModel(model);
  
  CloseWindowAndDispose();
}