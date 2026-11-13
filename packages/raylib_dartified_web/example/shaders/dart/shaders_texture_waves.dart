// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_waves.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const String GLSL_VERSION = '300es';
const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "shaders_texture_waves");
  SetTargetFPS(60);

  final texture = LoadTexture("../resources/space.png");

  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/wave.fs",
  );

  int sizeLoc = GetShaderLocation(shader, "size");
  int secondsLoc = GetShaderLocation(shader, "seconds");
  int freqXLoc = GetShaderLocation(shader, "freqX");
  int freqYLoc = GetShaderLocation(shader, "freqY");
  int ampXLoc = GetShaderLocation(shader, "ampX");
  int ampYLoc = GetShaderLocation(shader, "ampY");
  int speedXLoc = GetShaderLocation(shader, "speedX");
  int speedYLoc = GetShaderLocation(shader, "speedY");

  double freqX = 25.0;
  double freqY = 25.0;
  double ampX = 5.0;
  double ampY = 5.0;
  double speedX = 8.0;
  double speedY = 8.0;

  final screenSize = [ GetScreenWidth(), GetScreenHeight() ];
  SetShaderValue(shader, sizeLoc,
    screenSize,
    .SHADER_UNIFORM_VEC2,
  );
  SetShaderValue(shader, freqXLoc,
    [freqX],
    .SHADER_UNIFORM_FLOAT,
  );
  SetShaderValue(shader, freqYLoc,
    [freqY],
    .SHADER_UNIFORM_FLOAT,
  );
  SetShaderValue(shader, ampXLoc,
    [ampX],
    .SHADER_UNIFORM_FLOAT,
  );
  SetShaderValue(shader, ampYLoc,
    [ampY],
    .SHADER_UNIFORM_FLOAT,
  );
  SetShaderValue(shader, speedXLoc,
    [speedX],
    .SHADER_UNIFORM_FLOAT,
  );
  SetShaderValue(shader, speedYLoc,
    [speedY],
    .SHADER_UNIFORM_FLOAT,
  );

  double seconds = 0.0;

  rl.setMainLoop(() {
    seconds += GetFrameTime();

    SetShaderValue(shader, secondsLoc,
      [seconds],
      .SHADER_UNIFORM_FLOAT,
    );

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginShaderMode(shader);

        DrawTexture(texture, 0, 0, .WHITE);
        DrawTexture(texture, texture.width, 0, .WHITE);

      EndShaderMode();

    EndDrawing();
  });
});