// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_julia_set.c
// Run it: dart run shaders_julia_set.dart
// WARNING: expects resources from the raylib source
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
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_julia_set");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final shader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/julia_set.fs",
  );

  final target = rl.CoreD.LoadRenderTexture(rl.CoreD.GetScreenWidth(), rl.CoreD.GetScreenHeight());
  
  List<double> c = [ pointsOfInterest[0][0], pointsOfInterest[0][1] ];

  List<double> offset = [ 0.0, 0.0 ];
  double zoom = startingZoom;

  int cLoc = rl.CoreD.GetShaderLocation(shader, "c");
  int zoomLoc = rl.CoreD.GetShaderLocation(shader, "zoom");
  int offsetLoc = rl.CoreD.GetShaderLocation(shader, "offset");

  void updateShaderC() => rl.CoreD.SetShaderValue(
    shader, cLoc, c, .SHADER_UNIFORM_VEC2,
  ); updateShaderC();

  void updateShaderZoom() => rl.CoreD.SetShaderValue(
    shader, zoomLoc, [zoom], .SHADER_UNIFORM_FLOAT,
  ); updateShaderZoom();

  void updateShaderOffset() => rl.CoreD.SetShaderValue(
    shader, offsetLoc, offset, .SHADER_UNIFORM_VEC2,
  ); updateShaderOffset();

  int incrementSpeed = 0;
  bool showControls = true;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (
      rl.CoreD.IsKeyPressed(.KEY_ONE) ||
      rl.CoreD.IsKeyPressed(.KEY_TWO) ||
      rl.CoreD.IsKeyPressed(.KEY_THREE) ||
      rl.CoreD.IsKeyPressed(.KEY_FOUR) ||
      rl.CoreD.IsKeyPressed(.KEY_FIVE) ||
      rl.CoreD.IsKeyPressed(.KEY_SIX)
    ) {
      if (rl.CoreD.IsKeyPressed(.KEY_ONE)) c = [ pointsOfInterest[0][0], pointsOfInterest[0][1] ];
      else if (rl.CoreD.IsKeyPressed(.KEY_TWO)) c = [ pointsOfInterest[1][0], pointsOfInterest[1][1] ];
      else if (rl.CoreD.IsKeyPressed(.KEY_THREE)) c = [ pointsOfInterest[2][0], pointsOfInterest[2][1] ];
      else if (rl.CoreD.IsKeyPressed(.KEY_FOUR)) c = [ pointsOfInterest[3][0], pointsOfInterest[3][1] ];
      else if (rl.CoreD.IsKeyPressed(.KEY_FIVE)) c = [ pointsOfInterest[4][0], pointsOfInterest[4][1] ];
      else if (rl.CoreD.IsKeyPressed(.KEY_SIX)) c = [ pointsOfInterest[5][0], pointsOfInterest[5][1] ];

      updateShaderC();
    }

    if (rl.CoreD.IsKeyPressed(.KEY_R))
    {
      zoom = startingZoom;
      updateShaderZoom();

      offset[0] = 0.0;
      offset[1] = 0.0;
      updateShaderOffset();
    }

    if (rl.CoreD.IsKeyPressed(.KEY_SPACE)) incrementSpeed = 0;
    if (rl.CoreD.IsKeyPressed(.KEY_F1)) showControls = !showControls;

    if (rl.CoreD.IsKeyPressed(.KEY_RIGHT)) incrementSpeed++;
    else if (rl.CoreD.IsKeyPressed(.KEY_LEFT)) incrementSpeed--;

    if (
      rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT) ||
      rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_RIGHT)
    ) {
      zoom *= rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT)? zoomSpeed : 1.0/zoomSpeed;
      updateShaderZoom();

      final mousePos = rl.CoreD.GetMousePosition();
      final Vector2D offsetVelocity = .zero();

      offsetVelocity.x = (mousePos.x/screenWidth - 0.5)*offsetSpeedMul/zoom;
      offsetVelocity.y = (mousePos.y/screenHeight - 0.5)*offsetSpeedMul/zoom;

      offset[0] += rl.CoreD.GetFrameTime()*offsetVelocity.x;
      offset[1] += rl.CoreD.GetFrameTime()*offsetVelocity.y;
      updateShaderOffset();
    }

    final dc = rl.CoreD.GetFrameTime()*incrementSpeed*0.0005;
    c[0] += dc;
    c[1] += dc;
    updateShaderC();

    rl.CoreD.BeginTextureMode(target);
      rl.CoreD.ClearBackground(.BLACK);

      rl.CoreD.DrawRectangle(0, 0, rl.CoreD.GetScreenWidth(), rl.CoreD.GetScreenHeight(), .BLACK);
    rl.CoreD.EndTextureMode();
        
    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.BLACK);

      rl.CoreD.BeginShaderMode(shader);
        rl.CoreD.DrawTextureEx(
          target.texture,
          .zero(),
          0.0, 1.0, .WHITE
        );
      rl.CoreD.EndShaderMode();

      if (showControls)
      {
        rl.CoreD.DrawText(
          "Press Mouse buttons right/left to zoom in/out and move",
          10, 15, 10, .RAYWHITE
        );
        rl.CoreD.DrawText(
          "Press KEY_F1 to toggle these controls",
          10, 30, 10, .RAYWHITE
        );
        rl.CoreD.DrawText(
          "Press KEYS [1 - 6] to change point of interest",
          10, 45, 10, .RAYWHITE
        );
        rl.CoreD.DrawText(
          "Press KEY_LEFT | KEY_RIGHT to change speed",
          10, 60, 10, .RAYWHITE
        );
        rl.CoreD.DrawText(
          "Press KEY_SPACE to stop movement animation",
          10, 75, 10, .RAYWHITE
        );
        rl.CoreD.DrawText(
          "Press KEY_R to recenter the camera",
          10, 90, 10, .RAYWHITE
        );
      }
    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);
  rl.CoreD.UnloadRenderTexture(target);
  
  rl.CloseWindowAndDispose();
}