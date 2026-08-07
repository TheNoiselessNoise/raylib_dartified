// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_hilbert_curve.c
// Run it: dart run shapes_hilbert_curve.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_hilbert_curve".toC);
  SetTargetFPS(60);

  final order = Int$.ValueUnique(2);
  final size = Float32$.ValueUnique(GetScreenHeight().toDouble());
  final strokeCount = Int$.AtUnique();
  var hilbertPath = LoadHilbertPath(order.value, size.value, strokeCount);

  int prevOrder = order.value;
  double prevSize = size.value;
  int counter = 0;
  final thick = Float32$.ValueUnique(2.0);
  final animate = Bool$.ValueUnique(true);

  while (!WindowShouldClose())
  {
    if ((prevOrder != order.value) || (prevSize != size.value))
    {
      hilbertPath = LoadHilbertPath(order.value, size.value, strokeCount);

      if (animate.value) counter = 0;
      else counter = strokeCount.value;

      prevOrder = order.value;
      prevSize = size.value;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      if (counter < strokeCount.value)
      {
        for (int i = 1; i <= counter; i++)
        {
          DrawLineEx(hilbertPath[i], hilbertPath[i - 1], thick.value, ColorFromHSV((i/strokeCount.value)*360.0, 1.0, 1.0));
        }

        counter += 1;
      }
      else
      {
        for (int i = 1; i < strokeCount.value; i++)
        {
          DrawLineEx(hilbertPath[i], hilbertPath[i - 1], thick.value, ColorFromHSV((i/strokeCount.value)*360.0, 1.0, 1.0));
        }
      }

      GuiCheckBox(Rectangle$.$1.set(450, 50, 20, 20), "ANIMATE GENERATION ON CHANGE".toC, animate);
      GuiSpinner(Rectangle$.$1.set(585, 100, 180, 30), "HILBERT CURVE ORDER:  ".toC, order, 2, 8, false);
      GuiSlider(Rectangle$.$1.set(524, 150, 240, 24), "THICKNESS:  ".toC, nullptr, thick, 1.0, 10.0);
      GuiSlider(Rectangle$.$1.set(524, 190, 240, 24), "TOTAL SIZE: ".toC, nullptr, size, 10.0, GetScreenHeight()*1.5);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

Pointer<Vector2C> LoadHilbertPath(int order, double size, Pointer<Int> strokeCount)
{
  int N = 1 << order;
  double len = size/N;
  strokeCount.value = N*N;

  final hilbertPath = Vector2$.At('hilbertPath', strokeCount.value);

  for (int i = 0; i < strokeCount.value; i++)
  {
    ComputeHilbertStep(hilbertPath, order, i);
    hilbertPath[i].x = hilbertPath[i].x*len + len/2.0;
    hilbertPath[i].y = hilbertPath[i].y*len + len/2.0;
  }

  return hilbertPath;
}

void ComputeHilbertStep(Pointer<Vector2C> hilbertPath, int order, int index)
{
  final originalIndex = index;

  final List<(double x, double y)> hilbertPoints = [
    (0, 0),
    (0, 1),
    (1, 1),
    (1, 0),
  ];

  int hilbertIndex = index&3;
  var (vx, vy) = hilbertPoints[hilbertIndex];
  double temp = 0.0;
  int len = 0;

  for (int j = 1; j < order; j++)
  {
    index = index >> 2;
    hilbertIndex = index&3;
    len = 1 << j;

    switch (hilbertIndex)
    {
      case 0: {
        temp = vx;
        vx = vy;
        vy = temp;
      }
      case 1:
        vy += len;
      case 2: {
        vx += len;
        vy += len;
      }
      case 3: {
        temp = len - 1 - vx;
        vx = 2*len - 1 - vy;
        vy = temp;
      }
      default:
        break;
    }
  }

  hilbertPath[originalIndex].x = vx;
  hilbertPath[originalIndex].y = vy;
}
