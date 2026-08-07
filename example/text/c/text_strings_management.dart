// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_strings_management.c
// Run it: dart run text_strings_management.dart
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const int MAX_TEXT_LENGTH = 100;
const int MAX_TEXT_PARTICLES = 100;
const int FONT_SIZE = 30;

final class TextParticle extends Struct {
  external Pointer<Char> text;
  external RectangleC rect;
  external Vector2C vel;
  external Vector2C ppos;
  @Float()
  external double padding;
  @Float()
  external double borderWidth;
  @Float()
  external double friction;
  @Float()
  external double elasticity;
  external ColorC color;
  @Bool()
  external bool grabbed;
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_strings_management".toC);
  SetTargetFPS(60);

  final textParticles = calloc<TextParticle>(MAX_TEXT_PARTICLES);
  final particleCount = Int$.At('particleCount');
  Pointer<TextParticle> grabbedTextParticle = nullptr;
  final pressOffset = Vector2$.At('pressOffset');

  PrepareFirstTextParticle(String$.RawValue("raylib => fun videogames programming!"), textParticles, particleCount);

  while (!WindowShouldClose())
  {
    final delta = GetFrameTime();
    final mousePos = GetMousePosition();

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value))
    {
      for (int i = particleCount.value - 1; i >= 0; i--)
      {
        final tp = textParticles + i;
        pressOffset.ref.x = mousePos.x - tp.ref.rect.x;
        pressOffset.ref.y = mousePos.y - tp.ref.rect.y;
        if (CheckCollisionPointRec(mousePos, tp.ref.rect))
        {
          tp.ref.grabbed = true;
          grabbedTextParticle = tp;
          break;
        }
      }
    }

    if (IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value))
    {
      if (grabbedTextParticle != nullptr)
      {
        grabbedTextParticle.ref.grabbed = false;
        grabbedTextParticle = nullptr;
      }
    }

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_RIGHT.value))
    {
      for (int i = particleCount.value - 1; i >= 0; i--)
      {
        final tp = textParticles + i;
        if (CheckCollisionPointRec(mousePos, tp.ref.rect))
        {
          if (IsKeyDown(KeyboardKey.KEY_LEFT_SHIFT.value))
          {
            ShatterTextParticle(tp, i, textParticles, particleCount);
          }
          else
          {
            SliceTextParticle(tp, i, TextLength(tp.ref.text)~/2, textParticles, particleCount);
          }
          break;
        }
      }
    }

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_MIDDLE.value))
    {
      for (int i = 0; i < particleCount.value; i++)
      {
        if (!textParticles[i].grabbed) textParticles[i].vel.set(
          GetRandomValue(-2000, 2000),
          GetRandomValue(-2000, 2000)
        );
      }
    }

    if (IsKeyPressed(KeyboardKey.KEY_ONE.value))
      PrepareFirstTextParticle(String$.RawValue("raylib => fun videogames programming!"), textParticles, particleCount);
    if (IsKeyPressed(KeyboardKey.KEY_TWO.value))
      PrepareFirstTextParticle(String$.RawValue(TextToUpper("raylib => fun videogames programming!".toC).toD), textParticles, particleCount);
    if (IsKeyPressed(KeyboardKey.KEY_THREE.value))
      PrepareFirstTextParticle(String$.RawValue(TextToLower("raylib => fun videogames programming!".toC).toD), textParticles, particleCount);
    if (IsKeyPressed(KeyboardKey.KEY_FOUR.value))
      PrepareFirstTextParticle(String$.RawValue(TextToPascal("raylib_fun_videogames_programming".toC).toD), textParticles, particleCount);
    if (IsKeyPressed(KeyboardKey.KEY_FIVE.value))
      PrepareFirstTextParticle(String$.RawValue(TextToSnake("RaylibFunVideogamesProgramming".toC).toD), textParticles, particleCount);
    if (IsKeyPressed(KeyboardKey.KEY_SIX.value))
      PrepareFirstTextParticle(String$.RawValue(TextToCamel("raylib_fun_videogames_programming".toC).toD), textParticles, particleCount);

    final charPressed = GetCharPressed();
    if ((charPressed >= 'A'.ch) && (charPressed <= 'z'.ch) && (particleCount.value == 1))
    {
      SliceTextParticleByChar(textParticles + 0, charPressed, textParticles, particleCount);
    }

    for (int i = 0; i < particleCount.value; i++)
    {
      final tp = textParticles[i];

      if (!tp.grabbed)
      {
        tp.rect.x += tp.vel.x * delta;
        tp.rect.y += tp.vel.y * delta;

        if ((tp.rect.x + tp.rect.width) >= screenWidth)
        {
          tp.rect.x = screenWidth - tp.rect.width;
          tp.vel.x = -tp.vel.x*tp.elasticity;
        }
        else if (tp.rect.x <= 0)
        {
          tp.rect.x = 0.0;
          tp.vel.x = -tp.vel.x*tp.elasticity;
        }

        if ((tp.rect.y + tp.rect.height) >= screenHeight)
        {
          tp.rect.y = screenHeight - tp.rect.height;
          tp.vel.y = -tp.vel.y*tp.elasticity;
        }
        else if (tp.rect.y <= 0)
        {
          tp.rect.y = 0.0;
          tp.vel.y = -tp.vel.y*tp.elasticity;
        }

        tp.vel.x = tp.vel.x*tp.friction;
        tp.vel.y = tp.vel.y*tp.friction;
      }
      else
      {
        tp.rect.x = mousePos.x - pressOffset.ref.x;
        tp.rect.y = mousePos.y - pressOffset.ref.y;

        tp.vel.x = (tp.rect.x - tp.ppos.x)/delta;
        tp.vel.y = (tp.rect.y - tp.ppos.y)/delta;
        tp.ppos.x = tp.rect.x;
        tp.ppos.y = tp.rect.y;

        if (IsKeyDown(KeyboardKey.KEY_LEFT_CONTROL.value))
        {
          for (int i = 0; i < particleCount.value; i++)
          {
            if (textParticles + i != grabbedTextParticle && grabbedTextParticle.ref.grabbed)
            {
              if (CheckCollisionRecs(grabbedTextParticle.ref.rect, textParticles[i].rect))
              {
                GlueTextParticles(grabbedTextParticle, textParticles + i, textParticles, particleCount);
                grabbedTextParticle = textParticles + (particleCount.value-1);
              }
            }
          }
        }
      }
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      for (int i = 0; i < particleCount.value; i++)
      {
        final tp = textParticles[i];
        DrawRectangleRec(Rectangle$.$1.set(tp.rect.x - tp.borderWidth, tp.rect.y - tp.borderWidth, tp.rect.width + tp.borderWidth * 2, tp.rect.height + tp.borderWidth * 2), BLACK);
        DrawRectangleRec(tp.rect, tp.color);
        DrawText(tp.text, (tp.rect.x+tp.padding).toInt(), (tp.rect.y+tp.padding).toInt(), FONT_SIZE, BLACK);
      }

      DrawText("grab a text particle by pressing with the mouse and throw it by releasing".toC, 10, 10, 10, DARKGRAY);
      DrawText("slice a text particle by pressing it with the mouse right button".toC, 10, 30, 10, DARKGRAY);
      DrawText("shatter a text particle keeping left shift pressed and pressing it with the mouse right button".toC, 10, 50, 10, DARKGRAY);
      DrawText("glue text particles by grabbing than and keeping left control pressed".toC, 10, 70, 10, DARKGRAY);
      DrawText("1 to 6 to reset".toC, 10, 90, 10, DARKGRAY);
      DrawText("when you have only one text particle, you can slice it by pressing a char".toC, 10, 110, 10, DARKGRAY);
      DrawText("TEXT PARTICLE COUNT: ${particleCount.value}".toC, 10, GetScreenHeight() - 30, 20, BLACK);

    EndDrawing();
  }

  for (int i = 0; i < particleCount.value; i++) {
    calloc.free(textParticles[i].text);
  }
  calloc.free(textParticles);

  CloseWindowAndDispose();
}

