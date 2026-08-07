// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_mandelbrot_set.c
// Run it: dart run shaders_mandelbrot_set.dart
// WARNING: expects resources from the raylib source
import 'dart:math' as math;
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

const List<List<double>> pointsOfInterest = [
  [ -1.76826775, -0.00422996283, 28435.9238 ],
  [ 0.322004497, -0.0357099883, 56499.7266 ],
  [ -0.748880744, -0.0562955774, 9237.59082 ],
  [ -1.78385007, -0.0156200649, 14599.5283 ],
  [ -0.0985441282, -0.924688697, 26259.8535 ],
  [ 0.317785531, -0.0322612226, 29297.9258 ],
];
const double zoomSpeed = 1.01;
const double offsetSpeedMul = 2.0;
const double startingZoom = 0.6;
const List<double> startingOffset = [ -0.5, 0.0 ];

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_mandelbrot_set");
  SetTargetFPS(60);

  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/mandelbrot_set.fs",
  );

  final target = LoadRenderTexture(GetScreenWidth(), GetScreenHeight());
  
  List<double> offset = .from(startingOffset);
  double zoom = startingZoom;

  int zoomLoc = GetShaderLocation(shader, "zoom");
  int offsetLoc = GetShaderLocation(shader, "offset");
  int maxIterationsLoc = GetShaderLocation(shader, "maxIterations");

  int maxIterations = 333;
  double maxIterationsMultiplier = 166.5;
  bool showControls = true;

  void updateShaderZoom() => SetShaderValue(shader, zoomLoc, [zoom], .SHADER_UNIFORM_FLOAT);
  updateShaderZoom();

  void updateShaderOffset() => SetShaderValue(shader, offsetLoc, offset, .SHADER_UNIFORM_VEC2);
  updateShaderOffset();

  void updateShaderMaxIterations() => SetShaderValue(shader, maxIterationsLoc, [maxIterations], .SHADER_UNIFORM_INT);
  updateShaderMaxIterations();

  while (!WindowShouldClose())
  {
    bool updateShader = false;

    if (
      IsKeyPressed(.KEY_ONE) ||
      IsKeyPressed(.KEY_TWO) ||
      IsKeyPressed(.KEY_THREE) ||
      IsKeyPressed(.KEY_FOUR) ||
      IsKeyPressed(.KEY_FIVE) ||
      IsKeyPressed(.KEY_SIX)
    ) {
      int interestIndex = 0;
      if (IsKeyPressed(.KEY_ONE)) interestIndex = 0;
      else if (IsKeyPressed(.KEY_TWO)) interestIndex = 1;
      else if (IsKeyPressed(.KEY_THREE)) interestIndex = 2;
      else if (IsKeyPressed(.KEY_FOUR)) interestIndex = 3;
      else if (IsKeyPressed(.KEY_FIVE)) interestIndex = 4;
      else if (IsKeyPressed(.KEY_SIX)) interestIndex = 5;

      offset = .from(pointsOfInterest[interestIndex]);
      zoom = pointsOfInterest[interestIndex][2];
      updateShader = true;
    }

    if (IsKeyPressed(.KEY_R))
    {
      offset = .from(startingOffset);
      zoom = startingZoom;
      updateShader = true;
    }

    if (IsKeyPressed(.KEY_F1)) showControls = !showControls;

    if (IsKeyPressed(.KEY_UP))
    {
      maxIterationsMultiplier *= 1.4;
      updateShader = true;
    }
    else if (IsKeyPressed(.KEY_DOWN))
    {
      maxIterationsMultiplier /= 1.4;
      updateShader = true;
    }

    if (
      IsMouseButtonDown(.MOUSE_BUTTON_LEFT) ||
      IsMouseButtonDown(.MOUSE_BUTTON_RIGHT)
    ) {
      zoom *= IsMouseButtonDown(.MOUSE_BUTTON_LEFT)? zoomSpeed : 1.0/zoomSpeed;

      final mousePos = GetMousePosition();
      final Vector2D offsetVelocity = .vec2(
        (mousePos.x/screenWidth - 0.5)*offsetSpeedMul/zoom,
        (mousePos.y/screenHeight - 0.5)*offsetSpeedMul/zoom,
      );

      offset[0] += GetFrameTime()*offsetVelocity.x;
      offset[1] += GetFrameTime()*offsetVelocity.y;
      updateShader = true;
    }

    if (updateShader)
    {
      maxIterations = (math.sqrt(2.0*math.sqrt((1.0 - math.sqrt(37.5*zoom)).abs()))*maxIterationsMultiplier).toInt();

      updateShaderZoom();
      updateShaderOffset();
      updateShaderMaxIterations();
    }

    BeginTextureMode(target);
      ClearBackground(.BLACK);

      DrawRectangle(0, 0, GetScreenWidth(), GetScreenHeight(), .BLACK);
    EndTextureMode();
        
    BeginDrawing();
      ClearBackground(.BLACK);

      BeginShaderMode(shader);
        DrawTextureEx(target.texture, .zero(), 0.0, 1.0, .WHITE);
      EndShaderMode();

      if (showControls)
      {
        DrawText(
          "Press Mouse buttons right/left to zoom in/out and move",
          10, 15, 10, .RAYWHITE
        );
        DrawText(
          "Press F1 to toggle these controls",
          10, 30, 10, .RAYWHITE
        );
        DrawText(
          "Press [1 - 6] to change point of interest",
          10, 45, 10, .RAYWHITE
        );
        DrawText(
          "Press UP | DOWN to change number of iterations",
          10, 60, 10, .RAYWHITE
        );
        DrawText(
          "Press R to recenter the camera",
          10, 75, 10, .RAYWHITE
        );
      }
    EndDrawing();
  }

  UnloadShader(shader);
  UnloadRenderTexture(target);
  
  CloseWindowAndDispose();
}