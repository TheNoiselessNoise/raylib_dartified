// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_simple_mask.c
// Run it: dart run shaders_simple_mask.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_simple_mask".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(0.0, 1.0, 2.0);
  camera.ref.target.set(0.0, 0.0, 0.0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final torus = rl.Core.GenMeshTorus(0.3, 1, 16, 32);
  final model1 = rl.Core.LoadModelFromMesh(torus);

  final cube = rl.Core.GenMeshCube(0.8, 0.8, 0.8);
  final model2 = rl.Core.LoadModelFromMesh(cube);

  final sphere = rl.Core.GenMeshSphere(1, 16, 16);
  final model3 = rl.Core.LoadModelFromMesh(sphere);

  final shader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/mask.fs".toC,
  );

  final texDiffuse = rl.Core.LoadTexture("../resources/plasma.png".toC);
  model1.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texDiffuse;
  model2.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texDiffuse;

  final texMask = rl.Core.LoadTexture("../resources/mask.png".toC);
  model1.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].texture = texMask;
  model2.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].texture = texMask;
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_EMISSION.value] =
    rl.Core.GetShaderLocation(shader, "mask".toC);

  int shaderFrame = rl.Core.GetShaderLocation(shader, "frame".toC);

  model1.materials[0].shader = shader;
  model2.materials[0].shader = shader;

  int framesCounter = 0;
  final rotation = rl.Temp.Vector3$.At('rotation');

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);
        
    framesCounter++;
    rotation.ref.x += 0.01;
    rotation.ref.y += 0.005;
    rotation.ref.z -= 0.0025;

    rl.Core.SetShaderValue(shader, shaderFrame,
      rl.Temp.Int$.Value(framesCounter).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_INT.value,
    );

    model1.transform.setD(.rotateXYZ(rotation.toD()));

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.DARKBLUE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawModel(model1, rl.Temp.vec31(0.5, 0.0, 0.0), 1, rl.Color.WHITE);
        rl.Core.DrawModelEx(model2,
          rl.Temp.vec31(-0.5, 0.0, 0.0),
          rl.Temp.vec32(1.0, 1.0, 0.0),
          50,
          rl.Temp.vec33(1.0, 1.0, 1.0),
          rl.Color.WHITE
        );
        rl.Core.DrawModel(model3, rl.Temp.vec31(0.0, 0.0, -1.5), 1, rl.Color.WHITE);
        rl.Core.DrawGrid(10, 1.0);

      rl.Core.EndMode3D();

      final text = "Frame: $framesCounter".toC;
      rl.Core.DrawRectangle(16, 698, rl.Core.MeasureText(text, 20) + 8, 42, rl.Color.BLUE);
      rl.Core.DrawText(text, 20, 700, 20, rl.Color.WHITE);

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadModel(model1);
  rl.Core.UnloadModel(model2);
  rl.Core.UnloadModel(model3);

  rl.Core.UnloadTexture(texDiffuse);
  rl.Core.UnloadTexture(texMask);

  rl.Core.UnloadShader(shader);
  
  rl.CloseWindowAndDispose();
}