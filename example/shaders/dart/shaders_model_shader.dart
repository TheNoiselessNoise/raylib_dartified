// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_model_shader.c
// Run it: dart run shaders_model_shader.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_model_shader");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = Camera3DD(
    position: .vec3(4, 4, 4),
    target: .vec3(0, 1, -1),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = rl.CoreD.LoadModel("../resources/models/watermill.obj");
  final texture = rl.CoreD.LoadTexture("../resources/models/watermill_diffuse.png");

  final shader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/grayscale.fs",
  );

  model.materials[0].shader = shader;
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_FREE);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawModel(model, .zero(), 0.2, .WHITE);

        rl.CoreD.DrawGrid(10, 1.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "(c) Watermill 3D model by Alberto Cano",
        screenWidth - 210, screenHeight - 20, 10, .GRAY
      );

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);
  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}