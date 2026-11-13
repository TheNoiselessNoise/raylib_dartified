// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_polygon_drawing.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const int MAX_POINTS = 11;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "textures_polygon_drawing");
  SetTargetFPS(60);

  final List<Vector2> texcoords = [
    .vec2(0.75, 0.0),
    .vec2(0.25, 0.0),
    .vec2(0.0, 0.5),
    .vec2(0.0, 0.75),
    .vec2(0.25, 1.0),
    .vec2(0.375, 0.875),
    .vec2(0.625, 0.875),
    .vec2(0.75, 1.0),
    .vec2(1.0, 0.75),
    .vec2(1.0, 0.5),
    .vec2(0.75, 0.0),
  ];

  final List<Vector2> points = .generate(MAX_POINTS, (_) => .zero());
  for (int i = 0; i < MAX_POINTS; i++)
  {
    points[i].x = (texcoords[i].x - 0.5)*256.0;
    points[i].y = (texcoords[i].y - 0.5)*256.0;
  }

  final List<Vector2> positions = .generate(MAX_POINTS, (_) => .zero());
  for (int i = 0; i < MAX_POINTS; i++) {
    positions[i] = points[i];
  }

  final texture = LoadTexture("../resources/cat.png");

  double angle = 0.0;

  rl.setMainLoop(() {
    angle++;
    for (int i = 0; i < MAX_POINTS; i++) {
      positions[i] = points[i].rotate(angle*rl.DEG2RAD);
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText("textured polygon", 20, 20, 20, .DARKGRAY);

      DrawTexturePoly(
        texture,
        .vec2(GetScreenWidth()/2.0, GetScreenHeight()/2.0),
        positions,
        texcoords,
        .WHITE
      );

    EndDrawing();
  });
});

void DrawTexturePoly(Texture texture, Vector2 center, List<Vector2> points, List<Vector2> texcoords, Color tint)
{
  rlSetTexture(texture.id);
  rlBegin(.RL_TRIANGLES);

  rlColor4ub(tint.r, tint.g, tint.b, tint.a);

  for (int i = 0; i < points.length - 1; i++)
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
