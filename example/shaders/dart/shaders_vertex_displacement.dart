// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_vertex_displacement.c
// Run it: dart run shaders_vertex_displacement.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_vertex_displacement");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = CameraD(
    position: .vec3(20.0, 5.0, -20.0),
    target: .vec3(0.0, 0.0, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 60.0,
    projection: .CAMERA_PERSPECTIVE,
  );

  final shader = rl.CoreD.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/vertex_displacement.vs",
    "../resources/shaders/glsl$GLSL_VERSION/vertex_displacement.fs",
  );

  final perlinNoiseImage = rl.CoreD.GenImagePerlinNoise(512, 512, 0, 0, 1.0);
  final perlinNoiseMap = rl.CoreD.LoadTextureFromImage(perlinNoiseImage);
  rl.CoreD.UnloadImage(perlinNoiseImage);

  int perlinNoiseMapLoc = rl.CoreD.GetShaderLocation(shader, "perlinNoiseMap");
  rl.RlglD.rlEnableShader(shader.id);
  rl.RlglD.rlActiveTextureSlot(1);
  rl.RlglD.rlEnableTexture(perlinNoiseMap.id);
  rl.RlglD.rlSetUniformSampler(perlinNoiseMapLoc, 1);
  
  final planeMesh = rl.CoreD.GenMeshPlane(50, 50, 50, 50);
  final planeModel = rl.CoreD.LoadModelFromMesh(planeMesh);
  planeModel.materials[0].shader = shader;

  double time = 0.0;

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_FREE);

    time += rl.CoreD.GetFrameTime();
    rl.CoreD.SetShaderValue(shader,
      rl.CoreD.GetShaderLocation(shader, "time"),
      [time],
      .SHADER_UNIFORM_FLOAT,
    );

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.BeginShaderMode(shader);
          rl.CoreD.DrawModel(
            planeModel,
            .vec3(0.0, 0.0, 0.0),
            1.0,
            .color(255, 255, 255, 255),
          );
        rl.CoreD.EndShaderMode();

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Vertex displacement",
        10, 10, 20, .DARKGRAY
      );
      rl.CoreD.DrawFPS(10, 40);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);
  rl.CoreD.UnloadModel(planeModel);
  rl.CoreD.UnloadTexture(perlinNoiseMap);

  rl.CloseWindowAndDispose();
}