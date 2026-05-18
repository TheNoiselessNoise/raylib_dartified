// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_hot_reloading.c
// Run it: dart run shaders_hot_reloading.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_hot_reloading".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  String fragShaderFileName = "../resources/shaders/glsl$GLSL_VERSION/reload.fs";
  int fragShaderFileModTime = rl.Core.GetFileModTime(fragShaderFileName.toC);

  var shader = rl.Core.LoadShader(nullptr, fragShaderFileName.toC);

  int resolutionLoc = rl.Core.GetShaderLocation(shader, "resolution".toC);
  int mouseLoc = rl.Core.GetShaderLocation(shader, "mouse".toC);
  int timeLoc = rl.Core.GetShaderLocation(shader, "time".toC);

  final resolution = [ screenWidth, screenHeight ];
  void updateShaderResolution() {
    rl.Core.SetShaderValue(shader, resolutionLoc,
      rl.Temp.Float32$.Array(resolution).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
    );
  } updateShaderResolution();

  double totalTime = 0.0;
  bool shaderAutoReloading = false;

  while (!rl.Core.WindowShouldClose())
  {
    totalTime += rl.Core.GetFrameTime();
    final mouse = rl.Core.GetMousePosition();

    rl.Core.SetShaderValue(shader, timeLoc,
      rl.Temp.Float32$.Value(totalTime).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
    
    rl.Core.SetShaderValue(shader, mouseLoc,
      rl.Temp.vec21Ptr.setC(mouse).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
    );

    if (shaderAutoReloading || (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)))
    {
      final currentFragShaderModTime = rl.Core.GetFileModTime(fragShaderFileName.toC);

      if (currentFragShaderModTime != fragShaderFileModTime)
      {
        var updatedShader = rl.Core.LoadShader(nullptr, fragShaderFileName.toC);

        if (updatedShader.id != rl.Rlgl.rlGetShaderIdDefault())
        {
          rl.Core.UnloadShader(shader);
          shader = updatedShader;

          resolutionLoc = rl.Core.GetShaderLocation(shader, "resolution".toC);
          mouseLoc = rl.Core.GetShaderLocation(shader, "mouse".toC);
          timeLoc = rl.Core.GetShaderLocation(shader, "time".toC);

          updateShaderResolution();
        }

        fragShaderFileModTime = currentFragShaderModTime;
      }
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_A.value)) shaderAutoReloading = !shaderAutoReloading;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginShaderMode(shader);
        rl.Core.DrawRectangle(0, 0, screenWidth, screenHeight, rl.Color.WHITE);
      rl.Core.EndShaderMode();

      rl.Core.DrawText(
        "PRESS [A] to TOGGLE SHADER AUTOLOADING: ${shaderAutoReloading ? "AUTO" : "MANUAL"}".toC,
        10, 10, 10, shaderAutoReloading ? rl.Color.RED : rl.Color.BLACK
      );
      if (!shaderAutoReloading) rl.Core.DrawText(
        "MOUSE CLICK to SHADER RE-LOADING".toC,
        10, 30, 10, rl.Color.BLACK
      );

      final date = DateTime.fromMillisecondsSinceEpoch(fragShaderFileModTime * 1000);
      rl.Core.DrawText(
        "Shader last modification: $date".toC,
        10, 430, 10, rl.Color.BLACK
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shader);

  rl.CloseWindowAndDispose();
}