// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_recursive_tree.c
// Run it: dart run shapes_recursive_tree.dart
import 'dart:math' as math;

import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

class Branch {
  Vector2D start = .zero();
  Vector2D end = .zero();
  double angle = 0;
  double length = 0;
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_recursive_tree");
  SetTargetFPS(60);

  final Vector2D start = .vec2((screenWidth/2.0) - 125.0, screenHeight);
  double angle = 40.0;
  double thick = 1.0;
  double treeDepth = 10.0;
  double branchDecay = 0.66;
  double length = 120.0;
  bool bezier = false;

  final List<Branch> branches = .generate(1030, (_) => .new());

  while (!WindowShouldClose())
  {
    final theta = angle*rl.DEG2RAD;
    int maxBranches = math.pow(2, treeDepth.floor()).toInt();
    int count = 0;

    final Vector2D initialEnd = .vec2(
      start.x + length*math.sin(0.0),
      start.y - length*math.cos(0.0)
    );

    final current = count++;
    branches[current].start = start;
    branches[current].end = initialEnd;
    branches[current].angle = 0;
    branches[current].length = length;

    for (int i = 0; i < count; i++)
    {
      Branch branch = branches[i];
      if (branch.length < 2) continue;

      final nextLength = branch.length*branchDecay;

      if (count < maxBranches && nextLength >= 2)
      {
        final branchStart = branch.end;

        final angle1 = branch.angle + theta;
        final Vector2D branchEnd1 = .vec2(
          branchStart.x + nextLength*math.sin(angle1),
          branchStart.y - nextLength*math.cos(angle1)
        );
        
        final current1 = count++;
        branches[current1].start = branchStart;
        branches[current1].end = branchEnd1;
        branches[current1].angle = angle1;
        branches[current1].length = nextLength;

        final angle2 = branch.angle - theta;
        final Vector2D branchEnd2 = .vec2(
          branchStart.x + nextLength*math.sin(angle2),
          branchStart.y - nextLength*math.cos(angle2)
        );

        final current2 = count++;
        branches[current2].start = branchStart;
        branches[current2].end = branchEnd2;
        branches[current2].angle = angle2;
        branches[current2].length = nextLength;
      }
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      for (int i = 0; i < count; i++)
      {
        Branch branch = branches[i];
        if (branch.length >= 2)
        {
          if (bezier) DrawLineBezier(branch.start, branch.end, thick, .RED);
          else DrawLineEx(branch.start, branch.end, thick, .RED);
        }
      }

      DrawLine(580, 0, 580, GetScreenHeight(), .color(218, 218, 218, 255));
      DrawRectangle(580, 0, GetScreenWidth(), GetScreenHeight(), .color(232, 232, 232, 255));

      {
        final (_, newValue) = GuiSliderBar(.rect(640, 40, 120, 20), "Angle", angle.f0, angle, 0, 180);
        angle = newValue;
      }
      {
        final (_, newValue) = GuiSliderBar(.rect(640, 70, 120, 20), "Length", length.f0, length, 12.0, 240.0);
        length = newValue;
      }
      {
        final (_, newValue) = GuiSliderBar(.rect(640, 100, 120, 20), "Decay", branchDecay.f2, branchDecay, 0.1, 0.78);
        branchDecay = newValue;
      }
      {
        final (_, newValue) = GuiSliderBar(.rect(640, 130, 120, 20), "Depth", treeDepth.f0, treeDepth, 1.0, 10.0);
        treeDepth = newValue;
      }
      {
        final (_, newValue) = GuiSliderBar(.rect(640, 160, 120, 20), "Thick", thick.f0, thick, 1, 8);
        thick = newValue;
      }
      {
        final (_, newValue) = GuiCheckBox(.rect(640, 190, 20, 20), "Bezier", bezier);
        bezier = newValue;
      }

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}