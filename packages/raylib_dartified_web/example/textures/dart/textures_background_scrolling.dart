// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_background_scrolling.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "textures_background_scrolling");
  SetTargetFPS(60);

  // NOTE: Be careful, background width must be equal or bigger than screen width
  // if not, texture should be draw more than two times for scrolling effect
  final background = LoadTexture("../resources/cyberpunk_street_background.png");
  final midground = LoadTexture("../resources/cyberpunk_street_midground.png");
  final foreground = LoadTexture("../resources/cyberpunk_street_foreground.png");

  double scrollingBack = 0.0;
  double scrollingMid = 0.0;
  double scrollingFore = 0.0;

  rl.setMainLoop(() {
    scrollingBack -= 0.1;
    scrollingMid -= 0.5;
    scrollingFore -= 1.0;

    // NOTE: Texture is scaled twice its size, so it sould be considered on scrolling
    if (scrollingBack <= -background.width*2) scrollingBack = 0;
    if (scrollingMid <= -midground.width*2) scrollingMid = 0;
    if (scrollingFore <= -foreground.width*2) scrollingFore = 0;

    BeginDrawing();

      ClearBackground(GetColor(0x052c46ff));

      // Draw background image twice
      // NOTE: Texture is scaled twice its size
      DrawTextureEx(background, .vec2(scrollingBack, 20), 0.0, 2.0, .WHITE);
      DrawTextureEx(background, .vec2(background.width*2 + scrollingBack, 20), 0.0, 2.0, .WHITE);

      // Draw midground image twice
      DrawTextureEx(midground, .vec2(scrollingMid, 20), 0.0, 2.0, .WHITE);
      DrawTextureEx(midground, .vec2(midground.width*2 + scrollingMid, 20), 0.0, 2.0, .WHITE);

      // Draw foreground image twice
      DrawTextureEx(foreground, .vec2(scrollingFore, 70), 0.0, 2.0, .WHITE);
      DrawTextureEx(foreground, .vec2(foreground.width*2 + scrollingFore, 70), 0.0, 2.0, .WHITE);

      DrawText(
        "BACKGROUND SCROLLING & PARALLAX",
        10, 10, 20, .RED
      );
      DrawText(
        "(c) Cyberpunk Street Environment by Luis Zuno (@ansimuz)",
        screenWidth - 330, screenHeight - 20, 10, .RAYWHITE
      );

    EndDrawing();
  });
});