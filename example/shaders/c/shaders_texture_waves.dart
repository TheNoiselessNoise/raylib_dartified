// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_waves.c
// Run it: dart run shaders_texture_waves.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_texture_waves".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final texture = rl.Core.LoadTexture("../resources/space.png".toC);

  final shader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/wave.fs".toC,
  );

  int sizeLoc = rl.Core.GetShaderLocation(shader, "size".toC);
  int secondsLoc = rl.Core.GetShaderLocation(shader, "seconds".toC);
  int freqXLoc = rl.Core.GetShaderLocation(shader, "freqX".toC);
  int freqYLoc = rl.Core.GetShaderLocation(shader, "freqY".toC);
  int ampXLoc = rl.Core.GetShaderLocation(shader, "ampX".toC);
  int ampYLoc = rl.Core.GetShaderLocation(shader, "ampY".toC);
  int speedXLoc = rl.Core.GetShaderLocation(shader, "speedX".toC);
  int speedYLoc = rl.Core.GetShaderLocation(shader, "speedY".toC);

  double freqX = 25.0;
  double freqY = 25.0;
  double ampX = 5.0;
  double ampY = 5.0;
  double speedX = 8.0;
  double speedY = 8.0;

  final screenSize = [ rl.Core.GetScreenWidth(), rl.Core.GetScreenHeight() ];
  rl.Core.SetShaderValue(shader, sizeLoc,
    rl.Temp.Float$.Array(screenSize).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
  );
  rl.Core.SetShaderValue(shader, freqXLoc,
    rl.Temp.Float$.Value(freqX).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
  );
  rl.Core.SetShaderValue(shader, freqYLoc,
    rl.Temp.Float$.Value(freqY).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
  );
  rl.Core.SetShaderValue(shader, ampXLoc,
    rl.Temp.Float$.Value(ampX).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
  );
  rl.Core.SetShaderValue(shader, ampYLoc,
    rl.Temp.Float$.Value(ampY).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
  );
  rl.Core.SetShaderValue(shader, speedXLoc,
    rl.Temp.Float$.Value(speedX).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
  );
  rl.Core.SetShaderValue(shader, speedYLoc,
    rl.Temp.Float$.Value(speedY).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
  );

  double seconds = 0.0;

  while (!rl.Core.WindowShouldClose())
  {
    seconds += rl.Core.GetFrameTime();

    rl.Core.SetShaderValue(shader, secondsLoc,
      rl.Temp.Float$.Value(seconds).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginShaderMode(shader);

        rl.Core.DrawTexture(texture, 0, 0, rl.Color.WHITE);
        rl.Core.DrawTexture(texture, texture.width, 0, rl.Color.WHITE);

      rl.Core.EndShaderMode();

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shader);
  rl.Core.UnloadTexture(texture);
  
  rl.CloseWindowAndDispose();
}