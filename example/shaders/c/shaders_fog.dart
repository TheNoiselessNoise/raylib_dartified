// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_fog.c
// Run it: dart run shaders_fog.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_fog".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(2.0, 2.0, 6.0);
  camera.ref.target.set(0.0, 0.5, 0.0);
  camera.ref.up.set(0.0, 1.0, 0.0);
  camera.ref.fovy = 45.0;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final modelA = rl.Core.LoadModelFromMesh(rl.Core.GenMeshTorus(0.4, 1.0, 16, 32));
  final modelB = rl.Core.LoadModelFromMesh(rl.Core.GenMeshCube(1.0, 1.0, 1.0));
  final modelC = rl.Core.LoadModelFromMesh(rl.Core.GenMeshSphere(0.5, 32, 32));
  final texture = rl.Core.LoadTexture("../resources/texel_checker.png".toC);

  modelA.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
  modelB.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
  modelC.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final shader = rl.Core.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lighting.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/fog.fs".toC,
  );
  shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL.value] =
    rl.Core.GetShaderLocation(shader, "matModel".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    rl.Core.GetShaderLocation(shader, "viewPos".toC);

  int ambientLoc = rl.Core.GetShaderLocation(shader, "ambient".toC);
  rl.Core.SetShaderValue(shader, ambientLoc,
    rl.Temp.Float32$.Array([0.2, 0.2, 0.2, 1.0]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value,
  );

  double fogDensity = 0.15;

  void updateShaderFogDensity() {
    rl.Core.SetShaderValue(shader,
      rl.Core.GetShaderLocation(shader, "fogDensity".toC),
      rl.Temp.Float32$.Value(fogDensity).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
  } updateShaderFogDensity();

  modelA.materials[0].shader = shader;
  modelB.materials[0].shader = shader;
  modelC.materials[0].shader = shader;

  rl.Light.CreateLight(
    LightType.LIGHT_POINT.value,
    rl.Temp.vec31(0, 2, 6), rl.Temp.vec3Zero, rl.Color.WHITE, shader
  );

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_UP.value))
    {
      fogDensity += 0.001;
      if (fogDensity > 1.0) fogDensity = 1.0;
    }

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_DOWN.value))
    {
      fogDensity -= 0.001;
      if (fogDensity < 0.0) fogDensity = 0.0;
    }

    updateShaderFogDensity();

    modelA.transform.setD(modelA.transform.toD().mul(.rotateX(-0.025)));
    modelA.transform.setD(modelA.transform.toD().mul(.rotateZ(0.012)));

    rl.Core.SetShaderValue(shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      rl.Temp.vec31Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.GRAY);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawModel(modelA, rl.Temp.vec3Zero, 1.0, rl.Color.WHITE);
        rl.Core.DrawModel(modelB, rl.Temp.vec31(-2.6, 0, 0), 1.0, rl.Color.WHITE);
        rl.Core.DrawModel(modelC, rl.Temp.vec31(2.6, 0, 0), 1.0, rl.Color.WHITE);

        for (int i = -20; i < 20; i += 2) rl.Core.DrawModel(
          modelA,
          rl.Temp.vec31(i, 0, 2),
          1.0,
          rl.Color.WHITE
        );

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Use KEY_UP/KEY_DOWN to change fog density [${fogDensity.f2}]".toC,
        10, 10, 20, rl.Color.RAYWHITE
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadModel(modelA);
  rl.Core.UnloadModel(modelB);
  rl.Core.UnloadModel(modelC);
  rl.Core.UnloadTexture(texture);
  rl.Core.UnloadShader(shader);
  
  rl.CloseWindowAndDispose();
}