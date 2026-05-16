// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_raymarching.c
// Run it: dart run shaders_raymarching.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_WINDOW_RESIZABLE]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_raymarching");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = Camera3DD(
    position: .vec3(2.5, 2.5, 3.0),
    target: .vec3(0.0, 0.0, 0.7),
    up: .vec3(0, 1, 0),
    fovy: 65,
    projection: .CAMERA_PERSPECTIVE,
  );

  final shader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/raymarching.fs",
  );

  int viewEyeLoc = rl.CoreD.GetShaderLocation(shader, "viewEye");
  int viewCenterLoc = rl.CoreD.GetShaderLocation(shader, "viewCenter");
  int runTimeLoc = rl.CoreD.GetShaderLocation(shader, "runTime");
  int resolutionLoc = rl.CoreD.GetShaderLocation(shader, "resolution");

  final resolution = [ screenWidth, screenHeight ];
  void updateShaderResolution() {
    rl.CoreD.SetShaderValue(shader, resolutionLoc,
      resolution,
      .SHADER_UNIFORM_VEC2
    );
  } updateShaderResolution();

  double runTime = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    final deltaTime = rl.CoreD.GetFrameTime();
    runTime += deltaTime;

    rl.CoreD.SetShaderValue(shader, viewEyeLoc,
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    rl.CoreD.SetShaderValue(shader, viewCenterLoc,
      camera.target.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    rl.CoreD.SetShaderValue(shader, runTimeLoc,
      [runTime],
      .SHADER_UNIFORM_FLOAT,
    );

    if (rl.CoreD.IsWindowResized())
    {
      resolution[0] = rl.CoreD.GetScreenWidth();
      resolution[1] = rl.CoreD.GetScreenHeight();
      updateShaderResolution();
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginShaderMode(shader);
        rl.CoreD.DrawRectangle(0, 0, rl.CoreD.GetScreenWidth(), rl.CoreD.GetScreenHeight(), .WHITE);
      rl.CoreD.EndShaderMode();

      rl.CoreD.DrawText(
        "(c) Raymarching shader by Iñigo Quilez. MIT License.",
        rl.CoreD.GetScreenWidth() - 280, rl.CoreD.GetScreenHeight() - 20, 10, .BLACK
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);
  
  rl.CloseWindowAndDispose();
}