// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_clock_of_clocks.c
// Run it: dart run shapes_clock_of_clocks.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shapes_clock_of_clocks");
  SetTargetFPS(60);
  
  final bgColor = ColorLerp(.DARKBLUE, .BLACK, 0.75);
  final handsColor = ColorLerp(.YELLOW, .RAYWHITE, .25);

  const double clockFaceSize = 24;
  const double clockFaceSpacing = 8.0;
  const double sectionSpacing = 16.0;

  final Vector2D TL = .vec2(  0.0,  90.0); // Top-left corner
  final Vector2D TR = .vec2( 90.0, 180.0); // Top-right corner
  final Vector2D BR = .vec2(180.0, 270.0); // Bottom-right corner
  final Vector2D BL = .vec2(  0.0, 270.0); // Bottom-left corner
  final Vector2D HH = .vec2(  0.0, 180.0); // Horizontal line
  final Vector2D VV = .vec2( 90.0, 270.0); // Vertical line
  final Vector2D ZZ = .vec2(135.0, 135.0); // Not relevant

  List<List<Vector2D>> digitAngles = [
    /* 0 */ [ TL,HH,HH,TR, /* */ VV,TL,TR,VV,/* */ VV,VV,VV,VV,/* */ VV,VV,VV,VV,/* */ VV,BL,BR,VV,/* */ BL,HH,HH,BR ],
    /* 1 */ [ TL,HH,TR,ZZ, /* */ BL,TR,VV,ZZ,/* */ ZZ,VV,VV,ZZ,/* */ ZZ,VV,VV,ZZ,/* */ TL,BR,BL,TR,/* */ BL,HH,HH,BR ],
    /* 2 */ [ TL,HH,HH,TR, /* */ BL,HH,TR,VV,/* */ TL,HH,BR,VV,/* */ VV,TL,HH,BR,/* */ VV,BL,HH,TR,/* */ BL,HH,HH,BR ],
    /* 3 */ [ TL,HH,HH,TR, /* */ BL,HH,TR,VV,/* */ TL,HH,BR,VV,/* */ BL,HH,TR,VV,/* */ TL,HH,BR,VV,/* */ BL,HH,HH,BR ],
    /* 4 */ [ TL,TR,TL,TR, /* */ VV,VV,VV,VV,/* */ VV,BL,BR,VV,/* */ BL,HH,TR,VV,/* */ ZZ,ZZ,VV,VV,/* */ ZZ,ZZ,BL,BR ],
    /* 5 */ [ TL,HH,HH,TR, /* */ VV,TL,HH,BR,/* */ VV,BL,HH,TR,/* */ BL,HH,TR,VV,/* */ TL,HH,BR,VV,/* */ BL,HH,HH,BR ],
    /* 6 */ [ TL,HH,HH,TR, /* */ VV,TL,HH,BR,/* */ VV,BL,HH,TR,/* */ VV,TL,TR,VV,/* */ VV,BL,BR,VV,/* */ BL,HH,HH,BR ],
    /* 7 */ [ TL,HH,HH,TR, /* */ BL,HH,TR,VV,/* */ ZZ,ZZ,VV,VV,/* */ ZZ,ZZ,VV,VV,/* */ ZZ,ZZ,VV,VV,/* */ ZZ,ZZ,BL,BR ],
    /* 8 */ [ TL,HH,HH,TR, /* */ VV,TL,TR,VV,/* */ VV,BL,BR,VV,/* */ VV,TL,TR,VV,/* */ VV,BL,BR,VV,/* */ BL,HH,HH,BR ],
    /* 9 */ [ TL,HH,HH,TR, /* */ VV,TL,TR,VV,/* */ VV,BL,BR,VV,/* */ BL,HH,TR,VV,/* */ TL,HH,BR,VV,/* */ BL,HH,HH,BR ],
  ];

  const double handsMoveDuration = 0.5;

  int prevSeconds = -1;
  
  final List<List<Vector2D>> currentAngles = .generate(6, (_) => .generate(24, (_) => .zero()));
  final List<List<Vector2D>> srcAngles = .generate(6, (_) => .generate(24, (_) => .zero()));
  final List<List<Vector2D>> dstAngles = .generate(6, (_) => .generate(24, (_) => .zero()));

  double handsMoveTimer = 0.0;
  int hourMode = 24;

  while (!WindowShouldClose())
  {
    final dt = DateTime.now();

    if (dt.second != prevSeconds)
    {
      prevSeconds = dt.second;

      final clockDigits = "${(dt.hour%hourMode).pad()}${dt.minute.pad()}${dt.second.pad()}";

      for (int digit = 0; digit < 6; digit++)
      {
        for (int cell = 0; cell < 24; cell++)
        {
          srcAngles[digit][cell] = currentAngles[digit][cell];
          dstAngles[digit][cell] = digitAngles[clockDigits[digit].ch - '0'.ch][cell];

          if ((digit == 0) && (hourMode == 12) && (clockDigits[0] == '0')) dstAngles[digit][cell] = ZZ;
          if (srcAngles[digit][cell].x > dstAngles[digit][cell].x) srcAngles[digit][cell].x -= 360.0;
          if (srcAngles[digit][cell].y > dstAngles[digit][cell].y) srcAngles[digit][cell].y -= 360.0;
        }
      }

      handsMoveTimer = -GetFrameTime();
    }

    if (handsMoveTimer < handsMoveDuration)
    {
      handsMoveTimer = Clamp(handsMoveTimer + GetFrameTime(), 0, handsMoveDuration);

      double t = handsMoveTimer/handsMoveDuration;

      t = t*t*(3.0 - 2.0*t);

      for (int digit = 0; digit < 6; digit++)
      {
        for (int cell = 0; cell < 24; cell++)
        {
          currentAngles[digit][cell].x = Lerp(srcAngles[digit][cell].x, dstAngles[digit][cell].x, t);
          currentAngles[digit][cell].y = Lerp(srcAngles[digit][cell].y, dstAngles[digit][cell].y, t);
        }
      }
    }

    if (IsKeyPressed(.KEY_SPACE)) hourMode = 36 - hourMode;

    BeginDrawing();

      ClearBackground(bgColor);

      DrawText("$hourMode-h mode, space to change", 10, 30, 20, .RAYWHITE);

      double xOffset = 4.0;

      for (int digit = 0; digit < 6; digit++)
      {
        for (int row = 0; row < 6; row++)
        {
          for (int col = 0; col < 4; col++)
          {
            final Vector2D centre = .vec2(
              xOffset + col*(clockFaceSize+clockFaceSpacing) + clockFaceSize*0.5,
              100 + row*(clockFaceSize+clockFaceSpacing) + clockFaceSize*0.5
            );

            DrawRing(centre, clockFaceSize*0.5 - 2.0, clockFaceSize*0.5, 0, 360, 24, .DARKGRAY);

            // Big hand
            DrawRectanglePro(
              .rect(centre.x, centre.y, clockFaceSize*0.5+4.0, 4.0),
              .vec2(2.0, 2.0),
              currentAngles[digit][row*4+col].x,
              handsColor
            );

            // Little hand
            DrawRectanglePro(
              .rect(centre.x, centre.y, clockFaceSize*0.5+2.0, 4.0),
              .vec2(2.0, 2.0),
              currentAngles[digit][row*4+col].y,
              handsColor
            );
          }
        }

        xOffset += (clockFaceSize+clockFaceSpacing)*4;
        if (digit%2 == 1)
        {
          DrawRing(.vec2(xOffset + 4.0, 160.0), 6.0, 8.0, 0.0, 360.0, 24, handsColor);
          DrawRing(.vec2(xOffset + 4.0, 225.0), 6.0, 8.0, 0.0, 360.0, 24, handsColor);
          xOffset += sectionSpacing;
        }
      }

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}