// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rlgl_color_wheel.c
// Run it: dart run shapes_rlgl_color_wheel.dart
import '../../base.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_rlgl_color_wheel");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

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

  while (!rl.CoreD.WindowShouldClose())
  {
    triangleCount += rl.CoreD.GetMouseWheelMove().toInt();
    triangleCount = rl.Clamp(triangleCount, pointsMin, pointsMax).toInt();

    final RectangleD sliderRectangle = .rect(42.0, 16.0 + 64.0 + 45.0, 64.0, 16.0);
    final mousePosition = rl.CoreD.GetMousePosition();

    bool sliderHover = (
      mousePosition.x >= sliderRectangle.x &&
      mousePosition.y >= sliderRectangle.y &&
      mousePosition.x < sliderRectangle.x + sliderRectangle.width &&
      mousePosition.y < sliderRectangle.y + sliderRectangle.height
    );

    if (rl.CoreD.IsKeyDown(.KEY_LEFT_CONTROL) && rl.CoreD.IsKeyDown(.KEY_C))
    {
      if (rl.CoreD.IsKeyPressed(.KEY_C))
      {
        rl.CoreD.SetClipboardText(
          "#${color.r.hexPad()}${color.g.hexPad()}${color.b.hexPad()}"
        );
      }
    }

    if (rl.CoreD.IsKeyDown(.KEY_UP))
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

    if (rl.CoreD.IsKeyDown(.KEY_DOWN))
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
      double angle = (Vector2D.vec2(0, -pointScale).angle(center.sub(circlePosition)) / rl.PI + 1) / 2;

      if (distance > 1.0)
      {
        circlePosition = .vec2(
          math.sin(angle*(rl.PI*2.0))*pointScale,
          -math.cos(angle*(rl.PI*2.0))*pointScale
        ).add(center);
      }
    }

    if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT) && rl.CoreD.GetMousePosition().distance(center) <= pointScale + 10.0)
    {
      settingColor = true;
    }

    if (rl.CoreD.IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) settingColor = false;

    if (sliderHover && rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) sliderClicked = true;
    if (sliderClicked && rl.CoreD.IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) sliderClicked = false;
    if (rl.CoreD.IsKeyPressed(.KEY_SPACE)) renderType = .RL_LINES;
    if (rl.CoreD.IsKeyReleased(.KEY_SPACE)) renderType = .RL_TRIANGLES;

    if (settingColor || sliderClicked)
    {
      if (settingColor) circlePosition = rl.CoreD.GetMousePosition();

      double distance = center.distance(circlePosition)/pointScale;

      double angle = (Vector2D.vec2(0, -pointScale).angle(center.sub(circlePosition)) / rl.PI + 1) / 2;
      if (settingColor && distance > 1.0) {
        circlePosition = .vec2(
          math.sin(angle*(rl.PI*2.0))*pointScale,
          -math.cos(angle*(rl.PI*2.0))*pointScale
        ).add(center);
      }

      double angle360 = angle*360.0;
      double valueActual = rl.Clamp(distance, 0.0, 1.0);
      color = rl.CoreD.ColorLerp(
        .color(
          value*255.0,
          value*255.0,
          value*255.0,
          255
        ),
        rl.CoreD.ColorFromHSV(angle360, rl.Clamp(distance, 0.0, 1.0), 1.0),
        valueActual,
      );
    }

    rl.CoreD.BeginDrawing();

    rl.CoreD.ClearBackground(.RAYWHITE);

    rl.RlglD.rlBegin(renderType);
    for (int i = 0; i < triangleCount; i++)
    {
      double angleOffset = ((rl.PI*2.0)/triangleCount);
      double angle = angleOffset*i;
      double angleOffsetCalculated = (i + 1)*angleOffset;

      final Vector2D scale = .vec2(pointScale, pointScale);
      final Vector2D offset = .vec2(math.sin(angle), -math.cos(angle)).mul(scale);
      final Vector2D offset2 = .vec2(math.sin(angleOffsetCalculated), -math.cos(angleOffsetCalculated)).mul(scale);
      final position = center.add(offset);
      final position2 = center.add(offset2);

      double angleNonRadian = (angle/(2.0*rl.PI))*360.0;
      double angleNonRadianOffset = (angleOffset/(2.0*rl.PI))*360.0;

      final currentColor = rl.CoreD.ColorFromHSV(angleNonRadian, 1.0, 1.0);
      final offsetColor = rl.CoreD.ColorFromHSV(angleNonRadian + angleNonRadianOffset, 1.0, 1.0);

      if (renderType == .RL_TRIANGLES)
      {
        rl.RlglD.rlColor4ub(currentColor.r, currentColor.g, currentColor.b, currentColor.a);
        rl.RlglD.rlVertex2f(position.x, position.y);
        rl.RlglD.rlColor4f(value, value, value, 1.0);
        rl.RlglD.rlVertex2f(center.x, center.y);
        rl.RlglD.rlColor4ub(offsetColor.r, offsetColor.g, offsetColor.b, offsetColor.a);
        rl.RlglD.rlVertex2f(position2.x, position2.y);
      }
      else if (renderType == .RL_LINES)
      {
        rl.RlglD.rlColor4ub(currentColor.r, currentColor.g, currentColor.b, currentColor.a);
        rl.RlglD.rlVertex2f(position.x, position.y);
        
        final ColorD white = .WHITE;
        rl.RlglD.rlColor4ub(white.r, white.g, white.b, white.a);
        rl.RlglD.rlVertex2f(center.x, center.y);

        rl.RlglD.rlVertex2f(center.x, center.y);
        rl.RlglD.rlColor4ub(offsetColor.r, offsetColor.g, offsetColor.b, offsetColor.a);
        rl.RlglD.rlVertex2f(position2.x, position2.y);

        rl.RlglD.rlVertex2f(position2.x, position2.y);
        rl.RlglD.rlColor4ub(currentColor.r, currentColor.g, currentColor.b, currentColor.a);
        rl.RlglD.rlVertex2f(position.x, position.y);
      }
    }
    rl.RlglD.rlEnd();

    ColorD handleColor = .BLACK;

    if (center.distance(circlePosition)/pointScale <= 0.5 && value <= 0.5)
    {
      handleColor = .DARKGRAY;
    }

    rl.CoreD.DrawCircleLinesV(circlePosition, 4.0, handleColor);

    rl.CoreD.DrawRectangleV(
      .vec2(8, 8),
      .vec2(64, 64),
      color,
    );

    rl.CoreD.DrawRectangleLinesEx(
      .rect(8, 8, 64, 64),
      2,
      rl.CoreD.ColorLerp(color, .BLACK, 0.5),
    );

    StringBuffer sb = StringBuffer('#');
    sb.write(color.r.hexPad());
    sb.write(color.g.hexPad());
    sb.write(color.b.hexPad());
    sb.write('(');
    sb.write([color.r, color.g, color.b].join(', '));
    sb.write(')');

    rl.CoreD.DrawText(
      sb.toString(),
      8, 8 + 64 + 8, 20, .DARKGRAY
    );

    ColorD copyColor = .DARKGRAY;
    int offset = 0;
    if (rl.CoreD.IsKeyDown(.KEY_LEFT_CONTROL) && rl.CoreD.IsKeyDown(.KEY_C))
    {
      copyColor = .DARKGREEN;
      offset = 4;
    }

    rl.CoreD.DrawText(
      "press ctrl+c to copy!",
      8, 425 - offset, 20, copyColor
    );

    rl.CoreD.DrawText(
      "triangle count: $triangleCount",
      8, 395, 20, .DARKGRAY
    );

    { // GUI
      var (result, newValue) = rl.GuiD.GuiSliderBar(
        sliderRectangle,
        "value: ",
        "",
        value,
        0.0,
        1.0
      );
      value = newValue;
    }

    rl.CoreD.DrawFPS(64 + 16, 8);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}