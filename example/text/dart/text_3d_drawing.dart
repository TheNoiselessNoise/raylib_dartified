// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_3d_drawing.c
// Run it: dart run text_3d_drawing.dart
// WARNING: expects resources from the raylib source
import 'dart:math' as math;
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
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
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT,.FLAG_VSYNC_HINT]);
  InitWindow(screenWidth, screenHeight, "text_3d_drawing");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3DD(
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

  var font = GetFontDefault();
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

  final alphaDiscard = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/alpha_discard.fs",
  );

  final List<ColorD> multi = .generate(TEXT_MAX_LAYERS, (_) => .WHITE);

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, cameraMode);
        
    if (IsFileDropped())
    {
      final droppedFiles = LoadDroppedFiles();

      if (IsFileExtension(droppedFiles.paths[0], ".ttf"))
      {
        UnloadFont(font);
        font = LoadFontEx(droppedFiles.paths[0], fontSize, null);
      }
      else if (IsFileExtension(droppedFiles.paths[0], ".fnt"))
      {
        UnloadFont(font);
        font = LoadFont(droppedFiles.paths[0]);
        fontSize = font.baseSize.toDouble();
      }
    }

    if (IsKeyPressed(.KEY_F1))
      SHOW_LETTER_BOUNDRY = !SHOW_LETTER_BOUNDRY;
    if (IsKeyPressed(.KEY_F2))
      SHOW_TEXT_BOUNDRY = !SHOW_TEXT_BOUNDRY;
    if (IsKeyPressed(.KEY_F3))
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

    if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT))
    {
      final Vector2D center = .vec2(
        GetScreenWidth() / 2,
        GetScreenHeight() / 2,
      );
      final ray = GetScreenToWorldRay(center, camera);

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

      final collision = GetRayCollisionBox(ray, bbox);
      
      if (collision.hit)
      {
        light = GenerateRandomColor(0.5, 0.78);
        dark = GenerateRandomColor(0.4, 0.58);
      }
    }

    if (IsKeyPressed(.KEY_HOME)) { if (layers > 1) --layers; }
    else if (IsKeyPressed(.KEY_END)) { if (layers < TEXT_MAX_LAYERS) ++layers; }

    if (IsKeyPressed(.KEY_LEFT)) fontSize -= 0.5;
    else if (IsKeyPressed(.KEY_RIGHT)) fontSize += 0.5;
    else if (IsKeyPressed(.KEY_UP)) fontSpacing -= 0.1;
    else if (IsKeyPressed(.KEY_DOWN)) fontSpacing += 0.1;
    else if (IsKeyPressed(.KEY_PAGE_UP)) lineSpacing -= 0.1;
    else if (IsKeyPressed(.KEY_PAGE_DOWN)) lineSpacing += 0.1;
    else if (IsKeyDown(.KEY_INSERT)) layerDistance -= 0.001;
    else if (IsKeyDown(.KEY_DELETE)) layerDistance += 0.001;
    else if (IsKeyPressed(.KEY_TAB))
    {
      multicolor = !multicolor;

      if (multicolor)
      {
        for (int i = 0; i < TEXT_MAX_LAYERS; ++i)
        {
          multi[i] = GenerateRandomColor(0.5, 0.8);
          multi[i].a = GetRandomValue(0, 255);
        }
      }
    }

    int ch = GetCharPressed();
    if (IsKeyPressed(.KEY_BACKSPACE))
    {
      text = text.substring(0, text.length - 1);
    }
    else if (IsKeyPressed(.KEY_ENTER))
    {
      text += '\n';
    }
    else if (ch > 0)
    {
      text += String.fromCharCode(ch);
    }

    tbox = MeasureTextWave3D(font, text, fontSize, fontSpacing, lineSpacing);

    quads = 0;
    time += GetFrameTime();

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);
        DrawCubeV(cubePosition, cubeSize, dark);
        DrawCubeWires(cubePosition, 2.1, 2.1, 2.1, light);

        DrawGrid(10, 2.0);

        BeginShaderMode(alphaDiscard);

          rlPushMatrix();
            rlRotatef(90.0, 1.0, 0.0, 0.0);
            rlRotatef(90.0, 0.0, 0.0, -1.0);

            for (int i = 0; i < layers; ++i)
            {
              var clr = light;
              if (multicolor) clr = multi[i];
              final Vector3D pos = .vec3(-tbox.x/2.0, layerDistance*i, -4.5);
              DrawTextWave3D(font, text, pos, fontSize, fontSpacing, lineSpacing, true, wcfg, time, clr);
            }

            if (SHOW_TEXT_BOUNDRY) DrawCubeWiresV(
              .vec3(0.0, 0.0, -4.5 + tbox.z/2),
              tbox,
              dark,
            );

          rlPopMatrix();

          bool slb = SHOW_LETTER_BOUNDRY;
          SHOW_LETTER_BOUNDRY = false;

          rlPushMatrix();
            rlRotatef(180.0, 0.0, 1.0, 0.0);
            String opt = "< SIZE: ${fontSize.f1} >";
            quads += opt.length;
            var m = MeasureText3D(font, opt, 8.0, 1.0, 0.0);
            Vector3D pos = .vec3(-m.x/2.0, 0.01, 2.0);
            DrawText3D(font, opt, pos, 8.0, 1.0, 0.0, false, .BLUE);
            pos.z += 0.5 + m.z;

            opt = "< SPACING: ${fontSpacing.f1} >";
            quads += opt.length;
            m = MeasureText3D(font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(font, opt, pos, 8.0, 1.0, 0.0, false, .BLUE);
            pos.z += 0.5 + m.z;

            opt = "< LINE: ${lineSpacing.f1} >";
            quads += opt.length;
            m = MeasureText3D(font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(font, opt, pos, 8.0, 1.0, 0.0, false, .BLUE);
            pos.z += 1.0 + m.z;

            opt = "< LBOX: ${slb ? "ON" : "OFF"} >";
            quads += opt.length;
            m = MeasureText3D(font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(font, opt, pos, 8.0, 1.0, 0.0, false, .RED);
            pos.z += 0.5 + m.z;

            opt = "< TBOX: ${SHOW_TEXT_BOUNDRY ? "ON" : "OFF"} >";
            quads += opt.length;
            m = MeasureText3D(font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(font, opt, pos, 8.0, 1.0, 0.0, false, .RED);
            pos.z += 0.5 + m.z;

            opt = "< LAYER DISTANCE: ${layerDistance.f3} >";
            quads += opt.length;
            m = MeasureText3D(font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(font, opt, pos, 8.0, 1.0, 0.0, false, .DARKPURPLE);
          rlPopMatrix();

          opt = "All the text displayed here is in 3D";
          quads += 36;
          m = MeasureText3D(font, opt, 10.0, 0.5, 0.0);
          pos.set(-m.x/2.0, 0.01, 2.0);
          DrawText3D(font, opt, pos, 10.0, 0.5, 0.0, false, .DARKBLUE);
          pos.z += 1.5 + m.z;

          opt = "press [Left]/[Right] to change the font size";
          quads += 44;
          m = MeasureText3D(font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(font, opt, pos, 6.0, 0.5, 0.0, false, .DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [Up]/[Down] to change the font spacing";
          quads += 44;
          m = MeasureText3D(font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(font, opt, pos, 6.0, 0.5, 0.0, false, .DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [PgUp]/[PgDown] to change the line spacing";
          quads += 48;
          m = MeasureText3D(font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(font, opt, pos, 6.0, 0.5, 0.0, false, .DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [F1] to toggle the letter boundry";
          quads += 39;
          m = MeasureText3D(font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(font, opt, pos, 6.0, 0.5, 0.0, false, .DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [F2] to toggle the text boundry";
          quads += 37;
          m = MeasureText3D(font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(font, opt, pos, 6.0, 0.5, 0.0, false, .DARKBLUE);

          SHOW_LETTER_BOUNDRY = slb;

        EndShaderMode();

      EndMode3D();

      DrawText(
        "Drag & drop a font file to change the font!\nType something, see what happens!\n\n"
        "Press [F3] to toggle the camera",
        10, 35, 10, .BLACK
      );

      quads += text.length*2*layers;
      String tmp = "$layers layer(s) | ${spin ? "ORBITAL" : "FREE"} camera | $quads quads (${quads*4} verts)";
      int width = MeasureText(tmp, 10);
      DrawText(tmp, screenWidth - 20 - width, 10, 10, .DARKGREEN);

      tmp = "[Home]/[End] to add/remove 3D text layers";
      width = MeasureText(tmp, 10);
      DrawText(tmp, screenWidth - 20 - width, 25, 10, .DARKGRAY);

      tmp = "[Insert]/[Delete] to increase/decrease distance between layers";
      width = MeasureText(tmp, 10);
      DrawText(tmp, screenWidth - 20 - width, 40, 10, .DARKGRAY);

      tmp = "click the [CUBE] for a random color";
      width = MeasureText(tmp, 10);
      DrawText(tmp, screenWidth - 20 - width, 55, 10, .DARKGRAY);

      tmp = "[Tab] to toggle multicolor mode";
      width = MeasureText(tmp, 10);
      DrawText(tmp, screenWidth - 20 - width, 70, 10, .DARKGRAY);

      DrawFPS(10, 10);

      DrawCircle(
        GetScreenWidth() / 2,
        GetScreenHeight() / 2,
        2,
        .BLACK
      );

    EndDrawing();
  }

  UnloadFont(font);

  CloseWindowAndDispose();
}

void DrawTextCodepoint3D(
  FontD font,
  int codepoint,
  Vector3D position,
  double fontSize,
  bool backface,
  ColorD tint,
) {
  int index = GetGlyphIndex(font, codepoint);
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

    if (SHOW_LETTER_BOUNDRY) DrawCubeWiresV(
      .vec3(position.x + width/2, position.y, position.z + height/2),
      .vec3(width, LETTER_BOUNDRY_SIZE, height),
      LETTER_BOUNDRY_COLOR
    );

    rlCheckRenderBatchLimit(4 + 4*backface.toInt());
    rlSetTexture(font.texture.id);

    rlPushMatrix();
      rlTranslatef(position.x, position.y, position.z);

      rlBegin(.RL_QUADS);
        rlColor4ub(tint.r, tint.g, tint.b, tint.a);

        // Front Face
        rlNormal3f(0.0, 1.0, 0.0);
        rlTexCoord2f(tx, ty); rlVertex3f(x,         y, z);
        rlTexCoord2f(tx, th); rlVertex3f(x,         y, z + height);
        rlTexCoord2f(tw, th); rlVertex3f(x + width, y, z + height);
        rlTexCoord2f(tw, ty); rlVertex3f(x + width, y, z);

        if (backface)
        {
          // Back Face
          rlNormal3f(0.0, -1.0, 0.0);
          rlTexCoord2f(tx, ty); rlVertex3f(x,         y, z);
          rlTexCoord2f(tw, ty); rlVertex3f(x + width, y, z);
          rlTexCoord2f(tw, th); rlVertex3f(x + width, y, z + height);
          rlTexCoord2f(tx, th); rlVertex3f(x,         y, z + height);
        }
      rlEnd();
    rlPopMatrix();

    rlSetTexture(0);
  }
}

void DrawText3D(
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
    var (codepoint, codepointSize) = GetCodepoint(text[i]);
    int index = GetGlyphIndex(font, codepoint);

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
        DrawTextCodepoint3D(font, codepoint, pos, fontSize, backface, tint);
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

    var (codepoint, codepointSize) = GetCodepoint(text[i]);
    index = GetGlyphIndex(font, letter);

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
    var (codepoint, codepointSize) = GetCodepoint(text[i]);
    int index = GetGlyphIndex(font, codepoint);

    if (codepoint == 0x3f) codepointSize = 1;

    if (codepoint == '\n'.ch)
    {
      textOffsetY += scale + lineSpacing/font.baseSize*scale;
      textOffsetX = 0.0;
      k = 0;
    }
    else if (codepoint == '~'.ch)
    {
      var (tilde, tildeSize) = GetCodepoint(text[i+1]);
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

        DrawTextCodepoint3D(font, codepoint, pos, fontSize, backface, tint);
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

    var (codepoint, codepointSize) = GetCodepoint(text[i]);
    index = GetGlyphIndex(font, letter);

    if (letter == 0x3f) codepointSize = 1;
    i += codepointSize - 1;

    if (letter != '\n'.ch)
    {
      if (letter == '~'.ch)
      {
        var (tilde, tildeSize) = GetCodepoint(text[i+1]);
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

ColorD GenerateRandomColor(double s, double v)
{
  const double Phi = 0.618033988749895; // Golden ratio conjugate
  double h = GetRandomValue(0, 360).toDouble();
  h = (h + h*Phi) % 360.0;
  return ColorFromHSV(h, s, v);
}
