part of '../../raylib_dartified_unhinged.dart';

final class HeadlessRenderBackend extends RenderBackend {
  @override
  void drawText(String text, num posX, num posY, num fontSize, Color color) {}

  @override
  void drawTextEx(Font font, String text, Vector2 position, num fontSize, num spacing, Color tint) {}

  @override
  void drawTextPro(Font font, String text, Vector2 position, Vector2 origin, num rotation, num fontSize, num spacing, Color tint) {}

  @override
  void drawLineEx(Vector2 startPos, Vector2 endPos, num thick, Color color) {}

  @override
  int measureText(String text, num fontSize) => 0;
  
  @override
  Vector2 measureTextEx(Font font, String text, num fontSize, num spacing) => .zero();

  @override
  void drawRectangle(num posX, num posY, num width, num height, Color color) {}

  @override
  void drawRectangleGradientEx(Rectangle rec, Color topLeft, Color bottomLeft, Color topRight, Color bottomRight) {}

  @override
  void drawRectangleRounded(Rectangle rec, num roundness, num segments, Color color) {}

  @override
  void drawRectangleRoundedLinesEx(Rectangle rec, num roundness, num segments, num lineThick, Color color) {}

  @override
  void drawRectangleRec(Rectangle rec, Color color) {}

  @override
  void drawRectanglePro(Rectangle rec, Vector2 origin, num rotation, Color color) {}

  @override
  void drawPixel(num posX, num posY, Color color) {}

  @override
  void drawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color) {}

  @override
  void drawCircle(num centerX, num centerY, num radius, Color color) {}

  @override
  void drawTexturePro(Texture texture, Rectangle source, Rectangle dest, Vector2 origin, num rotation, Color tint) {}

  @override
  void beginDrawing() {}

  @override
  void clearBackground(Color color) {}
  
  @override
  void endDrawing() {}

  @override
  void beginScissorMode(num x, num y, num width, num height) {}
    
  @override
  void endScissorMode() {}

  @override
  void drawRectangleLinesEx(Rectangle rec, num lineThick, Color color) {}

  @override
  void drawCircleLinesV(Vector2 center, num radius, Color color) {}

  @override
  void drawRectangleLinesRotated(Rectangle rect, num rotationDegrees, num lineThick, Color color) {}
}

final class HeadlessInputBackend extends InputBackend {
  @override
  bool isKeyPressed(KeyboardKey key) => false;

  @override
  bool isKeyDown(KeyboardKey key) => false;

  @override
  bool isKeyUp(KeyboardKey key) => false;

  @override
  bool isKeyPressedRepeat(KeyboardKey key) => false;

  @override
  int getCharPressed() => 0;

  @override
  int getKeyPressed() => 0;
  
  @override
  bool isMouseButtonPressed(MouseButton button) => false;
  
  @override
  bool isMouseButtonDown(MouseButton button) => false;
}

final class HeadlessCollisionBackend extends CollisionBackend {
  @override
  bool circles(Vector2 center1, num radius1, Vector2 center2, num radius2) => false;
  
  @override
  bool circleRectangle(Vector2 center, num radius, Rectangle rec) => false;
  
  @override
  bool rectangles(Rectangle rec1, Rectangle rec2) => false;

  @override
  bool pointRectangle(Vector2 point, Rectangle rec) => false;
}

final class HeadlessAssetManager extends AssetManager {
  @override
  UnhingedAsset<Image> image(String id, {String? path}) => .new(id, .zero());

  @override
  UnhingedAsset<Texture> texture(String id, {String? path}) => .new(id, .zero());

  @override
  UnhingedAsset<Font> font(String id, {String? path, int fontSize = 32}) => .new(id, .zero());
}

final class HeadlessBackend extends UnhingedBackend {
  HeadlessBackend() : super(
    render: HeadlessRenderBackend(),
    input: HeadlessInputBackend(),
    collision: HeadlessCollisionBackend(),
    assets: HeadlessAssetManager(),
  );

  @override
  double getFrameTime() => 1;

  @override
  void setMouseCursor(MouseCursor cursor) {}

  @override
  void setClipboardText(String text) {}

  @override
  String getClipboardText() => '';

  @override
  void setTargetFPS(int fps) {}

  @override
  Font getFontDefault() => .new();
}