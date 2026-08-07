// Run it: dart run temp_dart_string.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

// Dart version for ../c/temp_dart_string.dart
// Here? Just use strings directly. All of it is handled for you.

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "temp_dart_string");
  SetTargetFPS(60);

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText(
        "String 1",
        50, 100, 20, .BLACK
      );

      DrawText(
        "String 2",
        50, 150, 20, .BLACK
      );

    EndDrawing();
  }

  CloseWindow();
  // automatically disposes all rl.Temp allocations
  rl.dispose();

  // or in a single call
  // CloseWindowAndDispose();
}