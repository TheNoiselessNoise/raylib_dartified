part of '../../raylib_dartified_unhinged.dart';

abstract class RenderBackend {
  void drawText(String text, num posX, num posY, num fontSize, Color color);

  void drawTextEx(Font font, String text, Vector2 position, num fontSize, num spacing, Color tint);

  void drawTextPro(Font font, String text, Vector2 position, Vector2 origin, num rotation, num fontSize, num spacing, Color tint);

  void drawLineEx(Vector2 startPos, Vector2 endPos, num thick, Color color);
  
  int measureText(String text, num fontSize);

  Vector2 measureTextEx(Font font, String text, num fontSize, num spacing);
  
  void drawRectangle(num posX, num posY, num width, num height, Color color);

  void drawRectangleGradientEx(Rectangle rec, Color topLeft, Color bottomLeft, Color topRight, Color bottomRight) {}

  void drawRectangleRounded(Rectangle rec, num roundness, num segments, Color color);

  void drawRectangleRoundedLinesEx(Rectangle rec, num roundness, num segments, num lineThick, Color color);

  void drawRectangleRec(Rectangle rec, Color color);

  void drawRectanglePro(Rectangle rec, Vector2 origin, num rotation, Color color);

  void drawPixel(num posX, num posY, Color color);

  void drawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);

  void drawCircle(num centerX, num centerY, num radius, Color color);

  void drawTexturePro(Texture texture, Rectangle source, Rectangle dest, Vector2 origin, num rotation, Color tint);

  void beginDrawing();

  void clearBackground(Color color);
  
  void endDrawing();

  void beginScissorMode(num x, num y, num width, num height);
    
  void endScissorMode();
  
  void drawRectangleLinesEx(Rectangle rec, num lineThick, Color color);

  void drawCircleLinesV(Vector2 center, num radius, Color color);

  void drawRectangleLinesRotated(Rectangle rect, num rotationDegrees, num lineThick, Color color);

  void dispose() {}
}

abstract class InputBackend {
  bool isKeyPressed(KeyboardKey key);

  bool isKeyDown(KeyboardKey key);

  bool isKeyUp(KeyboardKey key);

  bool isKeyPressedRepeat(KeyboardKey key);

  int getCharPressed();

  int getKeyPressed();
  
  bool isMouseButtonPressed(MouseButton button);
  
  bool isMouseButtonDown(MouseButton button);

  void dispose() {}
}

abstract class CollisionBackend {
  bool circles(Vector2 center1, num radius1, Vector2 center2, num radius2);
  
  bool circleRectangle(Vector2 center, num radius, Rectangle rec);
  
  bool rectangles(Rectangle rec1, Rectangle rec2);

  bool pointRectangle(Vector2 point, Rectangle rec);

  void dispose() {}
}

class UnhingedAsset<X> {
  final String id;
  final X asset;

  UnhingedAsset(this.id, this.asset);
}

abstract class AssetManager {
  UnhingedAsset<Image> image(String id, {String? path});

  UnhingedAsset<Texture> texture(String id, {String? path});

  UnhingedAsset<Font> font(String id, {String? path, int fontSize = 32});

  void dispose() {}
}

abstract class UnhingedBackend {
  final RenderBackend render;
  final InputBackend input;
  final CollisionBackend collision;
  final AssetManager assets;

  UnhingedBackend({
    required this.render,
    required this.input,
    required this.collision,
    required this.assets,
  });

  late MouseInfo mouse = .new();

  void beginFrame() {}
  
  void endFrame() {}

  double getFrameTime();

  void setMouseCursor(MouseCursor cursor);

  void setClipboardText(String text);

  String getClipboardText();

  void setTargetFPS(int fps);

  Font getFontDefault();

  @mustCallSuper
  void dispose() {
    render.dispose();
    input.dispose();
    collision.dispose();
    assets.dispose();
  }
}