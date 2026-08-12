// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_textured_curve.c
// Run it: dart run textures_textured_curve.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late TextureC texRoad;
bool showCurve = false;

double curveWidth = 50;
int curveSegments = 24;

late Pointer<Vector2C> curveStartPosition;
late Pointer<Vector2C> curveStartPositionTangent;

late Pointer<Vector2C> curveEndPosition;
late Pointer<Vector2C> curveEndPositionTangent;

Pointer<Vector2C> curveSelectedPoint = nullptr;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(
    ConfigFlags.FLAG_VSYNC_HINT.value |
    ConfigFlags.FLAG_MSAA_4X_HINT.value
  );
  InitWindow(screenWidth, screenHeight, "textures_textured_curve".toC);
  SetTargetFPS(60);

  texRoad = LoadTexture("../resources/road.png".toC);
  SetTextureFilter(texRoad, TextureFilter.TEXTURE_FILTER_BILINEAR.value);

  curveStartPosition = Vector2$.val.At('curveStartPosition').set(80, 100);
  curveStartPositionTangent = Vector2$.val.At('curveStartPositionTangent').set(100, 300);

  curveEndPosition = Vector2$.val.At('curveEndPosition').set(700, 350);
  curveEndPositionTangent = Vector2$.val.At('curveEndPositionTangent').set(600, 100);

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) showCurve = !showCurve;
    if (IsKeyPressed(KeyboardKey.KEY_EQUAL.value)) curveWidth += 2;
    if (IsKeyPressed(KeyboardKey.KEY_MINUS.value)) curveWidth -= 2;
    if (curveWidth < 2) curveWidth = 2;

    if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) curveSegments -= 2;
    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) curveSegments += 2;

    if (curveSegments < 2) curveSegments = 2;

    if (!IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)) curveSelectedPoint = nullptr;

    if (curveSelectedPoint.address != 0) {
      curveSelectedPoint.setD(curveSelectedPoint.toD().add(GetMouseDelta().toD()));
    }

    final mouse = GetMousePosition();
    if (CheckCollisionPointCircle(mouse, curveStartPosition.ref, 6))
      curveSelectedPoint = curveStartPosition;
    else if (CheckCollisionPointCircle(mouse, curveStartPositionTangent.ref, 6))
      curveSelectedPoint = curveStartPositionTangent;
    else if (CheckCollisionPointCircle(mouse, curveEndPosition.ref, 6))
      curveSelectedPoint = curveEndPosition;
    else if (CheckCollisionPointCircle(mouse, curveEndPositionTangent.ref, 6))
      curveSelectedPoint = curveEndPositionTangent;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTexturedCurve();
      
      if (showCurve) DrawSplineSegmentBezierCubic(
        curveStartPosition.ref,
        curveEndPosition.ref,
        curveStartPositionTangent.ref,
        curveEndPositionTangent.ref,
        2,
        BLUE
      );

      DrawLineV(curveStartPosition.ref, curveStartPositionTangent.ref, SKYBLUE);
      DrawLineV(curveStartPositionTangent.ref, curveEndPositionTangent.ref, Fade(LIGHTGRAY, 0.4));
      DrawLineV(curveEndPosition.ref, curveEndPositionTangent.ref, PURPLE);
      
      if (CheckCollisionPointCircle(mouse, curveStartPosition.ref, 6))
        DrawCircleV(curveStartPosition.ref, 7, YELLOW);
      DrawCircleV(curveStartPosition.ref, 5, RED);

      if (CheckCollisionPointCircle(mouse, curveStartPositionTangent.ref, 6))
        DrawCircleV(curveStartPositionTangent.ref, 7, YELLOW);
      DrawCircleV(curveStartPositionTangent.ref, 5, MAROON);

      if (CheckCollisionPointCircle(mouse, curveEndPosition.ref, 6))
        DrawCircleV(curveEndPosition.ref, 7, YELLOW);
      DrawCircleV(curveEndPosition.ref, 5, GREEN);

      if (CheckCollisionPointCircle(mouse, curveEndPositionTangent.ref, 6))
        DrawCircleV(curveEndPositionTangent.ref, 7, YELLOW);
      DrawCircleV(curveEndPositionTangent.ref, 5, DARKGREEN);

      DrawText(
        "Drag points to move curve, press SPACE to show/hide base curve".toC,
        10, 10, 10, DARKGRAY
      );
      DrawText(
        "Curve width: $curveWidth (Use + and - to adjust)".toC,
        10, 30, 10, DARKGRAY
      );
      DrawText(
        "Curve segments: $curveSegments (Use LEFT and RIGHT to adjust)".toC,
        10, 50, 10, DARKGRAY
      );
        
    EndDrawing();
  }

  UnloadTexture(texRoad);

  CloseWindowAndDispose();
}

void DrawTexturedCurve()
{
  final step = 1.0/curveSegments;

  final previous = Vector2$.val.At('previous').setC(curveStartPosition.ref);
  final previousTangent = Vector2$.val.At('previousTangent');
  double previousV = 0;

  bool tangentSet = false;

  final current = Vector2$.val.At('current');
  double t = 0.0;

  for (int i = 1; i <= curveSegments; i++)
  {
    t = step*i;

    final a = math.pow(1.0 - t, 3);
    final b = 3.0*math.pow(1.0 - t, 2)*t;
    final c = 3.0*(1.0 - t)*math.pow(t, 2);
    final d = math.pow(t, 3);

    current.ref.y = a*curveStartPosition.ref.y + b*curveStartPositionTangent.ref.y + c*curveEndPositionTangent.ref.y + d*curveEndPosition.ref.y;
    current.ref.x = a*curveStartPosition.ref.x + b*curveStartPositionTangent.ref.x + c*curveEndPositionTangent.ref.x + d*curveEndPosition.ref.x;

    final delta = Vector2$.val.At('delta').set(
      current.ref.x - previous.ref.x,
      current.ref.y - previous.ref.y
    );

    final normal = Vector2$.val.At('normal').setD(
      .vec2(-delta.ref.y, delta.ref.x).normalize()
    );

    double v = previousV + delta.toD().length;

    if (!tangentSet)
    {
      previousTangent.setC(normal.ref);
      tangentSet = true;
    }

    final prevPosNormal = previous.toD().add(previousTangent.toD().scale(curveWidth));
    final prevNegNormal = previous.toD().add(previousTangent.toD().scale(-curveWidth));

    final currentPosNormal = current.toD().add(normal.toD().scale(curveWidth));
    final currentNegNormal = current.toD().add(normal.toD().scale(-curveWidth));

    rlSetTexture(texRoad.id);
    rlBegin(RlDrawMode.RL_QUADS.value);
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

    previous.setC(current.ref);
    previousTangent.setC(normal.ref);
    previousV = v;
  }
}