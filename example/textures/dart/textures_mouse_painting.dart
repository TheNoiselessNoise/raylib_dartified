// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_mouse_painting.c
// Run it: dart run textures_mouse_painting.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

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

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_mouse_painting");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(120);

  final target = rl.CoreD.LoadRenderTexture(screenWidth, screenHeight);

  rl.CoreD.BeginTextureMode(target);
  rl.CoreD.ClearBackground(colors[0]);
  rl.CoreD.EndTextureMode();

  while (!rl.CoreD.WindowShouldClose())
  {
    final mousePos = rl.CoreD.GetMousePosition();

    if (rl.CoreD.IsKeyPressed(.KEY_RIGHT)) colorSelected++;
    else if (rl.CoreD.IsKeyPressed(.KEY_LEFT)) colorSelected--;

    if (colorSelected >= colors.length) colorSelected = colors.length - 1;
    else if (colorSelected < 0) colorSelected = 0;

    for (int i = 0; i < colors.length; i++) {
      if (rl.CoreD.CheckCollisionPointRec(mousePos, colorsRecs[i])) {
        colorMouseHover = i;
        break;
      }
      else colorMouseHover = -1;
    }

    if ((colorMouseHover >= 0) && rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) {
      colorSelected = colorMouseHover;
      colorSelectedPrev = colorSelected;
    }

    brushSize += rl.CoreD.GetMouseWheelMove()*5;
    if (brushSize < 2) brushSize = 2;
    if (brushSize > 50) brushSize = 50;

    if (rl.CoreD.IsKeyPressed(.KEY_C)) {
      rl.CoreD.BeginTextureMode(target);
      rl.CoreD.ClearBackground(colors[0]);
      rl.CoreD.EndTextureMode();
    }

    if (
      rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT) ||
      (rl.CoreD.GetGestureDetected() == .GESTURE_DRAG)
    ) {
      rl.CoreD.BeginTextureMode(target);
      if (mousePos.y > 50) {
        rl.CoreD.DrawCircle(mousePos.x, mousePos.y, brushSize, colors[colorSelected]);
      }
      rl.CoreD.EndTextureMode();
    }

    if (rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_RIGHT)) {
      if (!mouseWasPressed) {
        colorSelectedPrev = colorSelected;
        colorSelected = 0;
      }

      mouseWasPressed = true;

      rl.CoreD.BeginTextureMode(target);
      if (mousePos.y > 50) {
        rl.CoreD.DrawCircle(mousePos.x, mousePos.y, brushSize, colors[0]);
      }
      rl.CoreD.EndTextureMode();
    } else if (rl.CoreD.IsMouseButtonReleased(.MOUSE_BUTTON_RIGHT) && mouseWasPressed) {
      colorSelected = colorSelectedPrev;
      mouseWasPressed = false;
    }

    btnSaveMouseHover = rl.CoreD.CheckCollisionPointRec(mousePos, btnSaveRec);

    if (
      (btnSaveMouseHover && rl.CoreD.IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) ||
      rl.CoreD.IsKeyPressed(.KEY_S)
    ) {
      final image = rl.CoreD.LoadImageFromTexture(target.texture);
      rl.CoreD.ImageFlipVertical(image);
      rl.CoreD.ExportImage(image, "my_amazing_texture_painting.png");
      rl.CoreD.UnloadImage(image);
      showSaveMessage = true;
    }

    if (showSaveMessage) {
      saveMessageCounter++;
      if (saveMessageCounter > 240) {
        showSaveMessage = false;
        saveMessageCounter = 0;
      }
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawTextureRec(
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
        if (rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_RIGHT)) {
          rl.CoreD.DrawCircleLines(mousePos.x, mousePos.y, brushSize, .GRAY);
        } else {
          rl.CoreD.DrawCircle(rl.CoreD.GetMouseX(), rl.CoreD.GetMouseY(), brushSize, colors[colorSelected]);
        }
      }

      rl.CoreD.DrawRectangle(0, 0, rl.CoreD.GetScreenWidth(), 50, .RAYWHITE);
      rl.CoreD.DrawLine(0, 50, rl.CoreD.GetScreenWidth(), 50, .LIGHTGRAY);

      for (int i = 0; i < colors.length; i++) {
        rl.CoreD.DrawRectangleRec(colorsRecs[i], colors[i]);
      }
      rl.CoreD.DrawRectangleLines(10, 10, 30, 30, .LIGHTGRAY);

      if (colorMouseHover >= 0) {
        rl.CoreD.DrawRectangleRec(colorsRecs[colorMouseHover], rl.CoreD.Fade(.WHITE, 0.6));
      }

      rl.CoreD.DrawRectangleLinesEx(
        .rect(
          colorsRecs[colorSelected].x - 2,
          colorsRecs[colorSelected].y - 2,
          colorsRecs[colorSelected].width + 4,
          colorsRecs[colorSelected].height + 4
        ),
        2, .BLACK
      );

      rl.CoreD.DrawRectangleLinesEx(btnSaveRec, 2, btnSaveMouseHover ? .RED : .BLACK);
      rl.CoreD.DrawText("SAVE!", 755, 20, 10, btnSaveMouseHover ? .RED : .BLACK);

      if (showSaveMessage)
      {
        rl.CoreD.DrawRectangle(0, 0, rl.CoreD.GetScreenWidth(), rl.CoreD.GetScreenHeight(), rl.CoreD.Fade(.RAYWHITE, 0.8));
        rl.CoreD.DrawRectangle(0, 150, rl.CoreD.GetScreenWidth(), 80, .BLACK);
        rl.CoreD.DrawText("IMAGE SAVED!", 150, 180, 20, .RAYWHITE);
      }

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadRenderTexture(target);

  rl.CloseWindowAndDispose();
}