// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_pie_chart.c
// Run it: dart run shapes_pie_chart.dart
import 'dart:ffi';
import '../../base_c.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_PIE_SLICES = 7;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_pie_chart".toC);
  SetTargetFPS(60);

  final donutInnerRadius = Float32$.Value(25, 'donutInnerRadius');
  final sliceCount = Int$.Value(MAX_PIE_SLICES, 'sliceCount');

  final sliceValues = [ 300.0, 100.0, 450.0, 350.0, 600.0, 380.0, 750.0 ];
  assert(sliceValues.length == MAX_PIE_SLICES);
  final values = Float32$.Array(sliceValues, key: 'values');

  final labels = String$.Fill(
    key: 'labels',
    MAX_PIE_SLICES,
    (i) => String$.ValueAt('label_$i', 'Slice $i')
  );

  List<bool> editingLabel = .generate(MAX_PIE_SLICES, (_) => false);

  final showValues = Bool$.Value(true, 'showValues');
  final showPercentages = Bool$.Value(false, 'showPercentages');
  final showDonut = Bool$.Value(false, 'showDonut');
  
  int hoveredSlice = -1;
  final scrollPanelBounds = Rectangle$.At('scrollPanelBounds');
  final scrollContentOffset = Vector2$.At('scrollContentOffset');
  final view = Rectangle$.At('view');

  const int panelWidth = 270;
  const int panelMargin = 5;

  final panelPos = Vector2$.At('panelPos').set(
    (screenWidth - panelMargin - panelWidth).toDouble(),
    panelMargin.toDouble()
  );

  final panelRect = Rectangle$.At('panelRect').set(
    panelPos.ref.x, panelPos.ref.y,
    panelWidth.toDouble(),
    screenHeight - 2.0*panelMargin
  );

  final canvas = Rectangle$.At('canvas').set(0, 0, panelPos.ref.x, screenHeight.toDouble());
  final center = Vector2$.At('center').set(canvas.ref.width/2.0, canvas.ref.height/2.0);
  const double radius = 205.0;

  double totalValue = 0.0;

  while (!WindowShouldClose())
  {
    totalValue = 0.0;
    for (int i = 0; i < sliceCount.value; i++) totalValue += values[i];

    hoveredSlice = -1;
    final mousePos = GetMousePosition();
    if (CheckCollisionPointRec(mousePos, canvas.ref))
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

    BeginDrawing();
      ClearBackground(RAYWHITE);

      double startAngle = 0.0;
      for (int i = 0; i < sliceCount.value; i++)
      {
        final sweepAngle = (totalValue > 0)? (values[i]/totalValue)*360.0 : 0.0;
        final midAngle = startAngle + sweepAngle/2.0;

        final color = ColorFromHSV(i/sliceCount.value*360.0, 0.75, 0.9);
        double currentRadius = radius;

        if (i == hoveredSlice) currentRadius += 20.0;

        DrawCircleSector(center.ref, currentRadius, startAngle, startAngle + sweepAngle, 120, color);

        if (values[i] > 0)
        {
          String labelText;
          if (showValues.value && showPercentages.value) labelText = "${values[i].f1} (${((values[i]/totalValue)*100).f0}%)";
          else if (showValues.value) labelText = values[i].f1;
          else if (showPercentages.value) labelText = "${((values[i]/totalValue)*100).f0}%";
          else labelText = labels[i].toD;

          final textSize = MeasureTextEx(GetFontDefault(), labelText.toC, 20, 1);
          final labelRadius = radius*0.7;
          final labelPos = Vector2$.At('labelPos').set(
            center.ref.x + math.cos(midAngle*rl.DEG2RAD)*labelRadius - textSize.x/2.0,
            center.ref.y + math.sin(midAngle*rl.DEG2RAD)*labelRadius - textSize.y/2.0
          );
          DrawText(
            labelText.toC,
            labelPos.ref.x.toInt(), labelPos.ref.y.toInt(), 20, WHITE
          );
        }

        if (showDonut.value) DrawCircleV(center.ref, donutInnerRadius.value, RAYWHITE);

        startAngle += sweepAngle;
      }

      DrawRectangleRec(panelRect.ref, Fade(LIGHTGRAY, 0.5));
      DrawRectangleLinesEx(panelRect.ref, 1.0, GRAY);

      GuiSpinner(
        Rectangle$.$1.set(panelPos.ref.x + 95, panelPos.ref.y + 12, 125, 25),
        "Slices ".toC, sliceCount, 1, MAX_PIE_SLICES, false
      );
      GuiCheckBox(
        Rectangle$.$1.set(panelPos.ref.x + 20, panelPos.ref.y + 12 + 40, 20, 20),
        "Show Values".toC, showValues
      );
      GuiCheckBox(
        Rectangle$.$1.set(panelPos.ref.x + 20, panelPos.ref.y + 12 + 70, 20, 20),
        "Show Percentages".toC, showPercentages
      );
      GuiCheckBox(
        Rectangle$.$1.set(panelPos.ref.x + 20, panelPos.ref.y + 12 + 100, 20, 20),
        "Make Donut".toC, showDonut
      );

      if (!showDonut.value) GuiDisable();
      GuiSliderBar(
        Rectangle$.$1.set(panelPos.ref.x + 80, panelPos.ref.y + 12 + 130, panelRect.ref.width - 100, 30),
        "Inner Radius".toC, nullptr, donutInnerRadius, 5.0, radius - 10.0
      );
      GuiEnable();

      GuiLine(
        Rectangle$.$1.set(panelPos.ref.x + 10, panelPos.ref.y + 12 + 170, panelRect.ref.width - 20, 1),
        nullptr
      );

      scrollPanelBounds.set(
        panelPos.ref.x + panelMargin,
        panelPos.ref.y + 12 + 190,
        panelRect.ref.width - panelMargin*2,
        panelRect.ref.y + panelRect.ref.height - panelPos.ref.y + 12 + 190 - panelMargin
      );
      final contentHeight = sliceCount.value*35;

      GuiScrollPanel(scrollPanelBounds.ref, nullptr,
        Rectangle$.$1.set(0, 0, panelRect.ref.width - 25, contentHeight.toDouble()),
        scrollContentOffset,
        view
      );

      final contentX = view.ref.x + scrollContentOffset.ref.x;
      final contentY = view.ref.y + scrollContentOffset.ref.y;

      BeginScissorMode(
        view.ref.x.toInt(), view.ref.y.toInt(),
        view.ref.width.toInt(), view.ref.height.toInt()
      );

        for (int i = 0; i < sliceCount.value; i++)
        {
          int rowY = (contentY + 5 + i*35).toInt();

          final color = ColorFromHSV(i/sliceCount.value*360.0, 0.75, 0.9);
          DrawRectangle((contentX + 15).toInt(), rowY + 5, 20, 20, color);

          if (GuiTextBox(
            Rectangle$.$1.set(contentX + 45, rowY.toDouble(), 75, 30),
            labels[i], 32, editingLabel[i]
          ).toBool()) editingLabel[i] = !editingLabel[i];

          GuiSliderBar(
            Rectangle$.$1.set(contentX + 130, rowY.toDouble(), 110, 30),
            nullptr,
            nullptr,
            values + i,
            0.0,
            1000.0
          );
        }

      EndScissorMode();

    EndDrawing();
  }

  CloseWindowAndDispose();
}