// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_custom_uniform.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Camera3D camera;
late Model model;
late Texture texture;
late Shader shader;
late int swirlCenterLoc;
final swirlCenter = [screenWidth/2, screenHeight/2];
late RenderTexture target;

void main() => runExample(
  init: (_) {
    SetConfigFlags([.FLAG_MSAA_4X_HINT]);
    InitWindow(screenWidth, screenHeight, "shaders_custom_uniform");
    SetTargetFPS(60);

    camera = .new(
      position: .vec3(8, 8, 8),
      target: .vec3(0, 1.5, 0),
      up: .vec3(0, 1, 0),
      fovy: 45,
      projection: .CAMERA_PERSPECTIVE,
    );

    model = LoadModel("../resources/models/barracks.obj");
    texture = LoadTexture("../resources/models/barracks_diffuse.png");
    model.materials[0].maps[MATERIAL_MAP_DIFFUSE.value].texture = texture;

    shader = LoadShader(
      null,
      "../resources/shaders/glsl${Raylib.glslVersion}/swirl.fs",
    );

    swirlCenterLoc = GetShaderLocation(shader, "center");

    target = LoadRenderTexture(screenWidth, screenHeight);
  },
  loop: (_) async {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    final mousePosition = GetMousePosition();

    swirlCenter[0] = mousePosition.x;
    swirlCenter[1] = screenHeight - mousePosition.y;

    SetShaderValue(
      shader,
      swirlCenterLoc,
      swirlCenter,
      .SHADER_UNIFORM_VEC2,
    );

    BeginTextureMode(target);
      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);
        DrawModel(model, .zero(), 0.5, .WHITE);
        DrawGrid(10, 1.0);
      EndMode3D();

      DrawText(
        "TEXT DRAWN IN RENDER TEXTURE",
        200, 10, 30, .RED
      );
    EndTextureMode();

    BeginDrawing();
      ClearBackground(.RAYWHITE);

      BeginShaderMode(shader);
        DrawTextureRec(
          target.texture,
          .rect(
            0, 0,
            target.texture.width, -target.texture.height
          ),
          .zero(),
          .WHITE
        );
      EndShaderMode();

      DrawText(
        "(c) Barracks 3D model by Alberto Cano",
        screenWidth - 220, screenHeight - 20, 10, .GRAY
      );

      DrawFPS(10, 10);
    EndDrawing();
  },
  close: (_) {
    UnloadShader(shader);
    UnloadTexture(texture);
    UnloadModel(model);
    UnloadRenderTexture(target);
    CloseWindow();
  },
);