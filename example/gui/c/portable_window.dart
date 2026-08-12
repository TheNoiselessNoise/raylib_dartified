// Example dartified, see original for reference:
// https://github.com/raysan5/raygui/blob/master/examples/portable_window/portable_window.c
// Run it: dart run portable_window.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 600;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  final mousePosition = Vector2$.val.At('mousePosition');
  final windowPosition = Vector2$.val.At('windowPosition').set(500, 200);
  final panOffset = Vector2$.val.At('panOffset');
  bool dragWindow = false;
  bool exitWindow = false;

  SetConfigFlags(ConfigFlags.FLAG_WINDOW_UNDECORATED.value);
  InitWindow(screenWidth, screenHeight, "portable_window".toC);
  SetWindowPosition(windowPosition.ref.x.toInt(), windowPosition.ref.y.toInt());
  SetTargetFPS(60);

  while (!exitWindow && !WindowShouldClose())
  {
    mousePosition.setC(GetMousePosition());

    if (
      IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value) &&
      !dragWindow
    ) {
      if (CheckCollisionPointRec(
        mousePosition.ref,
        Rectangle$.val.$1.set(0, 0, screenWidth, 20),
      )) {
        windowPosition.setC(GetWindowPosition());
        dragWindow = true;
        panOffset.ref = mousePosition.ref;
      }
    }

    if (dragWindow) {
      windowPosition.ref.x += (mousePosition.ref.x - panOffset.ref.x);
      windowPosition.ref.y += (mousePosition.ref.y - panOffset.ref.y);

      SetWindowPosition(
        windowPosition.ref.x.toInt(),
        windowPosition.ref.y.toInt(),
      );

      if (IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) {
        dragWindow = false;
      }
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      exitWindow = GuiWindowBox(
        Rectangle$.val.$1.set(0, 0, screenWidth, screenHeight),
        "#198# PORTABLE WINDOW".toC,
      ).toBool();

      DrawText(
        "Mouse Position: ${mousePosition.toD().format()}".toC,
        10, 40, 10, DARKGRAY
      );
      DrawText(
        "Window Position: ${windowPosition.toD().format()}".toC,
        10, 60, 10, DARKGRAY
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}