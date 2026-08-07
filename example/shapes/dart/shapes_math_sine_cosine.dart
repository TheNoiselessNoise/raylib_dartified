// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_math_sine_cosine.c
// Run it: dart run shapes_math_sine_cosine.dart
import 'dart:math' as math;
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int WAVE_POINTS = 36;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shapes_math_sine_cosine");
  SetTargetFPS(60);

  final List<Vector2D> sinePoints = .generate(WAVE_POINTS, (_) => .zero());
  final List<Vector2D> cosPoints = .generate(WAVE_POINTS, (_) => .zero());
  final Vector2D center = .vec2((screenWidth/2.0) - 30.0, screenHeight/2.0);
  final RectangleD start = .rect(20.0, screenHeight - 120.0, 200.0, 100.0);
  double radius = 130.0;
  double angle = 0.0;
  bool pause = false;

  for (int i = 0; i < WAVE_POINTS; i++)
  {
    final t = i/(WAVE_POINTS - 1);
    final currentAngle = t*360.0*rl.DEG2RAD;
    sinePoints[i].set(start.x + t*start.width, start.y + start.height/2.0 - math.sin(currentAngle)*(start.height/2.0));
    cosPoints[i].set(start.x + t*start.width, start.y + start.height/2.0 - math.cos(currentAngle)*(start.height/2.0));
  }

  while (!WindowShouldClose())
  {
    final angleRad = angle*rl.DEG2RAD;
    final cosRad = math.cos(angleRad);
    final sinRad = math.sin(angleRad);

    final Vector2D point = .vec2(center.x + cosRad*radius, center.y - sinRad*radius);
    final Vector2D limitMin = .vec2(center.x - radius, center.y - radius);
    final Vector2D limitMax = .vec2(center.x + radius, center.y + radius);

    final complementary = 90.0 - angle;
    final supplementary = 180.0 - angle;
    final explementary = 360.0 - angle;

    final tangent = Clamp(math.tan(angleRad), -10.0, 10.0);
    final cotangent = (tangent.abs() > 0.001) ? Clamp(1.0/tangent, -radius, radius) : 0.0;
    final Vector2D tangentPoint = .vec2(center.x + radius, center.y - tangent*radius);
    final Vector2D cotangentPoint = .vec2(center.x + cotangent*radius, center.y - radius);

    angle = Wrap(angle + (!pause ? 1.0 : 0.0), 0.0, 360.0);

    BeginDrawing();
      ClearBackground(.RAYWHITE);

      // Cotangent (orange)
      DrawLineEx(.vec2(center.x, limitMin.y), .vec2(cotangentPoint.x, limitMin.y), 2.0, .ORANGE);
      DrawLineDashed(center, cotangentPoint, 10, 4, .ORANGE);

      // Side background
      DrawLine(580, 0, 580, GetScreenHeight(), .color(218, 218, 218, 255));
      DrawRectangle(580, 0, GetScreenWidth(), GetScreenHeight(), .color(232, 232, 232, 255));

      // Base circle and axes
      DrawCircleLinesV(center, radius, .GRAY);
      DrawLineEx(.vec2(center.x, limitMin.y), .vec2(center.x, limitMax.y), 1.0, .GRAY);
      DrawLineEx(.vec2(limitMin.x, center.y), .vec2(limitMax.x, center.y), 1.0, .GRAY);

      // Wave graph axes
      DrawLineEx(.vec2(start.x, start.y), .vec2(start.x, start.y + start.height), 2.0, .GRAY);
      DrawLineEx(.vec2(start.x + start.width, start.y), .vec2(start.x + start.width, start.y + start.height), 2.0, .GRAY);
      DrawLineEx(.vec2(start.x, start.y + start.height/2), .vec2(start.x + start.width, start.y + start.height/2), 2.0, .GRAY);

      // Wave graph axis labels
      DrawText("1", start.x.toInt() - 8, start.y.toInt(), 6, .GRAY);
      DrawText("0", start.x.toInt() - 8, start.y.toInt() + start.height~/2 - 6, 6, .GRAY);
      DrawText("-1", start.x.toInt() - 12, start.y.toInt() + start.height.toInt() - 8, 6, .GRAY);
      DrawText("0", start.x.toInt() - 2, start.y.toInt() + start.height.toInt() + 4, 6, .GRAY);
      DrawText("360", start.x.toInt() + start.width.toInt() - 8, start.y.toInt() + start.height.toInt() + 4, 6, .GRAY);

      // Sine (red - vertical)
      DrawLineEx(.vec2(center.x, center.y), .vec2(center.x, point.y), 2.0, .RED);
      DrawLineDashed(.vec2(point.x, center.y), .vec2(point.x, point.y), 10, 4, .RED);
      DrawText("Sine ${sinRad.f2}", 640, 190, 6, .RED);
      DrawCircleV(.vec2(start.x + (angle/360.0)*start.width, start.y + ((-sinRad + 1)*start.height/2.0)), 4.0, .RED);
      DrawSplineLinear(sinePoints, 1.0, .RED);

      // Cosine (blue - horizontal)
      DrawLineEx(.vec2(center.x, center.y), .vec2(point.x, center.y), 2.0, .BLUE);
      DrawLineDashed(.vec2(center.x, point.y), .vec2(point.x, point.y), 10, 4, .BLUE);
      DrawText("Cosine ${cosRad.f2}", 640, 210, 6, .BLUE);
      DrawCircleV(.vec2(start.x + (angle/360.0)*start.width, start.y + ((-cosRad + 1)*start.height/2.0)), 4.0, .BLUE);
      DrawSplineLinear(cosPoints, 1.0, .BLUE);

      // Tangent (purple)
      DrawLineEx(.vec2(limitMax.x, center.y), .vec2(limitMax.x, tangentPoint.y), 2.0, .PURPLE);
      DrawLineDashed(center, tangentPoint, 10, 4, .PURPLE);
      DrawText("Tangent ${tangent.f2}", 640, 230, 6, .PURPLE);

      // Cotangent (orange)
      DrawText("Cotangent ${cotangent.f2}", 640, 250, 6, .ORANGE);

      // Complementary angle (beige)
      DrawCircleSectorLines(center, radius*0.6, -angle, -90.0, 36, .BEIGE);
      DrawText("Complementary ${complementary.f0}°", 640, 150, 6, .BEIGE);

      // Supplementary angle (darkblue)
      DrawCircleSectorLines(center, radius*0.5, -angle, -180.0, 36, .DARKBLUE);
      DrawText("Supplementary ${supplementary.f0}°", 640, 130, 6, .DARKBLUE);

      // Explementary angle (pink)
      DrawCircleSectorLines(center, radius*0.4, -angle, -360.0, 36, .PINK);
      DrawText("Explementary ${explementary.f0}°", 640, 170, 6, .PINK);

      // Current angle - arc (lime), radius (black), endpoint (black)
      DrawCircleSectorLines(center, radius*0.7, -angle, 0.0, 36, .LIME);
      DrawLineEx(.vec2(center.x, center.y), point, 2.0, .BLACK);
      DrawCircleV(point, 4.0, .BLACK);

      GuiSetStyle(.LABEL, GuiControlProperty.TEXT_COLOR_NORMAL, ColorToInt(.GRAY));
      (_, pause) = GuiToggle(.rect(640, 70, 120, 20), "Pause", pause);
      GuiSetStyle(.LABEL, GuiControlProperty.TEXT_COLOR_NORMAL, ColorToInt(.LIME));
      (_, angle) = GuiSliderBar(.rect(640, 40, 120, 20), "Angle", "${angle.f0}°", angle, 0.0, 360.0);
      GuiGroupBox(.rect(620, 110, 140, 170), "Angle Values");

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}