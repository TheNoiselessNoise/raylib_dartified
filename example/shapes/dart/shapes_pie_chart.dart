// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_pie_chart.c
// Run it: dart run shapes_pie_chart.dart
import '../../base.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_PIE_SLICES = 7;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_pie_chart");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  double donutInnerRadius = 25;
  var sliceCount = MAX_PIE_SLICES;

  final sliceValues = [ 300.0, 100.0, 450.0, 350.0, 600.0, 380.0, 750.0 ];
  assert(sliceValues.length == MAX_PIE_SLICES);
  final values = List.generate(MAX_PIE_SLICES, (i) => sliceValues[i]);

  List<String> labels = .generate(MAX_PIE_SLICES, (i) => "Slice $i");
  List<bool> editingLabel = .generate(MAX_PIE_SLICES, (_) => false);

  var showValues = true;
  var showPercentages = false;
  var showDonut = false;
  
  int hoveredSlice = -1;
  final RectangleD scrollPanelBounds = .zero();
  final Vector2D scrollContentOffset = .zero();
  final RectangleD view = .zero();

  const int panelWidth = 270;
  const int panelMargin = 5;

  final Vector2D panelPos = .vec2(
    screenWidth - panelMargin - panelWidth,
    panelMargin,
  );

  final RectangleD panelRect = .rect(
    panelPos.x, panelPos.y,
    panelWidth, screenHeight - 2.0*panelMargin
  );

  final RectangleD canvas = .rect(0, 0, panelPos.x, screenHeight);
  final Vector2D center = .vec2(canvas.width/2.0, canvas.height/2.0);
  const double radius = 205.0;

  double totalValue = 0.0;

  while (!rl.CoreD.WindowShouldClose())
  {
    totalValue = 0.0;
    for (int i = 0; i < sliceCount; i++) totalValue += values[i];

    hoveredSlice = -1;
    final mousePos = rl.CoreD.GetMousePosition();
    if (rl.CoreD.CheckCollisionPointRec(mousePos, canvas))
    {
      final dx = mousePos.x - center.x;
      final dy = mousePos.y - center.y;
      final distance = math.sqrt(dx*dx + dy*dy);

      if (distance <= radius)
      {
        double angle = math.atan2(dy, dx)*rl.RAD2DEG;
        if (angle < 0) angle += 360;

        double currentAngle = 0.0;
        for (int i = 0; i < sliceCount; i++)
        {
          final sweep = (totalValue > 0)? (values[i]/totalValue)*360.0 : 0.0;

          if ((angle >= currentAngle) && (angle < (currentAngle + sweep)))
          {
            hoveredSlice = i;
            break;
          }

          currentAngle += sweep;
        }
      }
    }

    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.RAYWHITE);

      double startAngle = 0.0;
      for (int i = 0; i < sliceCount; i++)
      {
        final sweepAngle = (totalValue > 0)? (values[i]/totalValue)*360.0 : 0.0;
        final midAngle = startAngle + sweepAngle/2.0;

        final color = rl.CoreD.ColorFromHSV(i/sliceCount*360.0, 0.75, 0.9);
        double currentRadius = radius;

        if (i == hoveredSlice) currentRadius += 20.0;

        rl.CoreD.DrawCircleSector(center, currentRadius, startAngle, startAngle + sweepAngle, 120, color);

        if (values[i] > 0)
        {
          String labelText;
          if (showValues && showPercentages) labelText = "${values[i].f1} (${((values[i]/totalValue)*100).f0}%)";
          else if (showValues) labelText = values[i].f1;
          else if (showPercentages) labelText = "${((values[i]/totalValue)*100).f0}%";
          else labelText = labels[i];

          final textSize = rl.CoreD.MeasureTextEx(rl.CoreD.GetFontDefault(), labelText, 20, 1);
          final labelRadius = radius*0.7;
          final Vector2D labelPos = .vec2(
            center.x + math.cos(midAngle*rl.DEG2RAD)*labelRadius - textSize.x/2.0,
            center.y + math.sin(midAngle*rl.DEG2RAD)*labelRadius - textSize.y/2.0
          );
          rl.CoreD.DrawText(
            labelText,
            labelPos.x, labelPos.y, 20, .WHITE
          );
        }

        if (showDonut) rl.CoreD.DrawCircleV(center, donutInnerRadius, .RAYWHITE);

        startAngle += sweepAngle;
      }

      rl.CoreD.DrawRectangleRec(panelRect, rl.CoreD.Fade(.LIGHTGRAY, 0.5));
      rl.CoreD.DrawRectangleLinesEx(panelRect, 1.0, .GRAY);

      {
        final (result, newValue) = rl.GuiD.GuiSpinner(
          .rect(panelPos.x + 95, panelPos.y + 12, 125, 25),
          "Slices ", sliceCount, 1, MAX_PIE_SLICES, false
        );
        sliceCount = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiCheckBox(
          .rect(panelPos.x + 20, panelPos.y + 12 + 40, 20, 20),
          "Show Values", showValues
        );
        showValues = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiCheckBox(
          .rect(panelPos.x + 20, panelPos.y + 12 + 70, 20, 20),
          "Show Percentages", showPercentages
        );
        showPercentages = newValue;
      }

      {
        final (result, newValue) = rl.GuiD.GuiCheckBox(
          .rect(panelPos.x + 20, panelPos.y + 12 + 100, 20, 20),
          "Make Donut", showDonut
        );
        showDonut = newValue;
      }

      if (!showDonut) rl.GuiD.GuiDisable();
      
      {
        final (result, newValue) = rl.GuiD.GuiSliderBar(
          .rect(panelPos.x + 80, panelPos.y + 12 + 130, panelRect.width - 100, 30),
          "Inner Radius", null, donutInnerRadius, 5.0, radius - 10.0
        );
        donutInnerRadius = newValue;
      }
      rl.GuiD.GuiEnable();

      rl.GuiD.GuiLine(
        .rect(panelPos.x + 10, panelPos.y + 12 + 170, panelRect.width - 20, 1),
        null,
      );

      scrollPanelBounds.set(
        panelPos.x + panelMargin,
        panelPos.y + 12 + 190,
        panelRect.width - panelMargin*2,
        panelRect.y + panelRect.height - panelPos.y + 12 + 190 - panelMargin
      );

      final contentHeight = sliceCount*35;

      rl.GuiD.GuiScrollPanel(
        scrollPanelBounds, null,
        .rect(0, 0, panelRect.width - 25, contentHeight),
        scrollContentOffset,
        view
      );

      final contentX = view.x + scrollContentOffset.x;
      final contentY = view.y + scrollContentOffset.y;

      rl.CoreD.BeginScissorMode(
        view.x, view.y,
        view.width, view.height
      );

        for (int i = 0; i < sliceCount; i++)
        {
          int rowY = (contentY + 5 + i*35).toInt();

          final color = rl.CoreD.ColorFromHSV(i/sliceCount*360.0, 0.75, 0.9);
          rl.CoreD.DrawRectangle(contentX + 15, rowY + 5, 20, 20, color);

          {
            final (result, newValue) = rl.GuiD.GuiTextBox(
              .rect(contentX + 45, rowY, 75, 30),
              labels[i], 32, editingLabel[i]
            );
            if (result != 0) editingLabel[i] = !editingLabel[i];
            labels[i] = newValue;
          }

          {
            final (result, newValue) = rl.GuiD.GuiSliderBar(
              .rect(contentX + 130, rowY, 110, 30),
              null,
              null,
              values[i],
              0.0,
              1000.0
            );
            values[i] = newValue;
          }
        }

      rl.CoreD.EndScissorMode();

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}