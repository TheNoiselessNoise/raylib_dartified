// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_color_correction.c
// Run it: dart run shaders_color_correction.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_color_correction".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  List<TextureC> textures = [
    rl.Core.LoadTexture("../resources/parrots.png".toC),
    rl.Core.LoadTexture("../resources/cat.png".toC),
    rl.Core.LoadTexture("../resources/mandrill.png".toC),
    rl.Core.LoadTexture("../resources/fudesumi.png".toC),
  ];

  ShaderC shader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/color_correction.fs".toC,
  );

  final imageIndex = rl.Temp.Int$.At('imageIndex');
  int resetButtonClicked = 0;

  final contrast = rl.Temp.Float$.At('contrast');
  final saturation = rl.Temp.Float$.At('saturation');
  final brightness = rl.Temp.Float$.At('brightness');

  int contrastLoc = rl.Core.GetShaderLocation(shader, "contrast".toC);
  int saturationLoc = rl.Core.GetShaderLocation(shader, "saturation".toC);
  int brightnessLoc = rl.Core.GetShaderLocation(shader, "brightness".toC);

  void updateShaderValues() {
    rl.Core.SetShaderValue(shader, contrastLoc,
      rl.Temp.Float$.Value(contrast.value).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );

    rl.Core.SetShaderValue(shader, saturationLoc,
      rl.Temp.Float$.Value(saturation.value).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );

    rl.Core.SetShaderValue(shader, brightnessLoc,
      rl.Temp.Float$.Value(brightness.value).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
  }

  updateShaderValues();

  final lineColor = rl.Temp.Color$.At('lineColor').set(218, 218, 218, 255);
  final rectColor = rl.Temp.Color$.At('rectColor').set(232, 232, 232, 255);

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_ONE.value)) imageIndex.value = 0;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_TWO.value)) imageIndex.value = 1;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_THREE.value)) imageIndex.value = 2;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_FOUR.value)) imageIndex.value = 3;

    if (
      rl.Core.IsKeyPressed(KeyboardKey.KEY_R.value) ||
      resetButtonClicked.toBool()
    ) {
      contrast.value = 0;
      saturation.value = 0;
      brightness.value = 0;
    }

    updateShaderValues();

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginShaderMode(shader);

        rl.Core.DrawTexture(
          textures[imageIndex.value],
          (580/2 - textures[imageIndex.value].width/2).toInt(),
          (screenHeight/2 - textures[imageIndex.value].height/2).toInt(),
          rl.Color.WHITE
        );

      rl.Core.EndShaderMode();

      rl.Core.DrawLine(580, 0, 580, screenHeight, lineColor.ref);
      rl.Core.DrawRectangle(580, 0, screenWidth, screenHeight, rectColor.ref);

      rl.Core.DrawText(
        "Color Correction".toC,
        585, 40, 20, rl.Color.GRAY
      );

      rl.Core.DrawText(
        "Picture".toC,
        602, 75, 10, rl.Color.GRAY
      );
      rl.Core.DrawText(
        "Press [1] - [4] to Change Picture".toC,
        600, 230, 8, rl.Color.GRAY
      );
      rl.Core.DrawText(
        "Press [R] to Reset Values".toC,
        600, 250, 8, rl.Color.GRAY
      );

      rl.Gui.GuiToggleGroup(
        rl.Temp.rect1(645, 70, 20, 20),
        "1;2;3;4".toC, imageIndex
      );

      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(645, 100, 120, 20),
        "Contrast".toC, contrast.value.f0.toC,
        contrast, -100.0, 100.0
      );
      
      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(645, 130, 120, 20),
        "Saturation".toC, saturation.value.f0.toC,
        saturation, -100.0, 100.0
      );
      
      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(645, 160, 120, 20),
        "Brightness".toC, brightness.value.f0.toC,
        brightness, -100.0, 100.0
      );

      resetButtonClicked = rl.Gui.GuiButton(
        rl.Temp.rect1(645, 190, 40, 20),
        "Reset".toC
      );

      rl.Core.DrawFPS(710, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shader);
  
  rl.CloseWindowAndDispose();
}