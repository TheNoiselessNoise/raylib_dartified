// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_raymarching.c
// Run it: dart run shaders_raymarching.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_WINDOW_RESIZABLE.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_raymarching".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(2.5, 2.5, 3.0);
  camera.ref.target.set(0.0, 0.0, 0.7);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 65;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final shader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/raymarching.fs".toC,
  );

  int viewEyeLoc = rl.Core.GetShaderLocation(shader, "viewEye".toC);
  int viewCenterLoc = rl.Core.GetShaderLocation(shader, "viewCenter".toC);
  int runTimeLoc = rl.Core.GetShaderLocation(shader, "runTime".toC);
  int resolutionLoc = rl.Core.GetShaderLocation(shader, "resolution".toC);

  final resolution = [ screenWidth, screenHeight ];
  void updateShaderResolution() {
    rl.Core.SetShaderValue(shader, resolutionLoc,
      rl.Temp.Float$.Array(resolution).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value
    );
  } updateShaderResolution();

  double runTime = 0;

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    final deltaTime = rl.Core.GetFrameTime();
    runTime += deltaTime;

    rl.Core.SetShaderValue(shader, viewEyeLoc,
      rl.Temp.vec31Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    rl.Core.SetShaderValue(shader, viewCenterLoc,
      rl.Temp.vec31Ptr.setC(camera.ref.target).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    rl.Core.SetShaderValue(shader, runTimeLoc,
      rl.Temp.Float$.Value(runTime).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );

    if (rl.Core.IsWindowResized())
    {
      resolution[0] = rl.Core.GetScreenWidth();
      resolution[1] = rl.Core.GetScreenHeight();
      updateShaderResolution();
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginShaderMode(shader);
        rl.Core.DrawRectangle(0, 0, rl.Core.GetScreenWidth(), rl.Core.GetScreenHeight(), rl.Color.WHITE);
      rl.Core.EndShaderMode();

      rl.Core.DrawText(
        "(c) Raymarching shader by Iñigo Quilez. MIT License.".toC,
        rl.Core.GetScreenWidth() - 280, rl.Core.GetScreenHeight() - 20, 10, rl.Color.BLACK
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shader);
  
  rl.CloseWindowAndDispose();
}