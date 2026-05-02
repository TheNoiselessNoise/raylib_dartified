// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_hot_reloading.c
// Run it: dart run shaders_hot_reloading.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_hot_reloading");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  String fragShaderFileName = "../resources/shaders/glsl$GLSL_VERSION/reload.fs";
  int fragShaderFileModTime = rl.CoreD.GetFileModTime(fragShaderFileName);

  var shader = rl.CoreD.LoadShader(null, fragShaderFileName);

  int resolutionLoc = rl.CoreD.GetShaderLocation(shader, "resolution");
  int mouseLoc = rl.CoreD.GetShaderLocation(shader, "mouse");
  int timeLoc = rl.CoreD.GetShaderLocation(shader, "time");

  final resolution = [ screenWidth, screenHeight ];
  void updateShaderResolution() => rl.CoreD.SetShaderValue(shader, resolutionLoc, resolution, .SHADER_UNIFORM_VEC2);
  updateShaderResolution();

  double totalTime = 0.0;
  bool shaderAutoReloading = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    totalTime += rl.CoreD.GetFrameTime();
    final mouse = rl.CoreD.GetMousePosition();

    rl.CoreD.SetShaderValue(shader, timeLoc, [totalTime], .SHADER_UNIFORM_FLOAT);
    rl.CoreD.SetShaderValue(shader, mouseLoc, mouse.toArray(), .SHADER_UNIFORM_VEC2);

    if (shaderAutoReloading || (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)))
    {
      final currentFragShaderModTime = rl.CoreD.GetFileModTime(fragShaderFileName);

      if (currentFragShaderModTime != fragShaderFileModTime)
      {
        var updatedShader = rl.CoreD.LoadShader(null, fragShaderFileName);

        if (updatedShader.id != rl.Rlgl.rlGetShaderIdDefault())
        {
          rl.CoreD.UnloadShader(shader);
          shader = updatedShader;

          resolutionLoc = rl.CoreD.GetShaderLocation(shader, "resolution");
          mouseLoc = rl.CoreD.GetShaderLocation(shader, "mouse");
          timeLoc = rl.CoreD.GetShaderLocation(shader, "time");

          updateShaderResolution();
        }

        fragShaderFileModTime = currentFragShaderModTime;
      }
    }

    if (rl.CoreD.IsKeyPressed(.KEY_A)) shaderAutoReloading = !shaderAutoReloading;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginShaderMode(shader);
        rl.CoreD.DrawRectangle(0, 0, screenWidth, screenHeight, .WHITE);
      rl.CoreD.EndShaderMode();

      rl.CoreD.DrawText(
        "PRESS [A] to TOGGLE SHADER AUTOLOADING: ${shaderAutoReloading ? "AUTO" : "MANUAL"}",
        10, 10, 10, shaderAutoReloading ? .RED : .BLACK
      );
      if (!shaderAutoReloading) rl.CoreD.DrawText(
        "MOUSE CLICK to SHADER RE-LOADING",
        10, 30, 10, .BLACK
      );

      final date = DateTime.fromMillisecondsSinceEpoch(fragShaderFileModTime * 1000);
      rl.CoreD.DrawText(
        "Shader last modification: $date",
        10, 430, 10, .BLACK
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);

  rl.CloseWindowAndDispose();
}