// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rectangle_scaling.c
// Run it: dart run shapes_rectangle_scaling.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const double MOUSE_SCALE_MARK_SIZE = 12;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_rectangle_scaling");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final RectangleD rec = .rect(100, 100, 200, 80);
  Vector2D mousePosition = .zero();

  bool mouseScaleReady = false;
  bool mouseScaleMode = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    mousePosition = rl.CoreD.GetMousePosition();

    if (rl.CoreD.CheckCollisionPointRec(
      mousePosition,
      .rect(
        rec.x + rec.width - MOUSE_SCALE_MARK_SIZE,
        rec.y + rec.height - MOUSE_SCALE_MARK_SIZE,
        MOUSE_SCALE_MARK_SIZE, MOUSE_SCALE_MARK_SIZE
      )
    )) {
      mouseScaleReady = true;
      if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) mouseScaleMode = true;
    }
    else mouseScaleReady = false;

    if (mouseScaleMode)
    {
        mouseScaleReady = true;

        rec.width = mousePosition.x - rec.x;
        rec.height = mousePosition.y - rec.y;

        if (rec.width < MOUSE_SCALE_MARK_SIZE) rec.width = MOUSE_SCALE_MARK_SIZE;
        if (rec.height < MOUSE_SCALE_MARK_SIZE) rec.height = MOUSE_SCALE_MARK_SIZE;
        
        if (rec.width > (rl.CoreD.GetScreenWidth() - rec.x))
          rec.width = rl.CoreD.GetScreenWidth() - rec.x;
        if (rec.height > (rl.CoreD.GetScreenHeight() - rec.y))
          rec.height = rl.CoreD.GetScreenHeight() - rec.y;

        if (rl.CoreD.IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) mouseScaleMode = false;
    }
    
    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText(
        "Scale rectangle dragging from bottom-right corner!",
        10, 10, 20, .GRAY
      );

      rl.CoreD.DrawRectangleRec(rec, rl.CoreD.Fade(.GREEN, 0.5));

      if (mouseScaleReady)
      {
        rl.CoreD.DrawRectangleLinesEx(rec, 1, .RED);
        rl.CoreD.DrawTriangle(
          .vec2(rec.x + rec.width - MOUSE_SCALE_MARK_SIZE, rec.y + rec.height),
          .vec2(rec.x + rec.width, rec.y + rec.height),
          .vec2(rec.x + rec.width, rec.y + rec.height - MOUSE_SCALE_MARK_SIZE),
          .RED
        );
      }

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}