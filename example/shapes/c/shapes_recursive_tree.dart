// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_recursive_tree.c
// Run it: dart run shapes_recursive_tree.dart
import 'dart:ffi';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';

import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

final class Branch extends Struct {
  external Vector2C start;
  external Vector2C end;
  @Float()
  external double angle;
  @Float()
  external double length;
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_recursive_tree".toC);
  SetTargetFPS(60);

  final start = Vector2$.AtUnique().set((screenWidth/2.0) - 125.0, screenHeight);
  final angle = Float32$.ValueUnique(40.0);
  final thick = Float32$.ValueUnique(1.0);
  final treeDepth = Float32$.ValueUnique(10.0);
  final branchDecay = Float32$.ValueUnique(0.66);
  final length = Float32$.ValueUnique(120.0);
  final bezier = Bool$.ValueUnique(false);

  final branches = calloc<Branch>(1030);

  while (!WindowShouldClose())
  {
    final theta = angle.value*rl.DEG2RAD;
    int maxBranches = math.pow(2, treeDepth.value.floor()).toInt();
    int count = 0;

    final initialEnd = Vector2$.AtUnique().set(
      start.ref.x + length.value*math.sin(0.0),
      start.ref.y - length.value*math.cos(0.0)
    );

    final current = count++;
    branches[current].start = start.ref;
    branches[current].end = initialEnd.ref;
    branches[current].angle = 0;
    branches[current].length = length.value;

    for (int i = 0; i < count; i++)
    {
      Branch branch = branches[i];
      if (branch.length < 2) continue;

      final nextLength = branch.length*branchDecay.value;

      if (count < maxBranches && nextLength >= 2)
      {
        final branchStart = branch.end;

        final angle1 = branch.angle + theta;
        final branchEnd1 = Vector2$.At('branchEnd1_$i').set(
          branchStart.x + nextLength*math.sin(angle1),
          branchStart.y - nextLength*math.cos(angle1)
        );
        
        final current1 = count++;
        branches[current1].start = branchStart;
        branches[current1].end = branchEnd1.ref;
        branches[current1].angle = angle1;
        branches[current1].length = nextLength;

        final angle2 = branch.angle - theta;
        final branchEnd2 = Vector2$.At('branchEnd2_$i').set(
          branchStart.x + nextLength*math.sin(angle2),
          branchStart.y - nextLength*math.cos(angle2)
        );

        final current2 = count++;
        branches[current2].start = branchStart;
        branches[current2].end = branchEnd2.ref;
        branches[current2].angle = angle2;
        branches[current2].length = nextLength;
      }
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      for (int i = 0; i < count; i++)
      {
        Branch branch = branches[i];
        if (branch.length >= 2)
        {
          if (bezier.value) DrawLineBezier(branch.start, branch.end, thick.value, RED);
          else DrawLineEx(branch.start, branch.end, thick.value, RED);
        }
      }

      DrawLine(580, 0, 580, GetScreenHeight(), Color$.$1.set(218, 218, 218, 255));
      DrawRectangle(580, 0, GetScreenWidth(), GetScreenHeight(), Color$.$1.set(232, 232, 232, 255));

      GuiSliderBar(Rectangle$.$1.set(640, 40, 120, 20), "Angle".toC, angle.value.f0.toC, angle, 0, 180);
      GuiSliderBar(Rectangle$.$1.set(640, 70, 120, 20), "Length".toC, length.value.f0.toC, length, 12.0, 240.0);
      GuiSliderBar(Rectangle$.$1.set(640, 100, 120, 20), "Decay".toC, branchDecay.value.f2.toC, branchDecay, 0.1, 0.78);
      GuiSliderBar(Rectangle$.$1.set(640, 130, 120, 20), "Depth".toC, treeDepth.value.f0.toC, treeDepth, 1.0, 10.0);
      GuiSliderBar(Rectangle$.$1.set(640, 160, 120, 20), "Thick".toC, thick.value.f0.toC, thick, 1, 8);
      GuiCheckBox(Rectangle$.$1.set(640, 190, 20, 20), "Bezier".toC, bezier);

      DrawFPS(10, 10);

    EndDrawing();
  }

  calloc.free(branches);

  CloseWindowAndDispose();
}