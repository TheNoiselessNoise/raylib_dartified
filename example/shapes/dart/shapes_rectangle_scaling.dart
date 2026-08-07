// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rectangle_scaling.c
// Run it: dart run shapes_rectangle_scaling.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const double MOUSE_SCALE_MARK_SIZE = 12;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_rectangle_scaling");
  SetTargetFPS(60);

  final RectangleD rec = .rect(100, 100, 200, 80);
  Vector2D mousePosition = .zero();

  bool mouseScaleReady = false;
  bool mouseScaleMode = false;

  while (!WindowShouldClose())
  {
    mousePosition = GetMousePosition();

    if (CheckCollisionPointRec(
      mousePosition,
      .rect(
        rec.x + rec.width - MOUSE_SCALE_MARK_SIZE,
        rec.y + rec.height - MOUSE_SCALE_MARK_SIZE,
        MOUSE_SCALE_MARK_SIZE, MOUSE_SCALE_MARK_SIZE
      )
    )) {
      mouseScaleReady = true;
      if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) mouseScaleMode = true;
    }
    else mouseScaleReady = false;

    if (mouseScaleMode)
    {
      mouseScaleReady = true;

      rec.width = mousePosition.x - rec.x;
      rec.height = mousePosition.y - rec.y;

      if (rec.width < MOUSE_SCALE_MARK_SIZE) rec.width = MOUSE_SCALE_MARK_SIZE;
      if (rec.height < MOUSE_SCALE_MARK_SIZE) rec.height = MOUSE_SCALE_MARK_SIZE;
      
      if (rec.width > (GetScreenWidth() - rec.x))
        rec.width = GetScreenWidth() - rec.x;
      if (rec.height > (GetScreenHeight() - rec.y))
        rec.height = GetScreenHeight() - rec.y;

      if (IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) mouseScaleMode = false;
    }
    
    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText(
        "Scale rectangle dragging from bottom-right corner!",
        10, 10, 20, .GRAY
      );

      DrawRectangleRec(rec, Fade(.GREEN, 0.5));

      if (mouseScaleReady)
      {
        DrawRectangleLinesEx(rec, 1, .RED);
        DrawTriangle(
          .vec2(rec.x + rec.width - MOUSE_SCALE_MARK_SIZE, rec.y + rec.height),
          .vec2(rec.x + rec.width, rec.y + rec.height),
          .vec2(rec.x + rec.width, rec.y + rec.height - MOUSE_SCALE_MARK_SIZE),
          .RED
        );
      }

    EndDrawing();
  }

  CloseWindowAndDispose();
}