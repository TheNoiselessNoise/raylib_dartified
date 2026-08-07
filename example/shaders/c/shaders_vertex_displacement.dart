// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_vertex_displacement.c
// Run it: dart run shaders_vertex_displacement.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_vertex_displacement".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(20.0, 5.0, -20.0);
  camera.ref.target.set(0.0, 0.0, 0.0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 60;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/vertex_displacement.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/vertex_displacement.fs".toC,
  );

  final perlinNoiseImage = GenImagePerlinNoise(512, 512, 0, 0, 1.0);
  final perlinNoiseMap = LoadTextureFromImage(perlinNoiseImage);
  UnloadImage(perlinNoiseImage);

  int perlinNoiseMapLoc = GetShaderLocation(shader, "perlinNoiseMap".toC);
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
    UpdateCamera(camera, CameraMode.CAMERA_FREE.value);

    time += GetFrameTime();
    SetShaderValue(shader,
      GetShaderLocation(shader, "time".toC),
      Float32$.Value(time).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        BeginShaderMode(shader);
          DrawModel(
            planeModel,
            Vector3$.$1.set(0.0, 0.0, 0.0),
            1.0,
            Color$.$1.set(255, 255, 255, 255),
          );
        EndShaderMode();

      EndMode3D();

      DrawText(
        "Vertex displacement".toC,
        10, 10, 20, DARKGRAY
      );
      DrawFPS(10, 40);

    EndDrawing();
  }

  UnloadShader(shader);
  UnloadModel(planeModel);
  UnloadTexture(perlinNoiseMap);

  CloseWindowAndDispose();
}