// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_raymarching_rendering.c
// Run it: dart run shaders_raymarching_rendering.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_WINDOW_RESIZABLE]);
  InitWindow(screenWidth, screenHeight, "shaders_raymarching_rendering");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3DD(
    position: .vec3(2.5, 2.5, 3.0),
    target: .vec3(0.0, 0.0, 0.7),
    up: .vec3(0, 1, 0),
    fovy: 65,
    projection: .CAMERA_PERSPECTIVE,
  );

  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/raymarching.fs",
  );

  int viewEyeLoc = GetShaderLocation(shader, "viewEye");
  int viewCenterLoc = GetShaderLocation(shader, "viewCenter");
  int runTimeLoc = GetShaderLocation(shader, "runTime");
  int resolutionLoc = GetShaderLocation(shader, "resolution");

  final resolution = [ screenWidth, screenHeight ];
  void updateShaderResolution() {
    SetShaderValue(shader, resolutionLoc,
      resolution,
      .SHADER_UNIFORM_VEC2
    );
  } updateShaderResolution();

  double runTime = 0;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    final deltaTime = GetFrameTime();
    runTime += deltaTime;

    SetShaderValue(shader, viewEyeLoc,
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    SetShaderValue(shader, viewCenterLoc,
      camera.target.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    SetShaderValue(shader, runTimeLoc,
      [runTime],
      .SHADER_UNIFORM_FLOAT,
    );

    if (IsWindowResized())
    {
      resolution[0] = GetScreenWidth();
      resolution[1] = GetScreenHeight();
      updateShaderResolution();
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginShaderMode(shader);
        DrawRectangle(0, 0, GetScreenWidth(), GetScreenHeight(), .WHITE);
      EndShaderMode();

      DrawText(
        "(c) Raymarching shader by Iñigo Quilez. MIT License.",
        GetScreenWidth() - 280, GetScreenHeight() - 20, 10, .BLACK
      );

    EndDrawing();
  }

  UnloadShader(shader);
  
  CloseWindowAndDispose();
}