// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/others/shapes_easings_testbed.c
// Run it: dart run shapes_easings_testbed.dart
import 'dart:ffi';
import '../../base_c.dart';

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
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_easings_testbed".toC);
  SetTargetFPS(60);

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

  final ballPosition = Vector2$.val.At('ballPosition').set(100.0, 100.0);

  double t = 0.0;
  double d = 300.0;
  bool paused = true;
  bool boundedT = true;

  EasingTypes easingX = .EASING_NONE;
  EasingTypes easingY = .EASING_NONE;

  // NOTE: not part of the original example
  final tail = <Vector2D>[];
  // ---------

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_T.value)) boundedT = !boundedT;

    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) easingX = easingX.next;
    else if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) easingX = easingX.prev;

    if (IsKeyPressed(KeyboardKey.KEY_DOWN.value)) easingY = easingY.next;
    else if (IsKeyPressed(KeyboardKey.KEY_UP.value)) easingY = easingY.prev;

    if (IsKeyPressed(KeyboardKey.KEY_W.value) && d < D_MAX - D_STEP) d += D_STEP;
    else if (IsKeyPressed(KeyboardKey.KEY_Q.value) && d > D_MIN + D_STEP) d -= D_STEP;

    if (IsKeyDown(KeyboardKey.KEY_S.value) && d < D_MAX - D_STEP_FINE) d += D_STEP_FINE;
    else if (IsKeyDown(KeyboardKey.KEY_A.value) && d > D_MIN + D_STEP_FINE) d -= D_STEP_FINE;

    if (
      IsKeyPressed(KeyboardKey.KEY_SPACE.value) || IsKeyPressed(KeyboardKey.KEY_T.value) ||
      IsKeyPressed(KeyboardKey.KEY_RIGHT.value) || IsKeyPressed(KeyboardKey.KEY_LEFT.value) ||
      IsKeyPressed(KeyboardKey.KEY_DOWN.value) || IsKeyPressed(KeyboardKey.KEY_UP.value) ||
      IsKeyPressed(KeyboardKey.KEY_W.value) || IsKeyPressed(KeyboardKey.KEY_Q.value) ||
      IsKeyDown(KeyboardKey.KEY_S.value)  || IsKeyDown(KeyboardKey.KEY_A.value) ||
      (IsKeyPressed(KeyboardKey.KEY_ENTER.value) && boundedT && (t >= d))
    ) {
      t = 0.0;
      ballPosition.ref.x = 100.0;
      ballPosition.ref.y = 100.0;
      paused = true;
      // NOTE: not part of the original example
      tail.clear();
      // ---------
    }

    if (IsKeyPressed(KeyboardKey.KEY_ENTER.value)) paused = !paused;

    if (!paused && ((boundedT && t < d) || !boundedT))
    {
      ballPosition.ref.x = Easings[easingX]!(t, 100.0, 700.0 - 170.0, d);
      ballPosition.ref.y = Easings[easingY]!(t, 100.0, 400.0 - 170.0, d);
      t += 1.0;
      // NOTE: not part of the original example
      tail.add(ballPosition.toD());
      // ---------
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      // NOTE: not part of the original example
      if (tail.length >= 2) {
        for (int i = 1; i < tail.length; i++) {
          DrawLineEx(
            Vector2$.val.$1.setD(tail[i - 1]),
            Vector2$.val.$2.setD(tail[i]),
            1,
            RED
          );
        }
      }
      // ---------

      DrawText("Easing x: ${easingX.name}".toC, 20, FONT_SIZE, FONT_SIZE, LIGHTGRAY);
      DrawText("Easing y: ${easingY.name}".toC, 20, FONT_SIZE*2, FONT_SIZE, LIGHTGRAY);
      DrawText("t (${boundedT == true ? 'b' : 'u'}) = ${t.f2} d = ${d.f2}".toC, 20, FONT_SIZE*3, FONT_SIZE, LIGHTGRAY);

      DrawText(
        "Use ENTER to play or pause movement, use SPACE to restart".toC,
        20, GetScreenHeight() - FONT_SIZE*2, FONT_SIZE, LIGHTGRAY
      );
      DrawText(
        "Use Q and W or A and S keys to change duration".toC,
        20, GetScreenHeight() - FONT_SIZE*3, FONT_SIZE, LIGHTGRAY
      );
      DrawText(
        "Use LEFT or RIGHT keys to choose easing for the x axis".toC,
        20, GetScreenHeight() - FONT_SIZE*4, FONT_SIZE, LIGHTGRAY
      );
      DrawText(
        "Use UP or DOWN keys to choose easing for the y axis".toC,
        20, GetScreenHeight() - FONT_SIZE*5, FONT_SIZE, LIGHTGRAY
      );

      DrawCircleV(ballPosition.ref, 16.0, MAROON);

    EndDrawing();
  }
  
  CloseWindowAndDispose();
}
