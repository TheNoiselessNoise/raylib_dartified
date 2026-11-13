// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_ascii_rendering.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const String GLSL_VERSION = '300es';
const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "shaders_ascii_rendering");
  SetTargetFPS(60);

  final fudesumi = LoadTexture("../resources/fudesumi.png");
  final raysan = LoadTexture("../resources/raysan.png");

  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/ascii.fs",
  );

  int resolutionLoc = GetShaderLocation(shader, "resolution");
  int fontSizeLoc = GetShaderLocation(shader, "fontSize");

  double fontSize = 9.0;

  final resolution = [ screenWidth, screenHeight ];
  SetShaderValue(shader, resolutionLoc, resolution, .SHADER_UNIFORM_VEC2);

  final Vector2 circlePos = .vec2(40.0, screenHeight*0.5);
  double circleSpeed = 1.0;

  final target = LoadRenderTexture(screenWidth, screenHeight);

  rl.setMainLoop(() {
    circlePos.x += circleSpeed;
    if ((circlePos.x > 200.0) || (circlePos.x < 40.0)) circleSpeed *= -1;

    if (IsKeyPressed(.KEY_LEFT) && (fontSize > 9.0)) fontSize -= 1;
    if (IsKeyPressed(.KEY_RIGHT) && (fontSize < 15.0)) fontSize += 1;

    SetShaderValue(shader, fontSizeLoc, [fontSize], .SHADER_UNIFORM_FLOAT);

    BeginTextureMode(target);
      ClearBackground(.WHITE);

      DrawTexture(fudesumi, 500, -30, .WHITE);
      DrawTextureV(raysan, circlePos, .WHITE);
    EndTextureMode();

    BeginDrawing();
      ClearBackground(.RAYWHITE);

      BeginShaderMode(shader);
        DrawTextureRec(
          target.texture,
          .rect(0, 0, target.texture.width, -target.texture.height),
          .vec2(0, 0),
          .WHITE
        );
      EndShaderMode();

      DrawRectangle(0, 0, screenWidth, 40, .BLACK);
      DrawText("Ascii effect - FontSize:${fontSize.f0} - [Left] -1 [Right] +1", 120, 10, 20, .LIGHTGRAY);
      DrawFPS(10, 10);
    EndDrawing();
  });
});