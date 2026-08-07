// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_custom_uniform.c
// Run it: dart run shaders_custom_uniform.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shaders_custom_uniform");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(8, 8, 8),
    target: .vec3(0, 1.5, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = LoadModel("../resources/models/barracks.obj");
  final texture = LoadTexture("../resources/models/barracks_diffuse.png");
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/swirl.fs",
  );

  int swirlCenterLoc = GetShaderLocation(shader, "center");

  final swirlCenter = <double>[
    screenWidth/2, screenHeight/2,
  ];

  final target = LoadRenderTexture(screenWidth, screenHeight);

  while (!WindowShouldClose())
  {
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
  }

  UnloadShader(shader);
  UnloadTexture(texture);
  UnloadModel(model);
  UnloadRenderTexture(target);
  
  CloseWindowAndDispose();
}