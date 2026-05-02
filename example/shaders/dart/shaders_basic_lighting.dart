// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_basic_lighting.c
// Run it: dart run shaders_basic_lighting.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_basic_lighting");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = CameraD(
    position: .vec3(2, 4, 6),
    target: .vec3(0, 0.5, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final shader = rl.CoreD.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lighting.vs",
    "../resources/shaders/glsl$GLSL_VERSION/lighting.fs",
  );

  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    rl.CoreD.GetShaderLocation(shader, "viewPos");

  rl.CoreD.SetShaderValue(shader,
    rl.CoreD.GetShaderLocation(shader, "ambient"),
    [0.1, 0.1, 0.1, 1.0],
    .SHADER_UNIFORM_VEC4,
  );

  final lights = <LightD>[];

  lights.add(rl.LightD.CreateLight(.LIGHT_POINT,
    .vec3(-2, 1, -2), .zero(), .YELLOW, shader,
  ));

  lights.add(rl.LightD.CreateLight(.LIGHT_POINT,
    .vec3(2, 1, 2), .zero(), .RED, shader,
  ));

  lights.add(rl.LightD.CreateLight(.LIGHT_POINT,
    .vec3(-2, 1, 2), .zero(), .GREEN, shader,
  ));

  lights.add(rl.LightD.CreateLight(.LIGHT_POINT,
    .vec3(2, 1, -2), .zero(), .BLUE, shader,
  ));

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    rl.CoreD.SetShaderValue(
      shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    if (rl.CoreD.IsKeyPressed(.KEY_Y)) lights[0].enabled = !lights[0].enabled;
    if (rl.CoreD.IsKeyPressed(.KEY_R)) lights[1].enabled = !lights[1].enabled;
    if (rl.CoreD.IsKeyPressed(.KEY_G)) lights[2].enabled = !lights[2].enabled;
    if (rl.CoreD.IsKeyPressed(.KEY_B)) lights[3].enabled = !lights[3].enabled;

    for (int i = 0; i < lights.length; i++) {
      rl.LightD.UpdateLightValues(shader, lights[i]);
    }

    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.BeginShaderMode(shader);

          rl.CoreD.DrawPlane(.zero(), .vec2(10, 10), .WHITE);
          rl.CoreD.DrawCube(.zero(), 2, 4, 2, .WHITE);

        rl.Core.EndShaderMode();

        for (int i = 0; i < lights.length; i++) {
          if (lights[i].enabled) {
            rl.CoreD.DrawSphereEx(lights[i].position, 0.2, 8, 8, lights[i].color);
          } else {
            final color = rl.CoreD.ColorAlpha(lights[i].color, 0.3);
            rl.CoreD.DrawSphereWires(lights[i].position, 0.2, 8, 8, color);
          }
        }

        rl.CoreD.DrawGrid(10, 1);

      rl.CoreD.EndMode3D();
  
      rl.CoreD.DrawFPS(10, 10);

      rl.CoreD.DrawText(
        "Use keys [Y][R][G][B] to toggle lights",
        10, 40, 20, .DARKGRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);
  
  rl.CloseWindowAndDispose();
}