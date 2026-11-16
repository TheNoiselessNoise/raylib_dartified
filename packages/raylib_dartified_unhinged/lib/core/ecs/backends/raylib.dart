part of '../../raylib_dartified_unhinged.dart';

final class RaylibRenderBackend extends RenderBackend {
  final Raylib rl;

  RaylibRenderBackend(this.rl);

  RaylibCoreDart get _core => rl.module();
  RaylibRlglDart get _rlgl => rl.module();

  @override
  void drawText(String text, num posX, num posY, num fontSize, Color color)
    => _core.DrawText(text, posX, posY, fontSize, color);

  @override
  void drawTextEx(Font font, String text, Vector2 position, num fontSize, num spacing, Color tint)
    => _core.DrawTextEx(font, text, position, fontSize, spacing, tint);

  @override
  void drawTextPro(Font font, String text, Vector2 position, Vector2 origin, num rotation, num fontSize, num spacing, Color tint)
    => _core.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint);

  @override
  void drawLineEx(Vector2 startPos, Vector2 endPos, num thick, Color color)
    => _core.DrawLineEx(startPos, endPos, thick, color);

  @override
  int measureText(String text, num fontSize)
    => _core.MeasureText(text, fontSize);

  @override
  Vector2 measureTextEx(Font font, String text, num fontSize, num spacing)
    => _core.MeasureTextEx(font, text, fontSize, spacing);
  
  @override
  void drawRectangle(num posX, num posY, num width, num height, Color color)
    => _core.DrawRectangle(posX, posY, width, height, color);

  @override
  void drawRectangleGradientEx(Rectangle rec, Color topLeft, Color bottomLeft, Color topRight, Color bottomRight)
    => _core.DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight);

  @override
  void drawRectangleRounded(Rectangle rec, num roundness, num segments, Color color)
    => _core.DrawRectangleRounded(rec, roundness, segments, color);

  @override
  void drawRectangleRoundedLinesEx(Rectangle rec, num roundness, num segments, num lineThick, Color color)
    => _core.DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color);

  @override
  void drawRectangleRec(Rectangle rec, Color color)
    => _core.DrawRectangleRec(rec, color);

  @override
  void drawRectanglePro(Rectangle rec, Vector2 origin, num rotation, Color color)
    => _core.DrawRectanglePro(rec, origin, rotation, color);

  @override
  void drawPixel(num posX, num posY, Color color)
    => _core.DrawPixel(posX, posY, color);

  @override
  void drawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color)
    => _core.DrawTriangle(v1, v2, v3, color);

  @override
  void drawCircle(num centerX, num centerY, num radius, Color color)
    => _core.DrawCircle(centerX, centerY, radius, color);

  @override
  void drawTexturePro(Texture texture, Rectangle source, Rectangle dest, Vector2 origin, num rotation, Color tint)
    => _core.DrawTexturePro(texture, source, dest, origin, rotation, tint);

  @override
  void beginDrawing()
    => _core.BeginDrawing();

  @override
  void clearBackground(Color color)
    => _core.ClearBackground(color);
  
  @override
  void endDrawing()
    => _core.EndDrawing();

  @override
  void beginScissorMode(num x, num y, num width, num height)
    => _core.BeginScissorMode(x, y, width, height);
    
  @override
  void endScissorMode()
    => _core.EndScissorMode();

  @override
  void drawRectangleLinesEx(Rectangle rec, num lineThick, Color color)
    => _core.DrawRectangleLinesEx(rec, lineThick, color);

  @override
  void drawCircleLinesV(Vector2 center, num radius, Color color)
    => _core.DrawCircleLinesV(center, radius, color);
  
  @override
  void drawRectangleLinesRotated(Rectangle rect, num rotationDegrees, num lineThick, Color color) {
    final centerX = rect.x + rect.width / 2;
    final centerY = rect.y + rect.height / 2;

    _rlgl.rlPushMatrix();
    _rlgl.rlTranslatef(centerX, centerY, 0);
    _rlgl.rlRotatef(rotationDegrees, 0, 0, 1);

    _core.DrawRectangleLinesEx(
      .rect(-rect.width / 2, -rect.height / 2, rect.width, rect.height),
      lineThick,
      color,
    );

    _rlgl.rlPopMatrix();
  }
}

final class RaylibInputBackend extends InputBackend {
  final Raylib rl;

  RaylibInputBackend(this.rl);

  RaylibCoreDart get _core => rl.module();

  @override
  bool isKeyPressed(KeyboardKey key)
    => _core.IsKeyPressed(key);

  @override
  bool isKeyDown(KeyboardKey key)
    => _core.IsKeyDown(key);

  @override
  bool isKeyUp(KeyboardKey key)
    => _core.IsKeyUp(key);

  @override
  bool isKeyPressedRepeat(KeyboardKey key)
    => _core.IsKeyPressedRepeat(key);

