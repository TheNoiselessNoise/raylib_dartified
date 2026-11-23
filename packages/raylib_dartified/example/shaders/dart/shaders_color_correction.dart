// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_color_correction.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late List<Texture> textures;
late Shader shader;
int imageIndex = 0;
bool resetButtonClicked = false;
double contrast = 0;
double saturation = 0;
double brightness = 0;
late int contrastLoc;
late int saturationLoc;
late int brightnessLoc;
late Color lineColor;
late Color rectColor;

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

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shaders_color_correction");
    SetTargetFPS(60);

    textures = [
      LoadTexture("../resources/parrots.png"),
      LoadTexture("../resources/cat.png"),
      LoadTexture("../resources/mandrill.png"),
      LoadTexture("../resources/fudesumi.png"),
    ];

    shader = LoadShader(
      null,
      "../resources/shaders/glsl${Raylib.glslVersion}/color_correction.fs",
    );

    contrastLoc = GetShaderLocation(shader, "contrast");
    saturationLoc = GetShaderLocation(shader, "saturation");
    brightnessLoc = GetShaderLocation(shader, "brightness");

    updateShaderValues();

    lineColor = .color(218, 218, 218, 255);
    rectColor = .color(232, 232, 232, 255);
  },
  loop: (_) async {
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

      {
        final (_, newValue) = GuiToggleGroup(
          .rect(645, 70, 20, 20),
          "1;2;3;4", imageIndex
        );
        imageIndex = newValue;
      }

      {
        final (_, newValue) = GuiSliderBar(
          .rect(645, 100, 120, 20),
          "Contrast",
          contrast.f0, contrast, -100.0, 100.0
        );
        contrast = newValue;
      }

      {
        final (_, newValue) = GuiSliderBar(
          .rect(645, 130, 120, 20),
          "Saturation",
          saturation.f0, saturation, -100.0, 100.0
        );
        saturation = newValue;
      }
      
      {
        final (_, newValue) = GuiSliderBar(
          .rect(645, 160, 120, 20),
          "Brightness", 
          brightness.f0, brightness, -100.0, 100.0
        );
        brightness = newValue;
      }

      resetButtonClicked = GuiButton(.rect(645, 190, 40, 20), "Reset") != .RESULT_NONE;

      DrawFPS(710, 10);

    EndDrawing();
  },
  close: (_) {
    UnloadShader(shader);
    CloseWindow();
  },
);