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

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_background_scrolling".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  // NOTE: Be careful, background width must be equal or bigger than screen width
  // if not, texture should be draw more than two times for scrolling effect
  final background = rl.Core.LoadTexture("../resources/cyberpunk_street_background.png".toC);
  final midground = rl.Core.LoadTexture("../resources/cyberpunk_street_midground.png".toC);
  final foreground = rl.Core.LoadTexture("../resources/cyberpunk_street_foreground.png".toC);

  double scrollingBack = 0.0;
  double scrollingMid = 0.0;
  double scrollingFore = 0.0;

  while (!rl.Core.WindowShouldClose())
  {
    scrollingBack -= 0.1;
    scrollingMid -= 0.5;
    scrollingFore -= 1.0;

    // NOTE: Texture is scaled twice its size, so it sould be considered on scrolling
    if (scrollingBack <= -background.width*2) scrollingBack = 0;
    if (scrollingMid <= -midground.width*2) scrollingMid = 0;
    if (scrollingFore <= -foreground.width*2) scrollingFore = 0;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Core.GetColor(0x052c46ff));

      // Draw background image twice
      // NOTE: Texture is scaled twice its size
      rl.Core.DrawTextureEx(background, rl.Temp.vec21(scrollingBack, 20), 0.0, 2.0, rl.Color.WHITE);
      rl.Core.DrawTextureEx(background, rl.Temp.vec21(background.width*2 + scrollingBack, 20), 0.0, 2.0, rl.Color.WHITE);

      // Draw midground image twice
      rl.Core.DrawTextureEx(midground, rl.Temp.vec21(scrollingMid, 20), 0.0, 2.0, rl.Color.WHITE);
      rl.Core.DrawTextureEx(midground, rl.Temp.vec21(midground.width*2 + scrollingMid, 20), 0.0, 2.0, rl.Color.WHITE);

      // Draw foreground image twice
      rl.Core.DrawTextureEx(foreground, rl.Temp.vec21(scrollingFore, 70), 0.0, 2.0, rl.Color.WHITE);
      rl.Core.DrawTextureEx(foreground, rl.Temp.vec21(foreground.width*2 + scrollingFore, 70), 0.0, 2.0, rl.Color.WHITE);

      rl.Core.DrawText(
        "BACKGROUND SCROLLING & PARALLAX".toC,
        10, 10, 20, rl.Color.RED
      );
      rl.Core.DrawText(
        "(c) Cyberpunk Street Environment by Luis Zuno (@ansimuz)".toC,
        screenWidth - 330, screenHeight - 20, 10, rl.Color.RAYWHITE
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(background);
  rl.Core.UnloadTexture(midground);
  rl.Core.UnloadTexture(foreground);

  rl.CloseWindowAndDispose();
}