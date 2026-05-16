// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_pie_chart.c
// Run it: dart run shapes_pie_chart.dart
import 'dart:ffi';
import '../../base.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_PIE_SLICES = 7;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shapes_pie_chart".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final donutInnerRadius = rl.Temp.Float$.Value(25, 'donutInnerRadius');
  final sliceCount = rl.Temp.Int$.Value(MAX_PIE_SLICES, 'sliceCount');

  final sliceValues = [ 300.0, 100.0, 450.0, 350.0, 600.0, 380.0, 750.0 ];
  assert(sliceValues.length == MAX_PIE_SLICES);
  final values = rl.Temp.Float$.Array(sliceValues, key: 'values');

  final labels = rl.Temp.String$.Fill(
    key: 'labels',
    MAX_PIE_SLICES,
    (i) => rl.Temp.strAt('label_$i', 'Slice $i')
  );

  List<bool> editingLabel = .generate(MAX_PIE_SLICES, (_) => false);

  final showValues = rl.Temp.Bool$.Value(true, 'showValues');
  final showPercentages = rl.Temp.Bool$.Value(false, 'showPercentages');
  final showDonut = rl.Temp.Bool$.Value(false, 'showDonut');
  
  int hoveredSlice = -1;
  final scrollPanelBounds = rl.Temp.Rectangle$.At('scrollPanelBounds');
  final scrollContentOffset = rl.Temp.Vector2$.At('scrollContentOffset');
  final view = rl.Temp.Rectangle$.At('view');

  const int panelWidth = 270;
  const int panelMargin = 5;

  final panelPos = rl.Temp.Vector2$.At('panelPos').set(
    (screenWidth - panelMargin - panelWidth).toDouble(),
    panelMargin.toDouble()
  );

  final panelRect = rl.Temp.Rectangle$.At('panelRect').set(
    panelPos.ref.x, panelPos.ref.y,
    panelWidth.toDouble(),
    screenHeight - 2.0*panelMargin
  );

  final canvas = rl.Temp.Rectangle$.At('canvas').set(0, 0, panelPos.ref.x, screenHeight.toDouble());
  final center = rl.Temp.Vector2$.At('center').set(canvas.ref.width/2.0, canvas.ref.height/2.0);
  const double radius = 205.0;

  double totalValue = 0.0;

  while (!rl.Core.WindowShouldClose())
  {
    totalValue = 0.0;
    for (int i = 0; i < sliceCount.value; i++) totalValue += values[i];

    hoveredSlice = -1;
    final mousePos = rl.Core.GetMousePosition();
    if (rl.Core.CheckCollisionPointRec(mousePos, canvas.ref))
    {
      final dx = mousePos.x - center.ref.x;
      final dy = mousePos.y - center.ref.y;
      final distance = math.sqrt(dx*dx + dy*dy);

      if (distance <= radius)
      {
        double angle = math.atan2(dy, dx)*rl.RAD2DEG;
        if (angle < 0) angle += 360;

        double currentAngle = 0.0;
        for (int i = 0; i < sliceCount.value; i++)
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

    rl.Core.BeginDrawing();
      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      double startAngle = 0.0;
      for (int i = 0; i < sliceCount.value; i++)
      {
        final sweepAngle = (totalValue > 0)? (values[i]/totalValue)*360.0 : 0.0;
        final midAngle = startAngle + sweepAngle/2.0;

        final color = rl.Core.ColorFromHSV(i/sliceCount.value*360.0, 0.75, 0.9);
        double currentRadius = radius;

        if (i == hoveredSlice) currentRadius += 20.0;

        rl.Core.DrawCircleSector(center.ref, currentRadius, startAngle, startAngle + sweepAngle, 120, color);

        if (values[i] > 0)
        {
          String labelText;
          if (showValues.value && showPercentages.value) labelText = "${values[i].f1} (${((values[i]/totalValue)*100).f0}%)";
          else if (showValues.value) labelText = values[i].f1;
          else if (showPercentages.value) labelText = "${((values[i]/totalValue)*100).f0}%";
          else labelText = labels[i].toD;

          final textSize = rl.Core.MeasureTextEx(rl.Core.GetFontDefault(), labelText.toC, 20, 1);
          final labelRadius = radius*0.7;
          final labelPos = rl.Temp.Vector2$.At('labelPos').set(
            center.ref.x + math.cos(midAngle*rl.DEG2RAD)*labelRadius - textSize.x/2.0,
            center.ref.y + math.sin(midAngle*rl.DEG2RAD)*labelRadius - textSize.y/2.0
          );
          rl.Core.DrawText(
            labelText.toC,
            labelPos.ref.x.toInt(), labelPos.ref.y.toInt(), 20, rl.Color.WHITE
          );
        }

        if (showDonut.value) rl.Core.DrawCircleV(center.ref, donutInnerRadius.value, rl.Color.RAYWHITE);

        startAngle += sweepAngle;
      }

      rl.Core.DrawRectangleRec(panelRect.ref, rl.Core.Fade(rl.Color.LIGHTGRAY, 0.5));
      rl.Core.DrawRectangleLinesEx(panelRect.ref, 1.0, rl.Color.GRAY);

      rl.Gui.GuiSpinner(
        rl.Temp.rect1(panelPos.ref.x + 95, panelPos.ref.y + 12, 125, 25),
        "Slices ".toC, sliceCount, 1, MAX_PIE_SLICES, false
      );
      rl.Gui.GuiCheckBox(
        rl.Temp.rect1(panelPos.ref.x + 20, panelPos.ref.y + 12 + 40, 20, 20),
        "Show Values".toC, showValues
      );
      rl.Gui.GuiCheckBox(
        rl.Temp.rect1(panelPos.ref.x + 20, panelPos.ref.y + 12 + 70, 20, 20),
        "Show Percentages".toC, showPercentages
      );
      rl.Gui.GuiCheckBox(
        rl.Temp.rect1(panelPos.ref.x + 20, panelPos.ref.y + 12 + 100, 20, 20),
        "Make Donut".toC, showDonut
      );

      if (!showDonut.value) rl.Gui.GuiDisable();
      rl.Gui.GuiSliderBar(
        rl.Temp.rect1(panelPos.ref.x + 80, panelPos.ref.y + 12 + 130, panelRect.ref.width - 100, 30),
        "Inner Radius".toC, nullptr, donutInnerRadius, 5.0, radius - 10.0
      );
      rl.Gui.GuiEnable();

      rl.Gui.GuiLine(
        rl.Temp.rect1(panelPos.ref.x + 10, panelPos.ref.y + 12 + 170, panelRect.ref.width - 20, 1),
        nullptr
      );

      scrollPanelBounds.set(
        panelPos.ref.x + panelMargin,
        panelPos.ref.y + 12 + 190,
        panelRect.ref.width - panelMargin*2,
        panelRect.ref.y + panelRect.ref.height - panelPos.ref.y + 12 + 190 - panelMargin
      );
      final contentHeight = sliceCount.value*35;

      rl.Gui.GuiScrollPanel(scrollPanelBounds.ref, nullptr,
        rl.Temp.rect1(0, 0, panelRect.ref.width - 25, contentHeight.toDouble()),
        scrollContentOffset,
        view
      );

      final contentX = view.ref.x + scrollContentOffset.ref.x;
      final contentY = view.ref.y + scrollContentOffset.ref.y;

      rl.Core.BeginScissorMode(
        view.ref.x.toInt(), view.ref.y.toInt(),
        view.ref.width.toInt(), view.ref.height.toInt()
      );

        for (int i = 0; i < sliceCount.value; i++)
        {
          int rowY = (contentY + 5 + i*35).toInt();

          final color = rl.Core.ColorFromHSV(i/sliceCount.value*360.0, 0.75, 0.9);
          rl.Core.DrawRectangle((contentX + 15).toInt(), rowY + 5, 20, 20, color);

          if (rl.Gui.GuiTextBox(
            rl.Temp.rect1(contentX + 45, rowY.toDouble(), 75, 30),
            labels[i], 32, editingLabel[i]
          ).toBool()) editingLabel[i] = !editingLabel[i];

          rl.Gui.GuiSliderBar(
            rl.Temp.rect1(contentX + 130, rowY.toDouble(), 110, 30),
            nullptr,
            nullptr,
            values + i,
            0.0,
            1000.0
          );
        }

      rl.Core.EndScissorMode();

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}