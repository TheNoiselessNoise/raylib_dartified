// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_cellular_automata.c
// Run it: dart run textures_cellular_automata.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const int imageWidth = 800;
const int imageHeight = 800~/2;

const int drawRuleStartX       = 585;
const int drawRuleStartY       = 10;
const int drawRuleSpacing      = 15;
const int drawRuleGroupSpacing = 50;
const int drawRuleSize         = 14;
const int drawRuleInnerSize    = 10;

const int presetsSizeX = 42;
const int presetsSizeY = 22;

const int linesUpdatedPerFrame = 4;

void ComputeLine(Pointer<ImageC> image, int line, int rule)
{
  for (int i = 1; i < imageWidth - 1; i++)
  {
    int prevValue = ((GetImageColor(image.ref, i - 1, line - 1).r < 5)? 4 : 0) +
                    ((GetImageColor(image.ref, i,     line - 1).r < 5)? 2 : 0) +
                    ((GetImageColor(image.ref, i + 1, line - 1).r < 5)? 1 : 0);
    int currValue = (rule & (1 << prevValue));
    ImageDrawPixel(image, i, line, currValue > 0 ? BLACK : RAYWHITE);
  }
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_cellular_automata".toC);
  SetTargetFPS(60);

  final image = Image$.At('image');
  image.ref = GenImageColor(imageWidth, imageHeight, RAYWHITE);
  
  ImageDrawPixel(image, imageWidth~/2, 0, BLACK);

  final texture = LoadTextureFromImage(image.ref);

  final List<int> presetValues = [ 18, 30, 60, 86, 102, 124, 126, 150, 182, 225 ];

  int rule = 30;
  int line = 1;

  while (!WindowShouldClose())
  {
    final mouse = GetMousePosition();
    int mouseInCell = -1;

    for (int i = 0; i < 8; i++)
    {
      int cellX = drawRuleStartX - drawRuleGroupSpacing*i + drawRuleSpacing;
      int cellY = drawRuleStartY + drawRuleSpacing;
      if (
        (mouse.x >= cellX) && (mouse.x <= cellX + drawRuleSize) &&
        (mouse.y >= cellY) && (mouse.y <= cellY + drawRuleSize)
      ) {
        mouseInCell = i;
        break;
      }
    }

    if (mouseInCell < 0)
    {
      for (int i = 0; i < presetValues.length; i++)
      {
        int cellX = 4 + (presetsSizeX + 2)*(i~/2);
        int cellY = 2 + (presetsSizeY + 2)*(i%2);
        if (
          (mouse.x >= cellX) && (mouse.x <= cellX + presetsSizeX) &&
          (mouse.y >= cellY) && (mouse.y <= cellY + presetsSizeY)
        ) {
          mouseInCell = i + 8;
          break;
        }
      }
    }

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value) && (mouseInCell >= 0))
    {
      if (mouseInCell < 8)
        rule ^= (1 << mouseInCell);
      else
        rule = presetValues[mouseInCell - 8];

      ImageClearBackground(image, RAYWHITE);
      ImageDrawPixel(image, imageWidth~/2, 0, BLACK);
      line = 1;
    }

    if (line < imageHeight)
    {
      for (int i = 0; (i < linesUpdatedPerFrame) && (line + i < imageHeight); i++)
        ComputeLine(image, line + i, rule);

      line += linesUpdatedPerFrame;

      UpdateTexture(texture, image.ref.data);
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTexture(texture, 0, screenHeight - imageHeight, WHITE);

      for (int i = 0; i < presetValues.length; i++)
      {
        DrawText("${presetValues[i]}".toC, 8 + (presetsSizeX + 2)*(i~/2), 4 + (presetsSizeY + 2)*(i%2), 20, GRAY);
        DrawRectangleLines(4 + (presetsSizeX + 2)*(i~/2), 2 + (presetsSizeY + 2)*(i%2), presetsSizeX, presetsSizeY, BLUE);

        if (mouseInCell == i + 8)
          DrawRectangleLinesEx(
            Rectangle$.$1.set(2 + (presetsSizeX + 2.0)*(i~/2), (presetsSizeY + 2.0)*(i%2), presetsSizeX + 4.0, presetsSizeY + 4.0),
            3, RED
          );
      }

      for (int i = 0; i < 8; i++)
      {
        for (int j = 0; j < 3; j++)
        {
          DrawRectangleLines(drawRuleStartX - drawRuleGroupSpacing*i + drawRuleSpacing*j, drawRuleStartY, drawRuleSize, drawRuleSize, GRAY);
          if ((i & (4 >> j)) > 0)
            DrawRectangle(drawRuleStartX + 2 - drawRuleGroupSpacing*i + drawRuleSpacing*j, drawRuleStartY + 2, drawRuleInnerSize, drawRuleInnerSize, BLACK);
        }

        DrawRectangleLines(drawRuleStartX - drawRuleGroupSpacing*i + drawRuleSpacing, drawRuleStartY + drawRuleSpacing, drawRuleSize, drawRuleSize, BLUE);
        if ((rule & (1 << i)) > 0)
          DrawRectangle(drawRuleStartX + 2 - drawRuleGroupSpacing*i + drawRuleSpacing, drawRuleStartY + 2 + drawRuleSpacing, drawRuleInnerSize, drawRuleInnerSize, BLACK);

        if (mouseInCell == i)
          DrawRectangleLinesEx(
            Rectangle$.$1.set(drawRuleStartX - drawRuleGroupSpacing*i + drawRuleSpacing - 2.0, drawRuleStartY + drawRuleSpacing - 2.0, drawRuleSize + 4.0, drawRuleSize + 4.0),
            3, RED
          );
      }

      DrawText("RULE: $rule".toC, drawRuleStartX + drawRuleSpacing*4, drawRuleStartY + 1, 30, GRAY);

    EndDrawing();
  }
  
  UnloadImage(image.ref);
  UnloadTexture(texture);

  CloseWindowAndDispose();
}