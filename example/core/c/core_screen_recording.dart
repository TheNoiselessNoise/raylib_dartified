// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_screen_recording.c
// Run it: dart run core_screen_recording.dart
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_screen_recording".toC);
  SetTargetFPS(60);

  while (!WindowShouldClose()) {
    // TODO: requires `msf_gif` optional module
  }

  CloseWindowAndDispose();
}