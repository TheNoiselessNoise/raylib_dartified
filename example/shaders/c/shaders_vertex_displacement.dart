// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_vertex_displacement.c
// Run it: dart run shaders_vertex_displacement.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_vertex_displacement".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(20.0, 5.0, -20.0);
  camera.ref.target.set(0.0, 0.0, 0.0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 60;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final shader = rl.Core.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/vertex_displacement.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/vertex_displacement.fs".toC,
  );

  final perlinNoiseImage = rl.Core.GenImagePerlinNoise(512, 512, 0, 0, 1.0);
  final perlinNoiseMap = rl.Core.LoadTextureFromImage(perlinNoiseImage);
  rl.Core.UnloadImage(perlinNoiseImage);

  int perlinNoiseMapLoc = rl.Core.GetShaderLocation(shader, "perlinNoiseMap".toC);
  rl.Rlgl.rlEnableShader(shader.id);
  rl.Rlgl.rlActiveTextureSlot(1);
  rl.Rlgl.rlEnableTexture(perlinNoiseMap.id);
  rl.Rlgl.rlSetUniformSampler(perlinNoiseMapLoc, 1);
  
  final planeMesh = rl.Core.GenMeshPlane(50, 50, 50, 50);
  final planeModel = rl.Core.LoadModelFromMesh(planeMesh);
  planeModel.materials[0].shader = shader;

  double time = 0.0;

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_FREE.value);

    time += rl.Core.GetFrameTime();
    rl.Core.SetShaderValue(shader,
      rl.Core.GetShaderLocation(shader, "time".toC),
      rl.Temp.Float32$.Value(time).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.BeginShaderMode(shader);
          rl.Core.DrawModel(
            planeModel,
            rl.Temp.vec31(0.0, 0.0, 0.0),
            1.0,
            rl.Temp.color1(255, 255, 255, 255),
          );
        rl.Core.EndShaderMode();

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Vertex displacement".toC,
        10, 10, 20, rl.Color.DARKGRAY
      );
      rl.Core.DrawFPS(10, 40);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shader);
  rl.Core.UnloadModel(planeModel);
  rl.Core.UnloadTexture(perlinNoiseMap);

  rl.CloseWindowAndDispose();
}