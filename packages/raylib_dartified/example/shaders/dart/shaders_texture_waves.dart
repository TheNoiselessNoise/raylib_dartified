// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_waves.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Texture texture;
late Shader shader;

late int sizeLoc;
late int secondsLoc;
late int freqXLoc;
late int freqYLoc;
late int ampXLoc;
late int ampYLoc;
late int speedXLoc;
late int speedYLoc;

double freqX = 25.0;
double freqY = 25.0;
double ampX = 5.0;
double ampY = 5.0;
double speedX = 8.0;
double speedY = 8.0;
double seconds = 0.0;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shaders_texture_waves");
    SetTargetFPS(60);

    texture = LoadTexture("../resources/space.png");

    shader = LoadShader(
      null,
      "../resources/shaders/glsl${Raylib.glslVersion}/wave.fs",
    );

    sizeLoc = GetShaderLocation(shader, "size");
    secondsLoc = GetShaderLocation(shader, "seconds");
    freqXLoc = GetShaderLocation(shader, "freqX");
    freqYLoc = GetShaderLocation(shader, "freqY");
    ampXLoc = GetShaderLocation(shader, "ampX");
    ampYLoc = GetShaderLocation(shader, "ampY");
    speedXLoc = GetShaderLocation(shader, "speedX");
    speedYLoc = GetShaderLocation(shader, "speedY");

    final screenSize = [ GetScreenWidth(), GetScreenHeight() ];
    SetShaderValue(shader, sizeLoc, screenSize, .SHADER_UNIFORM_VEC2);
    SetShaderValue(shader, freqXLoc, [freqX], .SHADER_UNIFORM_FLOAT);
    SetShaderValue(shader, freqYLoc, [freqY], .SHADER_UNIFORM_FLOAT);
    SetShaderValue(shader, ampXLoc, [ampX], .SHADER_UNIFORM_FLOAT);
    SetShaderValue(shader, ampYLoc, [ampY], .SHADER_UNIFORM_FLOAT);
    SetShaderValue(shader, speedXLoc, [speedX], .SHADER_UNIFORM_FLOAT);
    SetShaderValue(shader, speedYLoc, [speedY], .SHADER_UNIFORM_FLOAT);
  },
  loop: (_) async {
    seconds += GetFrameTime();

    SetShaderValue(shader, secondsLoc, [seconds], .SHADER_UNIFORM_FLOAT);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginShaderMode(shader);

        DrawTexture(texture, 0, 0, .WHITE);
        DrawTexture(texture, texture.width, 0, .WHITE);

      EndShaderMode();

    EndDrawing();
  },
  close: (_) {
    UnloadShader(shader);
    UnloadTexture(texture);
    CloseWindow();
  },
);