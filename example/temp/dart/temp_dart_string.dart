// Run it: dart run temp_dart_string.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

// Dart version for ../c/temp_dart_string.dart
// Here? Just use strings directly. All of it is handled for you.

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "temp_dart_string");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText(
        "String 1",
        50, 100, 20, .BLACK
      );

      rl.CoreD.DrawText(
        "String 2",
        50, 150, 20, .BLACK
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.CloseWindow();
  // automatically disposes all rl.Temp allocations
  rl.dispose();

  // or in a single call
  // rl.CloseWindowAndDispose();
}