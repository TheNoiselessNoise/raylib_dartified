// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_mouse_painting.c
// Run it: dart run textures_mouse_painting.dart
import 'dart:ffi';
import '../../base.dart';

const int MAX_COLORS_COUNT = 23;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  final texturePos = rl.Temp.Vector2$.At('texturePos');
  final image = rl.Temp.Image$.At('image');

  List<ColorC> colors = [
    rl.Color.RAYWHITE, rl.Color.YELLOW, rl.Color.GOLD, rl.Color.ORANGE,
    rl.Color.PINK, rl.Color.RED, rl.Color.MAROON, rl.Color.GREEN,
    rl.Color.LIME, rl.Color.DARKGREEN, rl.Color.SKYBLUE, rl.Color.BLUE,
    rl.Color.DARKBLUE, rl.Color.PURPLE, rl.Color.VIOLET, rl.Color.DARKPURPLE,
    rl.Color.BEIGE, rl.Color.BROWN, rl.Color.DARKBROWN, rl.Color.LIGHTGRAY,
    rl.Color.GRAY, rl.Color.DARKGRAY, rl.Color.BLACK,
  ];
  assert(colors.length == MAX_COLORS_COUNT);

  final colorsRecs = rl.Temp.Rectangle$.At('colorsRecs', MAX_COLORS_COUNT);
  for (int i = 0; i < MAX_COLORS_COUNT; i++) {
    colorsRecs[i].x = (10 + 30*i + 2*i).toDouble();
    colorsRecs[i].y = 10;
    colorsRecs[i].width = 30;
    colorsRecs[i].height = 30;
  }

  int colorSelected = 0;
  int colorSelectedPrev = colorSelected;
  int colorMouseHover = 0;
  double brushSize = 20;
  bool mouseWasPressed = false;

  final btnSaveRec = rl.Temp.Rectangle$.At('btnSaveRec').set(750, 10, 40, 30);
  bool btnSaveMouseHover = false;
  bool showSaveMessage = false;
  int saveMessageCounter = 0;

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_mouse_painting".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(120);

  final target = rl.Core.LoadRenderTexture(screenWidth, screenHeight);

  rl.Core.BeginTextureMode(target);
  rl.Core.ClearBackground(colors[0]);
  rl.Core.EndTextureMode();

  while (!rl.Core.WindowShouldClose())
  {
    final mousePos = rl.Core.GetMousePosition();

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) colorSelected++;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_LEFT.value)) colorSelected--;

    if (colorSelected >= MAX_COLORS_COUNT) colorSelected = MAX_COLORS_COUNT - 1;
    else if (colorSelected < 0) colorSelected = 0;

    for (int i = 0; i < MAX_COLORS_COUNT; i++) {
      if (rl.Core.CheckCollisionPointRec(mousePos, colorsRecs[i])) {
        colorMouseHover = i;
        break;
      }
      else colorMouseHover = -1;
    }

    if ((colorMouseHover >= 0) && rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      colorSelected = colorMouseHover;
      colorSelectedPrev = colorSelected;
    }

    brushSize += rl.Core.GetMouseWheelMove()*5;
    if (brushSize < 2) brushSize = 2;
    if (brushSize > 50) brushSize = 50;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_C.value)) {
      rl.Core.BeginTextureMode(target);
      rl.Core.ClearBackground(colors[0]);
      rl.Core.EndTextureMode();
    }

    if (
      rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value) ||
      (rl.Core.GetGestureDetected() == Gesture.GESTURE_DRAG.value)
    ) {
      rl.Core.BeginTextureMode(target);
      if (mousePos.y > 50) {
        rl.Core.DrawCircle(mousePos.x.toInt(), mousePos.y.toInt(), brushSize, colors[colorSelected]);
      }
      rl.Core.EndTextureMode();
    }

    if (rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value)) {
      if (!mouseWasPressed) {
        colorSelectedPrev = colorSelected;
        colorSelected = 0;
      }

      mouseWasPressed = true;

      rl.Core.BeginTextureMode(target);
      if (mousePos.y > 50) {
        rl.Core.DrawCircle(mousePos.x.toInt(), mousePos.y.toInt(), brushSize, colors[0]);
      }
      rl.Core.EndTextureMode();
    } else if (rl.Core.IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_RIGHT.value) && mouseWasPressed) {
      colorSelected = colorSelectedPrev;
      mouseWasPressed = false;
    }

    btnSaveMouseHover = rl.Core.CheckCollisionPointRec(mousePos, btnSaveRec.ref);

    if (
      (btnSaveMouseHover && rl.Core.IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) ||
      rl.Core.IsKeyPressed(KeyboardKey.KEY_S.value)
    ) {
      image.ref = rl.Core.LoadImageFromTexture(target.texture);
      rl.Core.ImageFlipVertical(image);
      rl.Core.ExportImage(image.ref, "my_amazing_texture_painting.png".toC);
      rl.Core.UnloadImage(image.ref);
      showSaveMessage = true;
    }

    if (showSaveMessage) {
      saveMessageCounter++;
      if (saveMessageCounter > 240) {
        showSaveMessage = false;
        saveMessageCounter = 0;
      }
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawTextureRec(
        target.texture,
        rl.Temp.rect1(
          0, 0,
          target.texture.width, -target.texture.height,
        ),
        texturePos.ref,
        rl.Color.WHITE
      );

      if (mousePos.y > 50)
      {
        if (rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value)) {
          rl.Core.DrawCircleLines(mousePos.x.toInt(), mousePos.y.toInt(), brushSize, rl.Color.GRAY);
        } else {
          rl.Core.DrawCircle(rl.Core.GetMouseX(), rl.Core.GetMouseY(), brushSize, colors[colorSelected]);
        }
      }

      rl.Core.DrawRectangle(0, 0, rl.Core.GetScreenWidth(), 50, rl.Color.RAYWHITE);
      rl.Core.DrawLine(0, 50, rl.Core.GetScreenWidth(), 50, rl.Color.LIGHTGRAY);

      for (int i = 0; i < MAX_COLORS_COUNT; i++) {
        rl.Core.DrawRectangleRec(colorsRecs[i], colors[i]);
      }
      rl.Core.DrawRectangleLines(10, 10, 30, 30, rl.Color.LIGHTGRAY);

      if (colorMouseHover >= 0) {
        rl.Core.DrawRectangleRec(colorsRecs[colorMouseHover], rl.Core.Fade(rl.Color.WHITE, 0.6));
      }

      rl.Core.DrawRectangleLinesEx(
        rl.Temp.rect1(
          colorsRecs[colorSelected].x - 2,
          colorsRecs[colorSelected].y - 2,
          colorsRecs[colorSelected].width + 4,
          colorsRecs[colorSelected].height + 4
        ),
        2,
        rl.Color.BLACK
      );

      rl.Core.DrawRectangleLinesEx(btnSaveRec.ref, 2, btnSaveMouseHover ? rl.Color.RED : rl.Color.BLACK);
      rl.Core.DrawText("SAVE!".toC, 755, 20, 10, btnSaveMouseHover ? rl.Color.RED : rl.Color.BLACK);

      if (showSaveMessage)
      {
        rl.Core.DrawRectangle(0, 0, rl.Core.GetScreenWidth(), rl.Core.GetScreenHeight(), rl.Core.Fade(rl.Color.RAYWHITE, 0.8));
        rl.Core.DrawRectangle(0, 150, rl.Core.GetScreenWidth(), 80, rl.Color.BLACK);
        rl.Core.DrawText("IMAGE SAVED!".toC, 150, 180, 20, rl.Color.RAYWHITE);
      }

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadRenderTexture(target);

  rl.CloseWindowAndDispose();
}