// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_math_sine_cosine.c
// Run it: dart run shapes_math_sine_cosine.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int WAVE_POINTS = 36;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shapes_math_sine_cosine".toC);
  SetTargetFPS(60);

  final sinePoints = Vector2$.val.AtUnique(count: WAVE_POINTS);
  final cosPoints = Vector2$.val.AtUnique(count: WAVE_POINTS);
  final center = Vector2$.val.AtUnique().set((screenWidth/2.0) - 30.0, screenHeight/2.0);
  final start = Rectangle$.val.AtUnique().set(20.0, screenHeight - 120.0, 200.0, 100.0);
  double radius = 130.0;
  final angle = Float32$.val.ValueUnique(0.0);
  final pause = Bool$.ValueUnique(false);

  for (int i = 0; i < WAVE_POINTS; i++)
  {
    final t = i/(WAVE_POINTS - 1);
    final currentAngle = t*360.0*rl.DEG2RAD;
    sinePoints[i].set(start.ref.x + t*start.ref.width, start.ref.y + start.ref.height/2.0 - math.sin(currentAngle)*(start.ref.height/2.0));
    cosPoints[i].set(start.ref.x + t*start.ref.width, start.ref.y + start.ref.height/2.0 - math.cos(currentAngle)*(start.ref.height/2.0));
  }

  while (!WindowShouldClose())
  {
    final angleRad = angle.value*rl.DEG2RAD;
    final cosRad = math.cos(angleRad);
    final sinRad = math.sin(angleRad);

    final point = Vector2$.val.At('point').set(center.ref.x + cosRad*radius, center.ref.y - sinRad*radius);
    final limitMin = Vector2$.val.At('limitMin').set(center.ref.x - radius, center.ref.y - radius);
    final limitMax = Vector2$.val.At('limitMax').set(center.ref.x + radius, center.ref.y + radius);

    final complementary = 90.0 - angle.value;
    final supplementary = 180.0 - angle.value;
    final explementary = 360.0 - angle.value;

    final tangent = Clamp(math.tan(angleRad), -10.0, 10.0);
    final cotangent = (tangent.abs() > 0.001) ? Clamp(1.0/tangent, -radius, radius) : 0.0;
    final tangentPoint = Vector2$.val.At('tangentPoint').set(center.ref.x + radius, center.ref.y - tangent*radius);
    final cotangentPoint = Vector2$.val.At('cotangentPoint').set(center.ref.x + cotangent*radius, center.ref.y - radius);

    angle.value = Wrap(angle.value + (!pause.value ? 1.0 : 0.0), 0.0, 360.0);

    BeginDrawing();
      ClearBackground(RAYWHITE);

      // Cotangent (orange)
      DrawLineEx(Vector2$.val.$1.set(center.ref.x, limitMin.ref.y), Vector2$.val.$2.set(cotangentPoint.ref.x, limitMin.ref.y), 2.0, ORANGE);
      DrawLineDashed(center.ref, cotangentPoint.ref, 10, 4, ORANGE);

      // Side background
      DrawLine(580, 0, 580, GetScreenHeight(), Color$.val.$1.set(218, 218, 218, 255));
      DrawRectangle(580, 0, GetScreenWidth(), GetScreenHeight(), Color$.val.$1.set(232, 232, 232, 255));

      // Base circle and axes
      DrawCircleLinesV(center.ref, radius, GRAY);
      DrawLineEx(Vector2$.val.$1.set(center.ref.x, limitMin.ref.y), Vector2$.val.$2.set(center.ref.x, limitMax.ref.y), 1.0, GRAY);
      DrawLineEx(Vector2$.val.$1.set(limitMin.ref.x, center.ref.y), Vector2$.val.$2.set(limitMax.ref.x, center.ref.y), 1.0, GRAY);

      // Wave graph axes
      DrawLineEx(Vector2$.val.$1.set(start.ref.x, start.ref.y), Vector2$.val.$2.set(start.ref.x, start.ref.y + start.ref.height), 2.0, GRAY);
      DrawLineEx(Vector2$.val.$1.set(start.ref.x + start.ref.width, start.ref.y), Vector2$.val.$2.set(start.ref.x + start.ref.width, start.ref.y + start.ref.height), 2.0, GRAY);
      DrawLineEx(Vector2$.val.$1.set(start.ref.x, start.ref.y + start.ref.height/2), Vector2$.val.$2.set(start.ref.x + start.ref.width, start.ref.y + start.ref.height/2), 2.0, GRAY);

      // Wave graph axis labels
      DrawText("1".toC, start.ref.x.toInt() - 8, start.ref.y.toInt(), 6, GRAY);
      DrawText("0".toC, start.ref.x.toInt() - 8, start.ref.y.toInt() + start.ref.height~/2 - 6, 6, GRAY);
      DrawText("-1".toC, start.ref.x.toInt() - 12, start.ref.y.toInt() + start.ref.height.toInt() - 8, 6, GRAY);
      DrawText("0".toC, start.ref.x.toInt() - 2, start.ref.y.toInt() + start.ref.height.toInt() + 4, 6, GRAY);
      DrawText("360".toC, start.ref.x.toInt() + start.ref.width.toInt() - 8, start.ref.y.toInt() + start.ref.height.toInt() + 4, 6, GRAY);

      // Sine (red - vertical)
      DrawLineEx(Vector2$.val.$1.set(center.ref.x, center.ref.y), Vector2$.val.$2.set(center.ref.x, point.ref.y), 2.0, RED);
      DrawLineDashed(Vector2$.val.$1.set(point.ref.x, center.ref.y), Vector2$.val.$2.set(point.ref.x, point.ref.y), 10, 4, RED);
      DrawText("Sine ${sinRad.f2}".toC, 640, 190, 6, RED);
      DrawCircleV(Vector2$.val.$1.set(start.ref.x + (angle.value/360.0)*start.ref.width, start.ref.y + ((-sinRad + 1)*start.ref.height/2.0)), 4.0, RED);
      DrawSplineLinear(sinePoints, WAVE_POINTS, 1.0, RED);

      // Cosine (blue - horizontal)
      DrawLineEx(Vector2$.val.$1.set(center.ref.x, center.ref.y), Vector2$.val.$2.set(point.ref.x, center.ref.y), 2.0, BLUE);
      DrawLineDashed(Vector2$.val.$1.set(center.ref.x, point.ref.y), Vector2$.val.$2.set(point.ref.x, point.ref.y), 10, 4, BLUE);
      DrawText("Cosine ${cosRad.f2}".toC, 640, 210, 6, BLUE);
      DrawCircleV(Vector2$.val.$1.set(start.ref.x + (angle.value/360.0)*start.ref.width, start.ref.y + ((-cosRad + 1)*start.ref.height/2.0)), 4.0, BLUE);
      DrawSplineLinear(cosPoints, WAVE_POINTS, 1.0, BLUE);

      // Tangent (purple)
      DrawLineEx(Vector2$.val.$1.set(limitMax.ref.x, center.ref.y), Vector2$.val.$2.set(limitMax.ref.x, tangentPoint.ref.y), 2.0, PURPLE);
      DrawLineDashed(center.ref, tangentPoint.ref, 10, 4, PURPLE);
      DrawText("Tangent ${tangent.f2}".toC, 640, 230, 6, PURPLE);

      // Cotangent (orange)
      DrawText("Cotangent ${cotangent.f2}".toC, 640, 250, 6, ORANGE);

      // Complementary angle (beige)
      DrawCircleSectorLines(center.ref, radius*0.6, -angle.value, -90.0, 36, BEIGE);
      DrawText("Complementary ${complementary.f0}°".toC, 640, 150, 6, BEIGE);

      // Supplementary angle (darkblue)
      DrawCircleSectorLines(center.ref, radius*0.5, -angle.value, -180.0, 36, DARKBLUE);
      DrawText("Supplementary ${supplementary.f0}°".toC, 640, 130, 6, DARKBLUE);

      // Explementary angle (pink)
      DrawCircleSectorLines(center.ref, radius*0.4, -angle.value, -360.0, 36, PINK);
      DrawText("Explementary ${explementary.f0}°".toC, 640, 170, 6, PINK);

      // Current angle - arc (lime), radius (black), endpoint (black)
      DrawCircleSectorLines(center.ref, radius*0.7, -angle.value, 0.0, 36, LIME);
      DrawLineEx(Vector2$.val.$1.set(center.ref.x, center.ref.y), point.ref, 2.0, BLACK);
      DrawCircleV(point.ref, 4.0, BLACK);

      GuiSetStyle(GuiControl.LABEL.value, GuiControlProperty.TEXT_COLOR_NORMAL.value, ColorToInt(GRAY));
      GuiToggle(Rectangle$.val.$1.set(640, 70, 120, 20), "Pause".toC, pause);
      GuiSetStyle(GuiControl.LABEL.value, GuiControlProperty.TEXT_COLOR_NORMAL.value, ColorToInt(LIME));
      GuiSliderBar(Rectangle$.val.$1.set(640, 40, 120, 20), "Angle".toC, "${angle.value.f0}°".toC, angle, 0.0, 360.0);
      GuiGroupBox(Rectangle$.val.$1.set(620, 110, 140, 170), "Angle Values".toC);

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}