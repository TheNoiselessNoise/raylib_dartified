// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_vertex_displacement.c
// Run it: dart run shaders_vertex_displacement.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_vertex_displacement");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3DD(
    position: .vec3(20.0, 5.0, -20.0),
    target: .vec3(0.0, 0.0, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 60.0,
    projection: .CAMERA_PERSPECTIVE,
  );

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/vertex_displacement.vs",
    "../resources/shaders/glsl$GLSL_VERSION/vertex_displacement.fs",
  );

  final perlinNoiseImage = GenImagePerlinNoise(512, 512, 0, 0, 1.0);
  final perlinNoiseMap = LoadTextureFromImage(perlinNoiseImage);
  UnloadImage(perlinNoiseImage);

  int perlinNoiseMapLoc = GetShaderLocation(shader, "perlinNoiseMap");
  rlEnableShader(shader.id);
  rlActiveTextureSlot(1);
  rlEnableTexture(perlinNoiseMap.id);
  rlSetUniformSampler(perlinNoiseMapLoc, 1);
  
  final planeMesh = GenMeshPlane(50, 50, 50, 50);
  final planeModel = LoadModelFromMesh(planeMesh);
  planeModel.materials[0].shader = shader;

  double time = 0.0;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_FREE);

    time += GetFrameTime();
    SetShaderValue(shader,
      GetShaderLocation(shader, "time"),
      [time],
      .SHADER_UNIFORM_FLOAT,
    );

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        BeginShaderMode(shader);
          DrawModel(
            planeModel,
            .vec3(0.0, 0.0, 0.0),
            1.0,
            .color(255, 255, 255, 255),
          );
        EndShaderMode();

      EndMode3D();

      DrawText(
        "Vertex displacement",
        10, 10, 20, .DARKGRAY
      );
      DrawFPS(10, 40);

    EndDrawing();
  }

  UnloadShader(shader);
  UnloadModel(planeModel);
  UnloadTexture(perlinNoiseMap);

  CloseWindowAndDispose();
}