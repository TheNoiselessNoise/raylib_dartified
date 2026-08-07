// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_3d_drawing.c
// Run it: dart run text_3d_drawing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const double LETTER_BOUNDRY_SIZE = 0.25;
const int TEXT_MAX_LAYERS = 32;
late ColorC LETTER_BOUNDRY_COLOR;

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
  LETTER_BOUNDRY_COLOR = VIOLET;

  SetConfigFlags(
    ConfigFlags.FLAG_MSAA_4X_HINT.value |
    ConfigFlags.FLAG_VSYNC_HINT.value
  );
  InitWindow(screenWidth, screenHeight, "text_3d_drawing".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(-10.0, 15.0, -10.0);
  camera.ref.target.set(0.0, 0.0, 0.0);
  camera.ref.up.set(0.0, 1.0, 0.0);
  camera.ref.fovy = 45.0;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  bool spin = true;
  bool multicolor = false;
  int cameraMode = CameraMode.CAMERA_ORBITAL.value;

  final cubePosition = Vector3$.At('cubePosition').set(0.0, 1.0, 0.0);
  final cubeSize = Vector3$.At('cubeSize').set(2.0, 2.0, 2.0);

  var font = GetFontDefault();
  double fontSize = 8.0;
  double fontSpacing = 0.5;
  double lineSpacing = -1.0;

  // Set the text (using markdown!)
  String text = "Hello ~~World~~ in 3D!";
  final tbox = Vector3$.At('tbox');
  int layers = 1;
  int quads = 0;
  double layerDistance = 0.01;

  final wcfg = WaveTextConfig(
    waveSpeed: .vec3(3.0, 3.0, 0.5),
    waveOffset: .vec3(0.35, 0.35, 0.35),
    waveRange: .vec3(0.45, 0.45, 0.45),
  );

  double time = 0.0;

  var light = Color$.At('light').setC(MAROON);
  var dark = Color$.At('dart').setC(RED);

  final alphaDiscard = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/alpha_discard.fs".toC,
  );

  final multi = Color$.At('multi', TEXT_MAX_LAYERS);

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, cameraMode);
        
    if (IsFileDropped())
    {
      final droppedFiles = LoadDroppedFiles();

      if (IsFileExtension(droppedFiles.paths[0], ".ttf".toC))
      {
        UnloadFont(font);
        font = LoadFontEx(droppedFiles.paths[0], fontSize.toInt(), nullptr, 0);
      }
      else if (IsFileExtension(droppedFiles.paths[0], ".fnt".toC))
      {
        UnloadFont(font);
        font = LoadFont(droppedFiles.paths[0]);
        fontSize = font.baseSize.toDouble();
      }
      
      UnloadDroppedFiles(droppedFiles);
    }

    if (IsKeyPressed(KeyboardKey.KEY_F1.value))
      SHOW_LETTER_BOUNDRY = !SHOW_LETTER_BOUNDRY;
    if (IsKeyPressed(KeyboardKey.KEY_F2.value))
      SHOW_TEXT_BOUNDRY = !SHOW_TEXT_BOUNDRY;
    if (IsKeyPressed(KeyboardKey.KEY_F3.value))
    {
      spin = !spin;

      camera.ref.target.set(0, 0, 0);
      camera.ref.up.set(0, 1, 0);
      camera.ref.fovy = 45;
      camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

      if (spin)
      {
        camera.ref.position.set(-10.0, 15.0, -10.0);
        cameraMode = CameraMode.CAMERA_ORBITAL.value;
      }
      else
      {
        camera.ref.position.set(10.0, 10.0, -10.0);
        cameraMode = CameraMode.CAMERA_FREE.value;
      }
    }

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value))
    {
      final center = Vector2$.$1.set(
        GetScreenWidth() / 2,
        GetScreenHeight() / 2,
      );
      final ray = GetScreenToWorldRay(center, camera.ref);

      final bbox = BoundingBox$.At('bbox');

      bbox.ref.min.set(
        cubePosition.ref.x - cubeSize.ref.x/2,
        cubePosition.ref.y - cubeSize.ref.y/2,
        cubePosition.ref.z - cubeSize.ref.z/2
      );

      bbox.ref.max.set(
        cubePosition.ref.x + cubeSize.ref.x/2,
        cubePosition.ref.y + cubeSize.ref.y/2,
        cubePosition.ref.z + cubeSize.ref.z/2
      );

      final collision = GetRayCollisionBox(ray, bbox.ref);
      
      if (collision.hit)
      {
        light.setC(GenerateRandomColor(0.5, 0.78));
        dark.setC(GenerateRandomColor(0.4, 0.58));
      }
    }

    if (IsKeyPressed(KeyboardKey.KEY_HOME.value)) { if (layers > 1) --layers; }
    else if (IsKeyPressed(KeyboardKey.KEY_END.value)) { if (layers < TEXT_MAX_LAYERS) ++layers; }

    if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) fontSize -= 0.5;
    else if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) fontSize += 0.5;
    else if (IsKeyPressed(KeyboardKey.KEY_UP.value)) fontSpacing -= 0.1;
    else if (IsKeyPressed(KeyboardKey.KEY_DOWN.value)) fontSpacing += 0.1;
    else if (IsKeyPressed(KeyboardKey.KEY_PAGE_UP.value)) lineSpacing -= 0.1;
    else if (IsKeyPressed(KeyboardKey.KEY_PAGE_DOWN.value)) lineSpacing += 0.1;
    else if (IsKeyDown(KeyboardKey.KEY_INSERT.value)) layerDistance -= 0.001;
    else if (IsKeyDown(KeyboardKey.KEY_DELETE.value)) layerDistance += 0.001;
    else if (IsKeyPressed(KeyboardKey.KEY_TAB.value))
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
    if (IsKeyPressed(KeyboardKey.KEY_BACKSPACE.value))
    {
      text = text.substring(0, text.length - 1);
    }
    else if (IsKeyPressed(KeyboardKey.KEY_ENTER.value))
    {
      text += '\n';
    }
    else if (ch > 0)
    {
      text += String.fromCharCode(ch);
    }

    tbox.setD(MeasureTextWave3D(font, text, fontSize, fontSpacing, lineSpacing));

    quads = 0;
    time += GetFrameTime();

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);
        DrawCubeV(cubePosition.ref, cubeSize.ref, dark.ref);
        DrawCubeWires(cubePosition.ref, 2.1, 2.1, 2.1, light.ref);

        DrawGrid(10, 2.0);

        BeginShaderMode(alphaDiscard);

          rlPushMatrix();
            rlRotatef(90.0, 1.0, 0.0, 0.0);
            rlRotatef(90.0, 0.0, 0.0, -1.0);

            for (int i = 0; i < layers; ++i)
            {
              var clr = light.ref;
              if (multicolor) clr = multi[i];
              final Vector3D pos = .vec3(-tbox.ref.x/2.0, layerDistance*i, -4.5);
              DrawTextWave3D(font, text, pos, fontSize, fontSpacing, lineSpacing, true, wcfg, time, clr);
            }

            if (SHOW_TEXT_BOUNDRY) DrawCubeWiresV(
              Vector3$.$1.set(0, 0, -4.5 + tbox.ref.z/2),
              tbox.ref,
              dark.ref,
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
            DrawText3D(font, opt, pos, 8.0, 1.0, 0.0, false, BLUE);
            pos.z += 0.5 + m.z;

            opt = "< SPACING: ${fontSpacing.f1} >";
            quads += opt.length;
            m = MeasureText3D(font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(font, opt, pos, 8.0, 1.0, 0.0, false, BLUE);
            pos.z += 0.5 + m.z;

            opt = "< LINE: ${lineSpacing.f1} >";
            quads += opt.length;
            m = MeasureText3D(font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(font, opt, pos, 8.0, 1.0, 0.0, false, BLUE);
            pos.z += 1.0 + m.z;

            opt = "< LBOX: ${slb ? "ON" : "OFF"} >";
            quads += opt.length;
            m = MeasureText3D(font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(font, opt, pos, 8.0, 1.0, 0.0, false, RED);
            pos.z += 0.5 + m.z;

            opt = "< TBOX: ${SHOW_TEXT_BOUNDRY ? "ON" : "OFF"} >";
            quads += opt.length;
            m = MeasureText3D(font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(font, opt, pos, 8.0, 1.0, 0.0, false, RED);
            pos.z += 0.5 + m.z;

            opt = "< LAYER DISTANCE: ${layerDistance.f3} >";
            quads += opt.length;
            m = MeasureText3D(font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(font, opt, pos, 8.0, 1.0, 0.0, false, DARKPURPLE);
          rlPopMatrix();

          opt = "All the text displayed here is in 3D";
          quads += 36;
          m = MeasureText3D(font, opt, 10.0, 0.5, 0.0);
          pos.set(-m.x/2.0, 0.01, 2.0);
          DrawText3D(font, opt, pos, 10.0, 0.5, 0.0, false, DARKBLUE);
          pos.z += 1.5 + m.z;

          opt = "press [Left]/[Right] to change the font size";
          quads += 44;
          m = MeasureText3D(font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(font, opt, pos, 6.0, 0.5, 0.0, false, DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [Up]/[Down] to change the font spacing";
          quads += 44;
          m = MeasureText3D(font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(font, opt, pos, 6.0, 0.5, 0.0, false, DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [PgUp]/[PgDown] to change the line spacing";
          quads += 48;
          m = MeasureText3D(font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(font, opt, pos, 6.0, 0.5, 0.0, false, DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [F1] to toggle the letter boundry";
          quads += 39;
          m = MeasureText3D(font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(font, opt, pos, 6.0, 0.5, 0.0, false, DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [F2] to toggle the text boundry";
          quads += 37;
          m = MeasureText3D(font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(font, opt, pos, 6.0, 0.5, 0.0, false, DARKBLUE);

          SHOW_LETTER_BOUNDRY = slb;

        EndShaderMode();

      EndMode3D();

      DrawText(
        "Drag & drop a font file to change the font!\nType something, see what happens!\n\n"
        "Press [F3] to toggle the camera".toC,
        10, 35, 10, BLACK
      );

      quads += text.length*2*layers;
      String tmp = "$layers layer(s) | ${spin ? "ORBITAL" : "FREE"} camera | $quads quads (${quads*4} verts)";
      int width = MeasureText(tmp.toC, 10);
      DrawText(tmp.toC, screenWidth - 20 - width, 10, 10, DARKGREEN);

      tmp = "[Home]/[End] to add/remove 3D text layers";
      width = MeasureText(tmp.toC, 10);
      DrawText(tmp.toC, screenWidth - 20 - width, 25, 10, DARKGRAY);

      tmp = "[Insert]/[Delete] to increase/decrease distance between layers";
      width = MeasureText(tmp.toC, 10);
      DrawText(tmp.toC, screenWidth - 20 - width, 40, 10, DARKGRAY);

      tmp = "click the [CUBE] for a random color";
      width = MeasureText(tmp.toC, 10);
      DrawText(tmp.toC, screenWidth - 20 - width, 55, 10, DARKGRAY);

      tmp = "[Tab] to toggle multicolor mode";
      width = MeasureText(tmp.toC, 10);
      DrawText(tmp.toC, screenWidth - 20 - width, 70, 10, DARKGRAY);

      DrawFPS(10, 10);

      DrawCircle(
        (GetScreenWidth() / 2).toInt(),
        (GetScreenHeight() / 2).toInt(),
        2,
        BLACK
      );

    EndDrawing();
  }

  UnloadFont(font);

  CloseWindowAndDispose();
}

void DrawTextCodepoint3D(
  FontC font,
  int codepoint,
  Vector3D position,
  double fontSize,
  bool backface,
  ColorC tint,
) {
  int index = GetGlyphIndex(font, codepoint);
  double scale = fontSize/font.baseSize;

  position.x += (font.glyphs[index].offsetX - font.glyphPadding)/font.baseSize*scale;
  position.z += (font.glyphs[index].offsetY - font.glyphPadding)/font.baseSize*scale;

  final srcRec = Rectangle$.$1.set(
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
      Vector3$.$1.set(position.x + width/2, position.y, position.z + height/2),
      Vector3$.$2.set(width, LETTER_BOUNDRY_SIZE, height),
      LETTER_BOUNDRY_COLOR
    );

    rlCheckRenderBatchLimit(4 + 4*backface.toInt());
    rlSetTexture(font.texture.id);

    rlPushMatrix();
      rlTranslatef(position.x, position.y, position.z);

      rlBegin(RlDrawMode.RL_QUADS.value);
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
  FontC font,
  String text,
  Vector3D position,
  double fontSize,
  double fontSpacing,
  double lineSpacing,
  bool backface,
  ColorC tint,
) {
  double textOffsetY = 0.0;
  double textOffsetX = 0.0;

  double scale = fontSize/font.baseSize;

  for (int i = 0; i < text.length;)
  {
    final codepointByteCount = Int$.At('codepointByteCount');
    int codepoint = GetCodepoint(text[i].toC, codepointByteCount);
    int index = GetGlyphIndex(font, codepoint);

    if (codepoint == 0x3f) codepointByteCount.value = 1;

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

    i += codepointByteCount.value;
  }
}

Vector3D MeasureText3D(
  FontC font,
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

    final next = Int$.At('next');
    letter = GetCodepoint(text[i].toC, next);
    index = GetGlyphIndex(font, letter);

    if (letter == 0x3f) next.value = 1;
    i += next.value - 1;

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
  FontC font,
  String text,
  Vector3D position,
  double fontSize,
  double fontSpacing,
  double lineSpacing,
  bool backface,
  WaveTextConfig config,
  double time,
  ColorC tint
) {
  double textOffsetY = 0.0;
  double textOffsetX = 0.0;

  double scale = fontSize/font.baseSize;

  bool wave = false;

  for (int i = 0, k = 0; i < text.length; ++k)
  {
    final codepointByteCount = Int$.At('codepointByteCount');
    int codepoint = GetCodepoint(text[i].toC, codepointByteCount);
    int index = GetGlyphIndex(font, codepoint);

    if (codepoint == 0x3f) codepointByteCount.value = 1;

    if (codepoint == '\n'.ch)
    {
      textOffsetY += scale + lineSpacing/font.baseSize*scale;
      textOffsetX = 0.0;
      k = 0;
    }
    else if (codepoint == '~'.ch)
    {
      if (GetCodepoint(text[i+1].toC, codepointByteCount) == '~'.ch)
      {
        codepointByteCount.value += 1;
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

    i += codepointByteCount.value;
  }
}

Vector3D MeasureTextWave3D(
  FontC font,
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

    final next = Int$.At('next');
    letter = GetCodepoint(text[i].toC, next);
    index = GetGlyphIndex(font, letter);

    if (letter == 0x3f) next.value = 1;
    i += next.value - 1;

    if (letter != '\n'.ch)
    {
      if (letter == '~'.ch && GetCodepoint(text[i+1].toC, next) == '~'.ch)
      {
        i++;
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

ColorC GenerateRandomColor(double s, double v)
{
  const double Phi = 0.618033988749895; // Golden ratio conjugate
  double h = GetRandomValue(0, 360).toDouble();
  h = (h + h*Phi) % 360.0;
  return ColorFromHSV(h, s, v);
}
