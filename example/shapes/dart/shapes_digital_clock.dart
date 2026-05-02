// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_digital_clock.c
// Run it: dart run shapes_digital_clock.dart
import '../../base.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;

enum ClockType {
  CLOCK_ANALOG,
  CLOCK_DIGITAL
}

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
  ColorD color;

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
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_digital_clock");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  ClockType clockMode = .CLOCK_DIGITAL;

  final clock = Clock(
    second: ClockHand(
      angle: 45,
      length: 140,
      thickness: 3,
      color: .MAROON,
    ),
    minute: ClockHand(
      angle: 10,
      length: 130,
      thickness: 7,
      color: .DARKGRAY,
    ),
    hour: ClockHand(
      angle: 0,
      length: 100,
      thickness: 7,
      color: .BLACK,
    ),
  );

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyPressed(.KEY_SPACE))
    {
      if (clockMode == .CLOCK_DIGITAL) clockMode = .CLOCK_ANALOG;
      else if (clockMode == .CLOCK_ANALOG) clockMode = .CLOCK_DIGITAL;
    }

    UpdateClock(clock);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      if (clockMode == .CLOCK_ANALOG) DrawClockAnalog(rl, clock, .vec2(400, 240));
      else if (clockMode == .CLOCK_DIGITAL)
      {
        DrawClockDigital(rl, clock, .vec2(30, 60));

        final clockTime = "${clock.hour.value.pad()}:${clock.minute.value.pad()}:${clock.second.value.pad()}";
        rl.CoreD.DrawText(
          clockTime,
          rl.CoreD.GetScreenWidth()~/2 - rl.CoreD.MeasureText(clockTime, 150)~/2,
          300, 150,
          .BLACK
        );
      }

      rl.CoreD.DrawText(
        "Press [SPACE] to switch clock mode: ${clockMode.name}",
        10, 10, 20, .DARKGRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
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

void DrawClockAnalog(Raylib rl, Clock clock, Vector2D position)
{
  rl.CoreD.DrawCircleV(position, clock.second.length + 40.0, .LIGHTGRAY);
  rl.CoreD.DrawCircleV(position, 12.0, .GRAY);

  for (int i = 0; i < 60; i++)
  {
    final Vector2D v1 = .vec2(
      position.x + (clock.second.length + ((i%5>0)? 10 : 6))*math.cos((6.0*i - 90.0)*rl.DEG2RAD),
      position.y + (clock.second.length + ((i%5>0)? 10 : 6))*math.sin((6.0*i - 90.0)*rl.DEG2RAD)
    );

    final Vector2D v2 = .vec2(
      position.x + (clock.second.length + 20)*math.cos((6.0*i - 90.0)*rl.DEG2RAD),
      position.y + (clock.second.length + 20)*math.sin((6.0*i - 90.0)*rl.DEG2RAD)
    );

    rl.CoreD.DrawLineEx(v1, v2, ((i%5>1)? 1.0 : 3.0), .DARKGRAY);
  }

  // hand seconds
  rl.CoreD.DrawRectanglePro(
    .rect(
      position.x, position.y,
      clock.second.length, clock.second.thickness,
    ),
    .vec2(0.0, clock.second.thickness/2.0),
    clock.second.angle,
    clock.second.color
  );

  // hand minutes
  rl.CoreD.DrawRectanglePro(
    .rect(
      position.x, position.y,
      clock.minute.length, clock.minute.thickness,
    ),
    .vec2(0.0, clock.minute.thickness/2.0),
    clock.minute.angle,
    clock.minute.color
  );

  // hand hours
  rl.CoreD.DrawRectanglePro(
    .rect(
      position.x, position.y,
      clock.hour.length, clock.hour.thickness,
    ),
    .vec2(0.0, clock.hour.thickness/2.0),
    clock.hour.angle,
    clock.hour.color
  );
}

void DrawClockDigital(Raylib rl, Clock clock, Vector2D position)
{
  // Draw clock using custom 7-segments display (made of shapes)
  DrawDisplayValue(rl,
    .vec2(position.x, position.y), clock.hour.value~/10,
    .RED, rl.CoreD.Fade(.LIGHTGRAY, 0.3)
  );
  DrawDisplayValue(rl,
    .vec2(position.x + 120, position.y), clock.hour.value%10,
    .RED, rl.CoreD.Fade(.LIGHTGRAY, 0.3)
  );

  rl.CoreD.DrawCircle(
    position.x + 240, position.y + 70, 12,
    (clock.second.value%2)>0? .RED : rl.CoreD.Fade(.LIGHTGRAY, 0.3)
  );
  rl.CoreD.DrawCircle(
    position.x + 240, position.y + 150, 12,
    (clock.second.value%2)>0? .RED : rl.CoreD.Fade(.LIGHTGRAY, 0.3)
  );

  DrawDisplayValue(rl,
    .vec2(position.x + 260, position.y), clock.minute.value~/10,
    .RED, rl.CoreD.Fade(.LIGHTGRAY, 0.3)
  );
  DrawDisplayValue(rl,
    .vec2(position.x + 380, position.y), clock.minute.value%10,
    .RED, rl.CoreD.Fade(.LIGHTGRAY, 0.3)
  );

  rl.CoreD.DrawCircle(
    position.x + 500, position.y + 70, 12,
    (clock.second.value%2)>0? .RED : rl.CoreD.Fade(.LIGHTGRAY, 0.3)
  );
  rl.CoreD.DrawCircle(
    position.x + 500, position.y + 150, 12,
    (clock.second.value%2)>0? .RED : rl.CoreD.Fade(.LIGHTGRAY, 0.3)
  );

  DrawDisplayValue(rl,
    .vec2(position.x + 520, position.y), clock.second.value~/10,
    .RED, rl.CoreD.Fade(.LIGHTGRAY, 0.3)
  );
  DrawDisplayValue(rl,
    .vec2(position.x + 640, position.y), clock.second.value%10,
    .RED, rl.CoreD.Fade(.LIGHTGRAY, 0.3)
  );
}

void DrawDisplayValue(Raylib rl, Vector2D position, int value, ColorD colorOn, ColorD colorOff)
{
  switch (value)
  {
    case 0: Draw7SDisplay(rl, position, 00111111.b, colorOn, colorOff); break;
    case 1: Draw7SDisplay(rl, position, 00000110.b, colorOn, colorOff); break;
    case 2: Draw7SDisplay(rl, position, 01011011.b, colorOn, colorOff); break;
    case 3: Draw7SDisplay(rl, position, 01001111.b, colorOn, colorOff); break;
    case 4: Draw7SDisplay(rl, position, 01100110.b, colorOn, colorOff); break;
    case 5: Draw7SDisplay(rl, position, 01101101.b, colorOn, colorOff); break;
    case 6: Draw7SDisplay(rl, position, 01111101.b, colorOn, colorOff); break;
    case 7: Draw7SDisplay(rl, position, 00000111.b, colorOn, colorOff); break;
    case 8: Draw7SDisplay(rl, position, 01111111.b, colorOn, colorOff); break;
    case 9: Draw7SDisplay(rl, position, 01101111.b, colorOn, colorOff); break;
    default: break;
  }
}

void Draw7SDisplay(Raylib rl, Vector2D position, int segments, ColorD colorOn, ColorD colorOff)
{
  int segmentLen = 60;
  int segmentThick = 20;
  double offsetYAdjust = segmentThick*0.3;

  // Segment A
  DrawDisplaySegment(rl, .vec2(position.x + segmentThick + segmentLen/2.0, position.y + segmentThick),
    segmentLen, segmentThick, false, (segments & 00000001.b) > 0 ? colorOn : colorOff);
  // Segment B
  DrawDisplaySegment(rl, .vec2(position.x + segmentThick + segmentLen + segmentThick/2.0, position.y + 2*segmentThick + segmentLen/2.0 - offsetYAdjust),
    segmentLen, segmentThick, true, (segments & 00000010.b) > 0 ? colorOn : colorOff);
  // Segment C
  DrawDisplaySegment(rl, .vec2(position.x + segmentThick + segmentLen + segmentThick/2.0, position.y + 4*segmentThick + segmentLen + segmentLen/2.0 - 3*offsetYAdjust),
    segmentLen, segmentThick, true, (segments & 00000100.b) > 0 ? colorOn : colorOff);
  // Segment D
  DrawDisplaySegment(rl, .vec2(position.x + segmentThick + segmentLen/2.0, position.y + 5*segmentThick + 2*segmentLen - 4*offsetYAdjust),
    segmentLen, segmentThick, false, (segments & 00001000.b) > 0 ? colorOn : colorOff);
  // Segment E
  DrawDisplaySegment(rl, .vec2(position.x + segmentThick/2.0, position.y + 4*segmentThick + segmentLen + segmentLen/2.0 - 3*offsetYAdjust),
    segmentLen, segmentThick, true, (segments & 00010000.b) > 0 ? colorOn : colorOff);
  // Segment F
  DrawDisplaySegment(rl, .vec2(position.x + segmentThick/2.0, position.y + 2*segmentThick + segmentLen/2.0 - offsetYAdjust),
    segmentLen, segmentThick, true, (segments & 00100000.b) > 0 ? colorOn : colorOff);
  // Segment G
  DrawDisplaySegment(rl, .vec2(position.x + segmentThick + segmentLen/2.0, position.y + 3*segmentThick + segmentLen - 2*offsetYAdjust),
    segmentLen, segmentThick, false, (segments & 01000000.b) > 0 ? colorOn : colorOff);
}

void DrawDisplaySegment(Raylib rl, Vector2D center, int length, int thick, bool vertical, ColorD color)
{
  if (!vertical)
  {
    // Horizontal segment points
    final segmentPoints = <Vector2D>[
      .vec2(center.x - length/2.0 - thick/2.0,  center.y), // Point 1
      .vec2(center.x - length/2.0,  center.y + thick/2.0), // Point 2
      .vec2(center.x - length/2.0, center.y - thick/2.0), // Point 3
      .vec2(center.x + length/2.0,  center.y + thick/2.0), // Point 4
      .vec2(center.x + length/2.0,  center.y - thick/2.0), // Point 5
      .vec2(center.x + length/2.0 + thick/2.0,  center.y), // Point 6
    ];

    rl.CoreD.DrawTriangleStrip(segmentPoints, color);
  }
  else
  {
    // Vertical segment points
    final segmentPoints = <Vector2D>[
      .vec2(center.x,  center.y - length/2.0 - thick/2.0), // Point 1
      .vec2(center.x - thick/2.0,  center.y - length/2.0), // Point 2
      .vec2(center.x + thick/2.0, center.y - length/2.0), // Point 3
      .vec2(center.x - thick/2.0,  center.y + length/2.0), // Point 4
      .vec2(center.x + thick/2.0,  center.y + length/2.0), // Point 5
      .vec2(center.x,  center.y + length/2 + thick/2.0), // Point 6
    ];

    rl.CoreD.DrawTriangleStrip(segmentPoints, color);
  }
}