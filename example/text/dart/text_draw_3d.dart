// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_draw_3d.c
// Run it: dart run text_draw_3d.dart
// WARNING: expects resources from the raylib source
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const double LETTER_BOUNDRY_SIZE = 0.25;
const int TEXT_MAX_LAYERS = 32;
ColorD LETTER_BOUNDRY_COLOR = .VIOLET;

bool SHOW_LETTER_BOUNDRY = false;
bool SHOW_TEXT_BOUNDRY = false;

class WaveTextConfig {
  Vector3D waveRange;
  Vector3D waveSpeed;
  Vector3D waveOffset;

  WaveTextConfig({
    Vector3D? waveRange,
    Vector3D? waveSpeed,
    Vector3D? waveOffset,
  }) :
    waveRange = waveRange ?? .zero(),
    waveSpeed = waveSpeed ?? .zero(),
    waveOffset = waveOffset ?? .zero();
}

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT,.FLAG_VSYNC_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "text_draw_3d");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = CameraD(
    position: .vec3(-10.0, 15.0, -10.0),
    target: .vec3(0.0, 0.0, 0.0),
    up: .vec3(0.0, 1.0, 0.0),
    fovy: 45.0,
    projection: .CAMERA_PERSPECTIVE,
  );

  bool spin = true;
  bool multicolor = false;
  CameraMode cameraMode = .CAMERA_ORBITAL;

  final Vector3D cubePosition = .vec3(0.0, 1.0, 0.0);
  final Vector3D cubeSize = .vec3(2.0, 2.0, 2.0);

  var font = rl.CoreD.GetFontDefault();
  double fontSize = 8.0;
  double fontSpacing = 0.5;
  double lineSpacing = -1.0;

  // Set the text (using markdown!)
  String text = "Hello ~~World~~ in 3D!";
  Vector3D tbox = .zero();
  int layers = 1;
  int quads = 0;
  double layerDistance = 0.01;

  final wcfg = WaveTextConfig(
    waveSpeed: .vec3(3.0, 3.0, 0.5),
    waveOffset: .vec3(0.35, 0.35, 0.35),
    waveRange: .vec3(0.45, 0.45, 0.45),
  );

  double time = 0.0;

  ColorD light = .MAROON;
  ColorD dark = .RED;

  final alphaDiscard = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl330/alpha_discard.fs",
  );

  final List<ColorD> multi = List.generate(TEXT_MAX_LAYERS, (_) => .WHITE);

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, cameraMode);
        
    if (rl.CoreD.IsFileDropped())
    {
      final droppedFiles = rl.CoreD.LoadDroppedFiles();

      if (rl.CoreD.IsFileExtension(droppedFiles.paths[0], ".ttf"))
      {
        rl.CoreD.UnloadFont(font);
        font = rl.CoreD.LoadFontEx(droppedFiles.paths[0], fontSize, null);
      }
      else if (rl.CoreD.IsFileExtension(droppedFiles.paths[0], ".fnt"))
      {
        rl.CoreD.UnloadFont(font);
        font = rl.CoreD.LoadFont(droppedFiles.paths[0]);
        fontSize = font.baseSize.toDouble();
      }
    }

    if (rl.CoreD.IsKeyPressed(.KEY_F1))
      SHOW_LETTER_BOUNDRY = !SHOW_LETTER_BOUNDRY;
    if (rl.CoreD.IsKeyPressed(.KEY_F2))
      SHOW_TEXT_BOUNDRY = !SHOW_TEXT_BOUNDRY;
    if (rl.CoreD.IsKeyPressed(.KEY_F3))
    {
      spin = !spin;

      camera.target.set(0, 0, 0);
      camera.up.set(0, 1, 0);
      camera.fovy = 45;
      camera.projection = .CAMERA_PERSPECTIVE;

      if (spin)
      {
        camera.position.set(-10.0, 15.0, -10.0);
        cameraMode = .CAMERA_ORBITAL;
      }
      else
      {
        camera.position.set(10.0, 10.0, -10.0);
        cameraMode = .CAMERA_FREE;
      }
    }

    if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT))
    {
      final Vector2D center = .vec2(
        rl.CoreD.GetScreenWidth() / 2,
        rl.CoreD.GetScreenHeight() / 2,
      );
      final ray = rl.CoreD.GetScreenToWorldRay(center, camera);

      final BoundingBoxD bbox = .bbox(
        .vec3(
          cubePosition.x - cubeSize.x/2,
          cubePosition.y - cubeSize.y/2,
          cubePosition.z - cubeSize.z/2
        ),
        .vec3(
          cubePosition.x + cubeSize.x/2,
          cubePosition.y + cubeSize.y/2,
          cubePosition.z + cubeSize.z/2
        ),
      );

      final collision = rl.CoreD.GetRayCollisionBox(ray, bbox);
      
      if (collision.hit)
      {
        light = GenerateRandomColor(rl, 0.5, 0.78);
        dark = GenerateRandomColor(rl, 0.4, 0.58);
      }
    }

    if (rl.CoreD.IsKeyPressed(.KEY_HOME)) { if (layers > 1) --layers; }
    else if (rl.CoreD.IsKeyPressed(.KEY_END)) { if (layers < TEXT_MAX_LAYERS) ++layers; }

    if (rl.CoreD.IsKeyPressed(.KEY_LEFT)) fontSize -= 0.5;
    else if (rl.CoreD.IsKeyPressed(.KEY_RIGHT)) fontSize += 0.5;
    else if (rl.CoreD.IsKeyPressed(.KEY_UP)) fontSpacing -= 0.1;
    else if (rl.CoreD.IsKeyPressed(.KEY_DOWN)) fontSpacing += 0.1;
    else if (rl.CoreD.IsKeyPressed(.KEY_PAGE_UP)) lineSpacing -= 0.1;
    else if (rl.CoreD.IsKeyPressed(.KEY_PAGE_DOWN)) lineSpacing += 0.1;
    else if (rl.CoreD.IsKeyDown(.KEY_INSERT)) layerDistance -= 0.001;
    else if (rl.CoreD.IsKeyDown(.KEY_DELETE)) layerDistance += 0.001;
    else if (rl.CoreD.IsKeyPressed(.KEY_TAB))
    {
      multicolor = !multicolor;

      if (multicolor)
      {
        for (int i = 0; i < TEXT_MAX_LAYERS; ++i)
        {
          multi[i] = GenerateRandomColor(rl, 0.5, 0.8);
          multi[i].a = rl.CoreD.GetRandomValue(0, 255);
        }
      }
    }

    int ch = rl.CoreD.GetCharPressed();
    if (rl.CoreD.IsKeyPressed(.KEY_BACKSPACE))
    {
      text = text.substring(0, text.length - 1);
    }
    else if (rl.CoreD.IsKeyPressed(.KEY_ENTER))
    {
      text += '\n';
    }
    else if (ch > 0)
    {
      text += String.fromCharCode(ch);
    }

    tbox = MeasureTextWave3D(rl, font, text, fontSize, fontSpacing, lineSpacing);

    quads = 0;
    time += rl.CoreD.GetFrameTime();

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);
        rl.CoreD.DrawCubeV(cubePosition, cubeSize, dark);
        rl.CoreD.DrawCubeWires(cubePosition, 2.1, 2.1, 2.1, light);

        rl.CoreD.DrawGrid(10, 2.0);

        rl.CoreD.BeginShaderMode(alphaDiscard);

          rl.RlglD.rlPushMatrix();
            rl.RlglD.rlRotatef(90.0, 1.0, 0.0, 0.0);
            rl.RlglD.rlRotatef(90.0, 0.0, 0.0, -1.0);

            for (int i = 0; i < layers; ++i)
            {
              var clr = light;
              if (multicolor) clr = multi[i];
              final Vector3D pos = .vec3(-tbox.x/2.0, layerDistance*i, -4.5);
              DrawTextWave3D(rl, font, text, pos, fontSize, fontSpacing, lineSpacing, true, wcfg, time, clr);
            }

            if (SHOW_TEXT_BOUNDRY) rl.CoreD.DrawCubeWiresV(
              .vec3(0.0, 0.0, -4.5 + tbox.z/2),
              tbox,
              dark,
            );

          rl.RlglD.rlPopMatrix();

          bool slb = SHOW_LETTER_BOUNDRY;
          SHOW_LETTER_BOUNDRY = false;

          rl.RlglD.rlPushMatrix();
            rl.RlglD.rlRotatef(180.0, 0.0, 1.0, 0.0);
            String opt = "< SIZE: ${fontSize.f1} >";
            quads += opt.length;
            var m = MeasureText3D(rl, font, opt, 8.0, 1.0, 0.0);
            Vector3D pos = .vec3(-m.x/2.0, 0.01, 2.0);
            DrawText3D(rl, font, opt, pos, 8.0, 1.0, 0.0, false, .BLUE);
            pos.z += 0.5 + m.z;

            opt = "< SPACING: ${fontSpacing.f1} >";
            quads += opt.length;
            m = MeasureText3D(rl, font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(rl, font, opt, pos, 8.0, 1.0, 0.0, false, .BLUE);
            pos.z += 0.5 + m.z;

            opt = "< LINE: ${lineSpacing.f1} >";
            quads += opt.length;
            m = MeasureText3D(rl, font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(rl, font, opt, pos, 8.0, 1.0, 0.0, false, .BLUE);
            pos.z += 1.0 + m.z;

            opt = "< LBOX: ${slb ? "ON" : "OFF"} >";
            quads += opt.length;
            m = MeasureText3D(rl, font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(rl, font, opt, pos, 8.0, 1.0, 0.0, false, .RED);
            pos.z += 0.5 + m.z;

            opt = "< TBOX: ${SHOW_TEXT_BOUNDRY ? "ON" : "OFF"} >";
            quads += opt.length;
            m = MeasureText3D(rl, font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(rl, font, opt, pos, 8.0, 1.0, 0.0, false, .RED);
            pos.z += 0.5 + m.z;

            opt = "< LAYER DISTANCE: ${layerDistance.f3} >";
            quads += opt.length;
            m = MeasureText3D(rl, font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(rl, font, opt, pos, 8.0, 1.0, 0.0, false, .DARKPURPLE);
          rl.RlglD.rlPopMatrix();

          opt = "All the text displayed here is in 3D";
          quads += 36;
          m = MeasureText3D(rl, font, opt, 10.0, 0.5, 0.0);
          pos.set(-m.x/2.0, 0.01, 2.0);
          DrawText3D(rl, font, opt, pos, 10.0, 0.5, 0.0, false, .DARKBLUE);
          pos.z += 1.5 + m.z;

          opt = "press [Left]/[Right] to change the font size";
          quads += 44;
          m = MeasureText3D(rl, font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(rl, font, opt, pos, 6.0, 0.5, 0.0, false, .DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [Up]/[Down] to change the font spacing";
          quads += 44;
          m = MeasureText3D(rl, font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(rl, font, opt, pos, 6.0, 0.5, 0.0, false, .DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [PgUp]/[PgDown] to change the line spacing";
          quads += 48;
          m = MeasureText3D(rl, font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(rl, font, opt, pos, 6.0, 0.5, 0.0, false, .DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [F1] to toggle the letter boundry";
          quads += 39;
          m = MeasureText3D(rl, font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(rl, font, opt, pos, 6.0, 0.5, 0.0, false, .DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [F2] to toggle the text boundry";
          quads += 37;
          m = MeasureText3D(rl, font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(rl, font, opt, pos, 6.0, 0.5, 0.0, false, .DARKBLUE);

          SHOW_LETTER_BOUNDRY = slb;

        rl.CoreD.EndShaderMode();

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Drag & drop a font file to change the font!\nType something, see what happens!\n\n"
        "Press [F3] to toggle the camera",
        10, 35, 10, .BLACK
      );

      quads += text.length*2*layers;
      String tmp = "$layers layer(s) | ${spin ? "ORBITAL" : "FREE"} camera | $quads quads (${quads*4} verts)";
      int width = rl.CoreD.MeasureText(tmp, 10);
      rl.CoreD.DrawText(tmp, screenWidth - 20 - width, 10, 10, .DARKGREEN);

      tmp = "[Home]/[End] to add/remove 3D text layers";
      width = rl.CoreD.MeasureText(tmp, 10);
      rl.CoreD.DrawText(tmp, screenWidth - 20 - width, 25, 10, .DARKGRAY);

      tmp = "[Insert]/[Delete] to increase/decrease distance between layers";
      width = rl.CoreD.MeasureText(tmp, 10);
      rl.CoreD.DrawText(tmp, screenWidth - 20 - width, 40, 10, .DARKGRAY);

      tmp = "click the [CUBE] for a random color";
      width = rl.CoreD.MeasureText(tmp, 10);
      rl.CoreD.DrawText(tmp, screenWidth - 20 - width, 55, 10, .DARKGRAY);

      tmp = "[Tab] to toggle multicolor mode";
      width = rl.CoreD.MeasureText(tmp, 10);
      rl.CoreD.DrawText(tmp, screenWidth - 20 - width, 70, 10, .DARKGRAY);

      rl.CoreD.DrawFPS(10, 10);

      rl.CoreD.DrawCircle(
        rl.CoreD.GetScreenWidth() / 2,
        rl.CoreD.GetScreenHeight() / 2,
        2,
        .BLACK
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadFont(font);

  rl.CloseWindowAndDispose();
}

void DrawTextCodepoint3D(
  Raylib rl,
  FontD font,
  int codepoint,
  Vector3D position,
  double fontSize,
  bool backface,
  ColorD tint,
) {
  int index = rl.CoreD.GetGlyphIndex(font, codepoint);
  double scale = fontSize/font.baseSize;

  position.x += (font.glyphs[index].offsetX - font.glyphPadding)/font.baseSize*scale;
  position.z += (font.glyphs[index].offsetY - font.glyphPadding)/font.baseSize*scale;

  final RectangleD srcRec = .rect(
    font.recs[index].x - font.glyphPadding,
    font.recs[index].y - font.glyphPadding,
    font.recs[index].width + 2.0*font.glyphPadding,
    font.recs[index].height + 2.0*font.glyphPadding
  );

  final width = (font.recs[index].width + 2.0*font.glyphPadding)/font.baseSize*scale;
  final height = (font.recs[index].height + 2.0*font.glyphPadding)/font.baseSize*scale;

  if (font.texture.id > 0)
  {
    final x = 0.0;
    final y = 0.0;
    final z = 0.0;

    final tx = srcRec.x/font.texture.width;
    final ty = srcRec.y/font.texture.height;
    final tw = (srcRec.x+srcRec.width)/font.texture.width;
    final th = (srcRec.y+srcRec.height)/font.texture.height;

    if (SHOW_LETTER_BOUNDRY) rl.CoreD.DrawCubeWiresV(
      .vec3(position.x + width/2, position.y, position.z + height/2),
      .vec3(width, LETTER_BOUNDRY_SIZE, height),
      LETTER_BOUNDRY_COLOR
    );

    rl.RlglD.rlCheckRenderBatchLimit(4 + 4*backface.toInt());
    rl.RlglD.rlSetTexture(font.texture.id);

    rl.RlglD.rlPushMatrix();
      rl.RlglD.rlTranslatef(position.x, position.y, position.z);

      rl.RlglD.rlBegin(.RL_QUADS);
        rl.RlglD.rlColor4ub(tint.r, tint.g, tint.b, tint.a);

        // Front Face
        rl.RlglD.rlNormal3f(0.0, 1.0, 0.0);
        rl.RlglD.rlTexCoord2f(tx, ty); rl.RlglD.rlVertex3f(x,         y, z);
        rl.RlglD.rlTexCoord2f(tx, th); rl.RlglD.rlVertex3f(x,         y, z + height);
        rl.RlglD.rlTexCoord2f(tw, th); rl.RlglD.rlVertex3f(x + width, y, z + height);
        rl.RlglD.rlTexCoord2f(tw, ty); rl.RlglD.rlVertex3f(x + width, y, z);

        if (backface)
        {
          // Back Face
          rl.RlglD.rlNormal3f(0.0, -1.0, 0.0);
          rl.RlglD.rlTexCoord2f(tx, ty); rl.RlglD.rlVertex3f(x,         y, z);
          rl.RlglD.rlTexCoord2f(tw, ty); rl.RlglD.rlVertex3f(x + width, y, z);
          rl.RlglD.rlTexCoord2f(tw, th); rl.RlglD.rlVertex3f(x + width, y, z + height);
          rl.RlglD.rlTexCoord2f(tx, th); rl.RlglD.rlVertex3f(x,         y, z + height);
        }
      rl.RlglD.rlEnd();
    rl.RlglD.rlPopMatrix();

    rl.RlglD.rlSetTexture(0);
  }
}

void DrawText3D(
  Raylib rl,
  FontD font,
  String text,
  Vector3D position,
  double fontSize,
  double fontSpacing,
  double lineSpacing,
  bool backface,
  ColorD tint,
) {
  double textOffsetY = 0.0;
  double textOffsetX = 0.0;

  double scale = fontSize/font.baseSize;

  for (int i = 0; i < text.length;)
  {
    var (codepoint, codepointSize) = rl.CoreD.GetCodepoint(text[i]);
    int index = rl.CoreD.GetGlyphIndex(font, codepoint);

    if (codepoint == 0x3f) codepointSize = 1;

    if (codepoint == '\n'.ch)
    {
      textOffsetY += scale + lineSpacing/font.baseSize*scale;
      textOffsetX = 0.0;
    }
    else
    {
      if ((codepoint != ' '.ch) && (codepoint != '\t'.ch))
      {
        final Vector3D pos = .vec3(
          position.x + textOffsetX,
          position.y,
          position.z + textOffsetY,
        );
        DrawTextCodepoint3D(rl, font, codepoint, pos, fontSize, backface, tint);
      }

      if (font.glyphs[index].advanceX == 0) {
        textOffsetX += (font.recs[index].width + fontSpacing)/font.baseSize*scale;
      } else {
        textOffsetX += (font.glyphs[index].advanceX + fontSpacing)/font.baseSize*scale;
      }
    }

    i += codepointSize;
  }
}

Vector3D MeasureText3D(
  Raylib rl,
  FontD font,
  String text,
  double fontSize,
  double fontSpacing,
  double lineSpacing,
) {
  int tempLen = 0;
  int lenCounter = 0;

  double tempTextWidth = 0.0;

  double scale = fontSize/font.baseSize;
  double textHeight = scale;
  double textWidth = 0.0;

  int letter = 0;
  int index = 0;

  for (int i = 0; i < text.length; i++)
  {
    lenCounter++;

    var (codepoint, codepointSize) = rl.CoreD.GetCodepoint(text[i]);
    index = rl.CoreD.GetGlyphIndex(font, letter);

    if (letter == 0x3f) codepointSize = 1;
    i += codepointSize - 1;

    if (letter != '\n'.ch)
    {
      if (font.glyphs[index].advanceX != 0) {
        textWidth += (font.glyphs[index].advanceX+fontSpacing)/font.baseSize*scale;
      } else {
        textWidth += (font.recs[index].width + font.glyphs[index].offsetX)/font.baseSize*scale;
      }
    }
    else
    {
      if (tempTextWidth < textWidth) tempTextWidth = textWidth;
      lenCounter = 0;
      textWidth = 0.0;
      textHeight += scale + lineSpacing/font.baseSize*scale;
    }

    if (tempLen < lenCounter) tempLen = lenCounter;
  }

  if (tempTextWidth < textWidth) tempTextWidth = textWidth;

  return .vec3(
    tempTextWidth + ((tempLen - 1)*fontSpacing/font.baseSize*scale),
    0.25,
    textHeight,
  );
}

void DrawTextWave3D(
  Raylib rl,
  FontD font,
  String text,
  Vector3D position,
  double fontSize,
  double fontSpacing,
  double lineSpacing,
  bool backface,
  WaveTextConfig config,
  double time,
  ColorD tint
) {
  double textOffsetY = 0.0;
  double textOffsetX = 0.0;

  double scale = fontSize/font.baseSize;

  bool wave = false;

  for (int i = 0, k = 0; i < text.length; ++k)
  {
    var (codepoint, codepointSize) = rl.CoreD.GetCodepoint(text[i]);
    int index = rl.CoreD.GetGlyphIndex(font, codepoint);

    if (codepoint == 0x3f) codepointSize = 1;

    if (codepoint == '\n'.ch)
    {
      textOffsetY += scale + lineSpacing/font.baseSize*scale;
      textOffsetX = 0.0;
      k = 0;
    }
    else if (codepoint == '~'.ch)
    {
      var (tilde, tildeSize) = rl.CoreD.GetCodepoint(text[i+1]);
      if (tilde == '~'.codeUnitAt(0))
      {
        codepointSize += 1;
        wave = !wave;
      }
    }
    else
    {
      if ((codepoint != ' '.ch) && (codepoint != '\t'.ch))
      {
        if (wave)
        {
          position.x += math.sin(time*config.waveSpeed.x-k*config.waveOffset.x)*config.waveRange.x;
          position.y += math.sin(time*config.waveSpeed.y-k*config.waveOffset.y)*config.waveRange.y;
          position.z += math.sin(time*config.waveSpeed.z-k*config.waveOffset.z)*config.waveRange.z;
        }

        final Vector3D pos = .vec3(
          position.x + textOffsetX,
          position.y,
          position.z + textOffsetY
        );

        DrawTextCodepoint3D(rl, font, codepoint, pos, fontSize, backface, tint);
      }

      if (font.glyphs[index].advanceX == 0) {
        textOffsetX += (font.recs[index].width + fontSpacing)/font.baseSize*scale;
      } else {
        textOffsetX += (font.glyphs[index].advanceX + fontSpacing)/font.baseSize*scale;
      }
    }

    i += codepointSize;
  }
}

Vector3D MeasureTextWave3D(
  Raylib rl,
  FontD font,
  String text,
  double fontSize,
  double fontSpacing,
  double lineSpacing,
) {
  int tempLen = 0;
  int lenCounter = 0;

  double tempTextWidth = 0.0;

  double scale = fontSize/font.baseSize;
  double textHeight = scale;
  double textWidth = 0.0;

  int letter = 0;
  int index = 0;

  for (int i = 0; i < text.length; i++)
  {
    lenCounter++;

    var (codepoint, codepointSize) = rl.CoreD.GetCodepoint(text[i]);
    index = rl.CoreD.GetGlyphIndex(font, letter);

    if (letter == 0x3f) codepointSize = 1;
    i += codepointSize - 1;

    if (letter != '\n'.ch)
    {
      if (letter == '~'.ch)
      {
        var (tilde, tildeSize) = rl.CoreD.GetCodepoint(text[i+1]);
        if (tilde == '~'.codeUnitAt(0)) {
          i++;
        }
      }
      else
      {
        if (font.glyphs[index].advanceX != 0) {
          textWidth += (font.glyphs[index].advanceX+fontSpacing)/font.baseSize*scale;
        } else {
          textWidth += (font.recs[index].width + font.glyphs[index].offsetX)/font.baseSize*scale;
        }
      }
    }
    else
    {
      if (tempTextWidth < textWidth) tempTextWidth = textWidth;
      lenCounter = 0;
      textWidth = 0.0;
      textHeight += scale + lineSpacing/font.baseSize*scale;
    }

    if (tempLen < lenCounter) tempLen = lenCounter;
  }

  if (tempTextWidth < textWidth) tempTextWidth = textWidth;

  return .vec3(
    tempTextWidth + ((tempLen - 1)*fontSpacing/font.baseSize*scale),
    0.25,
    textHeight,
  );
}

ColorD GenerateRandomColor(Raylib rl, double s, double v)
{
  const double Phi = 0.618033988749895; // Golden ratio conjugate
  double h = rl.CoreD.GetRandomValue(0, 360).toDouble();
  h = (h + h*Phi) % 360.0;
  return rl.CoreD.ColorFromHSV(h, s, v);
}
