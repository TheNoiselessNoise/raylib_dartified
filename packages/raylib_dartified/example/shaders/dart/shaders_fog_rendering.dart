// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_fog_rendering.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Camera3D camera;
late Model modelA;
late Model modelB;
late Model modelC;
late Texture texture;
late Shader shader;
late int ambientLoc;
double fogDensity = 0.15;
late int fogDensityLoc;

void main() => runExample(
  init: (_) {
    SetConfigFlags([.FLAG_MSAA_4X_HINT]);
    InitWindow(screenWidth, screenHeight, "shaders_fog_rendering");
    SetTargetFPS(60);

    camera = .new(
      position: .vec3(2.0, 2.0, 6.0),
      target: .vec3(0.0, 0.5, 0.0),
      up: .vec3(0.0, 1.0, 0.0),
      fovy: 45.0,
      projection: .CAMERA_PERSPECTIVE,
    );

    modelA = LoadModelFromMesh(GenMeshTorus(0.4, 1.0, 16, 32));
    modelB = LoadModelFromMesh(GenMeshCube(1.0, 1.0, 1.0));
    modelC = LoadModelFromMesh(GenMeshSphere(0.5, 32, 32));
    texture = LoadTexture("../resources/texel_checker.png");

    modelA.materials[0].maps[MATERIAL_MAP_DIFFUSE.value].texture = texture;
    modelB.materials[0].maps[MATERIAL_MAP_DIFFUSE.value].texture = texture;
    modelC.materials[0].maps[MATERIAL_MAP_DIFFUSE.value].texture = texture;

    shader = LoadShader(
      "../resources/shaders/glsl${Raylib.glslVersion}/lighting.vs",
      "../resources/shaders/glsl${Raylib.glslVersion}/fog.fs",
    );
    shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL.value] = GetShaderLocation(shader, "matModel");
    shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] = GetShaderLocation(shader, "viewPos");

    ambientLoc = GetShaderLocation(shader, "ambient");
    SetShaderValue(shader, ambientLoc, [0.2, 0.2, 0.2, 1.0], .SHADER_UNIFORM_VEC4);

    fogDensityLoc = GetShaderLocation(shader, "fogDensity");
    SetShaderValue(shader, fogDensityLoc, [fogDensity], .SHADER_UNIFORM_FLOAT);

    modelA.materials[0].shader = shader;
    modelB.materials[0].shader = shader;
    modelC.materials[0].shader = shader;

    CreateLight(.LIGHT_POINT, .vec3(0, 2, 6), .zero(), .WHITE, shader);
  },
  loop: (_) async {
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

    SetShaderValue(shader, fogDensityLoc, [fogDensity], .SHADER_UNIFORM_FLOAT);

    modelA.transform = modelA.transform.mul(.rotateX(-0.025));
    modelA.transform = modelA.transform.mul(.rotateZ(0.012));

    SetShaderValue(shader, shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value], camera.position.toArray(), .SHADER_UNIFORM_VEC3);

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
  },
  close: (_) {
    UnloadModel(modelA);
    UnloadModel(modelB);
    UnloadModel(modelC);
    UnloadTexture(texture);
    UnloadShader(shader);
    CloseWindow();
  },
);