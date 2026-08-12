// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_viewport_scaling.c
// Run it: dart run core_viewport_scaling.dart
import 'dart:ffi';
import '../../base_c.dart';

enum ViewportType {
  // Only upscale, useful for pixel art
  KEEP_ASPECT_INTEGER,
  KEEP_HEIGHT_INTEGER,
  KEEP_WIDTH_INTEGER,
  // Can also downscale
  KEEP_ASPECT,
  KEEP_HEIGHT,
  KEEP_WIDTH;
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  final screenWidth = Int$.val.ValueUnique(800);
  final screenHeight = Int$.val.ValueUnique(450);

  SetConfigFlags(ConfigFlags.FLAG_WINDOW_RESIZABLE.value);
  InitWindow(screenWidth.value, screenHeight.value, "core_viewport_scaling".toC);
  SetTargetFPS(60);

  List<Vector2C> resolutionList = [
    Vector2$.val.$new.set(64, 64),
    Vector2$.val.$new.set(256, 240),
    Vector2$.val.$new.set(320, 180),
    Vector2$.val.$new.set(3840, 2160),
  ];

  int resolutionIndex = 0;
  int gameWidth = 64;
  int gameHeight = 64;

  final target = RenderTexture$.val.$newPtr;
  final sourceRect = Rectangle$.val.$newPtr;
  final destRect = Rectangle$.val.$newPtr;

  ViewportType viewportType = .KEEP_ASPECT_INTEGER;
  ResizeRenderSize(viewportType, screenWidth, screenHeight, gameWidth, gameHeight, sourceRect, destRect, target);

  final decreaseResolutionButton = Rectangle$.val.$new.set(200, 30, 10, 10);
  final increaseResolutionButton = Rectangle$.val.$new.set(215, 30, 10, 10);
  final decreaseTypeButton = Rectangle$.val.$new.set(200, 45, 10, 10);
  final increaseTypeButton = Rectangle$.val.$new.set(215, 45, 10, 10);

  while (!WindowShouldClose()) {
    if (IsWindowResized()) ResizeRenderSize(viewportType, screenWidth, screenHeight, gameWidth, gameHeight, sourceRect, destRect, target);

    final mousePosition = GetMousePosition();
    bool mousePressed = IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value);

    // Check buttons and rescale
    if (CheckCollisionPointRec(mousePosition, decreaseResolutionButton) && mousePressed)
    {
      resolutionIndex = (resolutionIndex + resolutionList.length - 1)%resolutionList.length;
      gameWidth = resolutionList[resolutionIndex].x.toInt();
      gameHeight = resolutionList[resolutionIndex].y.toInt();
      ResizeRenderSize(viewportType, screenWidth, screenHeight, gameWidth, gameHeight, sourceRect, destRect, target);
    }

    if (CheckCollisionPointRec(mousePosition, increaseResolutionButton) && mousePressed)
    {
      resolutionIndex = (resolutionIndex + 1)%resolutionList.length;
      gameWidth = resolutionList[resolutionIndex].x.toInt();
      gameHeight = resolutionList[resolutionIndex].y.toInt();
      ResizeRenderSize(viewportType, screenWidth, screenHeight, gameWidth, gameHeight, sourceRect, destRect, target);
    }

    if (CheckCollisionPointRec(mousePosition, decreaseTypeButton) && mousePressed)
    {
      viewportType = ViewportType.values[(viewportType.index + ViewportType.values.length - 1)%ViewportType.values.length];
      ResizeRenderSize(viewportType, screenWidth, screenHeight, gameWidth, gameHeight, sourceRect, destRect, target);
    }

    if (CheckCollisionPointRec(mousePosition, increaseTypeButton) && mousePressed)
    {
      viewportType = ViewportType.values[(viewportType.index + 1)%ViewportType.values.length];
      ResizeRenderSize(viewportType, screenWidth, screenHeight, gameWidth, gameHeight, sourceRect, destRect, target);
    }

    final textureMousePosition = Vector2$.val.At('textureMousePosition');
    Screen2RenderTexturePosition(textureMousePosition, mousePosition, sourceRect.ref, destRect.ref);

    BeginTextureMode(target.ref);
      ClearBackground(WHITE);
      DrawCircleV(textureMousePosition.ref, 20.0, LIME);
    EndTextureMode();

    BeginDrawing();
      ClearBackground(BLACK);

      DrawTexturePro(target.ref.texture, sourceRect.ref, destRect.ref, Vector2$.val.$zero, 0.0, WHITE);

      final infoRect = Rectangle$.val.$1.set(5, 5, 330, 105);
      DrawRectangleRec(infoRect, Fade(LIGHTGRAY, 0.7));
      DrawRectangleLinesEx(infoRect, 1, BLUE);