void PrepareFirstTextParticle(Pointer<Char> text, Pointer<TextParticle> tps, Pointer<Int> particleCount)
{
  CreateTextParticle(tps, 0,
    text,
    GetScreenWidth()/2.0,
    GetScreenHeight()/2.0,
    RAYWHITE
  );
  particleCount.value = 1;
}

void CreateTextParticle(Pointer<TextParticle> tps, int index, Pointer<Char> text, double x, double y, ColorC color)
{
  final tp = tps + index;

  tp.ref.text = String$.RawValue(text.toD);
  tp.ref.vel.set(GetRandomValue(-200, 200), GetRandomValue(-200, 200));
  tp.ref.ppos.set(0, 0);
  tp.ref.padding = 5.0;
  tp.ref.borderWidth = 5.0;
  tp.ref.friction = 0.99;
  tp.ref.elasticity = 0.9;
  tp.ref.color = color;
  tp.ref.grabbed = false;

  tp.ref.rect.set(x, y, 30, 30);
  tp.ref.rect.width = MeasureText(tp.ref.text, FONT_SIZE)+tp.ref.padding*2;
  tp.ref.rect.height = FONT_SIZE+tp.ref.padding*2;
}

void SliceTextParticle(Pointer<TextParticle> tp, int particlePos, int sliceLength, Pointer<TextParticle> tps, Pointer<Int> particleCount)
{
  int length = TextLength(tp.ref.text);

  if((length > 1) && ((particleCount.value+length) < MAX_TEXT_PARTICLES))
  {
    for (int i = 0; i < length; i += sliceLength)
    {
      final text = sliceLength == 1 ? tp.ref.text + i : TextSubtext(tp.ref.text, i, sliceLength);
      
      final nextPos = particleCount.value;
      particleCount.value = particleCount.value + 1;

      CreateTextParticle(tps, nextPos,
        text,
        tp.ref.rect.x + i * tp.ref.rect.width/length,
        tp.ref.rect.y,
        BLANK,
      );

      tps[nextPos].color.set(
        GetRandomValue(0, 255),
        GetRandomValue(0, 255),
        GetRandomValue(0, 255),
        255
      );
    }

    RealocateTextParticles(tps, particlePos, particleCount);
  }
}

