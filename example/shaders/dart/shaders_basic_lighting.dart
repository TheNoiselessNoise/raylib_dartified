// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_basic_lighting.c
// Run it: dart run shaders_basic_lighting.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shaders_basic_lighting");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(2, 4, 6),
    target: .vec3(0, 0.5, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lighting.vs",
    "../resources/shaders/glsl$GLSL_VERSION/lighting.fs",
  );

  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    GetShaderLocation(shader, "viewPos");

  SetShaderValue(shader,
    GetShaderLocation(shader, "ambient"),
    [0.1, 0.1, 0.1, 1.0],
    .SHADER_UNIFORM_VEC4,
  );

  final lights = <LightD>[];

  lights.add(CreateLight(.LIGHT_POINT,
    .vec3(-2, 1, -2), .zero(), .YELLOW, shader,
  ));

  lights.add(CreateLight(.LIGHT_POINT,
    .vec3(2, 1, 2), .zero(), .RED, shader,
  ));

  lights.add(CreateLight(.LIGHT_POINT,
    .vec3(-2, 1, 2), .zero(), .GREEN, shader,
  ));

  lights.add(CreateLight(.LIGHT_POINT,
    .vec3(2, 1, -2), .zero(), .BLUE, shader,
  ));

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    SetShaderValue(
      shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    if (IsKeyPressed(.KEY_Y)) lights[0].enabled = !lights[0].enabled;
    if (IsKeyPressed(.KEY_R)) lights[1].enabled = !lights[1].enabled;
    if (IsKeyPressed(.KEY_G)) lights[2].enabled = !lights[2].enabled;
    if (IsKeyPressed(.KEY_B)) lights[3].enabled = !lights[3].enabled;

    for (int i = 0; i < lights.length; i++) {
      UpdateLightValues(shader, lights[i]);
    }

    BeginDrawing();
      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        BeginShaderMode(shader);

          DrawPlane(.zero(), .vec2(10, 10), .WHITE);
          DrawCube(.zero(), 2, 4, 2, .WHITE);

        rl.Core.EndShaderMode();

        for (int i = 0; i < lights.length; i++) {
          if (lights[i].enabled) {
            DrawSphereEx(lights[i].position, 0.2, 8, 8, lights[i].color);
          } else {
            final color = ColorAlpha(lights[i].color, 0.3);
            DrawSphereWires(lights[i].position, 0.2, 8, 8, color);
          }
        }

        DrawGrid(10, 1);

      EndMode3D();
  
      DrawFPS(10, 10);

      DrawText(
        "Use keys [Y][R][G][B] to toggle lights",
        10, 40, 20, .DARKGRAY
      );

    EndDrawing();
  }

  UnloadShader(shader);
  
  CloseWindowAndDispose();
}