// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_ascii_rendering.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Texture fudesumi;
late Texture raysan;
late Shader shader;
late int resolutionLoc;
late int fontSizeLoc;
double fontSize = 9.0;
late Vector2 circlePos;
double circleSpeed = 1.0;
late RenderTexture target;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shaders_ascii_rendering");
    SetTargetFPS(60);

    fudesumi = LoadTexture("../resources/fudesumi.png");
    raysan = LoadTexture("../resources/raysan.png");

    shader = LoadShader(null, "../resources/shaders/glsl${Raylib.glslVersion}/ascii.fs");

    resolutionLoc = GetShaderLocation(shader, "resolution");
    fontSizeLoc = GetShaderLocation(shader, "fontSize");

    final resolution = [ screenWidth, screenHeight ];
    SetShaderValue(shader, resolutionLoc, resolution, .SHADER_UNIFORM_VEC2);

    circlePos = .vec2(40.0, screenHeight*0.5);
    target = LoadRenderTexture(screenWidth, screenHeight);
  },
  loop: (_) async {
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
  },
  close: (_) {
    UnloadRenderTexture(target);
    UnloadShader(shader);
    UnloadTexture(fudesumi);
    UnloadTexture(raysan);
    CloseWindow();
  },
);