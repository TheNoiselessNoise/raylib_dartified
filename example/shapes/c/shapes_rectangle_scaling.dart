// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rectangle_scaling.c
// Run it: dart run shapes_rectangle_scaling.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const double MOUSE_SCALE_MARK_SIZE = 12;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_rectangle_scaling".toC);
  SetTargetFPS(60);

  final rec = Rectangle$.val.At('rec').set(100, 100, 200, 80);
  final mousePosition = Vector2$.val.At('mousePosition');

  bool mouseScaleReady = false;
  bool mouseScaleMode = false;

  while (!WindowShouldClose())
  {
    mousePosition.setC(GetMousePosition());

    if (CheckCollisionPointRec(
      mousePosition.ref,
      Rectangle$.val.$1.set(
        rec.ref.x + rec.ref.width - MOUSE_SCALE_MARK_SIZE,
        rec.ref.y + rec.ref.height - MOUSE_SCALE_MARK_SIZE,
        MOUSE_SCALE_MARK_SIZE, MOUSE_SCALE_MARK_SIZE
      )
    )) {
      mouseScaleReady = true;
      if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) mouseScaleMode = true;
    }
    else mouseScaleReady = false;

    if (mouseScaleMode)
    {
      mouseScaleReady = true;

      rec.ref.width = mousePosition.ref.x - rec.ref.x;
      rec.ref.height = mousePosition.ref.y - rec.ref.y;

      if (rec.ref.width < MOUSE_SCALE_MARK_SIZE) rec.ref.width = MOUSE_SCALE_MARK_SIZE;
      if (rec.ref.height < MOUSE_SCALE_MARK_SIZE) rec.ref.height = MOUSE_SCALE_MARK_SIZE;
      
      if (rec.ref.width > (GetScreenWidth() - rec.ref.x))
        rec.ref.width = GetScreenWidth() - rec.ref.x;
      if (rec.ref.height > (GetScreenHeight() - rec.ref.y))
        rec.ref.height = GetScreenHeight() - rec.ref.y;

      if (IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) mouseScaleMode = false;
    }
    
    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText(
        "Scale rectangle dragging from bottom-right corner!".toC,
        10, 10, 20, GRAY
      );

      DrawRectangleRec(rec.ref, Fade(GREEN, 0.5));

      if (mouseScaleReady)
      {
        DrawRectangleLinesEx(rec.ref, 1, RED);
        DrawTriangle(
          Vector2$.val.$1.set(rec.ref.x + rec.ref.width - MOUSE_SCALE_MARK_SIZE, rec.ref.y + rec.ref.height),
          Vector2$.val.$2.set(rec.ref.x + rec.ref.width, rec.ref.y + rec.ref.height),
          Vector2$.val.$3.set(rec.ref.x + rec.ref.width, rec.ref.y + rec.ref.height - MOUSE_SCALE_MARK_SIZE),
          RED
        );
      }

    EndDrawing();
  }

  CloseWindowAndDispose();
}