// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_mandelbrot_set.c
// Run it: dart run shaders_mandelbrot_set.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

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

  InitWindow(screenWidth, screenHeight, "shaders_mandelbrot_set".toC);
  SetTargetFPS(60);

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/mandelbrot_set.fs".toC,
  );

  final target = LoadRenderTexture(GetScreenWidth(), GetScreenHeight());
  
  List<double> offset = .from(startingOffset);
  double zoom = startingZoom;

  int zoomLoc = GetShaderLocation(shader, "zoom".toC);
  int offsetLoc = GetShaderLocation(shader, "offset".toC);
  int maxIterationsLoc = GetShaderLocation(shader, "maxIterations".toC);

  int maxIterations = 333;
  double maxIterationsMultiplier = 166.5;
  bool showControls = true;

  void updateShaderZoom() {
    SetShaderValue(shader, zoomLoc,
      Float32$.Value(zoom).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
  } updateShaderZoom();

  void updateShaderOffset() {
    SetShaderValue(shader, offsetLoc,
      Float32$.Array(offset).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
    );
  } updateShaderOffset();

  void updateShaderMaxIterations() {
    SetShaderValue(shader, maxIterationsLoc,
      Int$.Value(maxIterations).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_INT.value,
    );
  } updateShaderMaxIterations();

  while (!WindowShouldClose())
  {
    bool updateShader = false;

    if (
      IsKeyPressed(KeyboardKey.KEY_ONE.value) ||
      IsKeyPressed(KeyboardKey.KEY_TWO.value) ||
      IsKeyPressed(KeyboardKey.KEY_THREE.value) ||
      IsKeyPressed(KeyboardKey.KEY_FOUR.value) ||
      IsKeyPressed(KeyboardKey.KEY_FIVE.value) ||
      IsKeyPressed(KeyboardKey.KEY_SIX.value)
    ) {
      int interestIndex = 0;
      if (IsKeyPressed(KeyboardKey.KEY_ONE.value)) interestIndex = 0;
      else if (IsKeyPressed(KeyboardKey.KEY_TWO.value)) interestIndex = 1;
      else if (IsKeyPressed(KeyboardKey.KEY_THREE.value)) interestIndex = 2;
      else if (IsKeyPressed(KeyboardKey.KEY_FOUR.value)) interestIndex = 3;
      else if (IsKeyPressed(KeyboardKey.KEY_FIVE.value)) interestIndex = 4;
      else if (IsKeyPressed(KeyboardKey.KEY_SIX.value)) interestIndex = 5;

      offset = .from(pointsOfInterest[interestIndex]);
      zoom = pointsOfInterest[interestIndex][2];
      updateShader = true;
    }

    if (IsKeyPressed(KeyboardKey.KEY_R.value))
    {
      offset = .from(startingOffset);
      zoom = startingZoom;
      updateShader = true;
    }

    if (IsKeyPressed(KeyboardKey.KEY_F1.value)) showControls = !showControls;

    if (IsKeyPressed(KeyboardKey.KEY_UP.value))
    {
      maxIterationsMultiplier *= 1.4;
      updateShader = true;
    }
    else if (IsKeyPressed(KeyboardKey.KEY_DOWN.value))
    {
      maxIterationsMultiplier /= 1.4;
      updateShader = true;
    }

    if (
      IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value) ||
      IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value)
    ) {
      zoom *= IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)? zoomSpeed : 1.0/zoomSpeed;

      final mousePos = GetMousePosition();
      final offsetVelocity = Vector2$.At('offsetVelocity');

      offsetVelocity.ref.x = (mousePos.x/screenWidth - 0.5)*offsetSpeedMul/zoom;
      offsetVelocity.ref.y = (mousePos.y/screenHeight - 0.5)*offsetSpeedMul/zoom;

      offset[0] += GetFrameTime()*offsetVelocity.ref.x;
      offset[1] += GetFrameTime()*offsetVelocity.ref.y;
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
      ClearBackground(BLACK);

      DrawRectangle(0, 0, GetScreenWidth(), GetScreenHeight(), BLACK);
    EndTextureMode();
        
    BeginDrawing();
      ClearBackground(BLACK);

      BeginShaderMode(shader);
        DrawTextureEx(target.texture, Vector2$.$zero, 0.0, 1.0, WHITE);
      EndShaderMode();

      if (showControls)
      {
        DrawText(
          "Press Mouse buttons right/left to zoom in/out and move".toC,
          10, 15, 10, RAYWHITE
        );
        DrawText(
          "Press F1 to toggle these controls".toC,
          10, 30, 10, RAYWHITE
        );
        DrawText(
          "Press [1 - 6] to change point of interest".toC,
          10, 45, 10, RAYWHITE
        );
        DrawText(
          "Press UP | DOWN to change number of iterations".toC,
          10, 60, 10, RAYWHITE
        );
        DrawText(
          "Press R to recenter the camera".toC,
          10, 75, 10, RAYWHITE
        );
      }
    EndDrawing();
  }

  UnloadShader(shader);
  UnloadRenderTexture(target);
  
  CloseWindowAndDispose();
}