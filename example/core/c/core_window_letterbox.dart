// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_window_letterbox.c
// Run it: dart run core_window_letterbox.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(
    ConfigFlags.FLAG_WINDOW_RESIZABLE.value |
    ConfigFlags.FLAG_VSYNC_HINT.value
  );
  InitWindow(screenWidth, screenHeight, "core_window_letterbox".toC);
  SetWindowMinSize(320, 240);
  SetTargetFPS(60);

  int gameScreenWidth = 640;
  int gameScreenHeight = 480;

  final target = LoadRenderTexture(gameScreenWidth, gameScreenHeight);
  SetTextureFilter(target.texture, TextureFilter.TEXTURE_FILTER_BILINEAR.value);

  final colors = Color$.AtUnique(count: 10);
  for (int i = 0; i < 10; i++) colors[i].set(GetRandomValue(100, 250), GetRandomValue(50, 150), GetRandomValue(10, 100), 255);

  while (!WindowShouldClose()) {
    final scale = math.min(GetScreenWidth()/gameScreenWidth, GetScreenHeight()/gameScreenHeight);

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value))
    {
      for (int i = 0; i < 10; i++) colors[i].set(GetRandomValue(100, 250), GetRandomValue(50, 150), GetRandomValue(10, 100), 255);
    }

    final mouse = GetMousePosition();
    final virtualMouse = Vector2$.At('virtualMouse');
    virtualMouse.ref.x = (mouse.x - (GetScreenWidth() - (gameScreenWidth*scale))*0.5)/scale;
    virtualMouse.ref.y = (mouse.y - (GetScreenHeight() - (gameScreenHeight*scale))*0.5)/scale;
    virtualMouse.setD(virtualMouse.toD().clamp(.zero(), .vec2(gameScreenWidth, gameScreenHeight)));

    // Apply the same transformation as the virtual mouse to the real mouse (i.e. to work with raygui)
    // SetMouseOffset(-((GetScreenWidth() - (gameScreenWidth*scale))*0.5).toInt(), -((GetScreenHeight() - (gameScreenHeight*scale))*0.5).toInt());
    // SetMouseScale(1/scale, 1/scale);

    BeginTextureMode(target);
      ClearBackground(RAYWHITE);

      for (int i = 0; i < 10; i++) DrawRectangle(0, (gameScreenHeight~/10)*i, gameScreenWidth, gameScreenHeight~/10, colors[i]);

      DrawText("If executed inside a window,\nyou can resize the window,\nand see the screen scaling!".toC, 10, 25, 20, WHITE);
      DrawText("Default Mouse: [${mouse.x.toInt()} , ${mouse.y.toInt()}]".toC, 350, 25, 20, GREEN);
      DrawText("Virtual Mouse: [${virtualMouse.ref.x.toInt()} , ${virtualMouse.ref.y.toInt()}]".toC, 350, 55, 20, YELLOW);
    EndTextureMode();

    BeginDrawing();
      ClearBackground(BLACK);

      DrawTexturePro(
        target.texture,
        Rectangle$.$1.set(0.0, 0.0, target.texture.width, -target.texture.height),
        Rectangle$.$2.set((GetScreenWidth() - (gameScreenWidth*scale))*0.5, (GetScreenHeight() - (gameScreenHeight*scale))*0.5, gameScreenWidth*scale, gameScreenHeight*scale),
        Vector2$.$zero, 0.0, WHITE
      );
    EndDrawing();
  }

  UnloadRenderTexture(target);

  CloseWindowAndDispose();
}
