// Custom example, there's no original equivalent
// Run it: dart run core_test.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "Live Image Data");
  SetTargetFPS(60);

  final image = LoadImage('../resources/xyzt.jpg');
  ImageResize(image, 256, 256);
  final texture = LoadTextureFromImage(image);

  int scanY = 0;

  while (!WindowShouldClose()) {
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

    UpdateTexture(texture, pixels);

    BeginDrawing();
      ClearBackground(.RAYWHITE);
      DrawTexture(texture, 50, 50, .WHITE);
    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadImage(image);

  CloseWindowAndDispose();
}