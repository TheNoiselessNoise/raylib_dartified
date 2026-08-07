// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_fog_rendering.c
// Run it: dart run shaders_fog_rendering.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shaders_fog_rendering");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(2.0, 2.0, 6.0),
    target: .vec3(0.0, 0.5, 0.0),
    up: .vec3(0.0, 1.0, 0.0),
    fovy: 45.0,
    projection: .CAMERA_PERSPECTIVE,
  );

  final modelA = LoadModelFromMesh(GenMeshTorus(0.4, 1.0, 16, 32));
  final modelB = LoadModelFromMesh(GenMeshCube(1.0, 1.0, 1.0));
  final modelC = LoadModelFromMesh(GenMeshSphere(0.5, 32, 32));
  final texture = LoadTexture("../resources/texel_checker.png");

  modelA.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
  modelB.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
  modelC.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lighting.vs",
    "../resources/shaders/glsl$GLSL_VERSION/fog.fs",
  );
  shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL.value] =
    GetShaderLocation(shader, "matModel");
  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    GetShaderLocation(shader, "viewPos");

  int ambientLoc = GetShaderLocation(shader, "ambient");
  SetShaderValue(
    shader,
    ambientLoc,
    [0.2, 0.2, 0.2, 1.0],
    .SHADER_UNIFORM_VEC4,
  );

  double fogDensity = 0.15;

  int fogDensityLoc = GetShaderLocation(shader, "fogDensity");
  SetShaderValue(
    shader,
    fogDensityLoc,
    [fogDensity],
    .SHADER_UNIFORM_FLOAT,
  );

  modelA.materials[0].shader = shader;
  modelB.materials[0].shader = shader;
  modelC.materials[0].shader = shader;

  CreateLight(
    .LIGHT_POINT, .vec3(0, 2, 6), .zero(), .WHITE, shader
  );

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    if (IsKeyDown(.KEY_UP))
    {
      fogDensity += 0.001;
      if (fogDensity > 1.0) fogDensity = 1.0;
    }

    if (IsKeyDown(.KEY_DOWN))
    {
      fogDensity -= 0.001;
      if (fogDensity < 0.0) fogDensity = 0.0;
    }

    SetShaderValue(
      shader,
      fogDensityLoc,
      [fogDensity],
      .SHADER_UNIFORM_FLOAT,
    );

    modelA.transform = modelA.transform.mul(.rotateX(-0.025));
    modelA.transform = modelA.transform.mul(.rotateZ(0.012));

    SetShaderValue(
      shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    BeginDrawing();

      ClearBackground(.GRAY);

      BeginMode3D(camera);

        DrawModel(modelA, .zero(), 1.0, .WHITE);
        DrawModel(modelB, .vec3(-2.6, 0, 0), 1.0, .WHITE);
        DrawModel(modelC, .vec3(2.6, 0, 0), 1.0, .WHITE);

        for (int i = -20; i < 20; i += 2) DrawModel(
          modelA,
          .vec3(i, 0, 2),
          1.0,
          .WHITE
        );

      EndMode3D();

      DrawText(
        "Use KEY_UP/KEY_DOWN to change fog density [${fogDensity.f2}]",
        10, 10, 20, .RAYWHITE
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