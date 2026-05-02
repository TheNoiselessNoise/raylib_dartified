// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_easings_box.c
// Run it: dart run shapes_easings_box.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_easings_box".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final rec = rl.Temp.Rectangle$.At('rec').set(screenWidth / 2, -100, 100, 100);
  double rotation = 0;
  double alpha = 1;
  int state = 0;
  int framesCounter = 0;

  void reset() {
    rec.set(rl.Core.GetScreenWidth() / 2, -100, 100, 100);
    rotation = 0;
    alpha = 1;
    state = 0;
    framesCounter = 0;
  }

  while (!rl.Core.WindowShouldClose())
  {
    switch (state) {
      case 0: {
        framesCounter++;

        // NOTE: Remember that 3rd parameter of easing function refers to
        // desired value variation, do not confuse it with expected final value!
        rec.ref.y = rl.Ease.EaseElasticOut(
          framesCounter.toDouble(),
          -100,
          rl.Core.GetScreenHeight() / 2 + 100,
          120
        );

        if (framesCounter >= 120) {
          framesCounter = 0;
          state = 1;
        }
      } break;
      case 1: {
        framesCounter++;

        rec.ref.height = rl.Ease.EaseBounceOut(
          framesCounter.toDouble(), 100, -90, 120
        );

        rec.ref.width = rl.Ease.EaseBounceOut(
          framesCounter.toDouble(), 100, rl.Core.GetScreenWidth().toDouble(), 120
        );

        if (framesCounter >= 120) {
          framesCounter = 0;
          state = 2;
        }
      } break;
      case 2: {
        framesCounter++;

        rotation = rl.Ease.EaseQuadOut(framesCounter.toDouble(), 0, 270, 240);

        if (framesCounter >= 240) {
          framesCounter = 0;
          state = 3;
        }

      } break;
      case 3: {
        framesCounter++;

        rec.ref.height = rl.Ease.EaseCircOut(
          framesCounter.toDouble(), 10, rl.Core.GetScreenWidth().toDouble(), 120
        );

        if (framesCounter >= 120) {
          framesCounter = 0;
          state = 4;
        }

      } break;
      case 4: {
        framesCounter++;

        alpha = rl.Ease.EaseSineOut(framesCounter.toDouble(), 1, -1, 160);

        if (framesCounter >= 160) {
          framesCounter = 0;
          state = 5;
        }

      } break;
      default: break;
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value)) {
      reset();
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);
      
      rl.Core.DrawRectanglePro(
        rec.ref,
        rl.Temp.vec21(
          rec.ref.width / 2,
          rec.ref.height / 2
        ),
        rotation,
        rl.Core.Fade(rl.C.BLACK, alpha),
      );

      rl.Core.DrawText(
        "PRESS [SPACE] TO RESET BOX ANIMATION!".toC,
        10,
        rl.Core.GetScreenHeight() - 25, 20,
        rl.C.LIGHTGRAY
      );

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}