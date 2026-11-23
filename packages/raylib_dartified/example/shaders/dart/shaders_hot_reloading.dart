// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_hot_reloading.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

String fragShaderFileName = "../resources/shaders/glsl${Raylib.glslVersion}/reload.fs";
late int fragShaderFileModTime;
late Shader shader;
late int resolutionLoc;
late int mouseLoc;
late int timeLoc;
final resolution = [ screenWidth, screenHeight ];
void updateShaderResolution() => SetShaderValue(shader, resolutionLoc, [ screenWidth, screenHeight ], .SHADER_UNIFORM_VEC2);
double totalTime = 0.0;
bool shaderAutoReloading = false;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shaders_hot_reloading");
    SetTargetFPS(60);

    fragShaderFileModTime = GetFileModTime(fragShaderFileName);
    shader = LoadShader(null, fragShaderFileName);
    resolutionLoc = GetShaderLocation(shader, "resolution");
    mouseLoc = GetShaderLocation(shader, "mouse");
    timeLoc = GetShaderLocation(shader, "time");
    updateShaderResolution();
  },
  loop: (_) async {
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
  },
  close: (_) {
    UnloadShader(shader);
    CloseWindow();
  },
);