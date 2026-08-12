// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_lines_drawing.c
// Run it: dart run shapes_lines_drawing.dart
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_lines_drawing".toC);
  SetTargetFPS(60);

  bool startText = true;
  var mousePositionPrevious = GetMousePosition();
  final canvas = LoadRenderTexture(screenWidth, screenHeight);
  double lineThickness = 8.0;
  double lineHue = 0.0;

  BeginTextureMode(canvas);
    ClearBackground(RAYWHITE);
  EndTextureMode();

  while (!WindowShouldClose())
  {
    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value) && startText) startText = false;

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_MIDDLE.value))
    {
      BeginTextureMode(canvas);
        ClearBackground(RAYWHITE);
      EndTextureMode();
    }

    bool leftButtonDown = IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value);
    bool rightButtonDown = IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value);

    if (leftButtonDown || rightButtonDown)
    {
      ColorC drawColor = WHITE;

      if (leftButtonDown)
      {
        lineHue += mousePositionPrevious.toD().distance(GetMousePosition().toD())/3.0;

        while (lineHue >= 360.0) lineHue -= 360.0;

        drawColor = ColorFromHSV(lineHue, 1.0, 1.0);
      }
      else if (rightButtonDown) drawColor = RAYWHITE;

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

      DrawTextureRec(canvas.texture, Rectangle$.val.$1.set(0.0, 0.0, canvas.texture.width,-canvas.texture.height), Vector2$.val.$zero, WHITE);

      if (!leftButtonDown) DrawCircleLinesV(GetMousePosition(), lineThickness/2.0, Color$.val.$1.set(127, 127, 127, 127));

      if (startText) DrawText("try clicking and dragging!".toC, 275, 215, 20, LIGHTGRAY);

    EndDrawing();
  }

  UnloadRenderTexture(canvas);

  CloseWindowAndDispose();
}
