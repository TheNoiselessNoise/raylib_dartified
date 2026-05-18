// Example dartified, see original for reference:
// https://github.com/raysan5/raygui/blob/master/examples/portable_window/portable_window.c
// Run it: dart run portable_window.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 600;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  final mousePosition = rl.Temp.Vector2$.At('mousePosition');
  final windowPosition = rl.Temp.Vector2$.At('windowPosition').set(500, 200);
  final panOffset = rl.Temp.Vector2$.At('panOffset');
  bool dragWindow = false;
  bool exitWindow = false;

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_WINDOW_UNDECORATED.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "portable_window".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetWindowPosition(windowPosition.ref.x.toInt(), windowPosition.ref.y.toInt());
  rl.Core.SetTargetFPS(60);

  while (!exitWindow && !rl.Core.WindowShouldClose())
  {
    mousePosition.setC(rl.Core.GetMousePosition());

    if (
      rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value) &&
      !dragWindow
    ) {
      if (rl.Core.CheckCollisionPointRec(
        mousePosition.ref,
        rl.Temp.rect1(0, 0, screenWidth, 20),
      )) {
        windowPosition.setC(rl.Core.GetWindowPosition());
        dragWindow = true;
        panOffset.ref = mousePosition.ref;
      }
    }

    if (dragWindow) {
      windowPosition.ref.x += (mousePosition.ref.x - panOffset.ref.x);
      windowPosition.ref.y += (mousePosition.ref.y - panOffset.ref.y);

      rl.Core.SetWindowPosition(
        windowPosition.ref.x.toInt(),
        windowPosition.ref.y.toInt(),
      );

      if (rl.Core.IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) {
        dragWindow = false;
      }
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      exitWindow = rl.Gui.GuiWindowBox(
        rl.Temp.rect1(0, 0, screenWidth, screenHeight),
        "#198# PORTABLE WINDOW".toC,
      ).toBool();

      rl.Core.DrawText(
        "Mouse Position: ${mousePosition.toD().format()}".toC,
        10, 40, 10, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "Window Position: ${windowPosition.toD().format()}".toC,
        10, 60, 10, rl.Color.DARKGRAY
      );

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}