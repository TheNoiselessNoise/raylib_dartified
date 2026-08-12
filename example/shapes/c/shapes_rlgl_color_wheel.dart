// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_rlgl_color_wheel.c
// Run it: dart run shapes_rlgl_color_wheel.dart
import 'dart:ffi';
import '../../base_c.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shapes_rlgl_color_wheel".toC);
  SetTargetFPS(60);

  const int pointsMin = 3;
  const int pointsMax = 256;

  int triangleCount = 64;
  double pointScale = 150.0;
  final value = Float32$.val.At('value');

  final center = Vector2$.val.At('center').set(screenWidth/2.0, screenHeight/2.0);
  final circlePosition = Vector2$.val.At('circlePos').setC(center.ref);
  final color = Color$.val.At('color').setC(WHITE);

  bool sliderClicked = false;
  bool settingColor = false;
  int renderType = RlDrawMode.RL_TRIANGLES.value;

  while (!WindowShouldClose())
  {
    triangleCount += GetMouseWheelMove().toInt();
    triangleCount = Clamp(
      triangleCount.toDouble(),
      pointsMin.toDouble(),
      pointsMax.toDouble(),
    ).toInt();

    final sliderRectangle = Rectangle$.val.At('slider').set(42.0, 16.0 + 64.0 + 45.0, 64.0, 16.0);
    final mousePosition = GetMousePosition();

    bool sliderHover = (
      mousePosition.x >= sliderRectangle.ref.x &&
      mousePosition.y >= sliderRectangle.ref.y &&
      mousePosition.x < sliderRectangle.ref.x + sliderRectangle.ref.width &&
      mousePosition.y < sliderRectangle.ref.y + sliderRectangle.ref.height
    );

    if (
      IsKeyDown(KeyboardKey.KEY_LEFT_CONTROL.value) &&
      IsKeyDown(KeyboardKey.KEY_C.value)
    ) {
      if (IsKeyPressed(KeyboardKey.KEY_C.value))
      {
        SetClipboardText("#${color.ref.r.hexPad()}${color.ref.g.hexPad()}${color.ref.b.hexPad()}".toC);
      }
    }

    if (IsKeyDown(KeyboardKey.KEY_UP.value))
    {
      pointScale *= 1.025;

      if (pointScale > screenHeight/2.0) {
        pointScale = screenHeight/2.0;
      } else {
        circlePosition.setD(circlePosition.toD()
          .sub(center.toD())
          .mul(.vec2(1.025, 1.025))
          .add(center.toD())
        );
      }
    }

    if (IsKeyDown(KeyboardKey.KEY_DOWN.value))
    {
      pointScale *= 0.975;

      if (pointScale < 32.0) {
        pointScale = 32.0;
      } else {
        circlePosition.setD(circlePosition.toD()
          .sub(center.toD())
          .mul(.vec2(0.975, 0.975))
          .add(center.toD())
        );
      }

      double distance = center.toD().distance(circlePosition.toD()) / pointScale;
      double angle = (Vector2D.vec2(0, -pointScale).angle(center.toD().sub(circlePosition.toD())) / PI + 1) / 2;

      if (distance > 1.0)
      {
        circlePosition.setD(
          .vec2(
            math.sin(angle*(PI*2.0))*pointScale,
            -math.cos(angle*(PI*2.0))*pointScale
          ).add(center.toD())
        );
      }
    }

    if (
      IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value) &&
      GetMousePosition().toD().distance(center.toD()) <= pointScale + 10.0
    ) {
      settingColor = true;
    }

    if (IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) settingColor = false;

    if (sliderHover && IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) sliderClicked = true;
    if (sliderClicked && IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) sliderClicked = false;
    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) renderType = RlDrawMode.RL_LINES.value;
    if (IsKeyReleased(KeyboardKey.KEY_SPACE.value)) renderType = RlDrawMode.RL_TRIANGLES.value;

    if (settingColor || sliderClicked)
    {
      if (settingColor) circlePosition.setC(GetMousePosition());

      double distance = center.toD().distance(circlePosition.toD())/pointScale;

      double angle = (Vector2D.vec2(0, -pointScale).angle(center.toD().sub(circlePosition.toD())) / PI + 1) / 2;
      if (settingColor && distance > 1.0) {
        circlePosition.setD(
          .vec2(
            math.sin(angle*(PI*2.0))*pointScale,
            -math.cos(angle*(PI*2.0))*pointScale
          ).add(center.toD())
        );
      }

      double angle360 = angle*360.0;
      double valueActual = Clamp(distance, 0.0, 1.0);
      color.setD(ColorLerp(
        Color$.val.$1.set((value.value*255.0).toInt(), (value.value*255.0).toInt(), (value.value*255.0).toInt(), 255),
        ColorFromHSV(angle360, Clamp(distance, 0.0, 1.0), 1.0),
        valueActual,
      ).toD());
    }

    BeginDrawing();

    ClearBackground(RAYWHITE);

    rlBegin(renderType);
    for (int i = 0; i < triangleCount; i++)
    {
      double angleOffset = ((PI*2.0)/triangleCount);
      double angle = angleOffset*i;
      double angleOffsetCalculated = (i + 1)*angleOffset;

      final Vector2D scale = .vec2(pointScale, pointScale);
      final Vector2D offset = .vec2(math.sin(angle), -math.cos(angle)).mul(scale);
      final Vector2D offset2 = .vec2(math.sin(angleOffsetCalculated), -math.cos(angleOffsetCalculated)).mul(scale);
      final position = center.toD().add(offset);
      final position2 = center.toD().add(offset2);

      double angleNonRadian = (angle/(2.0*PI))*360.0;
      double angleNonRadianOffset = (angleOffset/(2.0*PI))*360.0;

      final currentColor = ColorFromHSV(angleNonRadian, 1.0, 1.0);
      final offsetColor = ColorFromHSV(angleNonRadian + angleNonRadianOffset, 1.0, 1.0);

      if (renderType == RlDrawMode.RL_TRIANGLES.value)
      {
        rlColor4ub(currentColor.r, currentColor.g, currentColor.b, currentColor.a);
        rlVertex2f(position.x, position.y);
        rlColor4f(value.value, value.value, value.value, 1.0);
        rlVertex2f(center.ref.x, center.ref.y);
        rlColor4ub(offsetColor.r, offsetColor.g, offsetColor.b, offsetColor.a);
        rlVertex2f(position2.x, position2.y);
      }
      else if (renderType == RlDrawMode.RL_LINES.value)
      {
        rlColor4ub(currentColor.r, currentColor.g, currentColor.b, currentColor.a);
        rlVertex2f(position.x, position.y);
        rlColor4ub(WHITE.r, WHITE.g, WHITE.b, WHITE.a);
        rlVertex2f(center.ref.x, center.ref.y);

        rlVertex2f(center.ref.x, center.ref.y);
        rlColor4ub(offsetColor.r, offsetColor.g, offsetColor.b, offsetColor.a);
        rlVertex2f(position2.x, position2.y);

        rlVertex2f(position2.x, position2.y);
        rlColor4ub(currentColor.r, currentColor.g, currentColor.b, currentColor.a);
        rlVertex2f(position.x, position.y);
      }
    }
    rlEnd();

    ColorC handleColor = BLACK;

    if (center.toD().distance(circlePosition.toD())/pointScale <= 0.5 && value.value <= 0.5)
    {
      handleColor = DARKGRAY;
    }

    DrawCircleLinesV(circlePosition.ref, 4.0, handleColor);

    DrawRectangleV(
      Vector2$.val.$1.set(8, 8),
      Vector2$.val.$2.set(64, 64),
      color.ref,
    );

    DrawRectangleLinesEx(
      Rectangle$.val.$1.set(8, 8, 64, 64),
      2,
      ColorLerp(color.ref, BLACK, 0.5),
    );

    StringBuffer sb = StringBuffer('#');
    sb.write(color.ref.r.hexPad());
    sb.write(color.ref.g.hexPad());
    sb.write(color.ref.b.hexPad());
    sb.write('(');
    sb.write([color.ref.r, color.ref.g, color.ref.b].join(', '));
    sb.write(')');

    DrawText(sb.toString().toC, 8, 8 + 64 + 8, 20, DARKGRAY);

    ColorC copyColor = DARKGRAY;
    int offset = 0;
    if (IsKeyDown(KeyboardKey.KEY_LEFT_CONTROL.value) && IsKeyDown(KeyboardKey.KEY_C.value))
    {
      copyColor = DARKGREEN;
      offset = 4;
    }

    DrawText(
      "press ctrl+c to copy!".toC,
      8, 425 - offset, 20, copyColor
    );

    DrawText(
      "triangle count: $triangleCount".toC,
      8, 395, 20, DARKGRAY
    );

    GuiSliderBar(
      sliderRectangle.ref,
      "value: ".toC,
      "".toC,
      value,
      0.0,
      1.0
    );

    DrawFPS(64 + 16, 8);

    EndDrawing();
  }

  CloseWindowAndDispose();
}