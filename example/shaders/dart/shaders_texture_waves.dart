// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_waves.c
// Run it: dart run shaders_texture_waves.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_texture_waves");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final texture = rl.CoreD.LoadTexture("../resources/space.png");

  final shader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/wave.fs",
  );

  int sizeLoc = rl.CoreD.GetShaderLocation(shader, "size");
  int secondsLoc = rl.CoreD.GetShaderLocation(shader, "seconds");
  int freqXLoc = rl.CoreD.GetShaderLocation(shader, "freqX");
  int freqYLoc = rl.CoreD.GetShaderLocation(shader, "freqY");
  int ampXLoc = rl.CoreD.GetShaderLocation(shader, "ampX");
  int ampYLoc = rl.CoreD.GetShaderLocation(shader, "ampY");
  int speedXLoc = rl.CoreD.GetShaderLocation(shader, "speedX");
  int speedYLoc = rl.CoreD.GetShaderLocation(shader, "speedY");

  double freqX = 25.0;
  double freqY = 25.0;
  double ampX = 5.0;
  double ampY = 5.0;
  double speedX = 8.0;
  double speedY = 8.0;

  final screenSize = [ rl.CoreD.GetScreenWidth(), rl.CoreD.GetScreenHeight() ];
  rl.CoreD.SetShaderValue(shader, sizeLoc,
    screenSize,
    .SHADER_UNIFORM_VEC2,
  );
  rl.CoreD.SetShaderValue(shader, freqXLoc,
    [freqX],
    .SHADER_UNIFORM_FLOAT,
  );
  rl.CoreD.SetShaderValue(shader, freqYLoc,
    [freqY],
    .SHADER_UNIFORM_FLOAT,
  );
  rl.CoreD.SetShaderValue(shader, ampXLoc,
    [ampX],
    .SHADER_UNIFORM_FLOAT,
  );
  rl.CoreD.SetShaderValue(shader, ampYLoc,
    [ampY],
    .SHADER_UNIFORM_FLOAT,
  );
  rl.CoreD.SetShaderValue(shader, speedXLoc,
    [speedX],
    .SHADER_UNIFORM_FLOAT,
  );
  rl.CoreD.SetShaderValue(shader, speedYLoc,
    [speedY],
    .SHADER_UNIFORM_FLOAT,
  );

  double seconds = 0.0;

  while (!rl.CoreD.WindowShouldClose())
  {
    seconds += rl.CoreD.GetFrameTime();

    rl.CoreD.SetShaderValue(shader, secondsLoc,
      [seconds],
      .SHADER_UNIFORM_FLOAT,
    );

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginShaderMode(shader);

        rl.CoreD.DrawTexture(texture, 0, 0, .WHITE);
        rl.CoreD.DrawTexture(texture, texture.width, 0, .WHITE);

      rl.CoreD.EndShaderMode();

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);
  rl.CoreD.UnloadTexture(texture);
  
  rl.CloseWindowAndDispose();
}