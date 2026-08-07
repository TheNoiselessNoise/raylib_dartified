// Custom example, there's no original equivalent
// Run it: dart run tab_bar.dart
// WARNING: expects some example specific resources
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(800, 450, "tab_bar");
  SetTargetFPS(60);

  final image = LoadImage('../resources/xyzt.jpg');
  final pallete = LoadImagePalette(image, 128); // NOTE: max 128 colors please
  int pixelSize = 64;
  final pixelPad = 8;

  while (!WindowShouldClose())
  {
    final mouse = GetMousePosition();

    BeginDrawing();

    ClearBackground(.WHITE);

    final cols = screenWidth ~/ (pixelSize + pixelPad);

    for (int i = 0; i < pallete.length; i++) {
      final x = (i % cols) * (pixelSize + pixelPad) + pixelPad;
      final y = (i ~/ cols) * (pixelSize + pixelPad) + pixelPad;
      final RectangleD pixelRect = .rect(x, y, pixelSize, pixelSize);

      if (CheckCollisionPointRec(mouse, pixelRect)) {
        DrawRectangleRec(
          .rect(x-pixelPad/2, y-pixelPad/2, pixelSize+pixelPad, pixelSize+pixelPad),
          Fade(pallete[i], .5),
        );
      }

      DrawRectangleRec(pixelRect, pallete[i]);

      final fontSize = (pixelSize / 8).clamp(6, 20).toInt();
      DrawText(pallete[i].toHex(), x + 2, y + (pixelSize / 2), fontSize, .WHITE);
    }

    DrawText('Pallete Size: ${pallete.length}', 20, screenHeight - 30, 20, .BLACK);

    DrawText('Pixel Size: $pixelSize', 200, screenHeight - 30, 20, .BLACK);

    final (_, newValue) = GuiSlider(
      .rect(360, screenHeight - 30, 100, 20),
      null, null, pixelSize, 8, 128,
    );
    pixelSize = newValue.toInt();

    EndDrawing();
  }

  CloseWindowAndDispose();
}