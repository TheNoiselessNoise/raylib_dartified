// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_polygon.c
// Run it: dart run textures_polygon.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_POINTS = 11;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_polygon".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final texcoords = rl.Temp.Vector2$.FillInto(key: 'texcoords', MAX_POINTS, (i, v) => switch(i) {
    0 => v.set(0.75, 0.0),
    1 => v.set(0.25, 0.0),
    2 => v.set(0.0, 0.5),
    3 => v.set(0.0, 0.75),
    4 => v.set(0.25, 1.0),
    5 => v.set(0.375, 0.875),
    6 => v.set(0.625, 0.875),
    7 => v.set(0.75, 1.0),
    8 => v.set(1.0, 0.75),
    9 => v.set(1.0, 0.5),
    10 => v.set(0.75, 0.0),
    _ => throw Exception('Unreachable'),
  });

  final points = rl.Temp.Vector2$.FillInto(key: 'points', MAX_POINTS, (i, v) => v.set(
    (texcoords[i].x - 0.5)*256.0,
    (texcoords[i].y - 0.5)*256.0,
  ));

  final positions = rl.Temp.Vector2$.Copy(key: 'positions', points, MAX_POINTS);

  final texture = rl.Core.LoadTexture("../resources/cat.png".toC);

  double angle = 0.0;

  while (!rl.Core.WindowShouldClose())
  {
    angle++;
    for (int i = 0; i < MAX_POINTS; i++) {
      positions[i].setD(points[i].toD().rotate(angle*rl.DEG2RAD));
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.DrawText(
        "textured polygon".toC,
        20, 20, 20, rl.C.DARKGRAY
      );

      DrawTexturePoly(
        rl,
        texture,
        rl.Temp.Vector2$.At('center').set(
          rl.Core.GetScreenWidth()/2.0,
          rl.Core.GetScreenHeight()/2.0
        ).ref,
        positions,
        texcoords,
        MAX_POINTS,
        rl.C.WHITE
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texture);

  rl.CloseWindowAndDispose();
}

void DrawTexturePoly(
  Raylib rl,
  TextureC texture,
  Vector2C center,
  Pointer<Vector2C> points,
  Pointer<Vector2C> texcoords,
  int pointCount,
  ColorC tint
) {
  rl.Rlgl.rlSetTexture(texture.id);

  rl.Rlgl.rlBegin(RlDrawMode.RL_QUADS.value);

    rl.Rlgl.rlColor4ub(tint.r, tint.g, tint.b, tint.a);

    for (int i = 0; i < pointCount - 1; i++)
    {
      rl.Rlgl.rlTexCoord2f(0.5, 0.5);
      rl.Rlgl.rlVertex2f(center.x, center.y);

      rl.Rlgl.rlTexCoord2f(texcoords[i].x, texcoords[i].y);
      rl.Rlgl.rlVertex2f(points[i].x + center.x, points[i].y + center.y);

      rl.Rlgl.rlTexCoord2f(texcoords[i + 1].x, texcoords[i + 1].y);
      rl.Rlgl.rlVertex2f(points[i + 1].x + center.x, points[i + 1].y + center.y);

      rl.Rlgl.rlTexCoord2f(texcoords[i + 1].x, texcoords[i + 1].y);
      rl.Rlgl.rlVertex2f(points[i + 1].x + center.x, points[i + 1].y + center.y);
    }

  rl.Rlgl.rlEnd();

  rl.Rlgl.rlSetTexture(0);
}
