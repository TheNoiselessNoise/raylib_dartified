// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_easings_box.c
// Run it: dart run shapes_easings_box.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_easings_box");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  late RectangleD rec;
  late double rotation;
  late double alpha;
  late int state;
  late int framesCounter;

  void reset() {
    rec = .rect(rl.CoreD.GetScreenWidth() / 2, -100, 100, 100);
    rotation = 0;
    alpha = 1;
    state = 0;
    framesCounter = 0;
  }

  reset();

  while (!rl.CoreD.WindowShouldClose())
  {
    switch (state) {
      case 0: {
        framesCounter++;

        // NOTE: Remember that 3rd parameter of easing function refers to
        // desired value variation, do not confuse it with expected final value!
        rec.y = rl.Ease.EaseElasticOut(
          framesCounter,
          -100,
          rl.CoreD.GetScreenHeight() / 2 + 100,
          120
        );

        if (framesCounter >= 120) {
          framesCounter = 0;
          state = 1;
        }
      } break;
      case 1: {
        framesCounter++;

        rec.height = rl.Ease.EaseBounceOut(
          framesCounter, 100, -90, 120
        );

        rec.width = rl.Ease.EaseBounceOut(
          framesCounter, 100, rl.CoreD.GetScreenWidth(), 120
        );

        if (framesCounter >= 120) {
          framesCounter = 0;
          state = 2;
        }
      } break;
      case 2: {
        framesCounter++;

        rotation = rl.Ease.EaseQuadOut(framesCounter, 0, 270, 240);

        if (framesCounter >= 240) {
          framesCounter = 0;
          state = 3;
        }

      } break;
      case 3: {
        framesCounter++;

        rec.height = rl.Ease.EaseCircOut(
          framesCounter, 10, rl.CoreD.GetScreenWidth(), 120
        );

        if (framesCounter >= 120) {
          framesCounter = 0;
          state = 4;
        }

      } break;
      case 4: {
        framesCounter++;

        alpha = rl.Ease.EaseSineOut(framesCounter, 1, -1, 160);

        if (framesCounter >= 160) {
          framesCounter = 0;
          state = 5;
        }

      } break;
      default: break;
    }

    if (rl.CoreD.IsKeyPressed(.KEY_SPACE)) {
      reset();
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);
      
      rl.CoreD.DrawRectanglePro(
        rec,
        .vec2(rec.width / 2, rec.height / 2),
        rotation,
        rl.CoreD.Fade(.BLACK, alpha),
      );

      rl.CoreD.DrawText(
        "PRESS [SPACE] TO RESET BOX ANIMATION!",
        10,
        rl.CoreD.GetScreenHeight() - 25, 20,
        .LIGHTGRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}