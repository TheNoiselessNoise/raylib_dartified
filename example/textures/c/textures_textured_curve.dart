// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_textured_curve.c
// Run it: dart run textures_textured_curve.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import '../../base.dart';

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
  final rl = loadBaseRaylib();

  rl.Core.SetConfigFlags(
    ConfigFlags.FLAG_VSYNC_HINT.value |
    ConfigFlags.FLAG_MSAA_4X_HINT.value
  );
  rl.Core.InitWindow(screenWidth, screenHeight, "textures_textured_curve".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  texRoad = rl.Core.LoadTexture("../resources/road.png".toC);
  rl.Core.SetTextureFilter(texRoad, TextureFilter.TEXTURE_FILTER_BILINEAR.value);

  curveStartPosition = rl.Temp.Vector2$.At('curveStartPosition').set(80, 100);
  curveStartPositionTangent = rl.Temp.Vector2$.At('curveStartPositionTangent').set(100, 300);

  curveEndPosition = rl.Temp.Vector2$.At('curveEndPosition').set(700, 350);
  curveEndPositionTangent = rl.Temp.Vector2$.At('curveEndPositionTangent').set(600, 100);

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value)) showCurve = !showCurve;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_EQUAL.value)) curveWidth += 2;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_MINUS.value)) curveWidth -= 2;
    if (curveWidth < 2) curveWidth = 2;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_LEFT.value)) curveSegments -= 2;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) curveSegments += 2;

    if (curveSegments < 2) curveSegments = 2;

    if (!rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)) curveSelectedPoint = nullptr;

    if (curveSelectedPoint.address != 0) {
      curveSelectedPoint.ref.add(rl.Core.GetMouseDelta());
    }

    final mouse = rl.Core.GetMousePosition();
    if (rl.Core.CheckCollisionPointCircle(mouse, curveStartPosition.ref, 6))
      curveSelectedPoint = curveStartPosition;
    else if (rl.Core.CheckCollisionPointCircle(mouse, curveStartPositionTangent.ref, 6))
      curveSelectedPoint = curveStartPositionTangent;
    else if (rl.Core.CheckCollisionPointCircle(mouse, curveEndPosition.ref, 6))
      curveSelectedPoint = curveEndPosition;
    else if (rl.Core.CheckCollisionPointCircle(mouse, curveEndPositionTangent.ref, 6))
      curveSelectedPoint = curveEndPositionTangent;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      DrawTexturedCurve(rl);
      
      if (showCurve) rl.Core.DrawSplineSegmentBezierCubic(
        curveStartPosition.ref,
        curveEndPosition.ref,
        curveStartPositionTangent.ref,
        curveEndPositionTangent.ref,
        2,
        rl.C.BLUE
      );

      rl.Core.DrawLineV(curveStartPosition.ref, curveStartPositionTangent.ref, rl.C.SKYBLUE);
      rl.Core.DrawLineV(curveStartPositionTangent.ref, curveEndPositionTangent.ref, rl.Core.Fade(rl.C.LIGHTGRAY, 0.4));
      rl.Core.DrawLineV(curveEndPosition.ref, curveEndPositionTangent.ref, rl.C.PURPLE);
      
      if (rl.Core.CheckCollisionPointCircle(mouse, curveStartPosition.ref, 6))
        rl.Core.DrawCircleV(curveStartPosition.ref, 7, rl.C.YELLOW);
      rl.Core.DrawCircleV(curveStartPosition.ref, 5, rl.C.RED);

      if (rl.Core.CheckCollisionPointCircle(mouse, curveStartPositionTangent.ref, 6))
        rl.Core.DrawCircleV(curveStartPositionTangent.ref, 7, rl.C.YELLOW);
      rl.Core.DrawCircleV(curveStartPositionTangent.ref, 5, rl.C.MAROON);

      if (rl.Core.CheckCollisionPointCircle(mouse, curveEndPosition.ref, 6))
        rl.Core.DrawCircleV(curveEndPosition.ref, 7, rl.C.YELLOW);
      rl.Core.DrawCircleV(curveEndPosition.ref, 5, rl.C.GREEN);

      if (rl.Core.CheckCollisionPointCircle(mouse, curveEndPositionTangent.ref, 6))
        rl.Core.DrawCircleV(curveEndPositionTangent.ref, 7, rl.C.YELLOW);
      rl.Core.DrawCircleV(curveEndPositionTangent.ref, 5, rl.C.DARKGREEN);

      rl.Core.DrawText(
        "Drag points to move curve, press SPACE to show/hide base curve".toC,
        10, 10, 10, rl.C.DARKGRAY
      );
      rl.Core.DrawText(
        "Curve width: $curveWidth (Use + and - to adjust)".toC,
        10, 30, 10, rl.C.DARKGRAY
      );
      rl.Core.DrawText(
        "Curve segments: $curveSegments (Use LEFT and RIGHT to adjust)".toC,
        10, 50, 10, rl.C.DARKGRAY
      );
        
    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texRoad);

  rl.CloseWindowAndDispose();
}

void DrawTexturedCurve(Raylib rl)
{
  final step = 1.0/curveSegments;

  final previous = rl.Temp.Vector2$.At('previous').setC(curveStartPosition.ref);
  final previousTangent = rl.Temp.Vector2$.At('previousTangent');
  double previousV = 0;

  bool tangentSet = false;

  final current = rl.Temp.Vector2$.At('current');
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

    final delta = rl.Temp.Vector2$.At('delta').set(
      current.ref.x - previous.ref.x,
      current.ref.y - previous.ref.y
    );

    final normal = rl.Temp.Vector2$.At('normal').setD(
      .vec2(-delta.ref.y, delta.ref.x).normalize()
    );

    double v = previousV + delta.length;

    if (!tangentSet)
    {
      previousTangent.setC(normal.ref);
      tangentSet = true;
    }

    final prevPosNormal = previous.toD().add(previousTangent.toD().scale(curveWidth));
    final prevNegNormal = previous.toD().add(previousTangent.toD().scale(-curveWidth));

    final currentPosNormal = current.toD().add(normal.toD().scale(curveWidth));
    final currentNegNormal = current.toD().add(normal.toD().scale(-curveWidth));

    rl.Rlgl.rlSetTexture(texRoad.id);
    rl.Rlgl.rlBegin(RlDrawMode.RL_QUADS.value);
      rl.Rlgl.rlColor4ub(255,255,255,255);
      rl.Rlgl.rlNormal3f(0.0, 0.0, 1.0);

      rl.Rlgl.rlTexCoord2f(0, previousV);
      rl.Rlgl.rlVertex2f(prevNegNormal.x, prevNegNormal.y);

      rl.Rlgl.rlTexCoord2f(1, previousV);
      rl.Rlgl.rlVertex2f(prevPosNormal.x, prevPosNormal.y);

      rl.Rlgl.rlTexCoord2f(1, v);
      rl.Rlgl.rlVertex2f(currentPosNormal.x, currentPosNormal.y);

      rl.Rlgl.rlTexCoord2f(0, v);
      rl.Rlgl.rlVertex2f(currentNegNormal.x, currentNegNormal.y);
    rl.Rlgl.rlEnd();

    previous.setC(current.ref);
    previousTangent.setC(normal.ref);
    previousV = v;
  }
}