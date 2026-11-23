// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_model_shader.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Camera3D camera;
late Model model;
late Texture texture;
late Shader shader;

void main() => runExample(
  init: (_) {
    SetConfigFlags([.FLAG_MSAA_4X_HINT]);
    InitWindow(screenWidth, screenHeight, "shaders_model_shader");
    SetTargetFPS(60);
    DisableCursor();

    camera = .new(
      position: .vec3(4, 4, 4),
      target: .vec3(0, 1, -1),
      up: .vec3(0, 1, 0),
      fovy: 45,
      projection: .CAMERA_PERSPECTIVE,
    );

    model = LoadModel("../resources/models/watermill.obj");
    texture = LoadTexture("../resources/models/watermill_diffuse.png");

    shader = LoadShader(
      null,
      "../resources/shaders/glsl${Raylib.glslVersion}/grayscale.fs",
    );

    model.materials[0].shader = shader;
    model.materials[0].maps[MATERIAL_MAP_DIFFUSE.value].texture = texture;
  },
  loop: (_) async {
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
  },
  close: (_) {
    UnloadShader(shader);
    UnloadTexture(texture);
    UnloadModel(model);
    CloseWindow();
  },
);