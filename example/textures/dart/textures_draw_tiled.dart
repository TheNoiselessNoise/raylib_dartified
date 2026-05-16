// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_draw_tiled.c
// Run it: dart run textures_draw_tiled.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int OPT_WIDTH = 220;
const int MARGIN_SIZE = 8;
const int COLOR_SIZE = 16;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_WINDOW_RESIZABLE]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_draw_tiled");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(120);

  final texPattern = rl.CoreD.LoadTexture("../resources/patterns.png");
  rl.CoreD.SetTextureFilter(texPattern, .TEXTURE_FILTER_TRILINEAR);

  final recPattern = <RectangleD>[
    .rect(3, 3, 66, 66),
    .rect(75, 3, 100, 100),
    .rect(3, 75, 66, 66),
    .rect(7, 156, 50, 50),
    .rect(85, 106, 90, 45),
    .rect(75, 154, 100, 60),
  ];

  final colors = <ColorD>[
    .BLACK, .MAROON, .ORANGE, .BLUE, .PURPLE,
    .BEIGE, .LIME, .RED, .DARKGRAY, .SKYBLUE
  ];

  final colorRec = <RectangleD>[];

  for (int i = 0, x = 0, y = 0; i < colors.length; i++)
  {
    colorRec.add(.new(
      x: 2.0 + MARGIN_SIZE + x,
      y: 22.0 + 256.0 + MARGIN_SIZE + y,
      width: COLOR_SIZE*2.0,
      height: COLOR_SIZE.toDouble(),
    ));

    if (i == (colors.length/2 - 1))
    {
      x = 0;
      y += COLOR_SIZE + MARGIN_SIZE;
    }
    else x += (COLOR_SIZE*2 + MARGIN_SIZE);
  }

  int activePattern = 0, activeCol = 0;
  double scale = 1.0, rotation = 0.0;

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) {
      final mouse = rl.CoreD.GetMousePosition();

      for (int i = 0; i < recPattern.length; i++)
      {
        if (rl.CoreD.CheckCollisionPointRec(
          mouse,
          .rect(
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
        if (rl.CoreD.CheckCollisionPointRec(mouse, colorRec[i])) {
          activeCol = i;
          break;
        }
      }
    }

    if (rl.CoreD.IsKeyPressed(.KEY_UP)) scale += 0.25;
    if (rl.CoreD.IsKeyPressed(.KEY_DOWN)) scale -= 0.25;
    if (scale > 10.0) scale = 10.0;
    else if ( scale <= 0.0) scale = 0.25;

    if (rl.CoreD.IsKeyPressed(.KEY_LEFT)) rotation -= 25.0;
    if (rl.CoreD.IsKeyPressed(.KEY_RIGHT)) rotation += 25.0;

    if (rl.CoreD.IsKeyPressed(.KEY_SPACE)) { rotation = 0.0; scale = 1.0; }

    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.RAYWHITE);

      DrawTextureTiled(
        rl,
        texPattern,
        recPattern[activePattern],
        .rect(
          OPT_WIDTH+MARGIN_SIZE,
          MARGIN_SIZE,
          rl.CoreD.GetScreenWidth() - OPT_WIDTH - 2.0*MARGIN_SIZE,
          rl.CoreD.GetScreenHeight() - 2.0*MARGIN_SIZE,
        ),
        .zero(),
        rotation,
        scale,
        colors[activeCol]
      );

      rl.CoreD.DrawRectangle(
        MARGIN_SIZE,
        MARGIN_SIZE,
        OPT_WIDTH - MARGIN_SIZE,
        rl.CoreD.GetScreenHeight() - 2*MARGIN_SIZE,
        rl.CoreD.ColorAlpha(.LIGHTGRAY, 0.5)
      );

      rl.CoreD.DrawText(
        "Select Pattern",
        2 + MARGIN_SIZE, 30 + MARGIN_SIZE, 10, .BLACK
      );
      
      rl.CoreD.DrawTexture(texPattern, 2 + MARGIN_SIZE, 40 + MARGIN_SIZE, .BLACK);
      
      rl.CoreD.DrawRectangle(
        2 + MARGIN_SIZE + recPattern[activePattern].x,
        40 + MARGIN_SIZE + recPattern[activePattern].y,
        recPattern[activePattern].width,
        recPattern[activePattern].height,
        rl.CoreD.ColorAlpha(.DARKBLUE, 0.3)
      );

      rl.CoreD.DrawText(
        "Select Color",
        2+MARGIN_SIZE, 10+256+MARGIN_SIZE, 10, .BLACK
      );

      for (int i = 0; i < colors.length; i++)
      {
        rl.CoreD.DrawRectangleRec(colorRec[i], colors[i]);
        if (activeCol == i) rl.CoreD.DrawRectangleLinesEx(colorRec[i], 3, rl.CoreD.ColorAlpha(.WHITE, 0.5));
      }

      rl.CoreD.DrawText(
        "Scale (UP/DOWN to change)",
        2 + MARGIN_SIZE, 80 + 256 + MARGIN_SIZE, 10, .BLACK  
      );
      rl.CoreD.DrawText(
        scale.f2,
        2 + MARGIN_SIZE, 92 + 256 + MARGIN_SIZE, 20, .BLACK
      );

      rl.CoreD.DrawText(
        "Rotation (LEFT/RIGHT to change)",
        2 + MARGIN_SIZE, 122 + 256 + MARGIN_SIZE, 10, .BLACK
      );
      rl.CoreD.DrawText(
        "${rotation.f0} degrees",
        2 + MARGIN_SIZE, 134 + 256 + MARGIN_SIZE, 20, .BLACK
      );

      rl.CoreD.DrawText(
        "Press [SPACE] to reset",
        2 + MARGIN_SIZE, 164 + 256 + MARGIN_SIZE, 10, .DARKBLUE
      );

      rl.CoreD.DrawText(
        "${rl.CoreD.GetFPS()} FPS",
        2 + MARGIN_SIZE, 2 + MARGIN_SIZE, 20, .BLACK
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texPattern);

  rl.CloseWindowAndDispose();
}

void DrawTextureTiled(
  Raylib rl,
  TextureD texture,
  RectangleD source,
  RectangleD dest,
  Vector2D origin,
  double rotation,
  double scale,
  ColorD tint
) {
  if ((texture.id <= 0) || (scale <= 0.0)) return;
  if ((source.width == 0) || (source.height == 0)) return;

  int tileWidth = (source.width*scale).toInt();
  int tileHeight = (source.height*scale).toInt();
  if ((dest.width < tileWidth) && (dest.height < tileHeight))
  {
    // Can fit only one tile
    rl.CoreD.DrawTexturePro(
      texture,
      .rect(
        source.x, source.y,
        (dest.width/tileWidth)*source.width, (dest.height/tileHeight)*source.height
      ),
      .rect(
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
      rl.CoreD.DrawTexturePro(
        texture,
        .rect(
          source.x, source.y,
          (dest.width/tileWidth)*source.width, source.height
        ),
        .rect(
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
      rl.CoreD.DrawTexturePro(
        texture,
        .rect(
          source.x, source.y,
          (dest.width/tileWidth)*source.width, ((dest.height - dy)/tileHeight)*source.height
        ),
        .rect(
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
      rl.CoreD.DrawTexturePro(
        texture,
        .rect(
          source.x, source.y,
          source.width, (dest.height/tileHeight)*source.height
        ),
        .rect(
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
      rl.CoreD.DrawTexturePro(
        texture,
        .rect(
          source.x, source.y,
          ((dest.width - dx)/tileWidth)*source.width, (dest.height/tileHeight)*source.height
        ),
        .rect(
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
        rl.CoreD.DrawTexturePro(
          texture,
          source,
          .rect(
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
        rl.CoreD.DrawTexturePro(
          texture,
          .rect(
            source.x, source.y, source.width,
            ((dest.height - dy)/tileHeight)*source.height
          ),
          .rect(
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
        rl.CoreD.DrawTexturePro(
          texture,
          .rect(
            source.x, source.y,
            ((dest.width - dx)/tileWidth)*source.width, source.height
          ),
          .rect(
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
        rl.CoreD.DrawTexturePro(
          texture,
          .rect(
            source.x, source.y,
            ((dest.width - dx)/tileWidth)*source.width, ((dest.height - dy)/tileHeight)*source.height
          ),
          .rect(
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
