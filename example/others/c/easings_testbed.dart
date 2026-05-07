// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/others/easings_testbed.c
// Run it: dart run easings_testbed.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int FONT_SIZE = 20;
const double D_STEP = 20.0;
const double D_STEP_FINE = 2.0;
const double D_MIN = 1.0;
const double D_MAX = 10000.0;

enum EasingTypes {
  EASE_LINEAR_NONE,
  EASE_LINEAR_IN,
  EASE_LINEAR_OUT,
  EASE_LINEAR_IN_OUT,
  EASE_SINE_IN,
  EASE_SINE_OUT,
  EASE_SINE_IN_OUT,
  EASE_CIRC_IN,
  EASE_CIRC_OUT,
  EASE_CIRC_IN_OUT,
  EASE_CUBIC_IN,
  EASE_CUBIC_OUT,
  EASE_CUBIC_IN_OUT,
  EASE_QUAD_IN,
  EASE_QUAD_OUT,
  EASE_QUAD_IN_OUT,
  EASE_EXPO_IN,
  EASE_EXPO_OUT,
  EASE_EXPO_IN_OUT,
  EASE_BACK_IN,
  EASE_BACK_OUT,
  EASE_BACK_IN_OUT,
  EASE_BOUNCE_OUT,
  EASE_BOUNCE_IN,
  EASE_BOUNCE_IN_OUT,
  EASE_ELASTIC_IN,
  EASE_ELASTIC_OUT,
  EASE_ELASTIC_IN_OUT,
  EASING_NONE
  ;