  @override
  int getCharPressed()
    => _core.GetCharPressed();

  @override
  int getKeyPressed()
    => _core.GetKeyPressed();
  
  @override
  bool isMouseButtonPressed(MouseButton button)
    => _core.IsMouseButtonPressed(button);
  
  @override
  bool isMouseButtonDown(MouseButton button)
    => _core.IsMouseButtonDown(button);
}

final class RaylibCollisionBackend extends CollisionBackend {
  final Raylib rl;

  RaylibCollisionBackend(this.rl);

  RaylibCoreDart get _core => rl.module();

  @override
  bool circles(Vector2 center1, num radius1, Vector2 center2, num radius2)
    => _core.CheckCollisionCircles(center1, radius1, center2, radius2);
  
  @override
  bool circleRectangle(Vector2 center, num radius, Rectangle rec)
    => _core.CheckCollisionCircleRec(center, radius, rec);
  
  @override
  bool rectangles(Rectangle rec1, Rectangle rec2)
    => _core.CheckCollisionRecs(rec1, rec2);

  @override
  bool pointRectangle(Vector2 point, Rectangle rec)
    => _core.CheckCollisionPointRec(point, rec);
}

final class RaylibAssetManager extends AssetManager {
  final Raylib rl;

  RaylibAssetManager(this.rl);

  RaylibCoreDart get _core => rl.module();

  final Map<String, Image> _images = {};
  final Map<String, Texture> _textures = {};
  final Map<String, Font> _fonts = {};

  @override
  UnhingedAsset<Image> image(String id, {String? path}) {
    var existing = _images[id] ?? _images[path];
    if (existing != null) return .new(id, existing);
    return .new(id, _images[id] = _core.LoadImage(path ?? id));
  }

  @override
  UnhingedAsset<Texture> texture(String id, {String? path}) {
    var existing = _textures[id] ?? _textures[path];
    if (existing != null) return .new(id, existing);
    return .new(id, _textures[id] = _core.LoadTexture(path ?? id));
  }

  @override
  UnhingedAsset<Font> font(String id, {String? path, int fontSize = 32}) {
    var existing = _fonts[id] ?? _fonts[path];
    if (existing != null) return .new(id, existing);
    return .new(id, _fonts[id] = _core.LoadFontEx(path ?? id, fontSize));
  }

  @override
  void dispose() {
    _textures.values.forEach(_core.UnloadTexture);
    _images.values.forEach(_core.UnloadImage);
    _fonts.values.forEach(_core.UnloadFont);
  }
}

final class RaylibBackend extends UnhingedBackend {
  final Raylib rl;

  RaylibBackend(this.rl, {
    RaylibRenderBackend? render,
    RaylibInputBackend? input,
    RaylibCollisionBackend? collision,
    RaylibAssetManager? assets,
  }) : super(
    render: render ?? RaylibRenderBackend(rl),
    input: input ?? RaylibInputBackend(rl),
    collision: collision ?? RaylibCollisionBackend(rl),
    assets: assets ?? RaylibAssetManager(rl),
  );
  
  RaylibCoreDart get _core => rl.module();

  @override
  void beginFrame() => mouse = _core.GetMouseInfo();

  @override
  double getFrameTime() => _core.GetFrameTime();

  @override
  void setMouseCursor(MouseCursor cursor)
    => _core.SetMouseCursor(cursor);

  @override
  void setClipboardText(String text)
    => _core.SetClipboardText(text);

  @override
  String getClipboardText()
    // ignore: deprecated_member_use
    => _core.GetClipboardText();

  @override
  void setTargetFPS(int fps)
    => _core.SetTargetFPS(fps);

  @override
  Font getFontDefault()
    => _core.GetFontDefault();

  // Note: `rl.dispose` is already handled in `RaylibAppBase`
}

extension on Vector2 {
  List<double> getPersistableData() => [x, y];

  void setPersistableData(List<double> data) {
    // ignore: prefer_is_empty
    x = data.length < 1 ? 0 : data[0];
    y = data.length < 2 ? 0 : data[1];
  }
}

extension on Rectangle {
  List<double> getPersistableData() => [x, y, width, height];

  void setPersistableData(List<double> data) {
    // ignore: prefer_is_empty
    x = data.length < 1 ? 0 : data[0];
    y = data.length < 2 ? 0 : data[1];
    width = data.length < 3 ? 0 : data[2];
    height = data.length < 4 ? 0 : data[3];
  }
}

extension on Color {
  List<int> getPersistableData() => [r, g, b, a];

  void setPersistableData(List<int> data) {
    // ignore: prefer_is_empty
    r = data.length < 1 ? 0 : data[0];
    g = data.length < 2 ? 0 : data[1];
    b = data.length < 3 ? 0 : data[2];
    a = data.length < 4 ? 0 : data[3];
  }
}