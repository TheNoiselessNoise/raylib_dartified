// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_hot_reloading.c
// Run it: dart run shaders_hot_reloading.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_hot_reloading".toC);
  SetTargetFPS(60);

  String fragShaderFileName = "../resources/shaders/glsl$GLSL_VERSION/reload.fs";
  int fragShaderFileModTime = GetFileModTime(fragShaderFileName.toC);

  var shader = LoadShader(nullptr, fragShaderFileName.toC);

  int resolutionLoc = GetShaderLocation(shader, "resolution".toC);
  int mouseLoc = GetShaderLocation(shader, "mouse".toC);
  int timeLoc = GetShaderLocation(shader, "time".toC);

  final resolution = [ screenWidth, screenHeight ];
  void updateShaderResolution() {
    SetShaderValue(shader, resolutionLoc,
      Float32$.Array(resolution).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
    );
  } updateShaderResolution();

  double totalTime = 0.0;
  bool shaderAutoReloading = false;

  while (!WindowShouldClose())
  {
    totalTime += GetFrameTime();
    final mouse = GetMousePosition();

    SetShaderValue(shader, timeLoc,
      Float32$.Value(totalTime).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
    
    SetShaderValue(shader, mouseLoc,
      Vector2$.$1Ptr.setC(mouse).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
    );

    if (shaderAutoReloading || (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)))
    {
      final currentFragShaderModTime = GetFileModTime(fragShaderFileName.toC);

      if (currentFragShaderModTime != fragShaderFileModTime)
      {
        var updatedShader = LoadShader(nullptr, fragShaderFileName.toC);

        if (updatedShader.id != rlGetShaderIdDefault())
        {
          UnloadShader(shader);
          shader = updatedShader;

          resolutionLoc = GetShaderLocation(shader, "resolution".toC);
          mouseLoc = GetShaderLocation(shader, "mouse".toC);
          timeLoc = GetShaderLocation(shader, "time".toC);

          updateShaderResolution();
        }

        fragShaderFileModTime = currentFragShaderModTime;
      }
    }

    if (IsKeyPressed(KeyboardKey.KEY_A.value)) shaderAutoReloading = !shaderAutoReloading;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginShaderMode(shader);
        DrawRectangle(0, 0, screenWidth, screenHeight, WHITE);
      EndShaderMode();

      DrawText(
        "PRESS [A] to TOGGLE SHADER AUTOLOADING: ${shaderAutoReloading ? "AUTO" : "MANUAL"}".toC,
        10, 10, 10, shaderAutoReloading ? RED : BLACK
      );
      if (!shaderAutoReloading) DrawText(
        "MOUSE CLICK to SHADER RE-LOADING".toC,
        10, 30, 10, BLACK
      );

      final date = DateTime.fromMillisecondsSinceEpoch(fragShaderFileModTime * 1000);
      DrawText(
        "Shader last modification: $date".toC,
        10, 430, 10, BLACK
      );

    EndDrawing();
  }

  UnloadShader(shader);

  CloseWindowAndDispose();
}