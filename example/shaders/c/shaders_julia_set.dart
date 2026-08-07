// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_julia_set.c
// Run it: dart run shaders_julia_set.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

const List<List<double>> pointsOfInterest = [
  [ -0.348827, 0.607167 ],
  [ -0.786268, 0.169728 ],
  [ -0.8, 0.156 ],
  [ 0.285, 0.0 ],
  [ -0.835, -0.2321 ],
  [ -0.70176, -0.3842 ],
];
const double zoomSpeed = 1.01;
const double offsetSpeedMul = 2.0;
const double startingZoom = 0.75;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_julia_set".toC);
  SetTargetFPS(60);

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/julia_set.fs".toC,
  );

  final target = LoadRenderTexture(GetScreenWidth(), GetScreenHeight());
  
  List<double> c = [ pointsOfInterest[0][0], pointsOfInterest[0][1] ];

  List<double> offset = [ 0.0, 0.0 ];
  double zoom = startingZoom;

  int cLoc = GetShaderLocation(shader, "c".toC);
  int zoomLoc = GetShaderLocation(shader, "zoom".toC);
  int offsetLoc = GetShaderLocation(shader, "offset".toC);

  void updateShaderC() {
    SetShaderValue(shader, cLoc,
      Float32$.Array(c).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
    );
  } updateShaderC();

  void updateShaderZoom() {
    SetShaderValue(shader, zoomLoc,
      Float32$.Value(zoom).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
  } updateShaderZoom();

  void updateShaderOffset() {
    SetShaderValue(shader, offsetLoc,
      Float32$.Array(offset).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
    );
  } updateShaderOffset();

  int incrementSpeed = 0;
  bool showControls = true;

  while (!WindowShouldClose())
  {
    if (
      IsKeyPressed(KeyboardKey.KEY_ONE.value) ||
      IsKeyPressed(KeyboardKey.KEY_TWO.value) ||
      IsKeyPressed(KeyboardKey.KEY_THREE.value) ||
      IsKeyPressed(KeyboardKey.KEY_FOUR.value) ||
      IsKeyPressed(KeyboardKey.KEY_FIVE.value) ||
      IsKeyPressed(KeyboardKey.KEY_SIX.value)
    ) {
      if (IsKeyPressed(KeyboardKey.KEY_ONE.value)) c = [ pointsOfInterest[0][0], pointsOfInterest[0][1] ];
      else if (IsKeyPressed(KeyboardKey.KEY_TWO.value)) c = [ pointsOfInterest[1][0], pointsOfInterest[1][1] ];
      else if (IsKeyPressed(KeyboardKey.KEY_THREE.value)) c = [ pointsOfInterest[2][0], pointsOfInterest[2][1] ];
      else if (IsKeyPressed(KeyboardKey.KEY_FOUR.value)) c = [ pointsOfInterest[3][0], pointsOfInterest[3][1] ];
      else if (IsKeyPressed(KeyboardKey.KEY_FIVE.value)) c = [ pointsOfInterest[4][0], pointsOfInterest[4][1] ];
      else if (IsKeyPressed(KeyboardKey.KEY_SIX.value)) c = [ pointsOfInterest[5][0], pointsOfInterest[5][1] ];

      updateShaderC();
    }

    if (IsKeyPressed(KeyboardKey.KEY_R.value))
    {
      zoom = startingZoom;
      updateShaderZoom();

      offset[0] = 0.0;
      offset[1] = 0.0;
      updateShaderOffset();
    }

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) incrementSpeed = 0;
    if (IsKeyPressed(KeyboardKey.KEY_F1.value)) showControls = !showControls;

    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) incrementSpeed++;
    else if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) incrementSpeed--;

    if (
      IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value) ||
      IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value)
    ) {
      zoom *= IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)? zoomSpeed : 1.0/zoomSpeed;
      updateShaderZoom();

      final mousePos = GetMousePosition();
      final offsetVelocity = Vector2$.At('offsetVelocity');

      offsetVelocity.ref.x = (mousePos.x/screenWidth - 0.5)*offsetSpeedMul/zoom;
      offsetVelocity.ref.y = (mousePos.y/screenHeight - 0.5)*offsetSpeedMul/zoom;

      offset[0] += GetFrameTime()*offsetVelocity.ref.x;
      offset[1] += GetFrameTime()*offsetVelocity.ref.y;
      updateShaderOffset();
    }

    final dc = GetFrameTime()*incrementSpeed*0.0005;
    c[0] += dc;
    c[1] += dc;
    updateShaderC();

    BeginTextureMode(target);
      ClearBackground(BLACK);

      DrawRectangle(0, 0, GetScreenWidth(), GetScreenHeight(), BLACK);
    EndTextureMode();
        
    BeginDrawing();
      ClearBackground(BLACK);

      BeginShaderMode(shader);
        DrawTextureEx(
          target.texture,
          Vector2$.$zero,
          0.0, 1.0, WHITE
        );
      EndShaderMode();

      if (showControls)
      {
        DrawText(
          "Press Mouse buttons right/left to zoom in/out and move".toC,
          10, 15, 10, RAYWHITE
        );
        DrawText(
          "Press KEY_F1 to toggle these controls".toC,
          10, 30, 10, RAYWHITE
        );
        DrawText(
          "Press KEYS [1 - 6] to change point of interest".toC,
          10, 45, 10, RAYWHITE
        );
        DrawText(
          "Press KEY_LEFT | KEY_RIGHT to change speed".toC,
          10, 60, 10, RAYWHITE
        );
        DrawText(
          "Press KEY_SPACE to stop movement animation".toC,
          10, 75, 10, RAYWHITE
        );
        DrawText(
          "Press KEY_R to recenter the camera".toC,
          10, 90, 10, RAYWHITE
        );
      }
    EndDrawing();
  }

  UnloadShader(shader);
  UnloadRenderTexture(target);
  
  CloseWindowAndDispose();
}