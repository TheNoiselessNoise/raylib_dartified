// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_basic_lighting.c
// Run it: dart run shaders_basic_lighting.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_basic_lighting".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(2, 4, 6);
  camera.ref.target.set(0, 0.5, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final shader = rl.Core.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lighting.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/lighting.fs".toC,
  );

  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    rl.Core.GetShaderLocation(shader, "viewPos".toC);

  rl.Core.SetShaderValue(shader,
    rl.Core.GetShaderLocation(shader, "ambient".toC),
    rl.Temp.Float$.Array([0.1, 0.1, 0.1, 1.0]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
  );

  List<LightC> lights = [];

  lights.add(rl.Light.CreateLight(
    LightType.LIGHT_POINT.value,
    rl.Temp.vec31(-2, 1, -2), rl.Temp.vec3Zero, rl.C.YELLOW, shader
  ));

  lights.add(rl.Light.CreateLight(
    LightType.LIGHT_POINT.value,
    rl.Temp.vec31(2, 1, 2), rl.Temp.vec3Zero, rl.C.RED, shader
  ));

  lights.add(rl.Light.CreateLight(
    LightType.LIGHT_POINT.value,
    rl.Temp.vec31(-2, 1, 2), rl.Temp.vec3Zero, rl.C.GREEN, shader
  ));

  lights.add(rl.Light.CreateLight(
    LightType.LIGHT_POINT.value,
    rl.Temp.vec31(2, 1, -2), rl.Temp.vec3Zero, rl.C.BLUE, shader
  ));

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    rl.Core.SetShaderValue(shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      rl.Temp.vec31Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_Y.value)) lights[0].enabled = !lights[0].enabled;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_R.value)) lights[1].enabled = !lights[1].enabled;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_G.value)) lights[2].enabled = !lights[2].enabled;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_B.value)) lights[3].enabled = !lights[3].enabled;

    for (int i = 0; i < lights.length; i++) {
      rl.Light.UpdateLightValues(shader, lights[i]);
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.BeginShaderMode(shader);

          rl.Core.DrawPlane(rl.Temp.vec3Zero, rl.Temp.vec21(10, 10), rl.C.WHITE);
          rl.Core.DrawCube(rl.Temp.vec3Zero, 2, 4, 2, rl.C.WHITE);

        rl.Core.EndShaderMode();

        for (int i = 0; i < lights.length; i++) {
          if (lights[i].enabled) {
            rl.Core.DrawSphereEx(lights[i].position, 0.2, 8, 8, lights[i].color);
          } else {
            final color = rl.Core.ColorAlpha(lights[i].color, 0.3);
            rl.Core.DrawSphereWires(lights[i].position, 0.2, 8, 8, color);
          }
        }

        rl.Core.DrawGrid(10, 1);

      rl.Core.EndMode3D();

      rl.Core.DrawFPS(10, 10);

      rl.Core.DrawText(
        "Use keys [Y][R][G][B] to toggle lights".toC,
        10, 40, 20, rl.C.DARKGRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shader);
  
  rl.CloseWindowAndDispose();
}