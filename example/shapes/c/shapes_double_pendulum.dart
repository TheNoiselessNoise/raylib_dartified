// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_double_pendulum.c
// Run it: dart run shapes_double_pendulum.dart
import 'dart:ffi';
import '../../base.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;
const int SIMULATION_STEPS = 30;
const double G = 9.81;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_WINDOW_HIGHDPI.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_double_pendulum".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  double l1 = 15.0, m1 = 0.2, theta1 = rl.DEG2RAD*170, w1 = 0;
  double l2 = 15.0, m2 = 0.1, theta2 = rl.DEG2RAD*0, w2 = 0;
  double lengthScaler = 0.1;
  double totalM = m1 + m2;

  Vector2D previousPosition = CalculateDoublePendulumEndPoint(l1, theta1, l2, theta2);
  previousPosition.x += screenWidth/2;
  previousPosition.y += screenHeight/2 - 100;

  double L1 = l1*lengthScaler;
  double L2 = l2*lengthScaler;

  double lineThick = 20, trailThick = 2;
  double fateAlpha = 0.01;

  RenderTexture2DC target = rl.Core.LoadRenderTexture(screenWidth, screenHeight);
  rl.Core.SetTextureFilter(target.texture, TextureFilter.TEXTURE_FILTER_BILINEAR.value);

  while (!rl.Core.WindowShouldClose())
  {
    final dt = rl.Core.GetFrameTime();
    final step = dt/SIMULATION_STEPS, step2 = step*step;

    for (int i = 0; i < SIMULATION_STEPS; i++)
    {
      final delta = theta1 - theta2;
      final sinD = math.sin(delta), cosD = math.cos(delta), cos2D = math.cos(2*delta);
      final ww1 = w1*w1, ww2 = w2*w2;

      final a1 = (
        -G*(2*m1 + m2)*math.sin(theta1)
        - m2*G*math.sin(theta1 - 2*theta2)
        - 2*sinD*m2*(ww2*L2 + ww1*L1*cosD))
        /(L1*(2*m1 + m2 - m2*cos2D)
      );

      final a2 = (
        2*sinD*(ww1*L1*totalM
        + G*totalM*math.cos(theta1)
        + ww2*L2*m2*cosD))
        /(L2*(2*m1 + m2 - m2*cos2D)
      );

      theta1 += w1*step + 0.5*a1*step2;
      theta2 += w2*step + 0.5*a2*step2;

      w1 += a1*step;
      w2 += a2*step;
    }

    final currentPosition = CalculateDoublePendulumEndPoint(l1, theta1, l2, theta2);
    currentPosition.x += screenWidth/2;
    currentPosition.y += screenHeight/2 - 100;

    rl.Core.BeginTextureMode(target);
      rl.Core.DrawRectangle(0, 0, screenWidth, screenHeight, rl.Core.Fade(rl.C.BLACK, fateAlpha));

      rl.Core.DrawCircleV(rl.Temp.vec21Ptr.setD(previousPosition).ref, trailThick, rl.C.RED);
      rl.Core.DrawLineEx(
        rl.Temp.vec21Ptr.setD(previousPosition).ref,
        rl.Temp.vec22Ptr.setD(currentPosition).ref,
        trailThick*2, rl.C.RED
      );
    rl.Core.EndTextureMode();

    previousPosition = currentPosition;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.BLACK);

      rl.Core.DrawTextureRec(
        target.texture,
        rl.Temp.rect1(0, 0, target.texture.width.toDouble(), -target.texture.height.toDouble()),
        rl.Temp.vec21(0, 0),
        rl.C.WHITE
      );

      rl.Core.DrawRectanglePro(
        rl.Temp.rect1(screenWidth/2.0, screenHeight/2.0 - 100, 10*l1, lineThick),
        rl.Temp.vec21(0, lineThick*0.5),
        90 - rl.RAD2DEG*theta1,
        rl.C.RAYWHITE
      );

      final endpoint1 = CalculatePendulumEndPoint(l1, theta1);
      rl.Core.DrawRectanglePro(
        rl.Temp.rect1(screenWidth/2.0 + endpoint1.x, screenHeight/2.0 - 100 + endpoint1.y, 10*l2, lineThick),
        rl.Temp.vec21(0, lineThick*0.5),
        90 - rl.RAD2DEG*theta2,
        rl.C.RAYWHITE
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadRenderTexture(target);

  rl.CloseWindowAndDispose();
}

Vector2D CalculatePendulumEndPoint(double l, double theta)
{
  return .vec2(10*l*math.sin(theta), 10*l*math.cos(theta));
}

Vector2D CalculateDoublePendulumEndPoint(double l1, double theta1, double l2, double theta2)
{
  Vector2D endpoint1 = CalculatePendulumEndPoint(l1, theta1);
  Vector2D endpoint2 = CalculatePendulumEndPoint(l2, theta2);
  return .vec2(endpoint1.x + endpoint2.x, endpoint1.y + endpoint2.y);
}