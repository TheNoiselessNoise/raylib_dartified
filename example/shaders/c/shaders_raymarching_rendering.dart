// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_raymarching_rendering.c
// Run it: dart run shaders_raymarching_rendering.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_WINDOW_RESIZABLE.value);
  InitWindow(screenWidth, screenHeight, "shaders_raymarching_rendering".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(2.5, 2.5, 3.0);
  camera.ref.target.set(0.0, 0.0, 0.7);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 65;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/raymarching.fs".toC,
  );

  int viewEyeLoc = GetShaderLocation(shader, "viewEye".toC);
  int viewCenterLoc = GetShaderLocation(shader, "viewCenter".toC);
  int runTimeLoc = GetShaderLocation(shader, "runTime".toC);
  int resolutionLoc = GetShaderLocation(shader, "resolution".toC);

  final resolution = [ screenWidth, screenHeight ];
  void updateShaderResolution() {
    SetShaderValue(shader, resolutionLoc,
      Float32$.val.Array(resolution).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value
    );
  } updateShaderResolution();

  double runTime = 0;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    final deltaTime = GetFrameTime();
    runTime += deltaTime;

    SetShaderValue(shader, viewEyeLoc,
      Vector3$.val.$1Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    SetShaderValue(shader, viewCenterLoc,
      Vector3$.val.$1Ptr.setC(camera.ref.target).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    SetShaderValue(shader, runTimeLoc,
      Float32$.val.Value(runTime).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );

    if (IsWindowResized())
    {
      resolution[0] = GetScreenWidth();
      resolution[1] = GetScreenHeight();
      updateShaderResolution();
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginShaderMode(shader);
        DrawRectangle(0, 0, GetScreenWidth(), GetScreenHeight(), WHITE);
      EndShaderMode();

      DrawText(
        "(c) Raymarching shader by Iñigo Quilez. MIT License.".toC,
        GetScreenWidth() - 280, GetScreenHeight() - 20, 10, BLACK
      );

    EndDrawing();
  }

  UnloadShader(shader);
  
  CloseWindowAndDispose();
}