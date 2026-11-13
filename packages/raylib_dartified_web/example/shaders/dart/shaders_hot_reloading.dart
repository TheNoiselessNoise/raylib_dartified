// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_hot_reloading.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const String GLSL_VERSION = '300es';
const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "shaders_hot_reloading");
  SetTargetFPS(60);

  String fragShaderFileName = "../resources/shaders/glsl$GLSL_VERSION/reload.fs";
  int fragShaderFileModTime = GetFileModTime(fragShaderFileName);

  var shader = LoadShader(null, fragShaderFileName);

  int resolutionLoc = GetShaderLocation(shader, "resolution");
  int mouseLoc = GetShaderLocation(shader, "mouse");
  int timeLoc = GetShaderLocation(shader, "time");

  final resolution = [ screenWidth, screenHeight ];
  void updateShaderResolution() => SetShaderValue(shader, resolutionLoc, resolution, .SHADER_UNIFORM_VEC2);
  updateShaderResolution();

  double totalTime = 0.0;
  bool shaderAutoReloading = false;

  rl.setMainLoop(() {
    totalTime += GetFrameTime();
    final mouse = GetMousePosition();

    SetShaderValue(shader, timeLoc, [totalTime], .SHADER_UNIFORM_FLOAT);
    SetShaderValue(shader, mouseLoc, mouse.toArray(), .SHADER_UNIFORM_VEC2);

    if (shaderAutoReloading || (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)))
    {
      final currentFragShaderModTime = GetFileModTime(fragShaderFileName);

      if (currentFragShaderModTime != fragShaderFileModTime)
      {
        var updatedShader = LoadShader(null, fragShaderFileName);

        if (updatedShader.id != rlGetShaderIdDefault())
        {
          UnloadShader(shader);
          shader = updatedShader;

          resolutionLoc = GetShaderLocation(shader, "resolution");
          mouseLoc = GetShaderLocation(shader, "mouse");
          timeLoc = GetShaderLocation(shader, "time");

          updateShaderResolution();
        }

        fragShaderFileModTime = currentFragShaderModTime;
      }
    }

    if (IsKeyPressed(.KEY_A)) shaderAutoReloading = !shaderAutoReloading;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginShaderMode(shader);
        DrawRectangle(0, 0, screenWidth, screenHeight, .WHITE);
      EndShaderMode();

      DrawText(
        "PRESS [A] to TOGGLE SHADER AUTOLOADING: ${shaderAutoReloading ? "AUTO" : "MANUAL"}",
        10, 10, 10, shaderAutoReloading ? .RED : .BLACK
      );
      if (!shaderAutoReloading) DrawText(
        "MOUSE CLICK to SHADER RE-LOADING",
        10, 30, 10, .BLACK
      );

      final date = DateTime.fromMillisecondsSinceEpoch(fragShaderFileModTime * 1000);
      DrawText(
        "Shader last modification: $date",
        10, 430, 10, .BLACK
      );

    EndDrawing();
  });
});