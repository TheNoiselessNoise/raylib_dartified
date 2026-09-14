// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_easings_testbed.c
// Run it: dart run shapes_easings_testbed.dart
import '../../base_dart.dart';

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

  InitWindow(screenWidth, screenHeight, "shapes_easings_testbed");
  SetTargetFPS(60);

  Map<EasingTypes, double Function(num, num, num, num)> Easings = {
    .EASE_LINEAR_NONE: EaseLinearNone,
    .EASE_LINEAR_IN: EaseLinearIn,
    .EASE_LINEAR_OUT: EaseLinearOut,
    .EASE_LINEAR_IN_OUT: EaseLinearInOut,
    .EASE_SINE_IN: EaseSineIn,
    .EASE_SINE_OUT: EaseSineOut,
    .EASE_SINE_IN_OUT: EaseSineInOut,
    .EASE_CIRC_IN: EaseCircIn,
    .EASE_CIRC_OUT: EaseCircOut,
    .EASE_CIRC_IN_OUT: EaseCircInOut,
    .EASE_CUBIC_IN: EaseCubicIn,
    .EASE_CUBIC_OUT: EaseCubicOut,
    .EASE_CUBIC_IN_OUT: EaseCubicInOut,
    .EASE_QUAD_IN: EaseQuadIn,
    .EASE_QUAD_OUT: EaseQuadOut,
    .EASE_QUAD_IN_OUT: EaseQuadInOut,
    .EASE_EXPO_IN: EaseExpoIn,
    .EASE_EXPO_OUT: EaseExpoOut,
    .EASE_EXPO_IN_OUT: EaseExpoInOut,
    .EASE_BACK_IN: EaseBackIn,
    .EASE_BACK_OUT: EaseBackOut,
    .EASE_BACK_IN_OUT: EaseBackInOut,
    .EASE_BOUNCE_OUT: EaseBounceOut,
    .EASE_BOUNCE_IN: EaseBounceIn,
    .EASE_BOUNCE_IN_OUT: EaseBounceInOut,
    .EASE_ELASTIC_IN: EaseElasticIn,
    .EASE_ELASTIC_OUT: EaseElasticOut,
    .EASE_ELASTIC_IN_OUT: EaseElasticInOut,
    .EASING_NONE: (a, b, c, d) => b.toDouble(),
  };

  final Vector2D ballPosition = .vec2(100.0, 100.0);

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
    if (IsKeyPressed(.KEY_T)) boundedT = !boundedT;

    if (IsKeyPressed(.KEY_RIGHT)) easingX = easingX.next;
    else if (IsKeyPressed(.KEY_LEFT)) easingX = easingX.prev;

    if (IsKeyPressed(.KEY_DOWN)) easingY = easingY.next;
    else if (IsKeyPressed(.KEY_UP)) easingY = easingY.prev;

    if (IsKeyPressed(.KEY_W) && d < D_MAX - D_STEP) d += D_STEP;
    else if (IsKeyPressed(.KEY_D) && d > D_MIN + D_STEP) d -= D_STEP;

    if (IsKeyDown(.KEY_S) && d < D_MAX - D_STEP_FINE) d += D_STEP_FINE;
    else if (IsKeyDown(.KEY_A) && d > D_MIN + D_STEP_FINE) d -= D_STEP_FINE;

    if (
      IsKeyPressed(.KEY_SPACE) || IsKeyPressed(.KEY_T) ||
      IsKeyPressed(.KEY_RIGHT) || IsKeyPressed(.KEY_LEFT) ||
      IsKeyPressed(.KEY_DOWN) || IsKeyPressed(.KEY_UP) ||
      IsKeyPressed(.KEY_W) || IsKeyPressed(.KEY_Q) ||
      IsKeyDown(.KEY_S)  || IsKeyDown(.KEY_A) ||
      (IsKeyPressed(.KEY_ENTER) && boundedT && (t >= d))
    ) {
      t = 0.0;
      ballPosition.x = 100.0;
      ballPosition.y = 100.0;
      paused = true;
      // NOTE: not part of the original example
      tail.clear();
      // ---------
    }

    if (IsKeyPressed(.KEY_ENTER)) paused = !paused;

    if (!paused && ((boundedT && t < d) || !boundedT))
    {
      ballPosition.x = Easings[easingX]!(t, 100.0, 700.0 - 170.0, d);
      ballPosition.y = Easings[easingY]!(t, 100.0, 400.0 - 170.0, d);
      t += 1.0;
      // NOTE: not part of the original example
      tail.add(ballPosition.copy());
      // ---------
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      // NOTE: not part of the original example
      if (tail.length >= 2) {
        for (int i = 1; i < tail.length; i++) {
          DrawLineEx(tail[i - 1], tail[i], 1, .RED);
        }
      }
      // ---------

      DrawText("Easing x: ${easingX.name}", 20, FONT_SIZE, FONT_SIZE, .LIGHTGRAY);
      DrawText("Easing y: ${easingY.name}", 20, FONT_SIZE*2, FONT_SIZE, .LIGHTGRAY);
      DrawText("t (${boundedT == true ? 'b' : 'u'}) = ${t.f2} d = ${d.f2}", 20, FONT_SIZE*3, FONT_SIZE, .LIGHTGRAY);

      DrawText(
        "Use ENTER to play or pause movement, use SPACE to restart",
        20, GetScreenHeight() - FONT_SIZE*2, FONT_SIZE, .LIGHTGRAY
      );
      DrawText(
        "Use Q and W or A and S keys to change duration",
        20, GetScreenHeight() - FONT_SIZE*3, FONT_SIZE, .LIGHTGRAY
      );
      DrawText(
        "Use LEFT or RIGHT keys to choose easing for the x axis",
        20, GetScreenHeight() - FONT_SIZE*4, FONT_SIZE, .LIGHTGRAY
      );
      DrawText(
        "Use UP or DOWN keys to choose easing for the y axis",
        20, GetScreenHeight() - FONT_SIZE*5, FONT_SIZE, .LIGHTGRAY
      );

      DrawCircleV(ballPosition, 16.0, .MAROON);

    EndDrawing();
  }
  
  CloseWindowAndDispose();
}
