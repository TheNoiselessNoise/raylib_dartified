// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_simple_mask.c
// Run it: dart run shaders_simple_mask.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_simple_mask".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(0.0, 1.0, 2.0);
  camera.ref.target.set(0.0, 0.0, 0.0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final torus = GenMeshTorus(0.3, 1, 16, 32);
  final model1 = LoadModelFromMesh(torus);

  final cube = GenMeshCube(0.8, 0.8, 0.8);
  final model2 = LoadModelFromMesh(cube);

  final sphere = GenMeshSphere(1, 16, 16);
  final model3 = LoadModelFromMesh(sphere);

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/mask.fs".toC,
  );

  final texDiffuse = LoadTexture("../resources/plasma.png".toC);
  model1.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texDiffuse;
  model2.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texDiffuse;

  final texMask = LoadTexture("../resources/mask.png".toC);
  model1.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].texture = texMask;
  model2.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].texture = texMask;
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_EMISSION.value] =
    GetShaderLocation(shader, "mask".toC);

  int shaderFrame = GetShaderLocation(shader, "frame".toC);

  model1.materials[0].shader = shader;
  model2.materials[0].shader = shader;

  int framesCounter = 0;
  final rotation = Vector3$.val.At('rotation');

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);
        
    framesCounter++;
    rotation.ref.x += 0.01;
    rotation.ref.y += 0.005;
    rotation.ref.z -= 0.0025;

    SetShaderValue(shader, shaderFrame,
      Int$.val.Value(framesCounter).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_INT.value,
    );

    model1.transform.setD(.rotateXYZ(rotation.toD()));

    BeginDrawing();

      ClearBackground(DARKBLUE);

      BeginMode3D(camera.ref);

        DrawModel(model1, Vector3$.val.$1.set(0.5, 0.0, 0.0), 1, WHITE);
        DrawModelEx(model2,
          Vector3$.val.$1.set(-0.5, 0.0, 0.0),
          Vector3$.val.$2.set(1.0, 1.0, 0.0),
          50,
          Vector3$.val.$3.set(1.0, 1.0, 1.0),
          WHITE
        );
        DrawModel(model3, Vector3$.val.$1.set(0.0, 0.0, -1.5), 1, WHITE);
        DrawGrid(10, 1.0);

      EndMode3D();

      final text = "Frame: $framesCounter".toC;
      DrawRectangle(16, 698, MeasureText(text, 20) + 8, 42, BLUE);
      DrawText(text, 20, 700, 20, WHITE);

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadModel(model1);
  UnloadModel(model2);
  UnloadModel(model3);

  UnloadTexture(texDiffuse);
  UnloadTexture(texMask);

  UnloadShader(shader);
  
  CloseWindowAndDispose();
}