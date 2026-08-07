// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_lines_drawing.c
// Run it: dart run shapes_lines_drawing.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_lines_drawing");
  SetTargetFPS(60);

  bool startText = true;
  var mousePositionPrevious = GetMousePosition();
  final canvas = LoadRenderTexture(screenWidth, screenHeight);
  double lineThickness = 8.0;
  double lineHue = 0.0;

  BeginTextureMode(canvas);
    ClearBackground(.RAYWHITE);
  EndTextureMode();

  while (!WindowShouldClose())
  {
    if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT) && startText) startText = false;

    if (IsMouseButtonPressed(.MOUSE_BUTTON_MIDDLE))
    {
      BeginTextureMode(canvas);
        ClearBackground(.RAYWHITE);
      EndTextureMode();
    }

    bool leftButtonDown = IsMouseButtonDown(.MOUSE_BUTTON_LEFT);
    bool rightButtonDown = IsMouseButtonDown(.MOUSE_BUTTON_RIGHT);

    if (leftButtonDown || rightButtonDown)
    {
      ColorD drawColor = .WHITE;

      if (leftButtonDown)
      {
        lineHue += mousePositionPrevious.distance(GetMousePosition())/3.0;

        while (lineHue >= 360.0) lineHue -= 360.0;

        drawColor = ColorFromHSV(lineHue, 1.0, 1.0);
      }
      else if (rightButtonDown) drawColor = .RAYWHITE;

      BeginTextureMode(canvas);
        DrawCircleV(mousePositionPrevious, lineThickness/2.0, drawColor);
        DrawCircleV(GetMousePosition(), lineThickness/2.0, drawColor);
        DrawLineEx(mousePositionPrevious, GetMousePosition(), lineThickness, drawColor);
      EndTextureMode();
    }

    lineThickness += GetMouseWheelMove();
    lineThickness = Clamp(lineThickness, 1.0, 500.0);

    mousePositionPrevious = GetMousePosition();

    BeginDrawing();

      DrawTextureRec(canvas.texture, .rect(0.0, 0.0, canvas.texture.width,-canvas.texture.height), .zero(), .WHITE);

      if (!leftButtonDown) DrawCircleLinesV(GetMousePosition(), lineThickness/2.0, .color(127, 127, 127, 127));

      if (startText) DrawText("try clicking and dragging!", 275, 215, 20, .LIGHTGRAY);

    EndDrawing();
  }

  UnloadRenderTexture(canvas);

  CloseWindowAndDispose();
}
