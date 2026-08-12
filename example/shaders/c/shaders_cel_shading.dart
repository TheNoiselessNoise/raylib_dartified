// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_cel_shading.c
// Run it: dart run shaders_cel_shading.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shaders_cel_shading".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.AtUnique();
  camera.ref.position.set(9.0, 6.0, 9.0);
  camera.ref.target.set(0.0, 1.0, 0.0);
  camera.ref.up.set(0.0, 1.0, 0.0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = LoadModel("../resources/models/old_car_new.glb".toC);

  final celShader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/cel.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/cel.fs".toC
  );
  celShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] = GetShaderLocation(celShader, "viewPos".toC);

  final defaultShader = model.materials[0].shader;
  model.materials[0].shader = celShader;

  double numBands = 10.0;
  int numBandsLoc = GetShaderLocation(celShader, "numBands".toC);
  SetShaderValue(
    celShader, numBandsLoc,
    Float32$.val.Value(numBands).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value
  );

  final outlineShader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/outline_hull.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/outline_hull.fs".toC
  );
  int outlineThicknessLoc = GetShaderLocation(outlineShader, "outlineThickness".toC);

  final lights = Light$.val.AtUnique(count: rl.Light.MAX_LIGHTS);
  lights[0] = CreateLight(
    LightType.LIGHT_DIRECTIONAL.value,
    Vector3$.val.$1.set(50.0, 50.0, 50.0),
    Vector3$.val.$zero,
    WHITE,
    celShader
  );

  bool celEnabled = true;
  bool outlineEnabled = true;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    SetShaderValue(
      celShader, celShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      Float32$.val.Array([camera.ref.position.x, camera.ref.position.y, camera.ref.position.z]).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value
    );

    if (IsKeyPressed(KeyboardKey.KEY_Z.value))
    {
      celEnabled = !celEnabled;
      if (celEnabled) model.materials[0].shader = celShader;
      else model.materials[0].shader = defaultShader;
    }

    if (IsKeyPressed(KeyboardKey.KEY_C.value)) outlineEnabled = !outlineEnabled;

    if (IsKeyPressed(KeyboardKey.KEY_E.value) || IsKeyPressedRepeat(KeyboardKey.KEY_E.value))
      numBands = Clamp(numBands + 1.0, 2.0, 20.0);
    if (IsKeyPressed(KeyboardKey.KEY_Q.value) || IsKeyPressedRepeat(KeyboardKey.KEY_Q.value))
      numBands = Clamp(numBands - 1.0, 2.0, 20.0);
    
    SetShaderValue(
      celShader, numBandsLoc,
      Float32$.val.Value(numBands).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value
    );

    double t = GetTime();
    lights[0].position.set(math.sin(-t*0.3)*5.0, 5.0, math.cos(-t*0.3)*5.0);

    for (int i = 0; i < MAX_LIGHTS; i++) {
      UpdateLightValues(celShader, lights[i]);
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        if (outlineEnabled)
        {
          double thickness = 0.005;
          SetShaderValue(
            outlineShader, outlineThicknessLoc,
            Float32$.val.Value(thickness).cast(),
            ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value
          );

          rlSetCullFace(RlCullMode.RL_CULL_FACE_FRONT.value);

          model.materials[0].shader = outlineShader;

          DrawModel(model, Vector3$.val.$zero, 0.75, WHITE);

          if (celEnabled) model.materials[0].shader = celShader;
          else model.materials[0].shader = defaultShader;

          rlSetCullFace(RlCullMode.RL_CULL_FACE_BACK.value);
        }

        DrawModel(model, Vector3$.val.$zero, 0.75, WHITE);
        DrawSphereEx(lights[0].position, 0.2, 50, 50, YELLOW);
        DrawGrid(10, 10.0);

      EndMode3D();

      DrawFPS(10, 10);
      DrawText("Cel: ${celEnabled? "ON" : "OFF"} [Z]".toC, 10, 65, 20, celEnabled? DARKGREEN : DARKGRAY);
      DrawText("Outline: ${outlineEnabled? "ON" : "OFF"} [C]".toC, 10, 90, 20, outlineEnabled? DARKGREEN : DARKGRAY);
      DrawText("Bands: ${numBands.f0} [Q/E]".toC, 10, 115, 20, DARKGRAY);

    EndDrawing();
  }

  UnloadModel(model);
  UnloadShader(celShader);
  UnloadShader(outlineShader);

  CloseWindowAndDispose();
}