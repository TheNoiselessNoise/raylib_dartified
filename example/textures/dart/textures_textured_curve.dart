// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_textured_curve.c
// Run it: dart run textures_textured_curve.dart
// WARNING: expects resources from the raylib source
import 'dart:math' as math;
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late TextureD texRoad;
bool showCurve = false;

double curveWidth = 50;
int curveSegments = 24;

late Vector2D curveStartPosition;
late Vector2D curveStartPositionTangent;

late Vector2D curveEndPosition;
late Vector2D curveEndPositionTangent;

Vector2D? curveSelectedPoint;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_VSYNC_HINT, .FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "textures_textured_curve");
  SetTargetFPS(60);

  texRoad = LoadTexture("../resources/road.png");
  SetTextureFilter(texRoad, .TEXTURE_FILTER_BILINEAR);

  curveStartPosition = .vec2(80, 100);
  curveStartPositionTangent = .vec2(100, 300);

  curveEndPosition = .vec2(700, 350);
  curveEndPositionTangent = .vec2(600, 100);

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(.KEY_SPACE)) showCurve = !showCurve;
    if (IsKeyPressed(.KEY_UP)) curveWidth += 2;
    if (IsKeyPressed(.KEY_DOWN)) curveWidth -= 2;
    if (curveWidth < 2) curveWidth = 2;

    if (IsKeyPressed(.KEY_LEFT)) curveSegments -= 2;
    if (IsKeyPressed(.KEY_RIGHT)) curveSegments += 2;

    if (curveSegments < 2) curveSegments = 2;

    if (!IsMouseButtonDown(.MOUSE_BUTTON_LEFT)) curveSelectedPoint = null;

    if (curveSelectedPoint case Vector2D point) {
      point.setD(point.add(GetMouseDelta()));
    }

    final mouse = GetMousePosition();
    if (CheckCollisionPointCircle(mouse, curveStartPosition, 6))
      curveSelectedPoint = curveStartPosition;
    else if (CheckCollisionPointCircle(mouse, curveStartPositionTangent, 6))
      curveSelectedPoint = curveStartPositionTangent;
    else if (CheckCollisionPointCircle(mouse, curveEndPosition, 6))
      curveSelectedPoint = curveEndPosition;
    else if (CheckCollisionPointCircle(mouse, curveEndPositionTangent, 6))
      curveSelectedPoint = curveEndPositionTangent;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawTexturedCurve();

      if (showCurve) DrawSplineSegmentBezierCubic(
        curveStartPosition,
        curveEndPosition,
        curveStartPositionTangent,
        curveEndPositionTangent,
        2,
        .BLUE
      );

      DrawLineV(curveStartPosition, curveStartPositionTangent, .SKYBLUE);
      DrawLineV(curveStartPositionTangent, curveEndPositionTangent, Fade(.LIGHTGRAY, 0.4));
      DrawLineV(curveEndPosition, curveEndPositionTangent, .PURPLE);
      
      if (CheckCollisionPointCircle(mouse, curveStartPosition, 6))
        DrawCircleV(curveStartPosition, 7, .YELLOW);
      DrawCircleV(curveStartPosition, 5, .RED);

      if (CheckCollisionPointCircle(mouse, curveStartPositionTangent, 6))
        DrawCircleV(curveStartPositionTangent, 7, .YELLOW);
      DrawCircleV(curveStartPositionTangent, 5, .MAROON);

      if (CheckCollisionPointCircle(mouse, curveEndPosition, 6))
        DrawCircleV(curveEndPosition, 7, .YELLOW);
      DrawCircleV(curveEndPosition, 5, .GREEN);

      if (CheckCollisionPointCircle(mouse, curveEndPositionTangent, 6))
        DrawCircleV(curveEndPositionTangent, 7, .YELLOW);
      DrawCircleV(curveEndPositionTangent, 5, .DARKGREEN);

      DrawText(
        "Drag points to move curve, press SPACE to show/hide base curve",
        10, 10, 10, .DARKGRAY
      );
      DrawText(
        "Curve width: $curveWidth (Use UP and DOWN to adjust)",
        10, 30, 10, .DARKGRAY
      );
      DrawText(
        "Curve segments: $curveSegments (Use LEFT and RIGHT to adjust)",
        10, 50, 10, .DARKGRAY
      );
        
    EndDrawing();
  }

  UnloadTexture(texRoad);

  CloseWindowAndDispose();
}

void DrawTexturedCurve()
{
  final step = 1.0/curveSegments;

  Vector2D previous = curveStartPosition.clone();
  Vector2D previousTangent = .zero();
  double previousV = 0;

  bool tangentSet = false;

  final Vector2D current = .zero();
  double t = 0.0;

  for (int i = 1; i <= curveSegments; i++)
  {
    t = step*i;

    final a = math.pow(1.0 - t, 3);
    final b = 3.0*math.pow(1.0 - t, 2)*t;
    final c = 3.0*(1.0 - t)*math.pow(t, 2);
    final d = math.pow(t, 3);

    current.y = a*curveStartPosition.y + b*curveStartPositionTangent.y + c*curveEndPositionTangent.y + d*curveEndPosition.y;
    current.x = a*curveStartPosition.x + b*curveStartPositionTangent.x + c*curveEndPositionTangent.x + d*curveEndPosition.x;

    final Vector2D delta = .vec2(
      current.x - previous.x,
      current.y - previous.y
    );

    final Vector2D normal = .vec2(-delta.y, delta.x).normalize();

    double v = previousV + delta.length;

    if (!tangentSet)
    {
      previousTangent.setD(normal);
      tangentSet = true;
    }

    final prevPosNormal = previous.add(previousTangent.scale(curveWidth));
    final prevNegNormal = previous.add(previousTangent.scale(-curveWidth));

    final currentPosNormal = current.add(normal.scale(curveWidth));
    final currentNegNormal = current.add(normal.scale(-curveWidth));

    rlSetTexture(texRoad.id);
    rlBegin(.RL_QUADS);
      rlColor4ub(255,255,255,255);
      rlNormal3f(0.0, 0.0, 1.0);

      rlTexCoord2f(0, previousV);
      rlVertex2f(prevNegNormal.x, prevNegNormal.y);

      rlTexCoord2f(1, previousV);
      rlVertex2f(prevPosNormal.x, prevPosNormal.y);

      rlTexCoord2f(1, v);
      rlVertex2f(currentPosNormal.x, currentPosNormal.y);

      rlTexCoord2f(0, v);
      rlVertex2f(currentNegNormal.x, currentNegNormal.y);
    rlEnd();

    previous.setD(current);
    previousTangent.setD(normal);
    previousV = v;
  }
}