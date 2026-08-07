// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rlgl_color_wheel.c
// Run it: dart run shapes_rlgl_color_wheel.dart
import '../../base_dart.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shapes_rlgl_color_wheel");
  SetTargetFPS(60);

  const int pointsMin = 3;
  const int pointsMax = 256;

  int triangleCount = 64;
  double pointScale = 150.0;
  double value = 0;

  final Vector2D center = .vec2(screenWidth/2.0, screenHeight/2.0);
  Vector2D circlePosition = center.copy();
  ColorD color = .WHITE;

  bool sliderClicked = false;
  bool settingColor = false;
  RlDrawMode renderType = .RL_TRIANGLES;

  while (!WindowShouldClose())
  {
    triangleCount += GetMouseWheelMove().toInt();
    triangleCount = Clamp(triangleCount, pointsMin, pointsMax).toInt();

    final RectangleD sliderRectangle = .rect(42.0, 16.0 + 64.0 + 45.0, 64.0, 16.0);
    final mousePosition = GetMousePosition();

    bool sliderHover = (
      mousePosition.x >= sliderRectangle.x &&
      mousePosition.y >= sliderRectangle.y &&
      mousePosition.x < sliderRectangle.x + sliderRectangle.width &&
      mousePosition.y < sliderRectangle.y + sliderRectangle.height
    );

    if (IsKeyDown(.KEY_LEFT_CONTROL) && IsKeyDown(.KEY_C))
    {
      if (IsKeyPressed(.KEY_C))
      {
        SetClipboardText(
          "#${color.r.hexPad()}${color.g.hexPad()}${color.b.hexPad()}"
        );
      }
    }

    if (IsKeyDown(.KEY_UP))
    {
      pointScale *= 1.025;

      if (pointScale > screenHeight/2.0) {
        pointScale = screenHeight/2.0;
      } else {
        circlePosition = circlePosition
          .sub(center)
          .mul(.vec2(1.025, 1.025))
          .add(center);
      }
    }

    if (IsKeyDown(.KEY_DOWN))
    {
      pointScale *= 0.975;

      if (pointScale < 32.0) {
        pointScale = 32.0;
      } else {
        circlePosition = circlePosition
          .sub(center)
          .mul(.vec2(0.975, 0.975))
          .add(center);
      }

      double distance = center.distance(circlePosition) / pointScale;
      double angle = (Vector2D.vec2(0, -pointScale).angle(center.sub(circlePosition)) / PI + 1) / 2;

      if (distance > 1.0)
      {
        circlePosition = .vec2(
          math.sin(angle*(PI*2.0))*pointScale,
          -math.cos(angle*(PI*2.0))*pointScale
        ).add(center);
      }
    }

    if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT) && GetMousePosition().distance(center) <= pointScale + 10.0)
    {
      settingColor = true;
    }

    if (IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) settingColor = false;

    if (sliderHover && IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) sliderClicked = true;
    if (sliderClicked && IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) sliderClicked = false;
    if (IsKeyPressed(.KEY_SPACE)) renderType = .RL_LINES;
    if (IsKeyReleased(.KEY_SPACE)) renderType = .RL_TRIANGLES;

    if (settingColor || sliderClicked)
    {
      if (settingColor) circlePosition = GetMousePosition();

      double distance = center.distance(circlePosition)/pointScale;

      double angle = (Vector2D.vec2(0, -pointScale).angle(center.sub(circlePosition)) / PI + 1) / 2;
      if (settingColor && distance > 1.0) {
        circlePosition = .vec2(
          math.sin(angle*(PI*2.0))*pointScale,
          -math.cos(angle*(PI*2.0))*pointScale
        ).add(center);
      }

      double angle360 = angle*360.0;
      double valueActual = Clamp(distance, 0.0, 1.0);
      color = ColorLerp(
        .color(
          value*255.0,
          value*255.0,
          value*255.0,
          255
        ),
        ColorFromHSV(angle360, Clamp(distance, 0.0, 1.0), 1.0),
        valueActual,
      );
    }

    BeginDrawing();

    ClearBackground(.RAYWHITE);

    rlBegin(renderType);
    for (int i = 0; i < triangleCount; i++)
    {
      double angleOffset = ((PI*2.0)/triangleCount);
      double angle = angleOffset*i;
      double angleOffsetCalculated = (i + 1)*angleOffset;

      final Vector2D scale = .vec2(pointScale, pointScale);
      final Vector2D offset = .vec2(math.sin(angle), -math.cos(angle)).mul(scale);
      final Vector2D offset2 = .vec2(math.sin(angleOffsetCalculated), -math.cos(angleOffsetCalculated)).mul(scale);
      final position = center.add(offset);
      final position2 = center.add(offset2);

      double angleNonRadian = (angle/(2.0*PI))*360.0;
      double angleNonRadianOffset = (angleOffset/(2.0*PI))*360.0;

      final currentColor = ColorFromHSV(angleNonRadian, 1.0, 1.0);
      final offsetColor = ColorFromHSV(angleNonRadian + angleNonRadianOffset, 1.0, 1.0);

      if (renderType == .RL_TRIANGLES)
      {
        rlColor4ub(currentColor.r, currentColor.g, currentColor.b, currentColor.a);
        rlVertex2f(position.x, position.y);
        rlColor4f(value, value, value, 1.0);
        rlVertex2f(center.x, center.y);
        rlColor4ub(offsetColor.r, offsetColor.g, offsetColor.b, offsetColor.a);
        rlVertex2f(position2.x, position2.y);
      }
      else if (renderType == .RL_LINES)
      {
        rlColor4ub(currentColor.r, currentColor.g, currentColor.b, currentColor.a);
        rlVertex2f(position.x, position.y);
        
        final ColorD white = .WHITE;
        rlColor4ub(white.r, white.g, white.b, white.a);
        rlVertex2f(center.x, center.y);

        rlVertex2f(center.x, center.y);
        rlColor4ub(offsetColor.r, offsetColor.g, offsetColor.b, offsetColor.a);
        rlVertex2f(position2.x, position2.y);

        rlVertex2f(position2.x, position2.y);
        rlColor4ub(currentColor.r, currentColor.g, currentColor.b, currentColor.a);
        rlVertex2f(position.x, position.y);
      }
    }
    rlEnd();

    ColorD handleColor = .BLACK;

    if (center.distance(circlePosition)/pointScale <= 0.5 && value <= 0.5)
    {
      handleColor = .DARKGRAY;
    }

    DrawCircleLinesV(circlePosition, 4.0, handleColor);

    DrawRectangleV(
      .vec2(8, 8),
      .vec2(64, 64),
      color,
    );

    DrawRectangleLinesEx(
      .rect(8, 8, 64, 64),
      2,
      ColorLerp(color, .BLACK, 0.5),
    );

    StringBuffer sb = StringBuffer('#');
    sb.write(color.r.hexPad());
    sb.write(color.g.hexPad());
    sb.write(color.b.hexPad());
    sb.write('(');
    sb.write([color.r, color.g, color.b].join(', '));
    sb.write(')');

    DrawText(
      sb.toString(),
      8, 8 + 64 + 8, 20, .DARKGRAY
    );

    ColorD copyColor = .DARKGRAY;
    int offset = 0;
    if (IsKeyDown(.KEY_LEFT_CONTROL) && IsKeyDown(.KEY_C))
    {
      copyColor = .DARKGREEN;
      offset = 4;
    }

    DrawText(
      "press ctrl+c to copy!",
      8, 425 - offset, 20, copyColor
    );

    DrawText(
      "triangle count: $triangleCount",
      8, 395, 20, .DARKGRAY
    );

    { // GUI
      var (result, newValue) = GuiSliderBar(
        sliderRectangle,
        "value: ",
        "",
        value,
        0.0,
        1.0
      );
      value = newValue;
    }

    DrawFPS(64 + 16, 8);

    EndDrawing();
  }

  CloseWindowAndDispose();
}