// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_draw_3d.c
// Run it: dart run text_draw_3d.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import '../../base.dart';

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
  final rl = loadBaseRaylib();
  LETTER_BOUNDRY_COLOR = rl.Color.VIOLET;

  rl.Core.SetConfigFlags(
    ConfigFlags.FLAG_MSAA_4X_HINT.value |
    ConfigFlags.FLAG_VSYNC_HINT.value
  );
  rl.Core.InitWindow(screenWidth, screenHeight, "text_draw_3d".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(-10.0, 15.0, -10.0);
  camera.ref.target.set(0.0, 0.0, 0.0);
  camera.ref.up.set(0.0, 1.0, 0.0);
  camera.ref.fovy = 45.0;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  bool spin = true;
  bool multicolor = false;
  int cameraMode = CameraMode.CAMERA_ORBITAL.value;

  final cubePosition = rl.Temp.Vector3$.At('cubePosition').set(0.0, 1.0, 0.0);
  final cubeSize = rl.Temp.Vector3$.At('cubeSize').set(2.0, 2.0, 2.0);

  var font = rl.Core.GetFontDefault();
  double fontSize = 8.0;
  double fontSpacing = 0.5;
  double lineSpacing = -1.0;

  // Set the text (using markdown!)
  String text = "Hello ~~World~~ in 3D!";
  final tbox = rl.Temp.Vector3$.At('tbox');
  int layers = 1;
  int quads = 0;
  double layerDistance = 0.01;

  final wcfg = WaveTextConfig(
    waveSpeed: .vec3(3.0, 3.0, 0.5),
    waveOffset: .vec3(0.35, 0.35, 0.35),
    waveRange: .vec3(0.45, 0.45, 0.45),
  );

  double time = 0.0;

  var light = rl.Temp.Color$.At('light').setC(rl.Color.MAROON);
  var dark = rl.Temp.Color$.At('dart').setC(rl.Color.RED);

  final alphaDiscard = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/alpha_discard.fs".toC,
  );

  final multi = rl.Temp.Color$.At('multi', TEXT_MAX_LAYERS);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, cameraMode);
        
    if (rl.Core.IsFileDropped())
    {
      final droppedFiles = rl.Core.LoadDroppedFiles();

      if (rl.Core.IsFileExtension(droppedFiles.paths[0], ".ttf".toC))
      {
        rl.Core.UnloadFont(font);
        font = rl.Core.LoadFontEx(droppedFiles.paths[0], fontSize.toInt(), nullptr, 0);
      }
      else if (rl.Core.IsFileExtension(droppedFiles.paths[0], ".fnt".toC))
      {
        rl.Core.UnloadFont(font);
        font = rl.Core.LoadFont(droppedFiles.paths[0]);
        fontSize = font.baseSize.toDouble();
      }
      
      rl.Core.UnloadDroppedFiles(droppedFiles);
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_F1.value))
      SHOW_LETTER_BOUNDRY = !SHOW_LETTER_BOUNDRY;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_F2.value))
      SHOW_TEXT_BOUNDRY = !SHOW_TEXT_BOUNDRY;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_F3.value))
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

    if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value))
    {
      final center = rl.Temp.vec21(
        rl.Core.GetScreenWidth() / 2,
        rl.Core.GetScreenHeight() / 2,
      );
      final ray = rl.Core.GetScreenToWorldRay(center, camera.ref);

      final bbox = rl.Temp.BoundingBox$.At('bbox');

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

      final collision = rl.Core.GetRayCollisionBox(ray, bbox.ref);
      
      if (collision.hit)
      {
        light.setC(GenerateRandomColor(rl, 0.5, 0.78));
        dark.setC(GenerateRandomColor(rl, 0.4, 0.58));
      }
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_HOME.value)) { if (layers > 1) --layers; }
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_END.value)) { if (layers < TEXT_MAX_LAYERS) ++layers; }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_LEFT.value)) fontSize -= 0.5;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) fontSize += 0.5;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_UP.value)) fontSpacing -= 0.1;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_DOWN.value)) fontSpacing += 0.1;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_PAGE_UP.value)) lineSpacing -= 0.1;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_PAGE_DOWN.value)) lineSpacing += 0.1;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_INSERT.value)) layerDistance -= 0.001;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_DELETE.value)) layerDistance += 0.001;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_TAB.value))
    {
      multicolor = !multicolor;

      if (multicolor)
      {
        for (int i = 0; i < TEXT_MAX_LAYERS; ++i)
        {
          multi[i] = GenerateRandomColor(rl, 0.5, 0.8);
          multi[i].a = rl.Core.GetRandomValue(0, 255);
        }
      }
    }

    int ch = rl.Core.GetCharPressed();
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_BACKSPACE.value))
    {
      text = text.substring(0, text.length - 1);
    }
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_ENTER.value))
    {
      text += '\n';
    }
    else if (ch > 0)
    {
      text += String.fromCharCode(ch);
    }

    tbox.setD(MeasureTextWave3D(rl, font, text, fontSize, fontSpacing, lineSpacing));

    quads = 0;
    time += rl.Core.GetFrameTime();

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);
        rl.Core.DrawCubeV(cubePosition.ref, cubeSize.ref, dark.ref);
        rl.Core.DrawCubeWires(cubePosition.ref, 2.1, 2.1, 2.1, light.ref);

        rl.Core.DrawGrid(10, 2.0);

        rl.Core.BeginShaderMode(alphaDiscard);

          rl.Rlgl.rlPushMatrix();
            rl.Rlgl.rlRotatef(90.0, 1.0, 0.0, 0.0);
            rl.Rlgl.rlRotatef(90.0, 0.0, 0.0, -1.0);

            for (int i = 0; i < layers; ++i)
            {
              var clr = light.ref;
              if (multicolor) clr = multi[i];
              final Vector3D pos = .vec3(-tbox.ref.x/2.0, layerDistance*i, -4.5);
              DrawTextWave3D(rl, font, text, pos, fontSize, fontSpacing, lineSpacing, true, wcfg, time, clr);
            }

            if (SHOW_TEXT_BOUNDRY) rl.Core.DrawCubeWiresV(
              rl.Temp.vec31(0, 0, -4.5 + tbox.ref.z/2),
              tbox.ref,
              dark.ref,
            );

          rl.Rlgl.rlPopMatrix();

          bool slb = SHOW_LETTER_BOUNDRY;
          SHOW_LETTER_BOUNDRY = false;

          rl.Rlgl.rlPushMatrix();
            rl.Rlgl.rlRotatef(180.0, 0.0, 1.0, 0.0);
            String opt = "< SIZE: ${fontSize.f1} >";
            quads += opt.length;
            var m = MeasureText3D(rl, font, opt, 8.0, 1.0, 0.0);
            Vector3D pos = .vec3(-m.x/2.0, 0.01, 2.0);
            DrawText3D(rl, font, opt, pos, 8.0, 1.0, 0.0, false, rl.Color.BLUE);
            pos.z += 0.5 + m.z;

            opt = "< SPACING: ${fontSpacing.f1} >";
            quads += opt.length;
            m = MeasureText3D(rl, font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(rl, font, opt, pos, 8.0, 1.0, 0.0, false, rl.Color.BLUE);
            pos.z += 0.5 + m.z;

            opt = "< LINE: ${lineSpacing.f1} >";
            quads += opt.length;
            m = MeasureText3D(rl, font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(rl, font, opt, pos, 8.0, 1.0, 0.0, false, rl.Color.BLUE);
            pos.z += 1.0 + m.z;

            opt = "< LBOX: ${slb ? "ON" : "OFF"} >";
            quads += opt.length;
            m = MeasureText3D(rl, font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(rl, font, opt, pos, 8.0, 1.0, 0.0, false, rl.Color.RED);
            pos.z += 0.5 + m.z;

            opt = "< TBOX: ${SHOW_TEXT_BOUNDRY ? "ON" : "OFF"} >";
            quads += opt.length;
            m = MeasureText3D(rl, font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(rl, font, opt, pos, 8.0, 1.0, 0.0, false, rl.Color.RED);
            pos.z += 0.5 + m.z;

            opt = "< LAYER DISTANCE: ${layerDistance.f3} >";
            quads += opt.length;
            m = MeasureText3D(rl, font, opt, 8.0, 1.0, 0.0);
            pos.x = -m.x/2.0;
            DrawText3D(rl, font, opt, pos, 8.0, 1.0, 0.0, false, rl.Color.DARKPURPLE);
          rl.Rlgl.rlPopMatrix();

          opt = "All the text displayed here is in 3D";
          quads += 36;
          m = MeasureText3D(rl, font, opt, 10.0, 0.5, 0.0);
          pos.set(-m.x/2.0, 0.01, 2.0);
          DrawText3D(rl, font, opt, pos, 10.0, 0.5, 0.0, false, rl.Color.DARKBLUE);
          pos.z += 1.5 + m.z;

          opt = "press [Left]/[Right] to change the font size";
          quads += 44;
          m = MeasureText3D(rl, font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(rl, font, opt, pos, 6.0, 0.5, 0.0, false, rl.Color.DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [Up]/[Down] to change the font spacing";
          quads += 44;
          m = MeasureText3D(rl, font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(rl, font, opt, pos, 6.0, 0.5, 0.0, false, rl.Color.DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [PgUp]/[PgDown] to change the line spacing";
          quads += 48;
          m = MeasureText3D(rl, font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(rl, font, opt, pos, 6.0, 0.5, 0.0, false, rl.Color.DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [F1] to toggle the letter boundry";
          quads += 39;
          m = MeasureText3D(rl, font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(rl, font, opt, pos, 6.0, 0.5, 0.0, false, rl.Color.DARKBLUE);
          pos.z += 0.5 + m.z;

          opt = "press [F2] to toggle the text boundry";
          quads += 37;
          m = MeasureText3D(rl, font, opt, 6.0, 0.5, 0.0);
          pos.x = -m.x/2.0;
          DrawText3D(rl, font, opt, pos, 6.0, 0.5, 0.0, false, rl.Color.DARKBLUE);

          SHOW_LETTER_BOUNDRY = slb;

        rl.Core.EndShaderMode();

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Drag & drop a font file to change the font!\nType something, see what happens!\n\n"
        "Press [F3] to toggle the camera".toC,
        10, 35, 10, rl.Color.BLACK
      );

      quads += text.length*2*layers;
      String tmp = "$layers layer(s) | ${spin ? "ORBITAL" : "FREE"} camera | $quads quads (${quads*4} verts)";
      int width = rl.Core.MeasureText(tmp.toC, 10);
      rl.Core.DrawText(tmp.toC, screenWidth - 20 - width, 10, 10, rl.Color.DARKGREEN);

      tmp = "[Home]/[End] to add/remove 3D text layers";
      width = rl.Core.MeasureText(tmp.toC, 10);
      rl.Core.DrawText(tmp.toC, screenWidth - 20 - width, 25, 10, rl.Color.DARKGRAY);

      tmp = "[Insert]/[Delete] to increase/decrease distance between layers";
      width = rl.Core.MeasureText(tmp.toC, 10);
      rl.Core.DrawText(tmp.toC, screenWidth - 20 - width, 40, 10, rl.Color.DARKGRAY);

      tmp = "click the [CUBE] for a random color";
      width = rl.Core.MeasureText(tmp.toC, 10);
      rl.Core.DrawText(tmp.toC, screenWidth - 20 - width, 55, 10, rl.Color.DARKGRAY);

      tmp = "[Tab] to toggle multicolor mode";
      width = rl.Core.MeasureText(tmp.toC, 10);
      rl.Core.DrawText(tmp.toC, screenWidth - 20 - width, 70, 10, rl.Color.DARKGRAY);

      rl.Core.DrawFPS(10, 10);

      rl.Core.DrawCircle(
        (rl.Core.GetScreenWidth() / 2).toInt(),
        (rl.Core.GetScreenHeight() / 2).toInt(),
        2,
        rl.Color.BLACK
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadFont(font);

  rl.CloseWindowAndDispose();
}

void DrawTextCodepoint3D(
  Raylib rl,
  FontC font,
  int codepoint,
  Vector3D position,
  double fontSize,
  bool backface,
  ColorC tint,
) {
  int index = rl.Core.GetGlyphIndex(font, codepoint);
  double scale = fontSize/font.baseSize;

  position.x += (font.glyphs[index].offsetX - font.glyphPadding)/font.baseSize*scale;
  position.z += (font.glyphs[index].offsetY - font.glyphPadding)/font.baseSize*scale;

  final srcRec = rl.Temp.rect1(
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

    if (SHOW_LETTER_BOUNDRY) rl.Core.DrawCubeWiresV(
      rl.Temp.vec31(position.x + width/2, position.y, position.z + height/2),
      rl.Temp.vec32(width, LETTER_BOUNDRY_SIZE, height),
      LETTER_BOUNDRY_COLOR
    );

    rl.Rlgl.rlCheckRenderBatchLimit(4 + 4*backface.toInt());
    rl.Rlgl.rlSetTexture(font.texture.id);

    rl.Rlgl.rlPushMatrix();
      rl.Rlgl.rlTranslatef(position.x, position.y, position.z);

      rl.Rlgl.rlBegin(RlDrawMode.RL_QUADS.value);
        rl.Rlgl.rlColor4ub(tint.r, tint.g, tint.b, tint.a);

        // Front Face
        rl.Rlgl.rlNormal3f(0.0, 1.0, 0.0);
        rl.Rlgl.rlTexCoord2f(tx, ty); rl.Rlgl.rlVertex3f(x,         y, z);
        rl.Rlgl.rlTexCoord2f(tx, th); rl.Rlgl.rlVertex3f(x,         y, z + height);
        rl.Rlgl.rlTexCoord2f(tw, th); rl.Rlgl.rlVertex3f(x + width, y, z + height);
        rl.Rlgl.rlTexCoord2f(tw, ty); rl.Rlgl.rlVertex3f(x + width, y, z);

        if (backface)
        {
          // Back Face
          rl.Rlgl.rlNormal3f(0.0, -1.0, 0.0);
          rl.Rlgl.rlTexCoord2f(tx, ty); rl.Rlgl.rlVertex3f(x,         y, z);
          rl.Rlgl.rlTexCoord2f(tw, ty); rl.Rlgl.rlVertex3f(x + width, y, z);
          rl.Rlgl.rlTexCoord2f(tw, th); rl.Rlgl.rlVertex3f(x + width, y, z + height);
          rl.Rlgl.rlTexCoord2f(tx, th); rl.Rlgl.rlVertex3f(x,         y, z + height);
        }
      rl.Rlgl.rlEnd();
    rl.Rlgl.rlPopMatrix();

    rl.Rlgl.rlSetTexture(0);
  }
}

void DrawText3D(
  Raylib rl,
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
    final codepointByteCount = rl.Temp.Int$.At('codepointByteCount');
    int codepoint = rl.Core.GetCodepoint(text[i].toC, codepointByteCount);
    int index = rl.Core.GetGlyphIndex(font, codepoint);

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
        DrawTextCodepoint3D(rl, font, codepoint, pos, fontSize, backface, tint);
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
  Raylib rl,
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

    final next = rl.Temp.Int$.At('next');
    letter = rl.Core.GetCodepoint(text[i].toC, next);
    index = rl.Core.GetGlyphIndex(font, letter);

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
  Raylib rl,
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
    final codepointByteCount = rl.Temp.Int$.At('codepointByteCount');
    int codepoint = rl.Core.GetCodepoint(text[i].toC, codepointByteCount);
    int index = rl.Core.GetGlyphIndex(font, codepoint);

    if (codepoint == 0x3f) codepointByteCount.value = 1;

    if (codepoint == '\n'.ch)
    {
      textOffsetY += scale + lineSpacing/font.baseSize*scale;
      textOffsetX = 0.0;
      k = 0;
    }
    else if (codepoint == '~'.ch)
    {
      if (rl.Core.GetCodepoint(text[i+1].toC, codepointByteCount) == '~'.ch)
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

        DrawTextCodepoint3D(rl, font, codepoint, pos, fontSize, backface, tint);
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
  Raylib rl,
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

    final next = rl.Temp.Int$.At('next');
    letter = rl.Core.GetCodepoint(text[i].toC, next);
    index = rl.Core.GetGlyphIndex(font, letter);

    if (letter == 0x3f) next.value = 1;
    i += next.value - 1;

    if (letter != '\n'.ch)
    {
      if (letter == '~'.ch && rl.Core.GetCodepoint(text[i+1].toC, next) == '~'.ch)
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

ColorC GenerateRandomColor(Raylib rl, double s, double v)
{
  const double Phi = 0.618033988749895; // Golden ratio conjugate
  double h = rl.Core.GetRandomValue(0, 360).toDouble();
  h = (h + h*Phi) % 360.0;
  return rl.Core.ColorFromHSV(h, s, v);
}
