// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rectangle_advanced.c
// Run it: dart run shapes_rectangle_advanced.dart
import '../../base_dart.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;
const bool SUPPORT_QUADS_DRAW_MODE = true;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_rectangle_advanced");
  SetTargetFPS(60);

  while (!WindowShouldClose())
  {
    final width = GetScreenWidth()/2.0, height = GetScreenHeight()/6.0;
    
    final RectangleD rec = .rect(
      GetScreenWidth() / 2.0 - width/2,
      GetScreenHeight() / 2.0 - 5*(height/2),
      width, height
    );

    BeginDrawing();
      ClearBackground(.RAYWHITE);

      DrawRectangleRoundedGradientH(rec, 0.8, 0.8, 36, .BLUE, .RED);

      rec.y += rec.height + 1;
      DrawRectangleRoundedGradientH(rec, 0.5, 1.0, 36, .RED, .PINK);

      rec.y += rec.height + 1;
      DrawRectangleRoundedGradientH(rec, 1.0, 0.5, 36, .RED, .BLUE);

      rec.y += rec.height + 1;
      DrawRectangleRoundedGradientH(rec, 0.0, 1.0, 36, .BLUE, .BLACK);

      rec.y += rec.height + 1;
      DrawRectangleRoundedGradientH(rec, 1.0, 0.0, 36, .BLUE, .PINK);
    EndDrawing();
  }

  CloseWindowAndDispose();
}

