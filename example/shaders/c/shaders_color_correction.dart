// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_color_correction.c
// Run it: dart run shaders_color_correction.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_color_correction".toC);
  SetTargetFPS(60);

  List<TextureC> textures = [
    LoadTexture("../resources/parrots.png".toC),
    LoadTexture("../resources/cat.png".toC),
    LoadTexture("../resources/mandrill.png".toC),
    LoadTexture("../resources/fudesumi.png".toC),
  ];

  ShaderC shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/color_correction.fs".toC,
  );

  final imageIndex = Int$.val.At('imageIndex');
  int resetButtonClicked = 0;

  final contrast = Float32$.val.At('contrast');
  final saturation = Float32$.val.At('saturation');
  final brightness = Float32$.val.At('brightness');

  int contrastLoc = GetShaderLocation(shader, "contrast".toC);
  int saturationLoc = GetShaderLocation(shader, "saturation".toC);
  int brightnessLoc = GetShaderLocation(shader, "brightness".toC);

  void updateShaderValues() {
    SetShaderValue(shader, contrastLoc,
      Float32$.val.Value(contrast.value).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );

    SetShaderValue(shader, saturationLoc,
      Float32$.val.Value(saturation.value).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );

    SetShaderValue(shader, brightnessLoc,
      Float32$.val.Value(brightness.value).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
  }

  updateShaderValues();

  final lineColor = Color$.val.At('lineColor').set(218, 218, 218, 255);
  final rectColor = Color$.val.At('rectColor').set(232, 232, 232, 255);

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_ONE.value)) imageIndex.value = 0;
    else if (IsKeyPressed(KeyboardKey.KEY_TWO.value)) imageIndex.value = 1;
    else if (IsKeyPressed(KeyboardKey.KEY_THREE.value)) imageIndex.value = 2;
    else if (IsKeyPressed(KeyboardKey.KEY_FOUR.value)) imageIndex.value = 3;

    if (
      IsKeyPressed(KeyboardKey.KEY_R.value) ||
      resetButtonClicked.toBool()
    ) {
      contrast.value = 0;
      saturation.value = 0;
      brightness.value = 0;
    }

    updateShaderValues();

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginShaderMode(shader);

        DrawTexture(
          textures[imageIndex.value],
          (580/2 - textures[imageIndex.value].width/2).toInt(),
          (screenHeight/2 - textures[imageIndex.value].height/2).toInt(),
          WHITE
        );

      EndShaderMode();

      DrawLine(580, 0, 580, screenHeight, lineColor.ref);
      DrawRectangle(580, 0, screenWidth, screenHeight, rectColor.ref);

      DrawText(
        "Color Correction".toC,
        585, 40, 20, GRAY
      );

      DrawText(
        "Picture".toC,
        602, 75, 10, GRAY
      );
      DrawText(
        "Press [1] - [4] to Change Picture".toC,
        600, 230, 8, GRAY
      );
      DrawText(
        "Press [R] to Reset Values".toC,
        600, 250, 8, GRAY
      );

      GuiToggleGroup(
        Rectangle$.val.$1.set(645, 70, 20, 20),
        "1;2;3;4".toC, imageIndex
      );

      GuiSliderBar(
        Rectangle$.val.$1.set(645, 100, 120, 20),
        "Contrast".toC, contrast.value.f0.toC,
        contrast, -100.0, 100.0
      );
      
      GuiSliderBar(
        Rectangle$.val.$1.set(645, 130, 120, 20),
        "Saturation".toC, saturation.value.f0.toC,
        saturation, -100.0, 100.0
      );
      
      GuiSliderBar(
        Rectangle$.val.$1.set(645, 160, 120, 20),
        "Brightness".toC, brightness.value.f0.toC,
        brightness, -100.0, 100.0
      );

      resetButtonClicked = GuiButton(
        Rectangle$.val.$1.set(645, 190, 40, 20),
        "Reset".toC
      );

      DrawFPS(710, 10);

    EndDrawing();
  }

  UnloadShader(shader);
  
  CloseWindowAndDispose();
}