// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_splines_drawing.c
// Run it: dart run shapes_splines_drawing.dart
import '../../base_dart.dart';

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
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shapes_splines_drawing");
  SetTargetFPS(60);

  final List<Vector2D> points = .generate(MAX_SPLINE_POINTS, (i) => switch(i) {
    0 => .vec2( 50.0, 400.0),
    1 => .vec2(160.0, 220.0),
    2 => .vec2(340.0, 380.0),
    3 => .vec2(520.0, 60.0),
    4 => .vec2(710.0, 260.0),
    _ => .zero(),
  });
  
  final List<Vector2D> pointsInterleaved = .generate(
    3*(MAX_SPLINE_POINTS - 1) + 1, (_) => .zero()
  );
  
  int pointCount = 5;
  int selectedPoint = -1;
  int focusedPoint = -1;
  Vector2D? selectedControlPoint;
  Vector2D? focusedControlPoint;
  
  List<ControlPoint> control = .generate(MAX_SPLINE_POINTS-1, (i) => ControlPoint(
    start: .vec2(points[i].x + 50, points[i].y),
    end: .vec2(points[i + 1].x - 50, points[i + 1].y),
  ));

  double splineThickness = 8.0;
  SplineType splineTypeActive = .SPLINE_LINEAR;
  bool splineTypeEditMode = false; 
  bool splineHelpersActive = true;

  while (!WindowShouldClose())
  {
    final mousePos = GetMousePosition();

    if (IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT) && (pointCount < MAX_SPLINE_POINTS))
    {
      points[pointCount] = mousePos;
      int i = pointCount - 1;
      control[i].start.set(points[i].x + 50, points[i].y);
      control[i].end.set(points[i + 1].x - 50, points[i + 1].y);
      pointCount++;
    }

    for (int i = 0; i < pointCount; i++)
    {
      if (CheckCollisionPointCircle(mousePos, points[i], 8.0))
      {
        focusedPoint = i;
        if (IsMouseButtonDown(.MOUSE_BUTTON_LEFT)) selectedPoint = i; 
        break;
      }
      else focusedPoint = -1;
    }
    
    if (selectedPoint >= 0)
    {
      points[selectedPoint] = mousePos;
      if (IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) selectedPoint = -1;
    }
    
    if ((splineTypeActive == .SPLINE_BEZIER) && (focusedPoint == -1))
    {
      for (int i = 0; i < pointCount - 1; i++)
      {
        if (CheckCollisionPointCircle(mousePos, control[i].start, 6.0))
        {
          focusedControlPoint = control[i].start;
          if (IsMouseButtonDown(.MOUSE_BUTTON_LEFT)) selectedControlPoint = control[i].start; 
          break;
        }
        else if (CheckCollisionPointCircle(mousePos, control[i].end, 6.0))
        {
          focusedControlPoint = control[i].end;
          if (IsMouseButtonDown(.MOUSE_BUTTON_LEFT)) selectedControlPoint = control[i].end; 
          break;
        }
        else focusedControlPoint = null;
      }
      
      if (selectedControlPoint != null)
      {
        selectedControlPoint.setDart(mousePos);
        if (IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) selectedControlPoint = null;
      }
    }
    
    if (IsKeyPressed(.KEY_ONE)) splineTypeActive = .SPLINE_LINEAR;
    else if (IsKeyPressed(.KEY_TWO)) splineTypeActive = .SPLINE_BASIS;
    else if (IsKeyPressed(.KEY_THREE)) splineTypeActive = .SPLINE_CATMULLROM;
    else if (IsKeyPressed(.KEY_FOUR)) splineTypeActive = .SPLINE_BEZIER;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      final currentPoints = points.take(pointCount).toList();

      if (splineTypeActive == .SPLINE_LINEAR)
      {
        DrawSplineLinear(currentPoints, splineThickness, .RED);
      }
      else if (splineTypeActive == .SPLINE_BASIS)
      {
        DrawSplineBasis(currentPoints, splineThickness, .RED);

        /*
        for (int i = 0; i < (pointCount - 3); i++)
        {
          DrawSplineSegmentBasis(
            points[i], points[i + 1],
            points[i + 2], points[i + 3],
            splineThickness, .MAROON
          );
        }
        */
      }
      else if (splineTypeActive == .SPLINE_CATMULLROM)
      {
        DrawSplineCatmullRom(currentPoints, splineThickness, .RED);
        
        /*
        for (int i = 0; i < (pointCount - 3); i++)
        {
          DrawSplineSegmentCatmullRom(
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

        DrawSplineBezierCubic(currentPointsInterleaved, splineThickness, .RED);
        
        /*
        for (int i = 0; i < 3*(pointCount - 1); i += 3)
        {
          DrawSplineSegmentBezierCubic(
            pointsInterleaved[i], pointsInterleaved[i + 1],
            pointsInterleaved[i + 2], pointsInterleaved[i + 3],
            splineThickness, .MAROON
          );
        }
        */

        for (int i = 0; i < pointCount - 1; i++)
        {
          final p = control[i];

          DrawCircleV(p.start, 6, .GOLD);
          DrawCircleV(p.end, 6, .GOLD);
          if (focusedControlPoint == p.start) DrawCircleV(p.start, 8, .GREEN);
          else if (focusedControlPoint == p.end) DrawCircleV(p.end, 8, .GREEN);
          DrawLineEx(points[i], p.start, 1.0, .LIGHTGRAY);
          DrawLineEx(points[i + 1], p.end, 1.0, .LIGHTGRAY);
      
          DrawLineV(points[i], p.start, .GRAY);
          // DrawLineV(p.start, p.end, .LIGHTGRAY);
          DrawLineV(p.end, points[i + 1], .GRAY);
        }
      }

      if (splineHelpersActive)
      {
        for (int i = 0; i < pointCount; i++)
        {
          DrawCircleLinesV(points[i], (focusedPoint == i) ? 12.0 : 8.0, (focusedPoint == i) ? .BLUE : .DARKBLUE);
          if (
            (splineTypeActive != .SPLINE_LINEAR) &&
            (splineTypeActive != .SPLINE_BEZIER) &&
            (i < pointCount - 1)
          ) DrawLineV(points[i], points[i + 1], .GRAY);

          DrawText(
            "[${points[i].x.toInt()}, ${points[i].y.toInt()}]",
            points[i].x.toInt(), (points[i].y + 10).toInt(), 10, .BLACK
          );
        }
      }

      if (splineTypeEditMode) GuiLock();
      
      GuiLabel(
        .rect(12, 62, 140, 24),
        "Spline thickness: $splineThickness"
      );
      
      (_, splineThickness) = GuiSliderBar(
        .rect(12, 60 + 24, 140, 16),
        null,
        null,
        splineThickness, 1.0, 40.0
      );

      (_, splineHelpersActive) = GuiCheckBox(
        .rect(12, 110, 20, 20),
        "Show point helpers",
        splineHelpersActive
      );

      GuiUnlock();

      GuiLabel(
        .rect(12, 10, 140, 24),
        "Spline type:"
      );
      
      {
        final (result, splineTypeIndex) = GuiDropdownBox(
          .rect(12, 8 + 24, 140, 28),
          SplineType.values.map((e) => e.name).join(';'),
          splineTypeActive.index,
          splineTypeEditMode
        );

        if (result != .RESULT_NONE) {
          splineTypeActive = SplineType.values[splineTypeIndex];
          splineTypeEditMode = !splineTypeEditMode;
        }
      }

    EndDrawing();
  }

  CloseWindowAndDispose();
}