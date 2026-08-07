// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_waves.c
// Run it: dart run shaders_texture_waves.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_texture_waves".toC);
  SetTargetFPS(60);

  final texture = LoadTexture("../resources/space.png".toC);

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/wave.fs".toC,
  );

  int sizeLoc = GetShaderLocation(shader, "size".toC);
  int secondsLoc = GetShaderLocation(shader, "seconds".toC);
  int freqXLoc = GetShaderLocation(shader, "freqX".toC);
  int freqYLoc = GetShaderLocation(shader, "freqY".toC);
  int ampXLoc = GetShaderLocation(shader, "ampX".toC);
  int ampYLoc = GetShaderLocation(shader, "ampY".toC);
  int speedXLoc = GetShaderLocation(shader, "speedX".toC);
  int speedYLoc = GetShaderLocation(shader, "speedY".toC);

  double freqX = 25.0;
  double freqY = 25.0;
  double ampX = 5.0;
  double ampY = 5.0;
  double speedX = 8.0;
  double speedY = 8.0;

  final screenSize = [ GetScreenWidth(), GetScreenHeight() ];
  SetShaderValue(shader, sizeLoc,
    Float32$.Array(screenSize).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
  );
  SetShaderValue(shader, freqXLoc,
    Float32$.Value(freqX).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
  );
  SetShaderValue(shader, freqYLoc,
    Float32$.Value(freqY).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
  );
  SetShaderValue(shader, ampXLoc,
    Float32$.Value(ampX).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
  );
  SetShaderValue(shader, ampYLoc,
    Float32$.Value(ampY).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
  );
  SetShaderValue(shader, speedXLoc,
    Float32$.Value(speedX).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
  );
  SetShaderValue(shader, speedYLoc,
    Float32$.Value(speedY).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
  );

  double seconds = 0.0;

  while (!WindowShouldClose())
  {
    seconds += GetFrameTime();

    SetShaderValue(shader, secondsLoc,
      Float32$.Value(seconds).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginShaderMode(shader);

        DrawTexture(texture, 0, 0, WHITE);
        DrawTexture(texture, texture.width, 0, WHITE);

      EndShaderMode();

    EndDrawing();
  }

  UnloadShader(shader);
  UnloadTexture(texture);
  
  CloseWindowAndDispose();
}