// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_basic_lighting.c
// Run it: dart run shaders_basic_lighting.dart
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
  InitWindow(screenWidth, screenHeight, "shaders_basic_lighting".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(2, 4, 6);
  camera.ref.target.set(0, 0.5, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lighting.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/lighting.fs".toC,
  );

  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    GetShaderLocation(shader, "viewPos".toC);

  SetShaderValue(shader,
    GetShaderLocation(shader, "ambient".toC),
    Float32$.Array([0.1, 0.1, 0.1, 1.0]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
  );

  List<LightC> lights = [];

  lights.add(CreateLight(
    LightType.LIGHT_POINT.value,
    Vector3$.$1.set(-2, 1, -2), Vector3$.$zero, YELLOW, shader
  ));

  lights.add(CreateLight(
    LightType.LIGHT_POINT.value,
    Vector3$.$1.set(2, 1, 2), Vector3$.$zero, RED, shader
  ));

  lights.add(CreateLight(
    LightType.LIGHT_POINT.value,
    Vector3$.$1.set(-2, 1, 2), Vector3$.$zero, GREEN, shader
  ));

  lights.add(CreateLight(
    LightType.LIGHT_POINT.value,
    Vector3$.$1.set(2, 1, -2), Vector3$.$zero, BLUE, shader
  ));

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    SetShaderValue(shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      Vector3$.$1Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    if (IsKeyPressed(KeyboardKey.KEY_Y.value)) lights[0].enabled = !lights[0].enabled;
    if (IsKeyPressed(KeyboardKey.KEY_R.value)) lights[1].enabled = !lights[1].enabled;
    if (IsKeyPressed(KeyboardKey.KEY_G.value)) lights[2].enabled = !lights[2].enabled;
    if (IsKeyPressed(KeyboardKey.KEY_B.value)) lights[3].enabled = !lights[3].enabled;

    for (int i = 0; i < lights.length; i++) {
      UpdateLightValues(shader, lights[i]);
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        BeginShaderMode(shader);

          DrawPlane(Vector3$.$zero, Vector2$.$1.set(10, 10), WHITE);
          DrawCube(Vector3$.$zero, 2, 4, 2, WHITE);

        EndShaderMode();

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
        "Use keys [Y][R][G][B] to toggle lights".toC,
        10, 40, 20, DARKGRAY
      );

    EndDrawing();
  }

  UnloadShader(shader);
  
  CloseWindowAndDispose();
}