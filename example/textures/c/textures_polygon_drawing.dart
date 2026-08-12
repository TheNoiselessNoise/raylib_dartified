// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_polygon_drawing.c
// Run it: dart run textures_polygon_drawing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const int MAX_POINTS = 11;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_polygon_drawing".toC);
  SetTargetFPS(60);

  final texcoords = Vector2$.val.At('texcoords', MAX_POINTS);
  texcoords[0].set(0.75, 0.0);
  texcoords[1].set(0.25, 0.0);
  texcoords[2].set(0.0, 0.5);
  texcoords[3].set(0.0, 0.75);
  texcoords[4].set(0.25, 1.0);
  texcoords[5].set(0.375, 0.875);
  texcoords[6].set(0.625, 0.875);
  texcoords[7].set(0.75, 1.0);
  texcoords[8].set(1.0, 0.75);
  texcoords[9].set(1.0, 0.5);
  texcoords[10].set(0.75, 0.0);

  final points = Vector2$.val.At('points', MAX_POINTS);
  for (int i = 0; i < MAX_POINTS; i++)
  {
    points[i].x = (texcoords[i].x - 0.5)*256.0;
    points[i].y = (texcoords[i].y - 0.5)*256.0;
  }

  final positions = Vector2$.val.At('positions', MAX_POINTS);
  for (int i = 0; i < MAX_POINTS; i++) {
    positions[i] = points[i];
  }

  final texture = LoadTexture("../resources/cat.png".toC);

  double angle = 0.0;

  while (!WindowShouldClose())
  {
    angle++;
    for (int i = 0; i < MAX_POINTS; i++) {
      positions[i].setD(points[i].toD().rotate(angle*rl.DEG2RAD));
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText("textured polygon".toC, 20, 20, 20, DARKGRAY);

      DrawTexturePoly(
        texture,
        Vector2$.val.$1.set(GetScreenWidth()/2.0, GetScreenHeight()/2.0),
        positions,
        texcoords,
        MAX_POINTS,
        WHITE
      );

    EndDrawing();
  }

  UnloadTexture(texture);

  CloseWindowAndDispose();
}

void DrawTexturePoly(TextureC texture, Vector2C center, Pointer<Vector2C> points, Pointer<Vector2C> texcoords, int pointCount, ColorC tint)
{
  rlSetTexture(texture.id);
  rlBegin(RlDrawMode.RL_TRIANGLES.value);

  rlColor4ub(tint.r, tint.g, tint.b, tint.a);

  for (int i = 0; i < pointCount - 1; i++)
  {
    rlTexCoord2f(0.5, 0.5);
    rlVertex2f(center.x, center.y);

    rlTexCoord2f(texcoords[i].x, texcoords[i].y);
    rlVertex2f(points[i].x + center.x, points[i].y + center.y);

    rlTexCoord2f(texcoords[i + 1].x, texcoords[i + 1].y);
    rlVertex2f(points[i + 1].x + center.x, points[i + 1].y + center.y);
  }

  rlEnd();

  rlSetTexture(0);
}
