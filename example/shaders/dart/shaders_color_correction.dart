// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_color_correction.c
// Run it: dart run shaders_color_correction.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_color_correction");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final textures = [
    rl.CoreD.LoadTexture("../resources/parrots.png"),
    rl.CoreD.LoadTexture("../resources/cat.png"),
    rl.CoreD.LoadTexture("../resources/mandrill.png"),
    rl.CoreD.LoadTexture("../resources/fudesumi.png"),
  ];

  final shader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/color_correction.fs",
  );

  int imageIndex = 0;
  bool resetButtonClicked = false;

  double contrast = 0;
  double saturation = 0;
  double brightness = 0;

  int contrastLoc = rl.CoreD.GetShaderLocation(shader, "contrast");
  int saturationLoc = rl.CoreD.GetShaderLocation(shader, "saturation");
  int brightnessLoc = rl.CoreD.GetShaderLocation(shader, "brightness");

  void updateShaderValues() {
    rl.CoreD.SetShaderValue(
      shader, contrastLoc, [contrast],
      .SHADER_UNIFORM_FLOAT,
    );

    rl.CoreD.SetShaderValue(
      shader, saturationLoc, [saturation],
      .SHADER_UNIFORM_FLOAT,
    );

    rl.CoreD.SetShaderValue(
      shader, brightnessLoc, [brightness],
      .SHADER_UNIFORM_FLOAT,
    );
  }

  updateShaderValues();

  final ColorD lineColor = .color(218, 218, 218, 255);
  final ColorD rectColor = .color(232, 232, 232, 255);

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyPressed(.KEY_ONE)) imageIndex = 0;
    else if (rl.CoreD.IsKeyPressed(.KEY_TWO)) imageIndex = 1;
    else if (rl.CoreD.IsKeyPressed(.KEY_THREE)) imageIndex = 2;
    else if (rl.CoreD.IsKeyPressed(.KEY_FOUR)) imageIndex = 3;

    if (
      rl.CoreD.IsKeyPressed(.KEY_R) ||
      resetButtonClicked
    ) {
      contrast = 0;
      saturation = 0;
      brightness = 0;
    }

    updateShaderValues();

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginShaderMode(shader);

        rl.CoreD.DrawTexture(
          textures[imageIndex],
          580/2 - textures[imageIndex].width/2,
          screenHeight/2 - textures[imageIndex].height/2,
          .WHITE
        );

      rl.CoreD.EndShaderMode();

      rl.CoreD.DrawLine(580, 0, 580, screenHeight, lineColor);
      rl.CoreD.DrawRectangle(580, 0, screenWidth, screenHeight, rectColor);

      rl.CoreD.DrawText(
        "Color Correction",
        585, 40, 20, .GRAY
      );

      rl.CoreD.DrawText(
        "Picture",
        602, 75, 10, .GRAY
      );
      rl.CoreD.DrawText(
        "Press [1] - [4] to Change Picture",
        600, 230, 8, .GRAY
      );
      rl.CoreD.DrawText(
        "Press [R] to Reset Values",
        600, 250, 8, .GRAY
      );

      {
        final (result, active) = rl.GuiD.GuiToggleGroup(
          .rect(645, 70, 20, 20),
          "1;2;3;4", imageIndex
        );
        imageIndex = active;
      }

      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(645, 100, 120, 20),
          "Contrast",
          contrast.f0, contrast, -100.0, 100.0
        );
        contrast = newValue;
      }
      
      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(645, 130, 120, 20),
          "Saturation",
          saturation.f0, saturation, -100.0, 100.0
        );
        saturation = newValue;
      }
      
      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(645, 160, 120, 20),
          "Brightness", 
          brightness.f0, brightness, -100.0, 100.0
        );
        brightness = newValue;
      }

      resetButtonClicked = rl.GuiD.GuiButton(.rect(645, 190, 40, 20), "Reset") != 0;

      rl.CoreD.DrawFPS(710, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);
  
  rl.CloseWindowAndDispose();
}