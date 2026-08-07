// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_mouse_painting.c
// Run it: dart run textures_mouse_painting.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  final colors = <ColorD>[
    .RAYWHITE, .YELLOW, .GOLD, .ORANGE,
    .PINK, .RED, .MAROON, .GREEN,
    .LIME, .DARKGREEN, .SKYBLUE, .BLUE,
    .DARKBLUE, .PURPLE, .VIOLET, .DARKPURPLE,
    .BEIGE, .BROWN, .DARKBROWN, .LIGHTGRAY,
    .GRAY, .DARKGRAY, .BLACK,
  ];

  final colorsRecs = <RectangleD>[];
  for (int i = 0; i < colors.length; i++) {
    colorsRecs.add(.new(
      x: (10 + 30*i + 2*i).toDouble(),
      y: 10,
      width: 30,
      height: 30,
    ));
  }

  int colorSelected = 0;
  int colorSelectedPrev = colorSelected;
  int colorMouseHover = 0;
  double brushSize = 20;
  bool mouseWasPressed = false;

  final RectangleD btnSaveRec = .rect(750, 10, 40, 30);
  bool btnSaveMouseHover = false;
  bool showSaveMessage = false;
  int saveMessageCounter = 0;

  InitWindow(screenWidth, screenHeight, "textures_mouse_painting");
  SetTargetFPS(120);

  final target = LoadRenderTexture(screenWidth, screenHeight);

  BeginTextureMode(target);
  ClearBackground(colors[0]);
  EndTextureMode();

  while (!WindowShouldClose())
  {
    final mousePos = GetMousePosition();

    if (IsKeyPressed(.KEY_RIGHT)) colorSelected++;
    else if (IsKeyPressed(.KEY_LEFT)) colorSelected--;

    if (colorSelected >= colors.length) colorSelected = colors.length - 1;
    else if (colorSelected < 0) colorSelected = 0;

    for (int i = 0; i < colors.length; i++) {
      if (CheckCollisionPointRec(mousePos, colorsRecs[i])) {
        colorMouseHover = i;
        break;
      }
      else colorMouseHover = -1;
    }

    if ((colorMouseHover >= 0) && IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) {
      colorSelected = colorMouseHover;
      colorSelectedPrev = colorSelected;
    }

    brushSize += GetMouseWheelMove()*5;
    if (brushSize < 2) brushSize = 2;
    if (brushSize > 50) brushSize = 50;

    if (IsKeyPressed(.KEY_C)) {
      BeginTextureMode(target);
      ClearBackground(colors[0]);
      EndTextureMode();
    }

    if (
      IsMouseButtonDown(.MOUSE_BUTTON_LEFT) ||
      (GetGestureDetected() == .GESTURE_DRAG)
    ) {
      BeginTextureMode(target);
      if (mousePos.y > 50) {
        DrawCircle(mousePos.x, mousePos.y, brushSize, colors[colorSelected]);
      }
      EndTextureMode();
    }

    if (IsMouseButtonDown(.MOUSE_BUTTON_RIGHT)) {
      if (!mouseWasPressed) {
        colorSelectedPrev = colorSelected;
        colorSelected = 0;
      }

      mouseWasPressed = true;

      BeginTextureMode(target);
      if (mousePos.y > 50) {
        DrawCircle(mousePos.x, mousePos.y, brushSize, colors[0]);
      }
      EndTextureMode();
    } else if (IsMouseButtonReleased(.MOUSE_BUTTON_RIGHT) && mouseWasPressed) {
      colorSelected = colorSelectedPrev;
      mouseWasPressed = false;
    }

    btnSaveMouseHover = CheckCollisionPointRec(mousePos, btnSaveRec);

    if (
      (btnSaveMouseHover && IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) ||
      IsKeyPressed(.KEY_S)
    ) {
      final image = LoadImageFromTexture(target.texture);
      ImageFlipVertical(image);
      ExportImage(image, "my_amazing_texture_painting.png");
      UnloadImage(image);
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

      ClearBackground(.RAYWHITE);

      DrawTextureRec(
        target.texture,
        .rect(
          0, 0,
          target.texture.width, -target.texture.height,
        ),
        .zero(),
        .WHITE
      );

      if (mousePos.y > 50)
      {
        if (IsMouseButtonDown(.MOUSE_BUTTON_RIGHT)) {
          DrawCircleLines(mousePos.x, mousePos.y, brushSize, .GRAY);
        } else {
          DrawCircle(GetMouseX(), GetMouseY(), brushSize, colors[colorSelected]);
        }
      }

      DrawRectangle(0, 0, GetScreenWidth(), 50, .RAYWHITE);
      DrawLine(0, 50, GetScreenWidth(), 50, .LIGHTGRAY);

      for (int i = 0; i < colors.length; i++) {
        DrawRectangleRec(colorsRecs[i], colors[i]);
      }
      DrawRectangleLines(10, 10, 30, 30, .LIGHTGRAY);

      if (colorMouseHover >= 0) {
        DrawRectangleRec(colorsRecs[colorMouseHover], Fade(.WHITE, 0.6));
      }

      DrawRectangleLinesEx(
        .rect(
          colorsRecs[colorSelected].x - 2,
          colorsRecs[colorSelected].y - 2,
          colorsRecs[colorSelected].width + 4,
          colorsRecs[colorSelected].height + 4
        ),
        2, .BLACK
      );

      DrawRectangleLinesEx(btnSaveRec, 2, btnSaveMouseHover ? .RED : .BLACK);
      DrawText("SAVE!", 755, 20, 10, btnSaveMouseHover ? .RED : .BLACK);

      if (showSaveMessage)
      {
        DrawRectangle(0, 0, GetScreenWidth(), GetScreenHeight(), Fade(.RAYWHITE, 0.8));
        DrawRectangle(0, 150, GetScreenWidth(), 80, .BLACK);
        DrawText("IMAGE SAVED!", 150, 180, 20, .RAYWHITE);
      }

    EndDrawing();
  }

  UnloadRenderTexture(target);

  CloseWindowAndDispose();
}