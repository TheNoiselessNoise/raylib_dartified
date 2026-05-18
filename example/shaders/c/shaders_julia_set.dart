// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_julia_set.c
// Run it: dart run shaders_julia_set.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

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
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_julia_set".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final shader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/julia_set.fs".toC,
  );

  final target = rl.Core.LoadRenderTexture(rl.Core.GetScreenWidth(), rl.Core.GetScreenHeight());
  
  List<double> c = [ pointsOfInterest[0][0], pointsOfInterest[0][1] ];

  List<double> offset = [ 0.0, 0.0 ];
  double zoom = startingZoom;

  int cLoc = rl.Core.GetShaderLocation(shader, "c".toC);
  int zoomLoc = rl.Core.GetShaderLocation(shader, "zoom".toC);
  int offsetLoc = rl.Core.GetShaderLocation(shader, "offset".toC);

  void updateShaderC() {
    rl.Core.SetShaderValue(shader, cLoc,
      rl.Temp.Float32$.Array(c).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
    );
  } updateShaderC();

  void updateShaderZoom() {
    rl.Core.SetShaderValue(shader, zoomLoc,
      rl.Temp.Float32$.Value(zoom).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
  } updateShaderZoom();

  void updateShaderOffset() {
    rl.Core.SetShaderValue(shader, offsetLoc,
      rl.Temp.Float32$.Array(offset).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
    );
  } updateShaderOffset();

  int incrementSpeed = 0;
  bool showControls = true;

  while (!rl.Core.WindowShouldClose())
  {
    if (
      rl.Core.IsKeyPressed(KeyboardKey.KEY_ONE.value) ||
      rl.Core.IsKeyPressed(KeyboardKey.KEY_TWO.value) ||
      rl.Core.IsKeyPressed(KeyboardKey.KEY_THREE.value) ||
      rl.Core.IsKeyPressed(KeyboardKey.KEY_FOUR.value) ||
      rl.Core.IsKeyPressed(KeyboardKey.KEY_FIVE.value) ||
      rl.Core.IsKeyPressed(KeyboardKey.KEY_SIX.value)
    ) {
      if (rl.Core.IsKeyPressed(KeyboardKey.KEY_ONE.value)) c = [ pointsOfInterest[0][0], pointsOfInterest[0][1] ];
      else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_TWO.value)) c = [ pointsOfInterest[1][0], pointsOfInterest[1][1] ];
      else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_THREE.value)) c = [ pointsOfInterest[2][0], pointsOfInterest[2][1] ];
      else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_FOUR.value)) c = [ pointsOfInterest[3][0], pointsOfInterest[3][1] ];
      else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_FIVE.value)) c = [ pointsOfInterest[4][0], pointsOfInterest[4][1] ];
      else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SIX.value)) c = [ pointsOfInterest[5][0], pointsOfInterest[5][1] ];

      updateShaderC();
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_R.value))
    {
      zoom = startingZoom;
      updateShaderZoom();

      offset[0] = 0.0;
      offset[1] = 0.0;
      updateShaderOffset();
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value)) incrementSpeed = 0;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_F1.value)) showControls = !showControls;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) incrementSpeed++;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_LEFT.value)) incrementSpeed--;

    if (
      rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value) ||
      rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value)
    ) {
      zoom *= rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)? zoomSpeed : 1.0/zoomSpeed;
      updateShaderZoom();

      final mousePos = rl.Core.GetMousePosition();
      final offsetVelocity = rl.Temp.Vector2$.At('offsetVelocity');

      offsetVelocity.ref.x = (mousePos.x/screenWidth - 0.5)*offsetSpeedMul/zoom;
      offsetVelocity.ref.y = (mousePos.y/screenHeight - 0.5)*offsetSpeedMul/zoom;

      offset[0] += rl.Core.GetFrameTime()*offsetVelocity.ref.x;
      offset[1] += rl.Core.GetFrameTime()*offsetVelocity.ref.y;
      updateShaderOffset();
    }

    final dc = rl.Core.GetFrameTime()*incrementSpeed*0.0005;
    c[0] += dc;
    c[1] += dc;
    updateShaderC();

    rl.Core.BeginTextureMode(target);
      rl.Core.ClearBackground(rl.Color.BLACK);

      rl.Core.DrawRectangle(0, 0, rl.Core.GetScreenWidth(), rl.Core.GetScreenHeight(), rl.Color.BLACK);
    rl.Core.EndTextureMode();
        
    rl.Core.BeginDrawing();
      rl.Core.ClearBackground(rl.Color.BLACK);

      rl.Core.BeginShaderMode(shader);
        rl.Core.DrawTextureEx(
          target.texture,
          rl.Temp.vec2Zero,
          0.0, 1.0, rl.Color.WHITE
        );
      rl.Core.EndShaderMode();

      if (showControls)
      {
        rl.Core.DrawText(
          "Press Mouse buttons right/left to zoom in/out and move".toC,
          10, 15, 10, rl.Color.RAYWHITE
        );
        rl.Core.DrawText(
          "Press KEY_F1 to toggle these controls".toC,
          10, 30, 10, rl.Color.RAYWHITE
        );
        rl.Core.DrawText(
          "Press KEYS [1 - 6] to change point of interest".toC,
          10, 45, 10, rl.Color.RAYWHITE
        );
        rl.Core.DrawText(
          "Press KEY_LEFT | KEY_RIGHT to change speed".toC,
          10, 60, 10, rl.Color.RAYWHITE
        );
        rl.Core.DrawText(
          "Press KEY_SPACE to stop movement animation".toC,
          10, 75, 10, rl.Color.RAYWHITE
        );
        rl.Core.DrawText(
          "Press KEY_R to recenter the camera".toC,
          10, 90, 10, rl.Color.RAYWHITE
        );
      }
    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shader);
  rl.Core.UnloadRenderTexture(target);
  
  rl.CloseWindowAndDispose();
}