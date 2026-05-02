// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_splines_drawing.c
// Run it: dart run shapes_splines_drawing.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_SPLINE_POINTS = 21;

class ControlPoint {
  Vector2D start;
  Vector2D end;

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
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_splines_drawing");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final List<Vector2D> points = List.generate(MAX_SPLINE_POINTS, (i) => switch(i) {
    0 => .vec2( 50.0, 400.0),
    1 => .vec2(160.0, 220.0),
    2 => .vec2(340.0, 380.0),
    3 => .vec2(520.0, 60.0),
    4 => .vec2(710.0, 260.0),
    _ => .zero(),
  });
  
  final List<Vector2D> pointsInterleaved = List.generate(
    3*(MAX_SPLINE_POINTS - 1) + 1, (_) => .zero()
  );
  
  int pointCount = 5;
  int selectedPoint = -1;
  int focusedPoint = -1;
  Vector2D? selectedControlPoint;
  Vector2D? focusedControlPoint;
  
  List<ControlPoint> control = List.generate(MAX_SPLINE_POINTS-1, (i) => ControlPoint(
    start: .vec2(points[i].x + 50, points[i].y),
    end: .vec2(points[i + 1].x - 50, points[i + 1].y),
  ));

  double splineThickness = 8.0;
  SplineType splineTypeActive = .SPLINE_LINEAR;
  bool splineTypeEditMode = false; 
  bool splineHelpersActive = true;

  while (!rl.CoreD.WindowShouldClose())
  {
    final mousePos = rl.CoreD.GetMousePosition();

    if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT) && (pointCount < MAX_SPLINE_POINTS))
    {
      points[pointCount] = mousePos;
      int i = pointCount - 1;
      control[i].start.set(points[i].x + 50, points[i].y);
      control[i].end.set(points[i + 1].x - 50, points[i + 1].y);
      pointCount++;
    }

    for (int i = 0; i < pointCount; i++)
    {
      if (rl.CoreD.CheckCollisionPointCircle(mousePos, points[i], 8.0))
      {
        focusedPoint = i;
        if (rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT)) selectedPoint = i; 
        break;
      }
      else focusedPoint = -1;
    }
    
    if (selectedPoint >= 0)
    {
      points[selectedPoint] = mousePos;
      if (rl.CoreD.IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) selectedPoint = -1;
    }
    
    if ((splineTypeActive == .SPLINE_BEZIER) && (focusedPoint == -1))
    {
      for (int i = 0; i < pointCount - 1; i++)
      {
        if (rl.CoreD.CheckCollisionPointCircle(mousePos, control[i].start, 6.0))
        {
          focusedControlPoint = control[i].start;
          if (rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT)) selectedControlPoint = control[i].start; 
          break;
        }
        else if (rl.CoreD.CheckCollisionPointCircle(mousePos, control[i].end, 6.0))
        {
          focusedControlPoint = control[i].end;
          if (rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT)) selectedControlPoint = control[i].end; 
          break;
        }
        else focusedControlPoint = null;
      }
      
      if (selectedControlPoint != null)
      {
        selectedControlPoint.setD(mousePos);
        if (rl.CoreD.IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) selectedControlPoint = null;
      }
    }
    
    if (rl.CoreD.IsKeyPressed(.KEY_ONE)) splineTypeActive = .SPLINE_LINEAR;
    else if (rl.CoreD.IsKeyPressed(.KEY_TWO)) splineTypeActive = .SPLINE_BASIS;
    else if (rl.CoreD.IsKeyPressed(.KEY_THREE)) splineTypeActive = .SPLINE_CATMULLROM;
    else if (rl.CoreD.IsKeyPressed(.KEY_FOUR)) splineTypeActive = .SPLINE_BEZIER;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      final currentPoints = points.take(pointCount).toList();

      if (splineTypeActive == .SPLINE_LINEAR)
      {
        rl.CoreD.DrawSplineLinear(currentPoints, splineThickness, .RED);
      }
      else if (splineTypeActive == .SPLINE_BASIS)
      {
        rl.CoreD.DrawSplineBasis(currentPoints, splineThickness, .RED);

        /*
        for (int i = 0; i < (pointCount - 3); i++)
        {
          rl.CoreD.DrawSplineSegmentBasis(
            points[i], points[i + 1],
            points[i + 2], points[i + 3],
            splineThickness, .MAROON
          );
        }
        */
      }
      else if (splineTypeActive == .SPLINE_CATMULLROM)
      {
        rl.CoreD.DrawSplineCatmullRom(currentPoints, splineThickness, .RED);
        
        /*
        for (int i = 0; i < (pointCount - 3); i++)
        {
          rl.CoreD.DrawSplineSegmentCatmullRom(
            points[i], points[i + 1],
            points[i + 2], points[i + 3],
            splineThickness, .MAROON
          );
        }
        */
      }
      else if (splineTypeActive == .SPLINE_BEZIER)
      {
        for (int i = 0; i < (pointCount - 1); i++) 
        {
          pointsInterleaved[3*i] = points[i];
          pointsInterleaved[3*i + 1] = control[i].start;
          pointsInterleaved[3*i + 2] = control[i].end;
        }
        
        pointsInterleaved[3*(pointCount - 1)] = points[pointCount - 1];

        final currentPointsInterleaved = pointsInterleaved.take(3*pointCount).toList();

        rl.CoreD.DrawSplineBezierCubic(currentPointsInterleaved, splineThickness, .RED);
        
        /*
        for (int i = 0; i < 3*(pointCount - 1); i += 3)
        {
          rl.CoreD.DrawSplineSegmentBezierCubic(
            pointsInterleaved[i], pointsInterleaved[i + 1],
            pointsInterleaved[i + 2], pointsInterleaved[i + 3],
            splineThickness, .MAROON
          );
        }
        */

        for (int i = 0; i < pointCount - 1; i++)
        {
          final p = control[i];

          rl.CoreD.DrawCircleV(p.start, 6, .GOLD);
          rl.CoreD.DrawCircleV(p.end, 6, .GOLD);
          if (focusedControlPoint == p.start) rl.CoreD.DrawCircleV(p.start, 8, .GREEN);
          else if (focusedControlPoint == p.end) rl.CoreD.DrawCircleV(p.end, 8, .GREEN);
          rl.CoreD.DrawLineEx(points[i], p.start, 1.0, .LIGHTGRAY);
          rl.CoreD.DrawLineEx(points[i + 1], p.end, 1.0, .LIGHTGRAY);
      
          rl.CoreD.DrawLineV(points[i], p.start, .GRAY);
          // rl.CoreD.DrawLineV(p.start, p.end, .LIGHTGRAY);
          rl.CoreD.DrawLineV(p.end, points[i + 1], .GRAY);
        }
      }

      if (splineHelpersActive)
      {
        for (int i = 0; i < pointCount; i++)
        {
          rl.CoreD.DrawCircleLinesV(points[i], (focusedPoint == i) ? 12.0 : 8.0, (focusedPoint == i) ? .BLUE : .DARKBLUE);
          if (
            (splineTypeActive != .SPLINE_LINEAR) &&
            (splineTypeActive != .SPLINE_BEZIER) &&
            (i < pointCount - 1)
          ) rl.CoreD.DrawLineV(points[i], points[i + 1], .GRAY);

          rl.CoreD.DrawText(
            "[${points[i].x.toInt()}, ${points[i].y.toInt()}]",
            points[i].x.toInt(), (points[i].y + 10).toInt(), 10, .BLACK
          );
        }
      }

      if (splineTypeEditMode) rl.GuiD.GuiLock();
      
      rl.GuiD.GuiLabel(
        .rect(12, 62, 140, 24),
        "Spline thickness: $splineThickness"
      );
      
      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(12, 60 + 24, 140, 16),
          null,
          null,
          splineThickness, 1.0, 40.0
        );
        splineThickness = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiCheckBox(
          .rect(12, 110, 20, 20),
          "Show point helpers",
          splineHelpersActive
        );
        splineHelpersActive = newValue;
      }

      rl.GuiD.GuiUnlock();

      rl.GuiD.GuiLabel(
        .rect(12, 10, 140, 24),
        "Spline type:"
      );
      
      {
        final (result, splineTypeIndex) = rl.GuiD.GuiDropdownBox(
          .rect(12, 8 + 24, 140, 28),
          SplineType.values.map((e) => e.name).join(';'),
          splineTypeActive.index,
          splineTypeEditMode
        );

        if (result.toBool()) {
          splineTypeActive = SplineType.values[splineTypeIndex];
          splineTypeEditMode = !splineTypeEditMode;
        }
      }

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}