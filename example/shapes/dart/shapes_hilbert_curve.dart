// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_hilbert_curve.c
// Run it: dart run shapes_hilbert_curve.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_hilbert_curve");
  SetTargetFPS(60);

  int order = 2;
  double size = GetScreenHeight().toDouble();
  var hilbertPath = LoadHilbertPath(order, size);

  int prevOrder = order;
  double prevSize = size;
  int counter = 0;
  double thick = 2.0;
  bool animate = true;

  while (!WindowShouldClose())
  {
    if ((prevOrder != order) || (prevSize != size))
    {
      hilbertPath = LoadHilbertPath(order, size);

      if (animate) counter = 0;
      else counter = hilbertPath.length;

      prevOrder = order;
      prevSize = size;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      if (counter < hilbertPath.length)
      {
        for (int i = 1; i <= counter; i++)
        {
          DrawLineEx(hilbertPath[i], hilbertPath[i - 1], thick, ColorFromHSV((i/hilbertPath.length)*360.0, 1.0, 1.0));
        }

        counter += 1;
      }
      else
      {
        for (int i = 1; i < hilbertPath.length; i++)
        {
          DrawLineEx(hilbertPath[i], hilbertPath[i - 1], thick, ColorFromHSV((i/hilbertPath.length)*360.0, 1.0, 1.0));
        }
      }

      {
        final (_, newValue) = GuiCheckBox(.rect(450, 50, 20, 20), "ANIMATE GENERATION ON CHANGE", animate);
        animate = newValue;
      }
      {
        final (_, newValue) = GuiSpinner(.rect(585, 100, 180, 30), "HILBERT CURVE ORDER:  ", order, 2, 8, false);
        order = newValue;
      }
      {
        final (_, newValue) = GuiSlider(.rect(524, 150, 240, 24), "THICKNESS:  ", null, thick, 1.0, 10.0);
        thick = newValue;
      }
      {
        final (_, newValue) = GuiSlider(.rect(524, 190, 240, 24), "TOTAL SIZE: ", null, size, 10.0, GetScreenHeight()*1.5);
        size = newValue;
      }

    EndDrawing();
  }

  CloseWindowAndDispose();
}

List<Vector2D> LoadHilbertPath(int order, double size)
{
  int N = 1 << order;
  double len = size/N;

  final List<Vector2D> hilbertPath = .generate(N*N, (_) => .zero());

  for (int i = 0; i < hilbertPath.length; i++)
  {
    ComputeHilbertStep(hilbertPath, order, i);
    hilbertPath[i].x = hilbertPath[i].x*len + len/2.0;
    hilbertPath[i].y = hilbertPath[i].y*len + len/2.0;
  }

  return hilbertPath;
}

void ComputeHilbertStep(List<Vector2D> hilbertPath, int order, int index)
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
