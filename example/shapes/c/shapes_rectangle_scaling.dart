// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rectangle_scaling.c
// Run it: dart run shapes_rectangle_scaling.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const double MOUSE_SCALE_MARK_SIZE = 12;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_rectangle_scaling".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final rec = rl.Temp.Rectangle$.At('rec').set(100, 100, 200, 80);
  final mousePosition = rl.Temp.Vector2$.At('mousePosition');

  bool mouseScaleReady = false;
  bool mouseScaleMode = false;

  while (!rl.Core.WindowShouldClose())
  {
    mousePosition.setC(rl.Core.GetMousePosition());

    if (rl.Core.CheckCollisionPointRec(
      mousePosition.ref,
      rl.Temp.rect1(
        rec.ref.x + rec.ref.width - MOUSE_SCALE_MARK_SIZE,
        rec.ref.y + rec.ref.height - MOUSE_SCALE_MARK_SIZE,
        MOUSE_SCALE_MARK_SIZE, MOUSE_SCALE_MARK_SIZE
      )
    )) {
      mouseScaleReady = true;
      if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) mouseScaleMode = true;
    }
    else mouseScaleReady = false;

    if (mouseScaleMode)
    {
      mouseScaleReady = true;

      rec.ref.width = mousePosition.ref.x - rec.ref.x;
      rec.ref.height = mousePosition.ref.y - rec.ref.y;

      if (rec.ref.width < MOUSE_SCALE_MARK_SIZE) rec.ref.width = MOUSE_SCALE_MARK_SIZE;
      if (rec.ref.height < MOUSE_SCALE_MARK_SIZE) rec.ref.height = MOUSE_SCALE_MARK_SIZE;
      
      if (rec.ref.width > (rl.Core.GetScreenWidth() - rec.ref.x))
        rec.ref.width = rl.Core.GetScreenWidth() - rec.ref.x;
      if (rec.ref.height > (rl.Core.GetScreenHeight() - rec.ref.y))
        rec.ref.height = rl.Core.GetScreenHeight() - rec.ref.y;

      if (rl.Core.IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) mouseScaleMode = false;
    }
    
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawText(
        "Scale rectangle dragging from bottom-right corner!".toC,
        10, 10, 20, rl.Color.GRAY
      );

      rl.Core.DrawRectangleRec(rec.ref, rl.Core.Fade(rl.Color.GREEN, 0.5));

      if (mouseScaleReady)
      {
        rl.Core.DrawRectangleLinesEx(rec.ref, 1, rl.Color.RED);
        rl.Core.DrawTriangle(
          rl.Temp.vec21(rec.ref.x + rec.ref.width - MOUSE_SCALE_MARK_SIZE, rec.ref.y + rec.ref.height),
          rl.Temp.vec22(rec.ref.x + rec.ref.width, rec.ref.y + rec.ref.height),
          rl.Temp.vec23(rec.ref.x + rec.ref.width, rec.ref.y + rec.ref.height - MOUSE_SCALE_MARK_SIZE),
          rl.Color.RED
        );
      }

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}