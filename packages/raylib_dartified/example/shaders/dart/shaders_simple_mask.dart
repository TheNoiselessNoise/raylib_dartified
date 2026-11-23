// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_simple_mask.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Camera3D camera;
late Mesh torus;
late Model model1;
late Mesh cube;
late Model model2;
late Mesh sphere;
late Model model3;
late Shader shader;
late Texture texDiffuse;
late Texture texMask;
late int shaderFrame;
int framesCounter = 0;
late Vector3 rotation;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shaders_simple_mask");
    SetTargetFPS(60);
    DisableCursor();

    camera = .new(
      position: .vec3(0.0, 1.0, 2.0),
      target: .vec3(0.0, 0.0, 0.0),
      up: .vec3(0, 1, 0),
      fovy: 45,
      projection: .CAMERA_PERSPECTIVE,
    );

    torus = GenMeshTorus(0.3, 1, 16, 32);
    model1 = LoadModelFromMesh(torus);

    cube = GenMeshCube(0.8, 0.8, 0.8);
    model2 = LoadModelFromMesh(cube);

    sphere = GenMeshSphere(1, 16, 16);
    model3 = LoadModelFromMesh(sphere);

    shader = LoadShader(
      null,
      "../resources/shaders/glsl${Raylib.glslVersion}/mask.fs",
    );

    texDiffuse = LoadTexture("../resources/plasma.png");
    model1.materials[0].maps[MATERIAL_MAP_DIFFUSE.value].texture = texDiffuse;
    model2.materials[0].maps[MATERIAL_MAP_DIFFUSE.value].texture = texDiffuse;

    texMask = LoadTexture("../resources/mask.png");
    model1.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].texture = texMask;
    model2.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].texture = texMask;
    shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_EMISSION.value] = GetShaderLocation(shader, "mask");

    shaderFrame = GetShaderLocation(shader, "frame");

    model1.materials[0].shader = shader;
    model2.materials[0].shader = shader;

    rotation = .zero();
  },
  loop: (_) async {
    UpdateCamera(camera, .CAMERA_FIRST_PERSON);
        
    framesCounter++;
    rotation.x += 0.01;
    rotation.y += 0.005;
    rotation.z -= 0.0025;

    SetShaderValue(shader, shaderFrame,
      [framesCounter],
      .SHADER_UNIFORM_INT,
    );

    model1.transform = .rotateXYZ(rotation);

    BeginDrawing();

      ClearBackground(.DARKBLUE);

      BeginMode3D(camera);

        DrawModel(model1, .vec3(0.5, 0.0, 0.0), 1, .WHITE);
        DrawModelEx(model2,
          .vec3(-0.5, 0.0, 0.0),
          .vec3(1.0, 1.0, 0.0),
          50,
          .vec3(1.0, 1.0, 1.0),
          .WHITE
        );
        DrawModel(model3, .vec3(0.0, 0.0, -1.5), 1, .WHITE);
        DrawGrid(10, 1.0);

      EndMode3D();

      final text = "Frame: $framesCounter";
      DrawRectangle(16, 698, MeasureText(text, 20) + 8, 42, .BLUE);
      DrawText(text, 20, 700, 20, .WHITE);

      DrawFPS(10, 10);

    EndDrawing();
  },
  close: (_) {
    UnloadModel(model1);
    UnloadModel(model2);
    UnloadModel(model3);
    UnloadTexture(texDiffuse);
    UnloadTexture(texMask);
    UnloadShader(shader);
    CloseWindow();
  },
);