      DrawText("Window Resolution: ${screenWidth.value} x ${screenHeight.value}".toC, 15, 15, 10, BLACK);
      DrawText("Game Resolution: $gameWidth x $gameHeight".toC, 15, 30, 10, BLACK);

      DrawText("Type: ${viewportType.name}".toC, 15, 45, 10, BLACK);
      final scaleRatio = Vector2$.val.$1.set(destRect.ref.width/sourceRect.ref.width, -destRect.ref.height/sourceRect.ref.height);
      if (scaleRatio.x < 0.001 || scaleRatio.y < 0.001) DrawText("Scale ratio: INVALID".toC, 15, 60, 10, BLACK);
      else DrawText("Scale ratio: ${scaleRatio.x.f2} x ${scaleRatio.y.f2}".toC, 15, 60, 10, BLACK);

      DrawText("Source size: ${sourceRect.ref.width.f2} x ${(-sourceRect.ref.height).f2}".toC, 15, 75, 10, BLACK);
      DrawText("Destination size: ${destRect.ref.width.f2} x ${destRect.ref.height.f2}".toC, 15, 90, 10, BLACK);

      DrawRectangleRec(decreaseTypeButton, SKYBLUE);
      DrawRectangleRec(increaseTypeButton, SKYBLUE);
      DrawRectangleRec(decreaseResolutionButton, SKYBLUE);
      DrawRectangleRec(increaseResolutionButton, SKYBLUE);
      DrawText("<".toC, (decreaseTypeButton.x + 3).toInt(), (decreaseTypeButton.y + 1).toInt(), 10, BLACK);
      DrawText(">".toC, (increaseTypeButton.x + 3).toInt(), (increaseTypeButton.y + 1).toInt(), 10, BLACK);
      DrawText("<".toC, (decreaseResolutionButton.x + 3).toInt(), (decreaseResolutionButton.y + 1).toInt(), 10, BLACK);
      DrawText(">".toC, (increaseResolutionButton.x + 3).toInt(), (increaseResolutionButton.y + 1).toInt(), 10, BLACK);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void KeepAspectCenteredInteger(int screenWidth, int screenHeight, int gameWidth, int gameHeight, Pointer<RectangleC> sourceRect, Pointer<RectangleC> destRect)
{
  sourceRect.ref.x = 0.0;
  sourceRect.ref.y = gameHeight.toDouble();
  sourceRect.ref.width = gameWidth.toDouble();
  sourceRect.ref.height = -gameHeight.toDouble();

  final ratio_x = screenWidth~/gameWidth;
  final ratio_y = screenHeight~/gameHeight;
  final resizeRatio = (ratio_x < ratio_y ? ratio_x : ratio_y).toDouble();

  destRect.ref.x = (screenWidth - (gameWidth*resizeRatio))*0.5;
  destRect.ref.y = (screenHeight - (gameHeight*resizeRatio))*0.5;
  destRect.ref.width = gameWidth*resizeRatio;
  destRect.ref.height = gameHeight*resizeRatio;
}

void KeepHeightCenteredInteger(int screenWidth, int screenHeight, int gameWidth, int gameHeight, Pointer<RectangleC> sourceRect, Pointer<RectangleC> destRect)
{
  final resizeRatio = screenHeight/gameHeight;
  sourceRect.ref.x = 0.0;
  sourceRect.ref.y = 0.0;
  sourceRect.ref.width = screenWidth/resizeRatio;
  sourceRect.ref.height = -gameHeight.toDouble();

  destRect.ref.x = (screenWidth - (sourceRect.ref.width*resizeRatio))*0.5;
  destRect.ref.y = (screenHeight - (gameHeight*resizeRatio))*0.5;
  destRect.ref.width = sourceRect.ref.width*resizeRatio;
  destRect.ref.height = gameHeight*resizeRatio;
}

void KeepWidthCenteredInteger(int screenWidth, int screenHeight, int gameWidth, int gameHeight, Pointer<RectangleC> sourceRect, Pointer<RectangleC> destRect)
{
  final resizeRatio = screenWidth/gameWidth;
  sourceRect.ref.x = 0.0;
  sourceRect.ref.y = 0.0;
  sourceRect.ref.width = gameWidth.toDouble();
  sourceRect.ref.height = screenHeight/resizeRatio;

  destRect.ref.x = (screenWidth - (gameWidth*resizeRatio))*0.5;
  destRect.ref.y = (screenHeight - (sourceRect.ref.height*resizeRatio))*0.5;
  destRect.ref.width = gameWidth*resizeRatio;
  destRect.ref.height = sourceRect.ref.height*resizeRatio;

  sourceRect.ref.height *= -1.0;
}

void KeepAspectCentered(int screenWidth, int screenHeight, int gameWidth, int gameHeight, Pointer<RectangleC> sourceRect, Pointer<RectangleC> destRect)
{
  sourceRect.ref.x = 0.0;
  sourceRect.ref.y = gameHeight.toDouble();
  sourceRect.ref.width = gameWidth.toDouble();
  sourceRect.ref.height = -gameHeight.toDouble();

  final ratio_x = screenWidth/gameWidth;
  final ratio_y = screenHeight/gameHeight;
  final resizeRatio = ratio_x < ratio_y ? ratio_x : ratio_y;

  destRect.ref.x = (screenWidth - (gameWidth*resizeRatio))*0.5;
  destRect.ref.y = (screenHeight - (gameHeight*resizeRatio))*0.5;
  destRect.ref.width = gameWidth*resizeRatio;
  destRect.ref.height = gameHeight*resizeRatio;
}

void KeepHeightCentered(int screenWidth, int screenHeight, int gameWidth, int gameHeight, Pointer<RectangleC> sourceRect, Pointer<RectangleC> destRect)
{
  final resizeRatio = screenHeight/gameHeight;
  sourceRect.ref.x = 0.0;
  sourceRect.ref.y = 0.0;
  sourceRect.ref.width = screenWidth/resizeRatio;
  sourceRect.ref.height = -gameHeight.toDouble();

  destRect.ref.x = (screenWidth - (sourceRect.ref.width*resizeRatio))*0.5;
  destRect.ref.y = (screenHeight - (gameHeight*resizeRatio))*0.5;
  destRect.ref.width = sourceRect.ref.width*resizeRatio;
  destRect.ref.height = gameHeight*resizeRatio;
}

void KeepWidthCentered(int screenWidth, int screenHeight, int gameWidth, int gameHeight, Pointer<RectangleC> sourceRect, Pointer<RectangleC> destRect)
{
  final resizeRatio = screenWidth/gameWidth;
  sourceRect.ref.x = 0.0;
  sourceRect.ref.y = 0.0;
  sourceRect.ref.width = gameWidth.toDouble();
  sourceRect.ref.height = screenHeight/resizeRatio;

  destRect.ref.x = (screenWidth - (gameWidth*resizeRatio))*0.5;
  destRect.ref.y = (screenHeight - (sourceRect.ref.height*resizeRatio))*0.5;
  destRect.ref.width = gameWidth*resizeRatio;
  destRect.ref.height = sourceRect.ref.height*resizeRatio;

  sourceRect.ref.height *= -1.0;
}

void ResizeRenderSize(
  ViewportType viewportType,
  Pointer<Int> screenWidth,
  Pointer<Int> screenHeight,
  int gameWidth,
  int gameHeight,
  Pointer<RectangleC> sourceRect,
  Pointer<RectangleC> destRect,
  Pointer<RenderTextureC> target
) {
  screenWidth.value = GetScreenWidth();
  screenHeight.value = GetScreenHeight();

  switch(viewportType)
  {
    case .KEEP_ASPECT_INTEGER: KeepAspectCenteredInteger(screenWidth.value, screenHeight.value, gameWidth, gameHeight, sourceRect, destRect); break;
    case .KEEP_HEIGHT_INTEGER: KeepHeightCenteredInteger(screenWidth.value, screenHeight.value, gameWidth, gameHeight, sourceRect, destRect); break;
    case .KEEP_WIDTH_INTEGER: KeepWidthCenteredInteger(screenWidth.value, screenHeight.value, gameWidth, gameHeight, sourceRect, destRect); break;
    case .KEEP_ASPECT: KeepAspectCentered(screenWidth.value, screenHeight.value, gameWidth, gameHeight, sourceRect, destRect); break;
    case .KEEP_HEIGHT: KeepHeightCentered(screenWidth.value, screenHeight.value, gameWidth, gameHeight, sourceRect, destRect); break;
    case .KEEP_WIDTH: KeepWidthCentered(screenWidth.value, screenHeight.value, gameWidth, gameHeight, sourceRect, destRect); break;
  }

  UnloadRenderTexture(target.ref);
  target.ref = LoadRenderTexture(sourceRect.ref.width.toInt(), -sourceRect.ref.height.toInt());
}

void Screen2RenderTexturePosition(Pointer<Vector2C> dest, Vector2C point, RectangleC textureRect, RectangleC scaledRect)
{
  final relativePosition = Vector2$.val.$1.set(point.x - scaledRect.x, point.y - scaledRect.y);
  final ratio = Vector2$.val.$2.set(textureRect.width/scaledRect.width, -textureRect.height/scaledRect.height);
  dest.set(relativePosition.x*ratio.x, relativePosition.y*ratio.x);
}