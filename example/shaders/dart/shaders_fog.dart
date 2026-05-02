// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_fog.c
// Run it: dart run shaders_fog.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_fog");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = CameraD(
    position: .vec3(2.0, 2.0, 6.0),
    target: .vec3(0.0, 0.5, 0.0),
    up: .vec3(0.0, 1.0, 0.0),
    fovy: 45.0,
    projection: .CAMERA_PERSPECTIVE,
  );

  final modelA = rl.CoreD.LoadModelFromMesh(rl.CoreD.GenMeshTorus(0.4, 1.0, 16, 32));
  final modelB = rl.CoreD.LoadModelFromMesh(rl.CoreD.GenMeshCube(1.0, 1.0, 1.0));
  final modelC = rl.CoreD.LoadModelFromMesh(rl.CoreD.GenMeshSphere(0.5, 32, 32));
  final texture = rl.CoreD.LoadTexture("../resources/texel_checker.png");

  modelA.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
  modelB.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
  modelC.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final shader = rl.CoreD.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lighting.vs",
    "../resources/shaders/glsl$GLSL_VERSION/fog.fs",
  );
  shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL.value] =
    rl.CoreD.GetShaderLocation(shader, "matModel");
  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    rl.CoreD.GetShaderLocation(shader, "viewPos");

  int ambientLoc = rl.CoreD.GetShaderLocation(shader, "ambient");
  rl.CoreD.SetShaderValue(
    shader,
    ambientLoc,
    [0.2, 0.2, 0.2, 1.0],
    .SHADER_UNIFORM_VEC4,
  );

  double fogDensity = 0.15;

  int fogDensityLoc = rl.CoreD.GetShaderLocation(shader, "fogDensity");
  rl.CoreD.SetShaderValue(
    shader,
    fogDensityLoc,
    [fogDensity],
    .SHADER_UNIFORM_FLOAT,
  );

  modelA.materials[0].shader = shader;
  modelB.materials[0].shader = shader;
  modelC.materials[0].shader = shader;

  rl.LightD.CreateLight(
    .LIGHT_POINT, .vec3(0, 2, 6), .zero(), .WHITE, shader
  );

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    if (rl.CoreD.IsKeyDown(.KEY_UP))
    {
      fogDensity += 0.001;
      if (fogDensity > 1.0) fogDensity = 1.0;
    }

    if (rl.CoreD.IsKeyDown(.KEY_DOWN))
    {
      fogDensity -= 0.001;
      if (fogDensity < 0.0) fogDensity = 0.0;
    }

    rl.CoreD.SetShaderValue(
      shader,
      fogDensityLoc,
      [fogDensity],
      .SHADER_UNIFORM_FLOAT,
    );

    modelA.transform = modelA.transform.mul(.rotateX(-0.025));
    modelA.transform = modelA.transform.mul(.rotateZ(0.012));

    rl.CoreD.SetShaderValue(
      shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.GRAY);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawModel(modelA, .zero(), 1.0, .WHITE);
        rl.CoreD.DrawModel(modelB, .vec3(-2.6, 0, 0), 1.0, .WHITE);
        rl.CoreD.DrawModel(modelC, .vec3(2.6, 0, 0), 1.0, .WHITE);

        for (int i = -20; i < 20; i += 2) rl.CoreD.DrawModel(
          modelA,
          .vec3(i, 0, 2),
          1.0,
          .WHITE
        );

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Use KEY_UP/KEY_DOWN to change fog density [${fogDensity.f2}]",
        10, 10, 20, .RAYWHITE
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadModel(modelA);
  rl.CoreD.UnloadModel(modelB);
  rl.CoreD.UnloadModel(modelC);
  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadShader(shader);
  
  rl.CloseWindowAndDispose();
}