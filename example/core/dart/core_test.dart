// Custom example, there's no original equivalent
// Run it: dart run core_test.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'Live Image Data');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final image = rl.CoreD.LoadImage('../resources/xyzt.jpg');
  rl.CoreD.ImageResize(image, 256, 256);
  final texture = rl.CoreD.LoadTextureFromImage(image);

  int scanY = 0;

  while (!rl.CoreD.WindowShouldClose()) {
    // Paint a red scanline into image.data
    final pixels = image.data; // Uint8List, RGBA layout
    const w = 256;
    const barHeight = 4;

    print('scanY: $scanY');
    for (int y = scanY; y < (scanY + barHeight).clamp(0, 256); y++) {
      for (int x = 0; x < w; x++) {
        final i = (y * w + x) * 3;
        pixels[i + 0] = 0;   // R
        pixels[i + 1] = 255; // G
        pixels[i + 2] = 0;   // B
      }
    }

    scanY = (scanY + 1) % 256;

    rl.CoreD.UpdateTexture(texture, pixels);

    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.RAYWHITE);
      rl.CoreD.DrawTexture(texture, 50, 50, .WHITE);
    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadImage(image);

  rl.CloseWindowAndDispose();
}