// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_background_scrolling.c
// Run it: dart run textures_background_scrolling.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_background_scrolling");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  // NOTE: Be careful, background width must be equal or bigger than screen width
  // if not, texture should be draw more than two times for scrolling effect
  final background = rl.CoreD.LoadTexture("../resources/cyberpunk_street_background.png");
  final midground = rl.CoreD.LoadTexture("../resources/cyberpunk_street_midground.png");
  final foreground = rl.CoreD.LoadTexture("../resources/cyberpunk_street_foreground.png");

  double scrollingBack = 0.0;
  double scrollingMid = 0.0;
  double scrollingFore = 0.0;

  while (!rl.CoreD.WindowShouldClose())
  {
    scrollingBack -= 0.1;
    scrollingMid -= 0.5;
    scrollingFore -= 1.0;

    // NOTE: Texture is scaled twice its size, so it sould be considered on scrolling
    if (scrollingBack <= -background.width*2) scrollingBack = 0;
    if (scrollingMid <= -midground.width*2) scrollingMid = 0;
    if (scrollingFore <= -foreground.width*2) scrollingFore = 0;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(rl.CoreD.GetColor(0x052c46ff));

      // Draw background image twice
      // NOTE: Texture is scaled twice its size
      rl.CoreD.DrawTextureEx(background, .vec2(scrollingBack, 20), 0.0, 2.0, .WHITE);
      rl.CoreD.DrawTextureEx(background, .vec2(background.width*2 + scrollingBack, 20), 0.0, 2.0, .WHITE);

      // Draw midground image twice
      rl.CoreD.DrawTextureEx(midground, .vec2(scrollingMid, 20), 0.0, 2.0, .WHITE);
      rl.CoreD.DrawTextureEx(midground, .vec2(midground.width*2 + scrollingMid, 20), 0.0, 2.0, .WHITE);

      // Draw foreground image twice
      rl.CoreD.DrawTextureEx(foreground, .vec2(scrollingFore, 70), 0.0, 2.0, .WHITE);
      rl.CoreD.DrawTextureEx(foreground, .vec2(foreground.width*2 + scrollingFore, 70), 0.0, 2.0, .WHITE);

      rl.CoreD.DrawText(
        "BACKGROUND SCROLLING & PARALLAX",
        10, 10, 20, .RED
      );
      rl.CoreD.DrawText(
        "(c) Cyberpunk Street Environment by Luis Zuno (@ansimuz)",
        screenWidth - 330, screenHeight - 20, 10, .RAYWHITE
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(background);
  rl.CoreD.UnloadTexture(midground);
  rl.CoreD.UnloadTexture(foreground);

  rl.CloseWindowAndDispose();
}