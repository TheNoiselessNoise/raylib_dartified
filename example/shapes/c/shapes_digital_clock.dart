// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_digital_clock.c
// Run it: dart run shapes_digital_clock.dart
import '../../base_c.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;

const int CLOCK_ANALOG = 0;
const int CLOCK_DIGITAL = 1;

extension Binary on int {
  int get b {
    return int.parse(toRadixString(10), radix: 2);
  }
}

class ClockHand {
  int value;

  double angle;
  int length;
  int thickness;
  ColorC color;

  ClockHand({
    this.value = 0,
    this.angle = 0,
    this.length = 0,
    this.thickness = 0,
    required this.color
  });
}

class Clock {
  ClockHand second;
  ClockHand minute;
  ClockHand hour;

  Clock({
    required this.second,
    required this.minute,
    required this.hour,
  });
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shapes_digital_clock".toC);
  SetTargetFPS(60);

  int clockMode = CLOCK_DIGITAL;

  final clock = Clock(
    second: ClockHand(
      angle: 45,
      length: 140,
      thickness: 3,
      color: MAROON,
    ),
    minute: ClockHand(
      angle: 10,
      length: 130,
      thickness: 7,
      color: DARKGRAY,
    ),
    hour: ClockHand(
      angle: 0,
      length: 100,
      thickness: 7,
      color: BLACK,
    ),
  );

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value))
    {
      if (clockMode == CLOCK_DIGITAL) clockMode = CLOCK_ANALOG;
      else if (clockMode == CLOCK_ANALOG) clockMode = CLOCK_DIGITAL;
    }

    UpdateClock(clock);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      if (clockMode == CLOCK_ANALOG) DrawClockAnalog(clock, Vector2$.val.$1.set(400, 240));
      else if (clockMode == CLOCK_DIGITAL)
      {
        DrawClockDigital(clock, .vec2(30, 60));

        final clockTime = "${clock.hour.value.pad()}:${clock.minute.value.pad()}:${clock.second.value.pad()}".toC;
        DrawText(
          clockTime,
          GetScreenWidth()~/2 - MeasureText(clockTime, 150)~/2,
          300, 150,
          BLACK
        );
      }

      DrawText(
        "Press [SPACE] to switch clock mode: ${(clockMode == CLOCK_DIGITAL)? "DIGITAL CLOCK" : "ANALOGUE CLOCK"}".toC,
        10, 10, 20, DARKGRAY
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void UpdateClock(Clock clock)
{
  final now = DateTime.now();

  clock.second.value = now.second;
  clock.minute.value = now.minute;
  clock.hour.value = now.hour;

  clock.hour.angle = (now.hour % 12) * 180.0 / 6.0;
  clock.hour.angle += (now.minute % 60) * 30 / 60.0;
  clock.hour.angle -= 90;

  clock.minute.angle = (now.minute % 60) * 6.0;
  clock.minute.angle += (now.second % 60) * 6 / 60.0;
  clock.minute.angle -= 90;

  clock.second.angle = (now.second % 60) * 6.0;
  clock.second.angle -= 90;
}

void DrawClockAnalog(Clock clock, Vector2C position)
{
  DrawCircleV(position, clock.second.length + 40.0, LIGHTGRAY);
  DrawCircleV(position, 12.0, GRAY);

  for (int i = 0; i < 60; i++)
  {
    final v1 = Vector2$.val.$1.set(
      position.x + (clock.second.length + ((i%5>0)? 10 : 6))*math.cos((6.0*i - 90.0)*rl.DEG2RAD),
      position.y + (clock.second.length + ((i%5>0)? 10 : 6))*math.sin((6.0*i - 90.0)*rl.DEG2RAD)
    );

    final v2 = Vector2$.val.$2.set(
      position.x + (clock.second.length + 20)*math.cos((6.0*i - 90.0)*rl.DEG2RAD),
      position.y + (clock.second.length + 20)*math.sin((6.0*i - 90.0)*rl.DEG2RAD)
    );

    DrawLineEx(v1, v2, ((i%5>1)? 1.0 : 3.0), DARKGRAY);
  }

  // hand seconds
  DrawRectanglePro(
    Rectangle$.val.$1.set(
      position.x, position.y,
      clock.second.length.toDouble(), clock.second.thickness.toDouble(),
    ),
    Vector2$.val.$1.set(0.0, clock.second.thickness/2.0),
    clock.second.angle,
    clock.second.color
  );

  // hand minutes
  DrawRectanglePro(
    Rectangle$.val.$1.set(
      position.x, position.y,
      clock.minute.length.toDouble(), clock.minute.thickness.toDouble(),
    ),
    Vector2$.val.$1.set(0.0, clock.minute.thickness/2.0),
    clock.minute.angle,
    clock.minute.color
  );

  // hand hours
  DrawRectanglePro(
    Rectangle$.val.$1.set(
      position.x, position.y,
      clock.hour.length.toDouble(), clock.hour.thickness.toDouble(),
    ),
    Vector2$.val.$1.set(0.0, clock.hour.thickness/2.0),
    clock.hour.angle,
    clock.hour.color
  );
}

void DrawClockDigital(Clock clock, Vector2D position)
{
  // Draw clock using custom 7-segments display (made of shapes)
  DrawDisplayValue(
    .vec2(position.x, position.y), clock.hour.value~/10,
    RED, Fade(LIGHTGRAY, 0.3)
  );
  DrawDisplayValue(
    .vec2(position.x + 120, position.y), clock.hour.value%10,
    RED, Fade(LIGHTGRAY, 0.3)
  );

  DrawCircle(
    (position.x + 240).toInt(), (position.y + 70).toInt(), 12,
    (clock.second.value%2)>0? RED : Fade(LIGHTGRAY, 0.3)
  );
  DrawCircle(
    (position.x + 240).toInt(), (position.y + 150).toInt(), 12,
    (clock.second.value%2)>0? RED : Fade(LIGHTGRAY, 0.3)
  );

  DrawDisplayValue(
    .vec2(position.x + 260, position.y), clock.minute.value~/10,
    RED, Fade(LIGHTGRAY, 0.3)
  );
  DrawDisplayValue(
    .vec2(position.x + 380, position.y), clock.minute.value%10,
    RED, Fade(LIGHTGRAY, 0.3)
  );

  DrawCircle(
    (position.x + 500).toInt(), (position.y + 70).toInt(), 12,
    (clock.second.value%2)>0? RED : Fade(LIGHTGRAY, 0.3)
  );
  DrawCircle(
    (position.x + 500).toInt(), (position.y + 150).toInt(), 12,
    (clock.second.value%2)>0? RED : Fade(LIGHTGRAY, 0.3)
  );

  DrawDisplayValue(
    .vec2(position.x + 520, position.y), clock.second.value~/10,
    RED, Fade(LIGHTGRAY, 0.3)
  );
  DrawDisplayValue(
    .vec2(position.x + 640, position.y), clock.second.value%10,
    RED, Fade(LIGHTGRAY, 0.3)
  );
}

void DrawDisplayValue(Vector2D position, int value, ColorC colorOn, ColorC colorOff)
{
  switch (value)
  {
    case 0: Draw7SDisplay(position, 00111111.b, colorOn, colorOff); break;
    case 1: Draw7SDisplay(position, 00000110.b, colorOn, colorOff); break;
    case 2: Draw7SDisplay(position, 01011011.b, colorOn, colorOff); break;
    case 3: Draw7SDisplay(position, 01001111.b, colorOn, colorOff); break;
    case 4: Draw7SDisplay(position, 01100110.b, colorOn, colorOff); break;
    case 5: Draw7SDisplay(position, 01101101.b, colorOn, colorOff); break;
    case 6: Draw7SDisplay(position, 01111101.b, colorOn, colorOff); break;
    case 7: Draw7SDisplay(position, 00000111.b, colorOn, colorOff); break;
    case 8: Draw7SDisplay(position, 01111111.b, colorOn, colorOff); break;
    case 9: Draw7SDisplay(position, 01101111.b, colorOn, colorOff); break;
    default: break;
  }
}

void Draw7SDisplay(Vector2D position, int segments, ColorC colorOn, ColorC colorOff)
{
  int segmentLen = 60;
  int segmentThick = 20;
  double offsetYAdjust = segmentThick*0.3;

  // Segment A
  DrawDisplaySegment(.vec2(position.x + segmentThick + segmentLen/2.0, position.y + segmentThick),
    segmentLen, segmentThick, false, (segments & 00000001.b) > 0 ? colorOn : colorOff);
  // Segment B
  DrawDisplaySegment(.vec2(position.x + segmentThick + segmentLen + segmentThick/2.0, position.y + 2*segmentThick + segmentLen/2.0 - offsetYAdjust),
    segmentLen, segmentThick, true, (segments & 00000010.b) > 0 ? colorOn : colorOff);
  // Segment C
  DrawDisplaySegment(.vec2(position.x + segmentThick + segmentLen + segmentThick/2.0, position.y + 4*segmentThick + segmentLen + segmentLen/2.0 - 3*offsetYAdjust),
    segmentLen, segmentThick, true, (segments & 00000100.b) > 0 ? colorOn : colorOff);
  // Segment D
  DrawDisplaySegment(.vec2(position.x + segmentThick + segmentLen/2.0, position.y + 5*segmentThick + 2*segmentLen - 4*offsetYAdjust),
    segmentLen, segmentThick, false, (segments & 00001000.b) > 0 ? colorOn : colorOff);
  // Segment E
  DrawDisplaySegment(.vec2(position.x + segmentThick/2.0, position.y + 4*segmentThick + segmentLen + segmentLen/2.0 - 3*offsetYAdjust),
    segmentLen, segmentThick, true, (segments & 00010000.b) > 0 ? colorOn : colorOff);
  // Segment F
  DrawDisplaySegment(.vec2(position.x + segmentThick/2.0, position.y + 2*segmentThick + segmentLen/2.0 - offsetYAdjust),
    segmentLen, segmentThick, true, (segments & 00100000.b) > 0 ? colorOn : colorOff);
  // Segment G
  DrawDisplaySegment(.vec2(position.x + segmentThick + segmentLen/2.0, position.y + 3*segmentThick + segmentLen - 2*offsetYAdjust),
    segmentLen, segmentThick, false, (segments & 01000000.b) > 0 ? colorOn : colorOff);
}

void DrawDisplaySegment(Vector2D center, int length, int thick, bool vertical, ColorC color)
{
  if (!vertical)
  {
    // Horizontal segment points
    final segmentPoints = Vector2$.val.FillInto(key: 'segmentPoints', 6, (i, v) => switch (i) {
      0 => v.set(center.x - length/2.0 - thick/2.0,  center.y), // Point 1
      1 => v.set(center.x - length/2.0,  center.y + thick/2.0), // Point 2
      2 => v.set(center.x - length/2.0, center.y - thick/2.0), // Point 3
      3 => v.set(center.x + length/2.0,  center.y + thick/2.0), // Point 4
      4 => v.set(center.x + length/2.0,  center.y - thick/2.0), // Point 5
      5 => v.set(center.x + length/2.0 + thick/2.0,  center.y), // Point 6
      _ => {},
    });

    DrawTriangleStrip(segmentPoints, 6, color);
  }
  else
  {
    // Vertical segment points
    final segmentPoints = Vector2$.val.FillInto(key: 'segmentPoints', 6, (i, v) => switch (i) {
      0 => v.set(center.x,  center.y - length/2.0 - thick/2.0), // Point 1
      1 => v.set(center.x - thick/2.0,  center.y - length/2.0), // Point 2
      2 => v.set(center.x + thick/2.0, center.y - length/2.0), // Point 3
      3 => v.set(center.x - thick/2.0,  center.y + length/2.0), // Point 4
      4 => v.set(center.x + thick/2.0,  center.y + length/2.0), // Point 5
      5 => v.set(center.x,  center.y + length/2 + thick/2.0), // Point 6
      _ => {},
    });

    DrawTriangleStrip(segmentPoints, 6, color);
  }
}