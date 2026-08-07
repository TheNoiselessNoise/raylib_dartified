// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_fog_rendering.c
// Run it: dart run shaders_fog_rendering.dart
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
  InitWindow(screenWidth, screenHeight, "shaders_fog_rendering".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(2.0, 2.0, 6.0);
  camera.ref.target.set(0.0, 0.5, 0.0);
  camera.ref.up.set(0.0, 1.0, 0.0);
  camera.ref.fovy = 45.0;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final modelA = LoadModelFromMesh(GenMeshTorus(0.4, 1.0, 16, 32));
  final modelB = LoadModelFromMesh(GenMeshCube(1.0, 1.0, 1.0));
  final modelC = LoadModelFromMesh(GenMeshSphere(0.5, 32, 32));
  final texture = LoadTexture("../resources/texel_checker.png".toC);

  modelA.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
  modelB.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
  modelC.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lighting.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/fog.fs".toC,
  );
  shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL.value] =
    GetShaderLocation(shader, "matModel".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    GetShaderLocation(shader, "viewPos".toC);

  int ambientLoc = GetShaderLocation(shader, "ambient".toC);
  SetShaderValue(shader, ambientLoc,
    Float32$.Array([0.2, 0.2, 0.2, 1.0]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value,
  );

  double fogDensity = 0.15;

  void updateShaderFogDensity() {
    SetShaderValue(shader,
      GetShaderLocation(shader, "fogDensity".toC),
      Float32$.Value(fogDensity).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
  } updateShaderFogDensity();

  modelA.materials[0].shader = shader;
  modelB.materials[0].shader = shader;
  modelC.materials[0].shader = shader;

  CreateLight(
    LightType.LIGHT_POINT.value,
    Vector3$.$1.set(0, 2, 6), Vector3$.$zero, WHITE, shader
  );

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    if (IsKeyDown(KeyboardKey.KEY_UP.value))
    {
      fogDensity += 0.001;
      if (fogDensity > 1.0) fogDensity = 1.0;
    }

    if (IsKeyDown(KeyboardKey.KEY_DOWN.value))
    {
      fogDensity -= 0.001;
      if (fogDensity < 0.0) fogDensity = 0.0;
    }

    updateShaderFogDensity();

    modelA.transform.setD(modelA.transform.toD().mul(.rotateX(-0.025)));
    modelA.transform.setD(modelA.transform.toD().mul(.rotateZ(0.012)));

    SetShaderValue(shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      Vector3$.$1Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    BeginDrawing();

      ClearBackground(GRAY);

      BeginMode3D(camera.ref);

        DrawModel(modelA, Vector3$.$zero, 1.0, WHITE);
        DrawModel(modelB, Vector3$.$1.set(-2.6, 0, 0), 1.0, WHITE);
        DrawModel(modelC, Vector3$.$1.set(2.6, 0, 0), 1.0, WHITE);

        for (int i = -20; i < 20; i += 2) DrawModel(
          modelA,
          Vector3$.$1.set(i, 0, 2),
          1.0,
          WHITE
        );

      EndMode3D();

      DrawText(
        "Use KEY_UP/KEY_DOWN to change fog density [${fogDensity.f2}]".toC,
        10, 10, 20, RAYWHITE
      );

    EndDrawing();
  }

  UnloadModel(modelA);
  UnloadModel(modelB);
  UnloadModel(modelC);
  UnloadTexture(texture);
  UnloadShader(shader);
  
  CloseWindowAndDispose();
}