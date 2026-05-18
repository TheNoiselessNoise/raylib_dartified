// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_draw_tiled.c
// Run it: dart run textures_draw_tiled.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int OPT_WIDTH = 220;
const int MARGIN_SIZE = 8;
const int COLOR_SIZE = 16;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_WINDOW_RESIZABLE.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "textures_draw_tiled".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(120);

  final texPattern = rl.Core.LoadTexture("../resources/patterns.png".toC);
  rl.Core.SetTextureFilter(texPattern, TextureFilter.TEXTURE_FILTER_TRILINEAR.value);

  final recCount = 6;
  final recPattern = rl.Temp.Rectangle$.FillInto(key: 'recPattern', recCount, (i, r) => switch(i) {
    0 => r.set(3, 3, 66, 66),
    1 => r.set(75, 3, 100, 100),
    2 => r.set(3, 75, 66, 66),
    3 => r.set(7, 156, 50, 50),
    4 => r.set(85, 106, 90, 45),
    5 => r.set(75, 154, 100, 60),
    _ => throw Exception('Unreachable'),
  });

  final colors = <ColorC>[
    rl.Color.BLACK, rl.Color.MAROON, rl.Color.ORANGE, rl.Color.BLUE, rl.Color.PURPLE,
    rl.Color.BEIGE, rl.Color.LIME, rl.Color.RED, rl.Color.DARKGRAY, rl.Color.SKYBLUE
  ];

  final colorRec = rl.Temp.Rectangle$.At('colorRec', colors.length);

  for (int i = 0, x = 0, y = 0; i < colors.length; i++)
  {
    colorRec[i].x = 2.0 + MARGIN_SIZE + x;
    colorRec[i].y = 22.0 + 256.0 + MARGIN_SIZE + y;
    colorRec[i].width = COLOR_SIZE*2.0;
    colorRec[i].height = COLOR_SIZE.toDouble();

    if (i == (colors.length/2 - 1))
    {
      x = 0;
      y += COLOR_SIZE + MARGIN_SIZE;
    }
    else x += (COLOR_SIZE*2 + MARGIN_SIZE);
  }

  int activePattern = 0, activeCol = 0;
  double scale = 1.0, rotation = 0.0;

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      final mouse = rl.Core.GetMousePosition();

      for (int i = 0; i < recCount; i++)
      {
        if (rl.Core.CheckCollisionPointRec(
          mouse,
          rl.Temp.rect1(
            2 + MARGIN_SIZE + recPattern[i].x,
            40 + MARGIN_SIZE + recPattern[i].y,
            recPattern[i].width,
            recPattern[i].height
          ),
        )) {
          activePattern = i;
          break;
        }
      }

      for (int i = 0; i < colors.length; ++i)
      {
        if (rl.Core.CheckCollisionPointRec(mouse, colorRec[i])) {
          activeCol = i;
          break;
        }
      }
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_UP.value)) scale += 0.25;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_DOWN.value)) scale -= 0.25;
    if (scale > 10.0) scale = 10.0;
    else if ( scale <= 0.0) scale = 0.25;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_LEFT.value)) rotation -= 25.0;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) rotation += 25.0;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value)) { rotation = 0.0; scale = 1.0; }

    rl.Core.BeginDrawing();
      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      DrawTextureTiled(
        rl,
        texPattern,
        recPattern[activePattern],
        rl.Temp.rect1(
          OPT_WIDTH+MARGIN_SIZE,
          MARGIN_SIZE,
          rl.Core.GetScreenWidth() - OPT_WIDTH - 2.0*MARGIN_SIZE,
          rl.Core.GetScreenHeight() - 2.0*MARGIN_SIZE,
        ),
        rl.Temp.vec2Zero,
        rotation,
        scale,
        colors[activeCol]
      );

      rl.Core.DrawRectangle(
        MARGIN_SIZE,
        MARGIN_SIZE,
        OPT_WIDTH - MARGIN_SIZE,
        rl.Core.GetScreenHeight() - 2*MARGIN_SIZE,
        rl.Core.ColorAlpha(rl.Color.LIGHTGRAY, 0.5)
      );

      rl.Core.DrawText(
        "Select Pattern".toC,
        2 + MARGIN_SIZE, 30 + MARGIN_SIZE, 10, rl.Color.BLACK
      );
      
      rl.Core.DrawTexture(texPattern, 2 + MARGIN_SIZE, 40 + MARGIN_SIZE, rl.Color.BLACK);
      
      rl.Core.DrawRectangle(
        (2 + MARGIN_SIZE + recPattern[activePattern].x).toInt(),
        (40 + MARGIN_SIZE + recPattern[activePattern].y).toInt(),
        recPattern[activePattern].width.toInt(),
        recPattern[activePattern].height.toInt(),
        rl.Core.ColorAlpha(rl.Color.DARKBLUE, 0.3)
      );

      rl.Core.DrawText(
        "Select Color".toC,
        2+MARGIN_SIZE, 10+256+MARGIN_SIZE, 10, rl.Color.BLACK
      );

      for (int i = 0; i < colors.length; i++)
      {
        rl.Core.DrawRectangleRec(colorRec[i], colors[i]);
        if (activeCol == i) rl.Core.DrawRectangleLinesEx(colorRec[i], 3, rl.Core.ColorAlpha(rl.Color.WHITE, 0.5));
      }

      rl.Core.DrawText(
        "Scale (UP/DOWN to change)".toC,
        2 + MARGIN_SIZE, 80 + 256 + MARGIN_SIZE, 10, rl.Color.BLACK  
      );
      rl.Core.DrawText(
        scale.f2.toC,
        2 + MARGIN_SIZE, 92 + 256 + MARGIN_SIZE, 20, rl.Color.BLACK
      );

      rl.Core.DrawText(
        "Rotation (LEFT/RIGHT to change)".toC,
        2 + MARGIN_SIZE, 122 + 256 + MARGIN_SIZE, 10, rl.Color.BLACK
      );
      rl.Core.DrawText(
        "${rotation.f0} degrees".toC,
        2 + MARGIN_SIZE, 134 + 256 + MARGIN_SIZE, 20, rl.Color.BLACK
      );

      rl.Core.DrawText(
        "Press [SPACE] to reset".toC,
        2 + MARGIN_SIZE, 164 + 256 + MARGIN_SIZE, 10, rl.Color.DARKBLUE
      );

      rl.Core.DrawText(
        "${rl.Core.GetFPS()} FPS".toC,
        2 + MARGIN_SIZE, 2 + MARGIN_SIZE, 20, rl.Color.BLACK
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texPattern);

  rl.CloseWindowAndDispose();
}

