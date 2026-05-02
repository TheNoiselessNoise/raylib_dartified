// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rlgl_color_wheel.c
// Run it: dart run shapes_rlgl_color_wheel.dart
import 'dart:ffi';
import '../../base.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_rlgl_color_wheel".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  const int pointsMin = 3;
  const int pointsMax = 256;

  int triangleCount = 64;
  double pointScale = 150.0;
  final value = rl.Temp.Float$.At('value');

  final center = rl.Temp.Vector2$.At('center').set(screenWidth/2.0, screenHeight/2.0);
  final circlePosition = rl.Temp.Vector2$.At('circlePos').setC(center.ref);
  final color = rl.Temp.Color$.At('color').setC(rl.C.WHITE);

  bool sliderClicked = false;
  bool settingColor = false;
  int renderType = RlDrawMode.RL_TRIANGLES.value;

  while (!rl.Core.WindowShouldClose())
  {
    triangleCount += rl.Core.GetMouseWheelMove().toInt();
    triangleCount = rl.Clamp(
      triangleCount.toDouble(),
      pointsMin.toDouble(),
      pointsMax.toDouble(),
    ).toInt();

    final sliderRectangle = rl.Temp.Rectangle$.At('slider').set(42.0, 16.0 + 64.0 + 45.0, 64.0, 16.0);
    final mousePosition = rl.Core.GetMousePosition();

    bool sliderHover = (
      mousePosition.x >= sliderRectangle.ref.x &&
      mousePosition.y >= sliderRectangle.ref.y &&
      mousePosition.x < sliderRectangle.ref.x + sliderRectangle.ref.width &&
      mousePosition.y < sliderRectangle.ref.y + sliderRectangle.ref.height
    );

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT_CONTROL.value) && rl.Core.IsKeyDown(KeyboardKey.KEY_C.value))
    {
      if (rl.Core.IsKeyPressed(KeyboardKey.KEY_C.value))
      {
        rl.Core.SetClipboardText("#${color.ref.r.hexPad()}${color.ref.g.hexPad()}${color.ref.b.hexPad()}".toC);
      }
    }

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_UP.value))
    {
      pointScale *= 1.025;

      if (pointScale > screenHeight/2.0) {
        pointScale = screenHeight/2.0;
      } else {
        circlePosition.ref.setD(circlePosition.ref.toD()
          .sub(center.toD())
          .mul(.vec2(1.025, 1.025))
          .add(center.toD())
        );
      }
    }

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_DOWN.value))
    {
      pointScale *= 0.975;

      if (pointScale < 32.0) {
        pointScale = 32.0;
      } else {
        circlePosition.ref.setD(circlePosition.ref.toD()
          .sub(center.toD())
          .mul(.vec2(0.975, 0.975))
          .add(center.toD())
        );
      }

      double distance = center.distance(circlePosition) / pointScale;
      double angle = (Vector2D.vec2(0, -pointScale).angle(center.toD().sub(circlePosition.toD())) / rl.PI + 1) / 2;

      if (distance > 1.0)
      {
        circlePosition.setD(
          .vec2(
            math.sin(angle*(rl.PI*2.0))*pointScale,
            -math.cos(angle*(rl.PI*2.0))*pointScale
          ).add(center.toD())
        );
      }
    }

    if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value) && rl.Core.GetMousePosition().distance(center.ref) <= pointScale + 10.0)
    {
      settingColor = true;
    }

    if (rl.Core.IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) settingColor = false;

    if (sliderHover && rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) sliderClicked = true;
    if (sliderClicked && rl.Core.IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) sliderClicked = false;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value)) renderType = RlDrawMode.RL_LINES.value;
    if (rl.Core.IsKeyReleased(KeyboardKey.KEY_SPACE.value)) renderType = RlDrawMode.RL_TRIANGLES.value;

    if (settingColor || sliderClicked)
    {
      if (settingColor) circlePosition.setC(rl.Core.GetMousePosition());

      double distance = center.distance(circlePosition)/pointScale;

      double angle = (Vector2D.vec2(0, -pointScale).angle(center.toD().sub(circlePosition.toD())) / rl.PI + 1) / 2;
      if (settingColor && distance > 1.0) {
        circlePosition.setD(
          .vec2(
            math.sin(angle*(rl.PI*2.0))*pointScale,
            -math.cos(angle*(rl.PI*2.0))*pointScale
          ).add(center.toD())
        );
      }

      double angle360 = angle*360.0;
      double valueActual = rl.Clamp(distance, 0.0, 1.0);
      color.setD(rl.Core.ColorLerp(
        rl.Temp.color1((value.value*255.0).toInt(), (value.value*255.0).toInt(), (value.value*255.0).toInt(), 255),
        rl.Core.ColorFromHSV(angle360, rl.Clamp(distance, 0.0, 1.0), 1.0),
        valueActual,
      ).toD());
    }

    rl.Core.BeginDrawing();

    rl.Core.ClearBackground(rl.C.RAYWHITE);

    rl.Rlgl.rlBegin(renderType);
    for (int i = 0; i < triangleCount; i++)
    {
      double angleOffset = ((rl.PI*2.0)/triangleCount);
      double angle = angleOffset*i;
      double angleOffsetCalculated = (i + 1)*angleOffset;

      final Vector2D scale = .vec2(pointScale, pointScale);
      final Vector2D offset = .vec2(math.sin(angle), -math.cos(angle)).mul(scale);
      final Vector2D offset2 = .vec2(math.sin(angleOffsetCalculated), -math.cos(angleOffsetCalculated)).mul(scale);
      final position = center.toD().add(offset);
      final position2 = center.toD().add(offset2);

      double angleNonRadian = (angle/(2.0*rl.PI))*360.0;
      double angleNonRadianOffset = (angleOffset/(2.0*rl.PI))*360.0;

      final currentColor = rl.Core.ColorFromHSV(angleNonRadian, 1.0, 1.0);
      final offsetColor = rl.Core.ColorFromHSV(angleNonRadian + angleNonRadianOffset, 1.0, 1.0);

      if (renderType == RlDrawMode.RL_TRIANGLES.value)
      {
        rl.Rlgl.rlColor4ub(currentColor.r, currentColor.g, currentColor.b, currentColor.a);
        rl.Rlgl.rlVertex2f(position.x, position.y);
        rl.Rlgl.rlColor4f(value.value, value.value, value.value, 1.0);
        rl.Rlgl.rlVertex2f(center.ref.x, center.ref.y);
        rl.Rlgl.rlColor4ub(offsetColor.r, offsetColor.g, offsetColor.b, offsetColor.a);
        rl.Rlgl.rlVertex2f(position2.x, position2.y);
      }
      else if (renderType == RlDrawMode.RL_LINES.value)
      {
        rl.Rlgl.rlColor4ub(currentColor.r, currentColor.g, currentColor.b, currentColor.a);
        rl.Rlgl.rlVertex2f(position.x, position.y);
        rl.Rlgl.rlColor4ub(rl.C.WHITE.r, rl.C.WHITE.g, rl.C.WHITE.b, rl.C.WHITE.a);
        rl.Rlgl.rlVertex2f(center.ref.x, center.ref.y);

        rl.Rlgl.rlVertex2f(center.ref.x, center.ref.y);
        rl.Rlgl.rlColor4ub(offsetColor.r, offsetColor.g, offsetColor.b, offsetColor.a);
        rl.Rlgl.rlVertex2f(position2.x, position2.y);

        rl.Rlgl.rlVertex2f(position2.x, position2.y);
        rl.Rlgl.rlColor4ub(currentColor.r, currentColor.g, currentColor.b, currentColor.a);
        rl.Rlgl.rlVertex2f(position.x, position.y);
      }
    }
    rl.Rlgl.rlEnd();

    ColorC handleColor = rl.C.BLACK;

    if (center.distance(circlePosition)/pointScale <= 0.5 && value.value <= 0.5)
    {
      handleColor = rl.C.DARKGRAY;
    }

    rl.Core.DrawCircleLinesV(circlePosition.ref, 4.0, handleColor);

    rl.Core.DrawRectangleV(
      rl.Temp.vec21(8, 8),
      rl.Temp.vec22(64, 64),
      color.ref,
    );

    rl.Core.DrawRectangleLinesEx(
      rl.Temp.rect1(8, 8, 64, 64),
      2,
      rl.Core.ColorLerp(color.ref, rl.C.BLACK, 0.5),
    );

    StringBuffer sb = StringBuffer('#');
    sb.write(color.ref.r.hexPad());
    sb.write(color.ref.g.hexPad());
    sb.write(color.ref.b.hexPad());
    sb.write('(');
    sb.write([color.ref.r, color.ref.g, color.ref.b].join(', '));
    sb.write(')');

    rl.Core.DrawText(sb.toString().toC, 8, 8 + 64 + 8, 20, rl.C.DARKGRAY);

    ColorC copyColor = rl.C.DARKGRAY;
    int offset = 0;
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT_CONTROL.value) && rl.Core.IsKeyDown(KeyboardKey.KEY_C.value))
    {
      copyColor = rl.C.DARKGREEN;
      offset = 4;
    }

    rl.Core.DrawText(
      "press ctrl+c to copy!".toC,
      8, 425 - offset, 20, copyColor
    );

    rl.Core.DrawText(
      "triangle count: $triangleCount".toC,
      8, 395, 20, rl.C.DARKGRAY
    );

    rl.Gui.GuiSliderBar(
      sliderRectangle.ref,
      "value: ".toC,
      "".toC,
      value,
      0.0,
      1.0
    );

    rl.Core.DrawFPS(64 + 16, 8);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}