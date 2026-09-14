// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_easings_box.c
// Run it: dart run shapes_easings_box.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_easings_box");
  SetTargetFPS(60);

  late RectangleD rec;
  late double rotation;
  late double alpha;
  late int state;
  late int framesCounter;

  void reset() {
    rec = .rect(GetScreenWidth() / 2, -100, 100, 100);
    rotation = 0;
    alpha = 1;
    state = 0;
    framesCounter = 0;
  }

  reset();

  while (!WindowShouldClose())
  {
    switch (state) {
      case 0: {
        framesCounter++;

        // NOTE: Remember that 3rd parameter of easing function refers to
        // desired value variation, do not confuse it with expected final value!
        rec.y = EaseElasticOut(
          framesCounter,
          -100,
          GetScreenHeight() / 2 + 100,
          120
        );

        if (framesCounter >= 120) {
          framesCounter = 0;
          state = 1;
        }
      } break;
      case 1: {
        framesCounter++;

        rec.height = EaseBounceOut(
          framesCounter, 100, -90, 120
        );

        rec.width = EaseBounceOut(
          framesCounter, 100, GetScreenWidth(), 120
        );

        if (framesCounter >= 120) {
          framesCounter = 0;
          state = 2;
        }
      } break;
      case 2: {
        framesCounter++;

        rotation = EaseQuadOut(framesCounter, 0, 270, 240);

        if (framesCounter >= 240) {
          framesCounter = 0;
          state = 3;
        }

      } break;
      case 3: {
        framesCounter++;

        rec.height = EaseCircOut(
          framesCounter, 10, GetScreenWidth(), 120
        );

        if (framesCounter >= 120) {
          framesCounter = 0;
          state = 4;
        }

      } break;
      case 4: {
        framesCounter++;

        alpha = EaseSineOut(framesCounter, 1, -1, 160);

        if (framesCounter >= 160) {
          framesCounter = 0;
          state = 5;
        }

      } break;
      default: break;
    }

    if (IsKeyPressed(.KEY_SPACE)) {
      reset();
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);
      
      DrawRectanglePro(
        rec,
        .vec2(rec.width / 2, rec.height / 2),
        rotation,
        Fade(.BLACK, alpha),
      );

      DrawText(
        "PRESS [SPACE] TO RESET BOX ANIMATION!",
        10,
        GetScreenHeight() - 25, 20,
        .LIGHTGRAY
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}