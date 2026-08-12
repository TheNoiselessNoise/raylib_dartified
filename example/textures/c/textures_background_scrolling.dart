// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_background_scrolling.c
// Run it: dart run textures_background_scrolling.dart
// WARNING: expects resources from the raylib source
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_background_scrolling".toC);
  SetTargetFPS(60);

  // NOTE: Be careful, background width must be equal or bigger than screen width
  // if not, texture should be draw more than two times for scrolling effect
  final background = LoadTexture("../resources/cyberpunk_street_background.png".toC);
  final midground = LoadTexture("../resources/cyberpunk_street_midground.png".toC);
  final foreground = LoadTexture("../resources/cyberpunk_street_foreground.png".toC);

  double scrollingBack = 0.0;
  double scrollingMid = 0.0;
  double scrollingFore = 0.0;

  while (!WindowShouldClose())
  {
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
      DrawTextureEx(background, Vector2$.val.$1.set(scrollingBack, 20), 0.0, 2.0, WHITE);
      DrawTextureEx(background, Vector2$.val.$1.set(background.width*2 + scrollingBack, 20), 0.0, 2.0, WHITE);

      // Draw midground image twice
      DrawTextureEx(midground, Vector2$.val.$1.set(scrollingMid, 20), 0.0, 2.0, WHITE);
      DrawTextureEx(midground, Vector2$.val.$1.set(midground.width*2 + scrollingMid, 20), 0.0, 2.0, WHITE);

      // Draw foreground image twice
      DrawTextureEx(foreground, Vector2$.val.$1.set(scrollingFore, 70), 0.0, 2.0, WHITE);
      DrawTextureEx(foreground, Vector2$.val.$1.set(foreground.width*2 + scrollingFore, 70), 0.0, 2.0, WHITE);

      DrawText(
        "BACKGROUND SCROLLING & PARALLAX".toC,
        10, 10, 20, RED
      );
      DrawText(
        "(c) Cyberpunk Street Environment by Luis Zuno (@ansimuz)".toC,
        screenWidth - 330, screenHeight - 20, 10, RAYWHITE
      );

    EndDrawing();
  }

  UnloadTexture(background);
  UnloadTexture(midground);
  UnloadTexture(foreground);

  CloseWindowAndDispose();
}