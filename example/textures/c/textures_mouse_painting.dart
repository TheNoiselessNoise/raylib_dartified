// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_mouse_painting.c
// Run it: dart run textures_mouse_painting.dart
import 'dart:ffi';
import '../../base_c.dart';

const int MAX_COLORS_COUNT = 23;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  final texturePos = Vector2$.At('texturePos');
  final image = Image$.At('image');

  List<ColorC> colors = [
    RAYWHITE, YELLOW, GOLD, ORANGE,
    PINK, RED, MAROON, GREEN,
    LIME, DARKGREEN, SKYBLUE, BLUE,
    DARKBLUE, PURPLE, VIOLET, DARKPURPLE,
    BEIGE, BROWN, DARKBROWN, LIGHTGRAY,
    GRAY, DARKGRAY, BLACK,
  ];
  assert(colors.length == MAX_COLORS_COUNT);

  final colorsRecs = Rectangle$.At('colorsRecs', MAX_COLORS_COUNT);
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

  final btnSaveRec = Rectangle$.At('btnSaveRec').set(750, 10, 40, 30);
  bool btnSaveMouseHover = false;
  bool showSaveMessage = false;
  int saveMessageCounter = 0;

  InitWindow(screenWidth, screenHeight, "textures_mouse_painting".toC);
  SetTargetFPS(120);

  final target = LoadRenderTexture(screenWidth, screenHeight);

  BeginTextureMode(target);
  ClearBackground(colors[0]);
  EndTextureMode();

  while (!WindowShouldClose())
  {
    final mousePos = GetMousePosition();

    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) colorSelected++;
    else if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) colorSelected--;

    if (colorSelected >= MAX_COLORS_COUNT) colorSelected = MAX_COLORS_COUNT - 1;
    else if (colorSelected < 0) colorSelected = 0;

    for (int i = 0; i < MAX_COLORS_COUNT; i++) {
      if (CheckCollisionPointRec(mousePos, colorsRecs[i])) {
        colorMouseHover = i;
        break;
      }
      else colorMouseHover = -1;
    }

    if ((colorMouseHover >= 0) && IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      colorSelected = colorMouseHover;
      colorSelectedPrev = colorSelected;
    }

    brushSize += GetMouseWheelMove()*5;
    if (brushSize < 2) brushSize = 2;
    if (brushSize > 50) brushSize = 50;

    if (IsKeyPressed(KeyboardKey.KEY_C.value)) {
      BeginTextureMode(target);
      ClearBackground(colors[0]);
      EndTextureMode();
    }

    if (
      IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value) ||
      (GetGestureDetected() == Gesture.GESTURE_DRAG.value)
    ) {
      BeginTextureMode(target);
      if (mousePos.y > 50) {
        DrawCircle(mousePos.x.toInt(), mousePos.y.toInt(), brushSize, colors[colorSelected]);
      }
      EndTextureMode();
    }

    if (IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value)) {
      if (!mouseWasPressed) {
        colorSelectedPrev = colorSelected;
        colorSelected = 0;
      }

      mouseWasPressed = true;

      BeginTextureMode(target);
      if (mousePos.y > 50) {
        DrawCircle(mousePos.x.toInt(), mousePos.y.toInt(), brushSize, colors[0]);
      }
      EndTextureMode();
    } else if (IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_RIGHT.value) && mouseWasPressed) {
      colorSelected = colorSelectedPrev;
      mouseWasPressed = false;
    }

    btnSaveMouseHover = CheckCollisionPointRec(mousePos, btnSaveRec.ref);

    if (
      (btnSaveMouseHover && IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) ||
      IsKeyPressed(KeyboardKey.KEY_S.value)
    ) {
      image.ref = LoadImageFromTexture(target.texture);
      ImageFlipVertical(image);
      ExportImage(image.ref, "my_amazing_texture_painting.png".toC);
      UnloadImage(image.ref);
      showSaveMessage = true;
    }

    if (showSaveMessage) {
      saveMessageCounter++;
      if (saveMessageCounter > 240) {
        showSaveMessage = false;
        saveMessageCounter = 0;
      }
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTextureRec(
        target.texture,
        Rectangle$.$1.set(
          0, 0,
          target.texture.width, -target.texture.height,
        ),
        texturePos.ref,
        WHITE
      );

      if (mousePos.y > 50)
      {
        if (IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value)) {
          DrawCircleLines(mousePos.x.toInt(), mousePos.y.toInt(), brushSize, GRAY);
        } else {
          DrawCircle(GetMouseX(), GetMouseY(), brushSize, colors[colorSelected]);
        }
      }

      DrawRectangle(0, 0, GetScreenWidth(), 50, RAYWHITE);
      DrawLine(0, 50, GetScreenWidth(), 50, LIGHTGRAY);

      for (int i = 0; i < MAX_COLORS_COUNT; i++) {
        DrawRectangleRec(colorsRecs[i], colors[i]);
      }
      DrawRectangleLines(10, 10, 30, 30, LIGHTGRAY);

      if (colorMouseHover >= 0) {
        DrawRectangleRec(colorsRecs[colorMouseHover], Fade(WHITE, 0.6));
      }

      DrawRectangleLinesEx(
        Rectangle$.$1.set(
          colorsRecs[colorSelected].x - 2,
          colorsRecs[colorSelected].y - 2,
          colorsRecs[colorSelected].width + 4,
          colorsRecs[colorSelected].height + 4
        ),
        2,
        BLACK
      );

      DrawRectangleLinesEx(btnSaveRec.ref, 2, btnSaveMouseHover ? RED : BLACK);
      DrawText("SAVE!".toC, 755, 20, 10, btnSaveMouseHover ? RED : BLACK);

      if (showSaveMessage)
      {
        DrawRectangle(0, 0, GetScreenWidth(), GetScreenHeight(), Fade(RAYWHITE, 0.8));
        DrawRectangle(0, 150, GetScreenWidth(), 80, BLACK);
        DrawText("IMAGE SAVED!".toC, 150, 180, 20, RAYWHITE);
      }

    EndDrawing();
  }

  UnloadRenderTexture(target);

  CloseWindowAndDispose();
}