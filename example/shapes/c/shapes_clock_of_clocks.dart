// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_clock_of_clocks.c
// Run it: dart run shapes_clock_of_clocks.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shapes_clock_of_clocks".toC);
  SetTargetFPS(60);
  
  final bgColor = ColorLerp(DARKBLUE, BLACK, 0.75);
  final handsColor = ColorLerp(YELLOW, RAYWHITE, .25);

  const double clockFaceSize = 24;
  const double clockFaceSpacing = 8.0;
  const double sectionSpacing = 16.0;

  final TL = Vector2$.val.At('TL').set(  0.0,  90.0); // Top-left corner
  final TR = Vector2$.val.At('TR').set( 90.0, 180.0); // Top-right corner
  final BR = Vector2$.val.At('BR').set(180.0, 270.0); // Bottom-right corner
  final BL = Vector2$.val.At('BL').set(  0.0, 270.0); // Bottom-left corner
  final HH = Vector2$.val.At('HH').set(  0.0, 180.0); // Horizontal line
  final VV = Vector2$.val.At('VV').set( 90.0, 270.0); // Vertical line
  final ZZ = Vector2$.val.At('ZZ').set(135.0, 135.0); // Not relevant

  List<List<Pointer<Vector2C>>> digitAngles = [ // [10][24]
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
  
  final currentAngles = Vector2$.val.AtUnique(count: 6*24); // [6][24]
  Pointer<Vector2C> currentAngleAt(int i, int j) => currentAngles + (i * 24 + j);

  final srcAngles = Vector2$.val.AtUnique(count: 6*24); // [6][24]
  Pointer<Vector2C> srcAngleAt(int i, int j) => srcAngles + (i * 24 + j);

  final dstAngles = Vector2$.val.AtUnique(count: 6*24); // [6][24]
  Pointer<Vector2C> dstAngleAt(int i, int j) => dstAngles + (i * 24 + j);

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
          srcAngleAt(digit, cell).ref = currentAngleAt(digit, cell).ref;
          dstAngleAt(digit, cell).ref = digitAngles[clockDigits[digit].ch - '0'.ch][cell].ref;

          if ((digit == 0) && (hourMode == 12) && (clockDigits[0] == '0')) dstAngleAt(digit, cell).ref = ZZ.ref;
          if (srcAngleAt(digit, cell).ref.x > dstAngleAt(digit, cell).ref.x) srcAngleAt(digit, cell).ref.x -= 360.0;
          if (srcAngleAt(digit, cell).ref.y > dstAngleAt(digit, cell).ref.y) srcAngleAt(digit, cell).ref.y -= 360.0;
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
          currentAngleAt(digit, cell).ref.x = Lerp(srcAngleAt(digit, cell).ref.x, dstAngleAt(digit, cell).ref.x, t);
          currentAngleAt(digit, cell).ref.y = Lerp(srcAngleAt(digit, cell).ref.y, dstAngleAt(digit, cell).ref.y, t);
        }
      }
    }

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) hourMode = 36 - hourMode;

    BeginDrawing();

      ClearBackground(bgColor);

      DrawText("$hourMode-h mode, space to change".toC, 10, 30, 20, RAYWHITE);

      double xOffset = 4.0;

      for (int digit = 0; digit < 6; digit++)
      {
        for (int row = 0; row < 6; row++)
        {
          for (int col = 0; col < 4; col++)
          {
            final centre = Vector2$.val.$1.set(
              xOffset + col*(clockFaceSize+clockFaceSpacing) + clockFaceSize*0.5,
              100 + row*(clockFaceSize+clockFaceSpacing) + clockFaceSize*0.5
            );

            DrawRing(centre, clockFaceSize*0.5 - 2.0, clockFaceSize*0.5, 0, 360, 24, DARKGRAY);

            // Big hand
            DrawRectanglePro(
              Rectangle$.val.$1.set(centre.x, centre.y, clockFaceSize*0.5+4.0, 4.0),
              Vector2$.val.$2.set(2.0, 2.0),
              currentAngleAt(digit, row*4+col).ref.x,
              handsColor
            );

            // Little hand
            DrawRectanglePro(
              Rectangle$.val.$1.set(centre.x, centre.y, clockFaceSize*0.5+2.0, 4.0),
              Vector2$.val.$2.set(2.0, 2.0),
              currentAngleAt(digit, row*4+col).ref.y,
              handsColor
            );
          }
        }

        xOffset += (clockFaceSize+clockFaceSpacing)*4;
        if (digit%2 == 1)
        {
          DrawRing(Vector2$.val.$2.set(xOffset + 4.0, 160.0), 6.0, 8.0, 0.0, 360.0, 24, handsColor);
          DrawRing(Vector2$.val.$2.set(xOffset + 4.0, 225.0), 6.0, 8.0, 0.0, 360.0, 24, handsColor);
          xOffset += sectionSpacing;
        }
      }

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}