void SliceTextParticleByChar(Pointer<TextParticle> tp, int charToSlice, Pointer<TextParticle> tps, Pointer<Int> particleCount)
{
  final tokenCount = Int$.At('tokenCount');
  final tokens = TextSplit(tp.ref.text, charToSlice, tokenCount);

  if (tokenCount.value > 1)
  {
    int textLength = TextLength(tp.ref.text);
    for (int i = 0; i < textLength; i++)
    {
      if (tp.ref.text[i] == charToSlice)
      {
        final nextPos = particleCount.value++;

        CreateTextParticle(tps, nextPos,
          String$.RawValue(String.fromCharCode(charToSlice)),
          tp.ref.rect.x,
          tp.ref.rect.y,
          BLANK,
        );

        tps[nextPos].color.set(
          GetRandomValue(0, 255),
          GetRandomValue(0, 255),
          GetRandomValue(0, 255),
          255
        );
      }
    }

    int charIndex = 0;
    for (int i = 0; i < tokenCount.value; i++)
    {
      int tokenLength = TextLength(tokens[i]);

      if (tokenLength > 0) {
        final nextPos = particleCount.value++;
        
        CreateTextParticle(tps, nextPos,
          String$.RawValue(tokens[i].toD),
          tp.ref.rect.x + charIndex * tp.ref.rect.width / tokenLength,
          tp.ref.rect.y,
          BLANK,
        );

        tps[nextPos].color.set(
          GetRandomValue(0, 255),
          GetRandomValue(0, 255),
          GetRandomValue(0, 255),
          255
        );
      }

      charIndex += tokenLength + 1;
    }

    if (tokenCount.value > 0)
    {
      RealocateTextParticles(tps, 0, particleCount);
    }
  }
}

void ShatterTextParticle(Pointer<TextParticle> tp, int particlePos, Pointer<TextParticle> tps, Pointer<Int> particleCount)
{
  SliceTextParticle(tp, particlePos, 1, tps, particleCount);
}

void GlueTextParticles(Pointer<TextParticle> grabbed, Pointer<TextParticle> target, Pointer<TextParticle> tps, Pointer<Int> particleCount)
{
  int p1 = -1;
  int p2 = -1;

  for (int i = 0; i < particleCount.value; i++)
  {
    if (tps + i == grabbed) p1 = i;
    if (tps + i == target) p2 = i;
  }

  if ((p1 != -1) && (p2 != -1))
  {
    final nextPos = particleCount.value++;
    
    CreateTextParticle(tps, nextPos,
      String$.RawValue("${grabbed.ref.text.toD}${target.ref.text.toD}"),
      grabbed.ref.rect.x,
      grabbed.ref.rect.y,
      RAYWHITE
    );

    tps[nextPos].grabbed = true;
    grabbed.ref.grabbed = false;

    if (p1 < p2)
    {
      RealocateTextParticles(tps, p2, particleCount);
      RealocateTextParticles(tps, p1, particleCount);
    }
    else
    {
      RealocateTextParticles(tps, p1, particleCount);
      RealocateTextParticles(tps, p2, particleCount);
    }
  }
}

void RealocateTextParticles(Pointer<TextParticle> tps, int particlePos, Pointer<Int> particleCount)
{
  for (int i = particlePos+1; i < particleCount.value; i++)
  {
    tps[i-1] = tps[i];
  }
  particleCount.value--;
}