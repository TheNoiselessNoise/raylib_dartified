// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_window_letterbox.c
// Run it: dart run core_window_letterbox.dart
import 'dart:math' as math;
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_WINDOW_RESIZABLE, .FLAG_VSYNC_HINT]);
  InitWindow(screenWidth, screenHeight, "core_window_letterbox");
  SetWindowMinSize(320, 240);
  SetTargetFPS(60);

  int gameScreenWidth = 640;
  int gameScreenHeight = 480;

  final target = LoadRenderTexture(gameScreenWidth, gameScreenHeight);
  SetTextureFilter(target.texture, .TEXTURE_FILTER_BILINEAR);

  final List<ColorD> colors = .generate(10, (_) => .zero());
  for (int i = 0; i < 10; i++) colors[i] = .color(GetRandomValue(100, 250), GetRandomValue(50, 150), GetRandomValue(10, 100), 255);

  while (!WindowShouldClose()) {
    final scale = math.min(GetScreenWidth()/gameScreenWidth, GetScreenHeight()/gameScreenHeight);

    if (IsKeyPressed(.KEY_SPACE))
    {
      for (int i = 0; i < 10; i++) colors[i] = .color(GetRandomValue(100, 250), GetRandomValue(50, 150), GetRandomValue(10, 100), 255);
    }

    final mouse = GetMousePosition();
    Vector2D virtualMouse = .vec2(
      (mouse.x - (GetScreenWidth() - (gameScreenWidth*scale))*0.5)/scale,
      (mouse.y - (GetScreenHeight() - (gameScreenHeight*scale))*0.5)/scale,
    );
    virtualMouse = virtualMouse.clamp(.zero(), .vec2(gameScreenWidth, gameScreenHeight));

    // Apply the same transformation as the virtual mouse to the real mouse (i.e. to work with raygui)
    // SetMouseOffset(-(GetScreenWidth() - (gameScreenWidth*scale))*0.5, -(GetScreenHeight() - (gameScreenHeight*scale))*0.5);
    // SetMouseScale(1/scale, 1/scale);

    BeginTextureMode(target);
      ClearBackground(RAYWHITE);

      for (int i = 0; i < 10; i++) DrawRectangle(0, (gameScreenHeight~/10)*i, gameScreenWidth, gameScreenHeight~/10, colors[i]);

      DrawText("If executed inside a window,\nyou can resize the window,\nand see the screen scaling!", 10, 25, 20, WHITE);
      DrawText("Default Mouse: [${mouse.x.toInt()} , ${mouse.y.toInt()}]", 350, 25, 20, GREEN);
      DrawText("Virtual Mouse: [${virtualMouse.x.toInt()} , ${virtualMouse.y.toInt()}]", 350, 55, 20, YELLOW);
    EndTextureMode();

    BeginDrawing();
      ClearBackground(BLACK);

      DrawTexturePro(
        target.texture,
        .rect(0.0, 0.0, target.texture.width, -target.texture.height),
        .rect((GetScreenWidth() - (gameScreenWidth*scale))*0.5, (GetScreenHeight() - (gameScreenHeight*scale))*0.5, gameScreenWidth*scale, gameScreenHeight*scale),
        .zero(), 0.0, WHITE
      );
    EndDrawing();
  }

  UnloadRenderTexture(target);

  CloseWindowAndDispose();
}
