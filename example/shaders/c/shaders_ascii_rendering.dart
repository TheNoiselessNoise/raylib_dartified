// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_ascii_rendering.c
// Run it: dart run shaders_ascii_rendering.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_ascii_rendering".toC);
  SetTargetFPS(60);

  final fudesumi = LoadTexture("../resources/fudesumi.png".toC);
  final raysan = LoadTexture("../resources/raysan.png".toC);

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/ascii.fs".toC,
  );

  int resolutionLoc = GetShaderLocation(shader, "resolution".toC);
  int fontSizeLoc = GetShaderLocation(shader, "fontSize".toC);

  double fontSize = 9.0;

  final resolution = [ screenWidth, screenHeight ];
  SetShaderValue(
    shader, resolutionLoc,
    Float32$.Array(resolution).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC2.value
  );

  final circlePos = Vector2$.AtUnique().set(40.0, screenHeight*0.5);
  double circleSpeed = 1.0;

  final target = LoadRenderTexture(screenWidth, screenHeight);

  while (!WindowShouldClose())
  {
    circlePos.ref.x += circleSpeed;
    if ((circlePos.ref.x > 200.0) || (circlePos.ref.x < 40.0)) circleSpeed *= -1;

    if (IsKeyPressed(KeyboardKey.KEY_LEFT.value) && (fontSize > 9.0)) fontSize -= 1;
    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value) && (fontSize < 15.0)) fontSize += 1;

    SetShaderValue(
      shader, fontSizeLoc,
      Float32$.Value(fontSize).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value
    );

    BeginTextureMode(target);
      ClearBackground(WHITE);

      DrawTexture(fudesumi, 500, -30, WHITE);
      DrawTextureV(raysan, circlePos.ref, WHITE);
    EndTextureMode();

    BeginDrawing();
      ClearBackground(RAYWHITE);

      BeginShaderMode(shader);
        DrawTextureRec(
          target.texture,
          Rectangle$.$1.set(0, 0, target.texture.width, -target.texture.height),
          Vector2$.$1.set(0, 0),
          WHITE
        );
      EndShaderMode();

      DrawRectangle(0, 0, screenWidth, 40, BLACK);
      DrawText("Ascii effect - FontSize:${fontSize.f0} - [Left] -1 [Right] +1".toC, 120, 10, 20, LIGHTGRAY);
      DrawFPS(10, 10);
    EndDrawing();
  }

  UnloadRenderTexture(target);
  UnloadShader(shader);
  UnloadTexture(fudesumi);
  UnloadTexture(raysan);

  CloseWindowAndDispose();
}