void DrawTextureTiled(
  Raylib rl,
  TextureC texture,
  RectangleC source,
  RectangleC dest,
  Vector2C origin,
  double rotation,
  double scale,
  ColorC tint
) {
  // NOTE: we already use rl.Temp.rect1

  if ((texture.id <= 0) || (scale <= 0.0)) return;
  if ((source.width == 0) || (source.height == 0)) return;

  int tileWidth = (source.width*scale).toInt();
  int tileHeight = (source.height*scale).toInt();
  if ((dest.width < tileWidth) && (dest.height < tileHeight))
  {
    // Can fit only one tile
    rl.Core.DrawTexturePro(
      texture,
      rl.Temp.rect2(
        source.x, source.y,
        (dest.width/tileWidth)*source.width, (dest.height/tileHeight)*source.height
      ),
      rl.Temp.rect3(
        dest.x, dest.y,
        dest.width, dest.height
      ),
      origin,
      rotation,
      tint
    );
  }
  else if (dest.width <= tileWidth)
  {
    // Tiled vertically (one column)
    int dy = 0;
    for (;dy+tileHeight < dest.height; dy += tileHeight)
    {
      rl.Core.DrawTexturePro(
        texture,
        rl.Temp.rect2(
          source.x, source.y,
          (dest.width/tileWidth)*source.width, source.height
        ),
        rl.Temp.rect3(
          dest.x, dest.y + dy,
          dest.width, tileHeight,
        ),
        origin,
        rotation,
        tint
      );
    }

    // Fit last tile
    if (dy < dest.height)
    {
      rl.Core.DrawTexturePro(
        texture,
        rl.Temp.rect2(
          source.x, source.y,
          (dest.width/tileWidth)*source.width, ((dest.height - dy)/tileHeight)*source.height
        ),
        rl.Temp.rect3(
          dest.x, dest.y + dy,
          dest.width, dest.height - dy
        ),
        origin,
        rotation,
        tint
      );
    }
  }
  else if (dest.height <= tileHeight)
  {
    // Tiled horizontally (one row)
    int dx = 0;
    for (;dx+tileWidth < dest.width; dx += tileWidth)
    {
      rl.Core.DrawTexturePro(
        texture,
        rl.Temp.rect2(
          source.x, source.y,
          source.width, (dest.height/tileHeight)*source.height
        ),
        rl.Temp.rect3(
          dest.x + dx, dest.y,
          tileWidth, dest.height
        ),
        origin,
        rotation,
        tint
      );
    }

    // Fit last tile
    if (dx < dest.width)
    {
      rl.Core.DrawTexturePro(
        texture,
        rl.Temp.rect2(
          source.x, source.y,
          ((dest.width - dx)/tileWidth)*source.width, (dest.height/tileHeight)*source.height
        ),
        rl.Temp.rect3(
          dest.x + dx, dest.y,
          dest.width - dx, dest.height
        ),
        origin,
        rotation,
        tint
      );
    }
  }
  else
  {
    // Tiled both horizontally and vertically (rows and columns)
    int dx = 0;
    for (;dx+tileWidth < dest.width; dx += tileWidth)
    {
      int dy = 0;
      for (;dy+tileHeight < dest.height; dy += tileHeight)
      {
        rl.Core.DrawTexturePro(
          texture,
          source,
          rl.Temp.rect2(
            dest.x + dx, dest.y + dy,
            tileWidth, tileHeight
          ),
          origin,
          rotation,
          tint
        );
      }

      if (dy < dest.height)
      {
        rl.Core.DrawTexturePro(
          texture,
          rl.Temp.rect2(
            source.x, source.y, source.width,
            ((dest.height - dy)/tileHeight)*source.height
          ),
          rl.Temp.rect3(
            dest.x + dx, dest.y + dy,
            tileWidth, dest.height - dy
          ),
          origin,
          rotation,
          tint
        );
      }
    }

    // Fit last column of tiles
    if (dx < dest.width)
    {
      int dy = 0;
      for (;dy+tileHeight < dest.height; dy += tileHeight)
      {
        rl.Core.DrawTexturePro(
          texture,
          rl.Temp.rect2(
            source.x, source.y,
            ((dest.width - dx)/tileWidth)*source.width, source.height
          ),
          rl.Temp.rect3(
            dest.x + dx, dest.y + dy,
            dest.width - dx, tileHeight
          ),
          origin,
          rotation,
          tint
        );
      }

      // Draw final tile in the bottom right corner
      if (dy < dest.height)
      {
        rl.Core.DrawTexturePro(
          texture,
          rl.Temp.rect2(
            source.x, source.y,
            ((dest.width - dx)/tileWidth)*source.width, ((dest.height - dy)/tileHeight)*source.height
          ),
          rl.Temp.rect3(
            dest.x + dx, dest.y + dy,
            dest.width - dx, dest.height - dy
          ),
          origin,
          rotation,
          tint
        );
      }
    }
  }
}
