// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_polygon_drawing.c
// Run it: dart run textures_polygon_drawing.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const int MAX_POINTS = 11;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_polygon_drawing");
  SetTargetFPS(60);

  final List<Vector2D> texcoords = [
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

  final List<Vector2D> points = .generate(MAX_POINTS, (_) => .zero());
  for (int i = 0; i < MAX_POINTS; i++)
  {
    points[i].x = (texcoords[i].x - 0.5)*256.0;
    points[i].y = (texcoords[i].y - 0.5)*256.0;
  }

  final List<Vector2D> positions = .generate(MAX_POINTS, (_) => .zero());
  for (int i = 0; i < MAX_POINTS; i++) {
    positions[i] = points[i];
  }

  final texture = LoadTexture("../resources/cat.png");

  double angle = 0.0;

  while (!WindowShouldClose())
  {
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
  }

  UnloadTexture(texture);

  CloseWindowAndDispose();
}

void DrawTexturePoly(TextureD texture, Vector2D center, List<Vector2D> points, List<Vector2D> texcoords, ColorD tint)
{
  rl.Rlgl.rlSetTexture(texture.id);
  rl.Rlgl.rlBegin(RlDrawMode.RL_TRIANGLES.value);

  rl.Rlgl.rlColor4ub(tint.r, tint.g, tint.b, tint.a);

  for (int i = 0; i < points.length - 1; i++)
  {
    rl.Rlgl.rlTexCoord2f(0.5, 0.5);
    rl.Rlgl.rlVertex2f(center.x, center.y);

    rl.Rlgl.rlTexCoord2f(texcoords[i].x, texcoords[i].y);
    rl.Rlgl.rlVertex2f(points[i].x + center.x, points[i].y + center.y);

    rl.Rlgl.rlTexCoord2f(texcoords[i + 1].x, texcoords[i + 1].y);
    rl.Rlgl.rlVertex2f(points[i + 1].x + center.x, points[i + 1].y + center.y);
  }

  rl.Rlgl.rlEnd();

  rl.Rlgl.rlSetTexture(0);
}
