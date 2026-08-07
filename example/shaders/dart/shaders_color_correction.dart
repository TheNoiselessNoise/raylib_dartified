// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_color_correction.c
// Run it: dart run shaders_color_correction.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_color_correction");
  SetTargetFPS(60);

  final textures = [
    LoadTexture("../resources/parrots.png"),
    LoadTexture("../resources/cat.png"),
    LoadTexture("../resources/mandrill.png"),
    LoadTexture("../resources/fudesumi.png"),
  ];

  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/color_correction.fs",
  );

  int imageIndex = 0;
  bool resetButtonClicked = false;

  double contrast = 0;
  double saturation = 0;
  double brightness = 0;

  int contrastLoc = GetShaderLocation(shader, "contrast");
  int saturationLoc = GetShaderLocation(shader, "saturation");
  int brightnessLoc = GetShaderLocation(shader, "brightness");

  void updateShaderValues() {
    SetShaderValue(
      shader, contrastLoc, [contrast],
      .SHADER_UNIFORM_FLOAT,
    );

    SetShaderValue(
      shader, saturationLoc, [saturation],
      .SHADER_UNIFORM_FLOAT,
    );

    SetShaderValue(
      shader, brightnessLoc, [brightness],
      .SHADER_UNIFORM_FLOAT,
    );
  }

  updateShaderValues();

  final ColorD lineColor = .color(218, 218, 218, 255);
  final ColorD rectColor = .color(232, 232, 232, 255);

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(.KEY_ONE)) imageIndex = 0;
    else if (IsKeyPressed(.KEY_TWO)) imageIndex = 1;
    else if (IsKeyPressed(.KEY_THREE)) imageIndex = 2;
    else if (IsKeyPressed(.KEY_FOUR)) imageIndex = 3;

    if (
      IsKeyPressed(.KEY_R) ||
      resetButtonClicked
    ) {
      contrast = 0;
      saturation = 0;
      brightness = 0;
    }

    updateShaderValues();

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginShaderMode(shader);

        DrawTexture(
          textures[imageIndex],
          580/2 - textures[imageIndex].width/2,
          screenHeight/2 - textures[imageIndex].height/2,
          .WHITE
        );

      EndShaderMode();

      DrawLine(580, 0, 580, screenHeight, lineColor);
      DrawRectangle(580, 0, screenWidth, screenHeight, rectColor);

      DrawText(
        "Color Correction",
        585, 40, 20, .GRAY
      );

      DrawText(
        "Picture",
        602, 75, 10, .GRAY
      );
      DrawText(
        "Press [1] - [4] to Change Picture",
        600, 230, 8, .GRAY
      );
      DrawText(
        "Press [R] to Reset Values",
        600, 250, 8, .GRAY
      );

      (_, imageIndex) = GuiToggleGroup(
        .rect(645, 70, 20, 20),
        "1;2;3;4", imageIndex
      );

      (_, contrast) = GuiSliderBar(
        .rect(645, 100, 120, 20),
        "Contrast",
        contrast.f0, contrast, -100.0, 100.0
      );

      (_, saturation) = GuiSliderBar(
        .rect(645, 130, 120, 20),
        "Saturation",
        saturation.f0, saturation, -100.0, 100.0
      );
      
      (_, brightness) = GuiSliderBar(
        .rect(645, 160, 120, 20),
        "Brightness", 
        brightness.f0, brightness, -100.0, 100.0
      );

      resetButtonClicked = GuiButton(.rect(645, 190, 40, 20), "Reset") != 0;

      DrawFPS(710, 10);

    EndDrawing();
  }

  UnloadShader(shader);
  
  CloseWindowAndDispose();
}