void DrawRectangleRoundedGradientH(
  RectangleD rec,
  double roundnessLeft,
  double roundnessRight,
  int segments,
  ColorD left,
  ColorD right,
) {
  if ((roundnessLeft <= 0.0 && roundnessRight <= 0.0) || (rec.width < 1) || (rec.height < 1 ))
  {
    DrawRectangleGradientEx(rec, left, left, right, right);
    return;
  }

  if (roundnessLeft  >= 1.0) roundnessLeft  = 1.0;
  if (roundnessRight >= 1.0) roundnessRight = 1.0;

  double recSize = rec.width > rec.height ? rec.height : rec.width;
  double radiusLeft  = (recSize*roundnessLeft)/2;
  double radiusRight = (recSize*roundnessRight)/2;

  if (radiusLeft <= 0.0) radiusLeft = 0.0;
  if (radiusRight <= 0.0) radiusRight = 0.0;

  if (radiusRight <= 0.0 && radiusLeft <= 0.0) return;

  double stepLength = 90.0/segments;

  // Coordinates of the 12 points also apdated from `DrawRectangleRounded`
  final point = <Vector2D>[
    // PO, P1, P2
    .vec2(rec.x + radiusLeft, rec.y),
    .vec2(rec.x + rec.width - radiusRight, rec.y),
    .vec2(rec.x + rec.width, rec.y + radiusRight),
    // P3, P4
    .vec2(rec.x + rec.width, rec.y + rec.height - radiusRight),
    .vec2(rec.x + rec.width - radiusRight, rec.y + rec.height),
    // P5, P6, P7
    .vec2(rec.x + radiusLeft, rec.y + rec.height),
    .vec2(rec.x, rec.y + rec.height - radiusLeft),
    .vec2(rec.x, rec.y + radiusLeft),
    // P8, P9
    .vec2(rec.x + radiusLeft, rec.y + radiusLeft),
    .vec2(rec.x + rec.width - radiusRight, rec.y + radiusRight),
    // P10, P11
    .vec2(rec.x + rec.width - radiusRight, rec.y + rec.height - radiusRight),
    .vec2(rec.x + radiusLeft, rec.y + rec.height - radiusLeft),
  ];

  final centers = [ point[8], point[9], point[10], point[11] ];
  final angles = [ 180.0, 270.0, 0.0, 90.0 ];

  if (SUPPORT_QUADS_DRAW_MODE) {
    final texShapes = GetShapesTexture();
    rlSetTexture(texShapes.id);
    final shapeRect = GetShapesTextureRectangle();

    rlBegin(.RL_QUADS);
      for (int k = 0; k < 4; ++k)
      {
        late ColorD color;
        late double radius;
        if (k == 0) { color = left; radius = radiusLeft; }
        if (k == 1) { color = right; radius = radiusRight; }
        if (k == 2) { color = right; radius = radiusRight; }
        if (k == 3) { color = left; radius = radiusLeft; }
        double angle = angles[k];
        final center = centers[k];

        for (int i = 0; i < segments/2; i++)
        {
          rlColor4ub(color.r, color.g, color.b, color.a);
          rlTexCoord2f(shapeRect.x/texShapes.width, shapeRect.y/texShapes.height);
          rlVertex2f(center.x, center.y);

          rlTexCoord2f((shapeRect.x + shapeRect.width)/texShapes.width, shapeRect.y/texShapes.height);
          rlVertex2f(center.x + math.cos(rl.DEG2RAD*(angle + stepLength*2))*radius, center.y + math.sin(rl.DEG2RAD*(angle + stepLength*2))*radius);

          rlTexCoord2f((shapeRect.x + shapeRect.width)/texShapes.width, (shapeRect.y + shapeRect.height)/texShapes.height);
          rlVertex2f(center.x + math.cos(rl.DEG2RAD*(angle + stepLength))*radius, center.y + math.sin(rl.DEG2RAD*(angle + stepLength))*radius);

          rlTexCoord2f(shapeRect.x/texShapes.width, (shapeRect.y + shapeRect.height)/texShapes.height);
          rlVertex2f(center.x + math.cos(rl.DEG2RAD*angle)*radius, center.y + math.sin(rl.DEG2RAD*angle)*radius);

          angle += (stepLength*2);
        }

        if (segments % 2 == 0)
        {
          rlTexCoord2f(shapeRect.x/texShapes.width, shapeRect.y/texShapes.height);
          rlVertex2f(center.x, center.y);

          rlTexCoord2f((shapeRect.x + shapeRect.width)/texShapes.width, (shapeRect.y + shapeRect.height)/texShapes.height);
          rlVertex2f(center.x + math.cos(rl.DEG2RAD*(angle + stepLength))*radius, center.y + math.sin(rl.DEG2RAD*(angle + stepLength))*radius);

          rlTexCoord2f(shapeRect.x/texShapes.width, (shapeRect.y + shapeRect.height)/texShapes.height);
          rlVertex2f(center.x + math.cos(rl.DEG2RAD*angle)*radius, center.y + math.sin(rl.DEG2RAD*angle)*radius);

          rlTexCoord2f((shapeRect.x + shapeRect.width)/texShapes.width, shapeRect.y/texShapes.height);
          rlVertex2f(center.x, center.y);
        }
      }

      //
      // Here we use the `Diagram` to guide ourselves to which point receives what color.
      //
      // By choosing the color correctly associated with a pointe the gradient effect 
      // will naturally come from OpenGL interpolation.
      //

      // [2] Upper Rectangle
      rlColor4ub(left.r, left.g, left.b, left.a);
      rlTexCoord2f(shapeRect.x/texShapes.width, shapeRect.y/texShapes.height);
      rlVertex2f(point[0].x, point[0].y);
      rlTexCoord2f(shapeRect.x/texShapes.width, (shapeRect.y + shapeRect.height)/texShapes.height);
      rlVertex2f(point[8].x, point[8].y);

      rlColor4ub(right.r, right.g, right.b, right.a);
      rlTexCoord2f((shapeRect.x + shapeRect.width)/texShapes.width, (shapeRect.y + shapeRect.height)/texShapes.height);
      rlVertex2f(point[9].x, point[9].y);

      rlColor4ub(right.r, right.g, right.b, right.a);
      rlTexCoord2f((shapeRect.x + shapeRect.width)/texShapes.width, shapeRect.y/texShapes.height);
      rlVertex2f(point[1].x, point[1].y);

      // [4] Left Rectangle
      rlColor4ub(right.r, right.g, right.b, right.a);
      rlTexCoord2f(shapeRect.x/texShapes.width, shapeRect.y/texShapes.height);
      rlVertex2f(point[2].x, point[2].y);
      rlTexCoord2f(shapeRect.x/texShapes.width, (shapeRect.y + shapeRect.height)/texShapes.height);
      rlVertex2f(point[9].x, point[9].y);
      rlTexCoord2f((shapeRect.x + shapeRect.width)/texShapes.width, (shapeRect.y + shapeRect.height)/texShapes.height);
      rlVertex2f(point[10].x, point[10].y);
      rlTexCoord2f((shapeRect.x + shapeRect.width)/texShapes.width, shapeRect.y/texShapes.height);
      rlVertex2f(point[3].x, point[3].y);

      // [6] Bottom Rectangle
      rlColor4ub(left.r, left.g, left.b, left.a);
      rlTexCoord2f(shapeRect.x/texShapes.width, shapeRect.y/texShapes.height);
      rlVertex2f(point[11].x, point[11].y);
      rlTexCoord2f(shapeRect.x/texShapes.width, (shapeRect.y + shapeRect.height)/texShapes.height);
      rlVertex2f(point[5].x, point[5].y);

      rlColor4ub(right.r, right.g, right.b, right.a);
      rlTexCoord2f((shapeRect.x + shapeRect.width)/texShapes.width, (shapeRect.y + shapeRect.height)/texShapes.height);
      rlVertex2f(point[4].x, point[4].y);
      rlTexCoord2f((shapeRect.x + shapeRect.width)/texShapes.width, shapeRect.y/texShapes.height);
      rlVertex2f(point[10].x, point[10].y);

      // [8] left Rectangle
      rlColor4ub(left.r, left.g, left.b, left.a);
      rlTexCoord2f(shapeRect.x/texShapes.width, shapeRect.y/texShapes.height);
      rlVertex2f(point[7].x, point[7].y);
      rlTexCoord2f(shapeRect.x/texShapes.width, (shapeRect.y + shapeRect.height)/texShapes.height);
      rlVertex2f(point[6].x, point[6].y);
      rlTexCoord2f((shapeRect.x + shapeRect.width)/texShapes.width, (shapeRect.y + shapeRect.height)/texShapes.height);
      rlVertex2f(point[11].x, point[11].y);
      rlTexCoord2f((shapeRect.x + shapeRect.width)/texShapes.width, shapeRect.y/texShapes.height);
      rlVertex2f(point[8].x, point[8].y);

      // [9] Middle Rectangle
      rlColor4ub(left.r, left.g, left.b, left.a);
      rlTexCoord2f(shapeRect.x/texShapes.width, shapeRect.y/texShapes.height);
      rlVertex2f(point[8].x, point[8].y);
      rlTexCoord2f(shapeRect.x/texShapes.width, (shapeRect.y + shapeRect.height)/texShapes.height);
      rlVertex2f(point[11].x, point[11].y);

      rlColor4ub(right.r, right.g, right.b, right.a);
      rlTexCoord2f((shapeRect.x + shapeRect.width)/texShapes.width, (shapeRect.y + shapeRect.height)/texShapes.height);
      rlVertex2f(point[10].x, point[10].y);
      rlTexCoord2f((shapeRect.x + shapeRect.width)/texShapes.width, shapeRect.y/texShapes.height);
      rlVertex2f(point[9].x, point[9].y);

    rlEnd();
    rlSetTexture(0);

  } else {

    //
    // Here we use the `Diagram` to guide ourselves to which point receives what color.
    //
    // By choosing the color correctly associated with a pointe the gradient effect 
    // will naturally come from OpenGL interpolation.
    // But this time instead of Quad, we think in triangles.
    //

    rlBegin(.RL_TRIANGLES);

      for (int k = 0; k < 4; ++k)
      {
        late ColorD color;
        late double radius;
        if (k == 0) { color = left; radius = radiusLeft; }
        if (k == 1) { color = right; radius = radiusRight; }
        if (k == 2) { color = right; radius = radiusRight; }
        if (k == 3) { color = left; radius = radiusLeft; }
        double angle = angles[k];
        final center = centers[k];
        for (int i = 0; i < segments; i++)
        {
          rlColor4ub(color.r, color.g, color.b, color.a);
          rlVertex2f(center.x, center.y);
          rlVertex2f(center.x + math.cos(rl.DEG2RAD*(angle + stepLength))*radius, center.y + math.sin(rl.DEG2RAD*(angle + stepLength))*radius);
          rlVertex2f(center.x + math.cos(rl.DEG2RAD*angle)*radius, center.y + math.sin(rl.DEG2RAD*angle)*radius);
          angle += stepLength;
        }
      }

      // [2] Upper Rectangle
      rlColor4ub(left.r, left.g, left.b, left.a);
      rlVertex2f(point[0].x, point[0].y);
      rlVertex2f(point[8].x, point[8].y);
      rlColor4ub(right.r, right.g, right.b, right.a);
      rlVertex2f(point[9].x, point[9].y);
      rlVertex2f(point[1].x, point[1].y);
      rlColor4ub(left.r, left.g, left.b, left.a);
      rlVertex2f(point[0].x, point[0].y);
      rlColor4ub(right.r, right.g, right.b, right.a);
      rlVertex2f(point[9].x, point[9].y);

      // [4] Right Rectangle
      rlColor4ub(right.r, right.g, right.b, right.a);
      rlVertex2f(point[9].x, point[9].y);
      rlVertex2f(point[10].x, point[10].y);
      rlVertex2f(point[3].x, point[3].y);
      rlVertex2f(point[2].x, point[2].y);
      rlVertex2f(point[9].x, point[9].y);
      rlVertex2f(point[3].x, point[3].y);

      // [6] Bottom Rectangle
      rlColor4ub(left.r, left.g, left.b, left.a);
      rlVertex2f(point[11].x, point[11].y);
      rlVertex2f(point[5].x, point[5].y);
      rlColor4ub(right.r, right.g, right.b, right.a);
      rlVertex2f(point[4].x, point[4].y);
      rlVertex2f(point[10].x, point[10].y);
      rlColor4ub(left.r, left.g, left.b, left.a);
      rlVertex2f(point[11].x, point[11].y);
      rlColor4ub(right.r, right.g, right.b, right.a);
      rlVertex2f(point[4].x, point[4].y);

      // [8] Left Rectangle
      rlColor4ub(left.r, left.g, left.b, left.a);
      rlVertex2f(point[7].x, point[7].y);
      rlVertex2f(point[6].x, point[6].y);
      rlVertex2f(point[11].x, point[11].y);
      rlVertex2f(point[8].x, point[8].y);
      rlVertex2f(point[7].x, point[7].y);
      rlVertex2f(point[11].x, point[11].y);

      // [9] Middle Rectangle
      rlColor4ub(left.r, left.g, left.b, left.a);
      rlVertex2f(point[8].x, point[8].y);
      rlVertex2f(point[11].x, point[11].y);
      rlColor4ub(right.r, right.g, right.b, right.a);
      rlVertex2f(point[10].x, point[10].y);
      rlVertex2f(point[9].x, point[9].y);
      rlColor4ub(left.r, left.g, left.b, left.a);
      rlVertex2f(point[8].x, point[8].y);
      rlColor4ub(right.r, right.g, right.b, right.a);
      rlVertex2f(point[10].x, point[10].y);

    rlEnd();

  }
}