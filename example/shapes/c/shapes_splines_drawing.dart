// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_splines_drawing.c
// Run it: dart run shapes_splines_drawing.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_SPLINE_POINTS = 21;

class ControlPoint {
  Pointer<Vector2C> start;
  Pointer<Vector2C> end;

  ControlPoint({
    required this.start,
    required this.end
  });
}

enum SplineType {
  SPLINE_LINEAR,
  SPLINE_BASIS,
  SPLINE_CATMULLROM,
  SPLINE_BEZIER
}

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_splines_drawing".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final points = rl.Temp.Vector2$.FillInto(key: 'points', MAX_SPLINE_POINTS, (i, v) => switch(i) {
    0 => v.set( 50.0, 400.0),
    1 => v.set(160.0, 220.0),
    2 => v.set(340.0, 380.0),
    3 => v.set(520.0, 60.0),
    4 => v.set(710.0, 260.0),
    _ => null,
  });
  
  final pointsInterleaved = rl.Temp.Vector2$.At('key', 3*(MAX_SPLINE_POINTS - 1) + 1);
  
  int pointCount = 5;
  int selectedPoint = -1;
  int focusedPoint = -1;
  Pointer<Vector2C> selectedControlPoint = nullptr;
  Pointer<Vector2C> focusedControlPoint = nullptr;
  
  List<ControlPoint> control = .generate(MAX_SPLINE_POINTS-1, (i) => ControlPoint(
    start: rl.Temp.Vector2$.At('control_start_$i').set(points[i].x + 50, points[i].y),
    end: rl.Temp.Vector2$.At('control_end_$i').set(points[i + 1].x - 50, points[i + 1].y),
  ));

  final splineThickness = rl.Temp.Float32$.Value(8.0, 'splineThickness');
  SplineType splineTypeActive = .SPLINE_LINEAR;
  final splineType = rl.Temp.Int$.Value(splineTypeActive.index, 'splineType');
  bool splineTypeEditMode = false; 
  final splineHelpersActive = rl.Temp.Bool$.Value(true, 'splineHelpersActive');

  while (!rl.Core.WindowShouldClose())
  {
    final mousePos = rl.Core.GetMousePosition();

    if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_RIGHT.value) && (pointCount < MAX_SPLINE_POINTS))
    {
      points[pointCount] = mousePos;
      int i = pointCount - 1;
      control[i].start.set(points[i].x + 50, points[i].y);
      control[i].end.set(points[i + 1].x - 50, points[i + 1].y);
      pointCount++;
    }

    for (int i = 0; i < pointCount; i++)
    {
      if (rl.Core.CheckCollisionPointCircle(mousePos, points[i], 8.0))
      {
        focusedPoint = i;
        if (rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)) selectedPoint = i; 
        break;
      }
      else focusedPoint = -1;
    }
    
    if (selectedPoint >= 0)
    {
      points[selectedPoint] = mousePos;
      if (rl.Core.IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) selectedPoint = -1;
    }
    
    if ((splineTypeActive == .SPLINE_BEZIER) && (focusedPoint == -1))
    {
      for (int i = 0; i < pointCount - 1; i++)
      {
        if (rl.Core.CheckCollisionPointCircle(mousePos, control[i].start.ref, 6.0))
        {
          focusedControlPoint = control[i].start;
          if (rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)) selectedControlPoint = control[i].start; 
          break;
        }
        else if (rl.Core.CheckCollisionPointCircle(mousePos, control[i].end.ref, 6.0))
        {
          focusedControlPoint = control[i].end;
          if (rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)) selectedControlPoint = control[i].end; 
          break;
        }
        else focusedControlPoint = nullptr;
      }
      
      if (selectedControlPoint != nullptr)
      {
        selectedControlPoint.ref = mousePos;
        if (rl.Core.IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) selectedControlPoint = nullptr;
      }
    }
    
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_ONE.value)) splineTypeActive = .SPLINE_LINEAR;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_TWO.value)) splineTypeActive = .SPLINE_BASIS;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_THREE.value)) splineTypeActive = .SPLINE_CATMULLROM;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_FOUR.value)) splineTypeActive = .SPLINE_BEZIER;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      if (splineTypeActive == .SPLINE_LINEAR)
      {
        rl.Core.DrawSplineLinear(points, pointCount, splineThickness.value, rl.Color.RED);
      }
      else if (splineTypeActive == .SPLINE_BASIS)
      {
        rl.Core.DrawSplineBasis(points, pointCount, splineThickness.value, rl.Color.RED);

        /*
        for (int i = 0; i < (pointCount - 3); i++)
        {
          rl.Core.DrawSplineSegmentBasis(
            points[i], points[i + 1],
            points[i + 2], points[i + 3],
            splineThickness.value, rl.Color.MAROON
          );
        }
        */
      }
      else if (splineTypeActive == .SPLINE_CATMULLROM)
      {
        rl.Core.DrawSplineCatmullRom(points, pointCount, splineThickness.value, rl.Color.RED);
        
        /*
        for (int i = 0; i < (pointCount - 3); i++)
        {
          rl.Core.DrawSplineSegmentCatmullRom(
            points[i], points[i + 1],
            points[i + 2], points[i + 3],
            splineThickness.value, rl.Color.MAROON
          );
        }
        */
      }
      else if (splineTypeActive == .SPLINE_BEZIER)
      {
        for (int i = 0; i < (pointCount - 1); i++) 
        {
          pointsInterleaved[3*i] = points[i];
          pointsInterleaved[3*i + 1] = control[i].start.ref;
          pointsInterleaved[3*i + 2] = control[i].end.ref;
        }
        
        pointsInterleaved[3*(pointCount - 1)] = points[pointCount - 1];

        rl.Core.DrawSplineBezierCubic(pointsInterleaved, 3*(pointCount - 1) + 1, splineThickness.value, rl.Color.RED);
        
        /*
        for (int i = 0; i < 3*(pointCount - 1); i += 3)
        {
          rl.Core.DrawSplineSegmentBezierCubic(
            pointsInterleaved[i], pointsInterleaved[i + 1],
            pointsInterleaved[i + 2], pointsInterleaved[i + 3],
            splineThickness.value, rl.Color.MAROON
          );
        }
        */

        for (int i = 0; i < pointCount - 1; i++)
        {
          final p = control[i];

          rl.Core.DrawCircleV(p.start.ref, 6, rl.Color.GOLD);
          rl.Core.DrawCircleV(p.end.ref, 6, rl.Color.GOLD);
          if (focusedControlPoint == p.start) rl.Core.DrawCircleV(p.start.ref, 8, rl.Color.GREEN);
          else if (focusedControlPoint == p.end) rl.Core.DrawCircleV(p.end.ref, 8, rl.Color.GREEN);
          rl.Core.DrawLineEx(points[i], p.start.ref, 1.0, rl.Color.LIGHTGRAY);
          rl.Core.DrawLineEx(points[i + 1], p.end.ref, 1.0, rl.Color.LIGHTGRAY);
      
          rl.Core.DrawLineV(points[i], p.start.ref, rl.Color.GRAY);
          // rl.Core.DrawLineV(p.start.ref, p.end.ref, rl.Color.LIGHTGRAY);
          rl.Core.DrawLineV(p.end.ref, points[i + 1], rl.Color.GRAY);
        }
      }

      if (splineHelpersActive.value)
      {
        for (int i = 0; i < pointCount; i++)
        {
          rl.Core.DrawCircleLinesV(points[i], (focusedPoint == i) ? 12.0 : 8.0, (focusedPoint == i) ? rl.Color.BLUE : rl.Color.DARKBLUE);
          if (
            (splineTypeActive != .SPLINE_LINEAR) &&
            (splineTypeActive != .SPLINE_BEZIER) &&
            (i < pointCount - 1)
          ) rl.Core.DrawLineV(points[i], points[i + 1], rl.Color.GRAY);

          rl.Core.DrawText(
            "[${points[i].x.toInt()}, ${points[i].y.toInt()}]".toC,
            points[i].x.toInt(), (points[i].y + 10).toInt(), 10, rl.Color.BLACK
          );
        }
      }

      if (splineTypeEditMode) rl.Gui.GuiLock();
      
      rl.Gui.GuiLabel(
        rl.Temp.rect1(12, 62, 140, 24),
        "Spline thickness: ${splineThickness.value}".toC,
      );
      
      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(12, 60 + 24, 140, 16),
        nullptr,
        nullptr,
        splineThickness, 1.0, 40.0
      );

      rl.Gui.GuiCheckBox(
        rl.Temp.rect1(12, 110, 20, 20),
        "Show point helpers".toC,
        splineHelpersActive
      );

      rl.Gui.GuiUnlock();

      rl.Gui.GuiLabel(
        rl.Temp.rect1(12, 10, 140, 24),
        "Spline type:".toC,
      );
      
      if (rl.Gui.GuiDropdownBox(
        rl.Temp.rect1(12, 8 + 24, 140, 28),
        SplineType.values.map((e) => e.name).join(';').toC,
        splineType,
        splineTypeEditMode
      ).toBool()) {
        splineTypeActive = SplineType.values[splineType.value];
        splineTypeEditMode = !splineTypeEditMode;
      }

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}