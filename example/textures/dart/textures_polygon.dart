// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_polygon.c
// Run it: dart run textures_polygon.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_polygon");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

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

  final List<Vector2D> points = .generate(texcoords.length, (i) => .vec2(
    (texcoords[i].x - 0.5)*256.0,
    (texcoords[i].y - 0.5)*256.0,
  ));

  final positions = points.map((p) => p.clone()).toList();

  final texture = rl.CoreD.LoadTexture("../resources/cat.png");

  double angle = 0.0;

  while (!rl.CoreD.WindowShouldClose())
  {
    angle++;
    for (int i = 0; i < texcoords.length; i++) {
      positions[i] = points[i].rotate(angle*rl.DEG2RAD);
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText(
        "textured polygon",
        20, 20, 20, .DARKGRAY
      );

      DrawTexturePoly(
        rl,
        texture,
        .vec2(
          rl.CoreD.GetScreenWidth()/2.0,
          rl.CoreD.GetScreenHeight()/2.0
        ),
        positions,
        texcoords,
        .WHITE
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texture);

  rl.CloseWindowAndDispose();
}

void DrawTexturePoly(
  Raylib rl,
  TextureD texture,
  Vector2D center,
  List<Vector2D> points,
  List<Vector2D> texcoords,
  ColorD tint
) {
  rl.RlglD.rlSetTexture(texture.id);

  rl.RlglD.rlBegin(.RL_QUADS);

    rl.RlglD.rlColor4ub(tint.r, tint.g, tint.b, tint.a);

    for (int i = 0; i < points.length - 1; i++)
    {
      rl.RlglD.rlTexCoord2f(0.5, 0.5);
      rl.RlglD.rlVertex2f(center.x, center.y);

      rl.RlglD.rlTexCoord2f(texcoords[i].x, texcoords[i].y);
      rl.RlglD.rlVertex2f(points[i].x + center.x, points[i].y + center.y);

      rl.RlglD.rlTexCoord2f(texcoords[i + 1].x, texcoords[i + 1].y);
      rl.RlglD.rlVertex2f(points[i + 1].x + center.x, points[i + 1].y + center.y);

      rl.RlglD.rlTexCoord2f(texcoords[i + 1].x, texcoords[i + 1].y);
      rl.RlglD.rlVertex2f(points[i + 1].x + center.x, points[i + 1].y + center.y);
    }

  rl.RlglD.rlEnd();

  rl.RlglD.rlSetTexture(0);
}
