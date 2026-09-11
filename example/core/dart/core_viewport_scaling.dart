// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_viewport_scaling.c
// Run it: dart run core_viewport_scaling.dart
import '../../base_dart.dart';

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

  int screenWidth = 800;
  int screenHeight = 450;

  SetConfigFlags([.FLAG_WINDOW_RESIZABLE]);
  InitWindow(screenWidth, screenHeight, "core_viewport_scaling");
  SetTargetFPS(60);

  List<Vector2D> resolutionList = [
    .vec2(64, 64),
    .vec2(256, 240),
    .vec2(320, 180),
    .vec2(3840, 2160),
  ];

  int resolutionIndex = 0;
  int gameWidth = 64;
  int gameHeight = 64;

  RenderTextureD target = .zero();
  final RectangleD sourceRect = .zero();
  final RectangleD destRect = .zero();

  ViewportType viewportType = .KEEP_ASPECT_INTEGER;
  (screenWidth, screenHeight, target) = ResizeRenderSize(viewportType, gameWidth, gameHeight, sourceRect, destRect, target);

  final RectangleD decreaseResolutionButton = .rect(200, 30, 10, 10);
  final RectangleD increaseResolutionButton = .rect(215, 30, 10, 10);
  final RectangleD decreaseTypeButton = .rect(200, 45, 10, 10);
  final RectangleD increaseTypeButton = .rect(215, 45, 10, 10);

  while (!WindowShouldClose()) {
    if (IsWindowResized()) (screenWidth, screenHeight, target) = ResizeRenderSize(viewportType, gameWidth, gameHeight, sourceRect, destRect, target);

    final mousePosition = GetMousePosition();
    bool mousePressed = IsMouseButtonPressed(.MOUSE_BUTTON_LEFT);

    // Check buttons and rescale
    if (CheckCollisionPointRec(mousePosition, decreaseResolutionButton) && mousePressed)
    {
      resolutionIndex = (resolutionIndex + resolutionList.length - 1)%resolutionList.length;
      gameWidth = resolutionList[resolutionIndex].x.toInt();
      gameHeight = resolutionList[resolutionIndex].y.toInt();
      (screenWidth, screenHeight, target) = ResizeRenderSize(viewportType, gameWidth, gameHeight, sourceRect, destRect, target);
    }

    if (CheckCollisionPointRec(mousePosition, increaseResolutionButton) && mousePressed)
    {
      resolutionIndex = (resolutionIndex + 1)%resolutionList.length;
      gameWidth = resolutionList[resolutionIndex].x.toInt();
      gameHeight = resolutionList[resolutionIndex].y.toInt();
      (screenWidth, screenHeight, target) = ResizeRenderSize(viewportType, gameWidth, gameHeight, sourceRect, destRect, target);
    }

    if (CheckCollisionPointRec(mousePosition, decreaseTypeButton) && mousePressed)
    {
      viewportType = ViewportType.values[(viewportType.index + ViewportType.values.length - 1)%ViewportType.values.length];
      (screenWidth, screenHeight, target) = ResizeRenderSize(viewportType, gameWidth, gameHeight, sourceRect, destRect, target);
    }

    if (CheckCollisionPointRec(mousePosition, increaseTypeButton) && mousePressed)
    {
      viewportType = ViewportType.values[(viewportType.index + 1)%ViewportType.values.length];
      (screenWidth, screenHeight, target) = ResizeRenderSize(viewportType, gameWidth, gameHeight, sourceRect, destRect, target);
    }

    final textureMousePosition = Screen2RenderTexturePosition(mousePosition, sourceRect, destRect);

    BeginTextureMode(target);
      ClearBackground(WHITE);
      DrawCircleV(textureMousePosition, 20.0, LIME);
    EndTextureMode();

    BeginDrawing();
      ClearBackground(BLACK);

      DrawTexturePro(target.texture, sourceRect, destRect, .zero(), 0.0, WHITE);

      final RectangleD infoRect = .rect(5, 5, 330, 105);
      DrawRectangleRec(infoRect, Fade(LIGHTGRAY, 0.7));
      DrawRectangleLinesEx(infoRect, 1, BLUE);

      DrawText("Window Resolution: $screenWidth x $screenHeight", 15, 15, 10, BLACK);
      DrawText("Game Resolution: $gameWidth x $gameHeight", 15, 30, 10, BLACK);

      DrawText("Type: ${viewportType.name}", 15, 45, 10, BLACK);
      final Vector2D scaleRatio = .vec2(destRect.width/sourceRect.width, -destRect.height/sourceRect.height);
      if (scaleRatio.x < 0.001 || scaleRatio.y < 0.001) DrawText("Scale ratio: INVALID", 15, 60, 10, BLACK);
      else DrawText("Scale ratio: ${scaleRatio.x.f2} x ${scaleRatio.y.f2}", 15, 60, 10, BLACK);

      DrawText("Source size: ${sourceRect.width.f2} x ${(-sourceRect.height).f2}", 15, 75, 10, BLACK);
      DrawText("Destination size: ${destRect.width.f2} x ${destRect.height.f2}", 15, 90, 10, BLACK);

      DrawRectangleRec(decreaseTypeButton, SKYBLUE);
      DrawRectangleRec(increaseTypeButton, SKYBLUE);
      DrawRectangleRec(decreaseResolutionButton, SKYBLUE);
      DrawRectangleRec(increaseResolutionButton, SKYBLUE);
      DrawText("<", decreaseTypeButton.x + 3, decreaseTypeButton.y + 1, 10, BLACK);
      DrawText(">", increaseTypeButton.x + 3, increaseTypeButton.y + 1, 10, BLACK);
      DrawText("<", decreaseResolutionButton.x + 3, decreaseResolutionButton.y + 1, 10, BLACK);
      DrawText(">", increaseResolutionButton.x + 3, increaseResolutionButton.y + 1, 10, BLACK);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void KeepAspectCenteredInteger(int screenWidth, int screenHeight, int gameWidth, int gameHeight, RectangleD sourceRect, RectangleD destRect)
{
  sourceRect.x = 0.0;
  sourceRect.y = gameHeight.toDouble();
  sourceRect.width = gameWidth.toDouble();
  sourceRect.height = -gameHeight.toDouble();

  final ratio_x = screenWidth~/gameWidth;
  final ratio_y = screenHeight~/gameHeight;
  final resizeRatio = (ratio_x < ratio_y ? ratio_x : ratio_y).toDouble();

  destRect.x = (screenWidth - (gameWidth*resizeRatio))*0.5;
  destRect.y = (screenHeight - (gameHeight*resizeRatio))*0.5;
  destRect.width = gameWidth*resizeRatio;
  destRect.height = gameHeight*resizeRatio;
}

void KeepHeightCenteredInteger(int screenWidth, int screenHeight, int gameWidth, int gameHeight, RectangleD sourceRect, RectangleD destRect)
{
  final resizeRatio = screenHeight/gameHeight;
  sourceRect.x = 0.0;
  sourceRect.y = 0.0;
  sourceRect.width = screenWidth/resizeRatio;
  sourceRect.height = -gameHeight.toDouble();

  destRect.x = (screenWidth - (sourceRect.width*resizeRatio))*0.5;
  destRect.y = (screenHeight - (gameHeight*resizeRatio))*0.5;
  destRect.width = sourceRect.width*resizeRatio;
  destRect.height = gameHeight*resizeRatio;
}

void KeepWidthCenteredInteger(int screenWidth, int screenHeight, int gameWidth, int gameHeight, RectangleD sourceRect, RectangleD destRect)
{
  final resizeRatio = screenWidth/gameWidth;
  sourceRect.x = 0.0;
  sourceRect.y = 0.0;
  sourceRect.width = gameWidth.toDouble();
  sourceRect.height = screenHeight/resizeRatio;

  destRect.x = (screenWidth - (gameWidth*resizeRatio))*0.5;
  destRect.y = (screenHeight - (sourceRect.height*resizeRatio))*0.5;
  destRect.width = gameWidth*resizeRatio;
  destRect.height = sourceRect.height*resizeRatio;

  sourceRect.height *= -1.0;
}

void KeepAspectCentered(int screenWidth, int screenHeight, int gameWidth, int gameHeight, RectangleD sourceRect, RectangleD destRect)
{
  sourceRect.x = 0.0;
  sourceRect.y = gameHeight.toDouble();
  sourceRect.width = gameWidth.toDouble();
  sourceRect.height = -gameHeight.toDouble();

  final ratio_x = screenWidth/gameWidth;
  final ratio_y = screenHeight/gameHeight;
  final resizeRatio = ratio_x < ratio_y ? ratio_x : ratio_y;

  destRect.x = (screenWidth - (gameWidth*resizeRatio))*0.5;
  destRect.y = (screenHeight - (gameHeight*resizeRatio))*0.5;
  destRect.width = gameWidth*resizeRatio;
  destRect.height = gameHeight*resizeRatio;
}

void KeepHeightCentered(int screenWidth, int screenHeight, int gameWidth, int gameHeight, RectangleD sourceRect, RectangleD destRect)
{
  final resizeRatio = screenHeight/gameHeight;
  sourceRect.x = 0.0;
  sourceRect.y = 0.0;
  sourceRect.width = screenWidth/resizeRatio;
  sourceRect.height = -gameHeight.toDouble();

  destRect.x = (screenWidth - (sourceRect.width*resizeRatio))*0.5;
  destRect.y = (screenHeight - (gameHeight*resizeRatio))*0.5;
  destRect.width = sourceRect.width*resizeRatio;
  destRect.height = gameHeight*resizeRatio;
}

void KeepWidthCentered(int screenWidth, int screenHeight, int gameWidth, int gameHeight, RectangleD sourceRect, RectangleD destRect)
{
  final resizeRatio = screenWidth/gameWidth;
  sourceRect.x = 0.0;
  sourceRect.y = 0.0;
  sourceRect.width = gameWidth.toDouble();
  sourceRect.height = screenHeight/resizeRatio;

  destRect.x = (screenWidth - (gameWidth*resizeRatio))*0.5;
  destRect.y = (screenHeight - (sourceRect.height*resizeRatio))*0.5;
  destRect.width = gameWidth*resizeRatio;
  destRect.height = sourceRect.height*resizeRatio;

  sourceRect.height *= -1.0;
}

(int screenWidth, int screenHeight, RenderTextureD target) ResizeRenderSize(
  ViewportType viewportType,
  int gameWidth,
  int gameHeight,
  RectangleD sourceRect,
  RectangleD destRect,
  RenderTextureD target
) {
  final screenWidth = GetScreenWidth();
  final screenHeight = GetScreenHeight();

  switch(viewportType)
  {
    case .KEEP_ASPECT_INTEGER: KeepAspectCenteredInteger(screenWidth, screenHeight, gameWidth, gameHeight, sourceRect, destRect); break;
    case .KEEP_HEIGHT_INTEGER: KeepHeightCenteredInteger(screenWidth, screenHeight, gameWidth, gameHeight, sourceRect, destRect); break;
    case .KEEP_WIDTH_INTEGER: KeepWidthCenteredInteger(screenWidth, screenHeight, gameWidth, gameHeight, sourceRect, destRect); break;
    case .KEEP_ASPECT: KeepAspectCentered(screenWidth, screenHeight, gameWidth, gameHeight, sourceRect, destRect); break;
    case .KEEP_HEIGHT: KeepHeightCentered(screenWidth, screenHeight, gameWidth, gameHeight, sourceRect, destRect); break;
    case .KEEP_WIDTH: KeepWidthCentered(screenWidth, screenHeight, gameWidth, gameHeight, sourceRect, destRect); break;
  }

  UnloadRenderTexture(target);

  final newTarget = LoadRenderTexture(sourceRect.width, -sourceRect.height);

  return (screenWidth, screenHeight, newTarget);
}

Vector2D Screen2RenderTexturePosition(Vector2D point, RectangleD textureRect, RectangleD scaledRect)
{
  final Vector2D relativePosition = .vec2(point.x - scaledRect.x, point.y - scaledRect.y);
  final Vector2D ratio = .vec2(textureRect.width/scaledRect.width, -textureRect.height/scaledRect.height);
  return .vec2(relativePosition.x*ratio.x, relativePosition.y*ratio.x);
}