  EasingTypes get next => .fromIndex(index + 1);
  EasingTypes get prev => .fromIndex(index - 1);
  static EasingTypes fromIndex(int index) => values[index % values.length];
}

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "easings_testbed".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  Map<EasingTypes, double Function(num, num, num, num)> Easings = {
    .EASE_LINEAR_NONE: rl.Ease.EaseLinearNone,
    .EASE_LINEAR_IN: rl.Ease.EaseLinearIn,
    .EASE_LINEAR_OUT: rl.Ease.EaseLinearOut,
    .EASE_LINEAR_IN_OUT: rl.Ease.EaseLinearInOut,
    .EASE_SINE_IN: rl.Ease.EaseSineIn,
    .EASE_SINE_OUT: rl.Ease.EaseSineOut,
    .EASE_SINE_IN_OUT: rl.Ease.EaseSineInOut,
    .EASE_CIRC_IN: rl.Ease.EaseCircIn,
    .EASE_CIRC_OUT: rl.Ease.EaseCircOut,
    .EASE_CIRC_IN_OUT: rl.Ease.EaseCircInOut,
    .EASE_CUBIC_IN: rl.Ease.EaseCubicIn,
    .EASE_CUBIC_OUT: rl.Ease.EaseCubicOut,
    .EASE_CUBIC_IN_OUT: rl.Ease.EaseCubicInOut,
    .EASE_QUAD_IN: rl.Ease.EaseQuadIn,
    .EASE_QUAD_OUT: rl.Ease.EaseQuadOut,
    .EASE_QUAD_IN_OUT: rl.Ease.EaseQuadInOut,
    .EASE_EXPO_IN: rl.Ease.EaseExpoIn,
    .EASE_EXPO_OUT: rl.Ease.EaseExpoOut,
    .EASE_EXPO_IN_OUT: rl.Ease.EaseExpoInOut,
    .EASE_BACK_IN: rl.Ease.EaseBackIn,
    .EASE_BACK_OUT: rl.Ease.EaseBackOut,
    .EASE_BACK_IN_OUT: rl.Ease.EaseBackInOut,
    .EASE_BOUNCE_OUT: rl.Ease.EaseBounceOut,
    .EASE_BOUNCE_IN: rl.Ease.EaseBounceIn,
    .EASE_BOUNCE_IN_OUT: rl.Ease.EaseBounceInOut,
    .EASE_ELASTIC_IN: rl.Ease.EaseElasticIn,
    .EASE_ELASTIC_OUT: rl.Ease.EaseElasticOut,
    .EASE_ELASTIC_IN_OUT: rl.Ease.EaseElasticInOut,
    .EASING_NONE: (a, b, c, d) => b.toDouble(),
  };

  final ballPosition = rl.Temp.Vector2$.At('ballPosition').set(100.0, 100.0);

  double t = 0.0;
  double d = 300.0;
  bool paused = true;
  bool boundedT = true;

  EasingTypes easingX = .EASING_NONE;
  EasingTypes easingY = .EASING_NONE;

  // NOTE: not part of the original example
  final tail = <Vector2D>[];
  // ---------

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_T.value)) boundedT = !boundedT;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) easingX = easingX.next;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_LEFT.value)) easingX = easingX.prev;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_DOWN.value)) easingY = easingY.next;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_UP.value)) easingY = easingY.prev;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_W.value) && d < D_MAX - D_STEP) d += D_STEP;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_Q.value) && d > D_MIN + D_STEP) d -= D_STEP;

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_S.value) && d < D_MAX - D_STEP_FINE) d += D_STEP_FINE;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_A.value) && d > D_MIN + D_STEP_FINE) d -= D_STEP_FINE;

    if (
      rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value) || rl.Core.IsKeyPressed(KeyboardKey.KEY_T.value) ||
      rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value) || rl.Core.IsKeyPressed(KeyboardKey.KEY_LEFT.value) ||
      rl.Core.IsKeyPressed(KeyboardKey.KEY_DOWN.value) || rl.Core.IsKeyPressed(KeyboardKey.KEY_UP.value) ||
      rl.Core.IsKeyPressed(KeyboardKey.KEY_W.value) || rl.Core.IsKeyPressed(KeyboardKey.KEY_Q.value) ||
      rl.Core.IsKeyDown(KeyboardKey.KEY_S.value)  || rl.Core.IsKeyDown(KeyboardKey.KEY_A.value) ||
      (rl.Core.IsKeyPressed(KeyboardKey.KEY_ENTER.value) && boundedT && (t >= d))
    ) {
      t = 0.0;
      ballPosition.ref.x = 100.0;
      ballPosition.ref.y = 100.0;
      paused = true;
      // NOTE: not part of the original example
      tail.clear();
      // ---------
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_ENTER.value)) paused = !paused;

    if (!paused && ((boundedT && t < d) || !boundedT))
    {
      ballPosition.ref.x = Easings[easingX]!(t, 100.0, 700.0 - 170.0, d);
      ballPosition.ref.y = Easings[easingY]!(t, 100.0, 400.0 - 170.0, d);
      t += 1.0;
      // NOTE: not part of the original example
      tail.add(ballPosition.toD());
      // ---------
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      // NOTE: not part of the original example
      if (tail.length >= 2) {
        for (int i = 1; i < tail.length; i++) {
          rl.Core.DrawLineEx(
            rl.Temp.vec21D(tail[i - 1]),
            rl.Temp.vec22D(tail[i]),
            1,
            rl.C.RED
          );
        }
      }
      // ---------

      rl.Core.DrawText("Easing x: ${easingX.name}".toC, 20, FONT_SIZE, FONT_SIZE, rl.C.LIGHTGRAY);
      rl.Core.DrawText("Easing y: ${easingY.name}".toC, 20, FONT_SIZE*2, FONT_SIZE, rl.C.LIGHTGRAY);
      rl.Core.DrawText("t (${boundedT == true ? 'b' : 'u'}) = ${t.f2} d = ${d.f2}".toC, 20, FONT_SIZE*3, FONT_SIZE, rl.C.LIGHTGRAY);

      rl.Core.DrawText(
        "Use ENTER to play or pause movement, use SPACE to restart".toC,
        20, rl.Core.GetScreenHeight() - FONT_SIZE*2, FONT_SIZE, rl.C.LIGHTGRAY
      );
      rl.Core.DrawText(
        "Use Q and W or A and S keys to change duration".toC,
        20, rl.Core.GetScreenHeight() - FONT_SIZE*3, FONT_SIZE, rl.C.LIGHTGRAY
      );
      rl.Core.DrawText(
        "Use LEFT or RIGHT keys to choose easing for the x axis".toC,
        20, rl.Core.GetScreenHeight() - FONT_SIZE*4, FONT_SIZE, rl.C.LIGHTGRAY
      );
      rl.Core.DrawText(
        "Use UP or DOWN keys to choose easing for the y axis".toC,
        20, rl.Core.GetScreenHeight() - FONT_SIZE*5, FONT_SIZE, rl.C.LIGHTGRAY
      );

      rl.Core.DrawCircleV(ballPosition.ref, 16.0, rl.C.MAROON);

    rl.Core.EndDrawing();
  }
  
  rl.CloseWindowAndDispose();
}
