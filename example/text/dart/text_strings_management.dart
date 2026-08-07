// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/text/text_strings_management.c
// Run it: dart run text_strings_management.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const int MAX_TEXT_LENGTH = 100;
const int MAX_TEXT_PARTICLES = 100;
const int FONT_SIZE = 30;

class TextParticle {
  String text = '';
  RectangleD rect = .zero();
  Vector2D vel = .zero();
  Vector2D ppos = .zero();
  double padding = 0;
  double borderWidth = 0;
  double friction = 0;
  double elasticity = 0;
  ColorD color = .zero();
  bool grabbed = false;
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "text_strings_management");
  SetTargetFPS(60);

  final List<TextParticle> textParticles = [];
  TextParticle? grabbedTextParticle;
  final Vector2D pressOffset = .zero();

  PrepareFirstTextParticle("raylib => fun videogames programming!", textParticles);

  while (!WindowShouldClose())
  {
    final delta = GetFrameTime();
    final mousePos = GetMousePosition();

    if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT))
    {
      for (int i = textParticles.length - 1; i >= 0; i--)
      {
        final tp = textParticles[i];
        pressOffset.x = mousePos.x - tp.rect.x;
        pressOffset.y = mousePos.y - tp.rect.y;
        if (CheckCollisionPointRec(mousePos, tp.rect))
        {
          tp.grabbed = true;
          grabbedTextParticle = tp;
          break;
        }
      }
    }

    if (IsMouseButtonReleased(.MOUSE_BUTTON_LEFT))
    {
      if (grabbedTextParticle != null)
      {
        grabbedTextParticle.grabbed = false;
        grabbedTextParticle = null;
      }
    }

    if (IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT))
    {
      for (int i = textParticles.length - 1; i >= 0; i--)
      {
        final tp = textParticles[i];
        if (CheckCollisionPointRec(mousePos, tp.rect))
        {
          if (IsKeyDown(.KEY_LEFT_SHIFT))
          {
            ShatterTextParticle(tp, i, textParticles);
          }
          else
          {
            SliceTextParticle(tp, i, tp.text.length~/2, textParticles);
          }
          break;
        }
      }
    }

    if (IsMouseButtonPressed(.MOUSE_BUTTON_MIDDLE))
    {
      for (int i = 0; i < textParticles.length; i++)
      {
        if (!textParticles[i].grabbed) textParticles[i].vel.set(
          GetRandomValue(-2000, 2000),
          GetRandomValue(-2000, 2000)
        );
      }
    }

    if (IsKeyPressed(.KEY_ONE))
      PrepareFirstTextParticle("raylib => fun videogames programming!", textParticles);
    if (IsKeyPressed(.KEY_TWO))
      PrepareFirstTextParticle(TextToUpper("raylib => fun videogames programming!"), textParticles);
    if (IsKeyPressed(.KEY_THREE))
      PrepareFirstTextParticle(TextToLower("raylib => fun videogames programming!"), textParticles);
    if (IsKeyPressed(.KEY_FOUR))
      PrepareFirstTextParticle(TextToPascal("raylib_fun_videogames_programming"), textParticles);
    if (IsKeyPressed(.KEY_FIVE))
      PrepareFirstTextParticle(TextToSnake("RaylibFunVideogamesProgramming"), textParticles);
    if (IsKeyPressed(.KEY_SIX))
      PrepareFirstTextParticle(TextToCamel("raylib_fun_videogames_programming"), textParticles);

    final charPressed = GetCharPressed();
    if ((charPressed >= 'A'.ch) && (charPressed <= 'z'.ch) && (textParticles.length == 1))
    {
      SliceTextParticleByChar(textParticles[0], .fromCharCode(charPressed), textParticles);
    }

    for (int i = 0; i < textParticles.length; i++)
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
        tp.rect.x = mousePos.x - pressOffset.x;
        tp.rect.y = mousePos.y - pressOffset.y;

        tp.vel.x = (tp.rect.x - tp.ppos.x)/delta;
        tp.vel.y = (tp.rect.y - tp.ppos.y)/delta;
        tp.ppos.x = tp.rect.x;
        tp.ppos.y = tp.rect.y;

        if (IsKeyDown(.KEY_LEFT_CONTROL))
        {
          for (int i = 0; i < textParticles.length; i++)
          {
            if (grabbedTextParticle != null && textParticles[i] != grabbedTextParticle && grabbedTextParticle.grabbed)
            {
              if (CheckCollisionRecs(grabbedTextParticle.rect, textParticles[i].rect))
              {
                GlueTextParticles(grabbedTextParticle, textParticles[i], textParticles);
                grabbedTextParticle = textParticles[textParticles.length-1];
              }
            }
          }
        }
      }
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      for (int i = 0; i < textParticles.length; i++)
      {
        final tp = textParticles[i];
        DrawRectangleRec(.rect(tp.rect.x - tp.borderWidth, tp.rect.y - tp.borderWidth, tp.rect.width + tp.borderWidth * 2, tp.rect.height + tp.borderWidth * 2), .BLACK);
        DrawRectangleRec(tp.rect, tp.color);
        DrawText(tp.text, (tp.rect.x+tp.padding).toInt(), (tp.rect.y+tp.padding).toInt(), FONT_SIZE, .BLACK);
      }

      DrawText("grab a text particle by pressing with the mouse and throw it by releasing", 10, 10, 10, .DARKGRAY);
      DrawText("slice a text particle by pressing it with the mouse right button", 10, 30, 10, .DARKGRAY);
      DrawText("shatter a text particle keeping left shift pressed and pressing it with the mouse right button", 10, 50, 10, .DARKGRAY);
      DrawText("glue text particles by grabbing than and keeping left control pressed", 10, 70, 10, .DARKGRAY);
      DrawText("1 to 6 to reset", 10, 90, 10, .DARKGRAY);
      DrawText("when you have only one text particle, you can slice it by pressing a char", 10, 110, 10, .DARKGRAY);
      DrawText("TEXT PARTICLE COUNT: ${textParticles.length}", 10, GetScreenHeight() - 30, 20, .BLACK);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void PrepareFirstTextParticle(String text, List<TextParticle> tps)
{
  tps.clear();

  CreateTextParticle(tps,
    text,
    GetScreenWidth()/2.0,
    GetScreenHeight()/2.0,
    .RAYWHITE
  );
}

void CreateTextParticle(List<TextParticle> tps, String text, double x, double y, ColorD color)
{
  final TextParticle tp = .new();

  tp.text = text;
  tp.vel.set(GetRandomValue(-200, 200), GetRandomValue(-200, 200));
  tp.ppos.set(0, 0);
  tp.padding = 5.0;
  tp.borderWidth = 5.0;
  tp.friction = 0.99;
  tp.elasticity = 0.9;
  tp.color = color;
  tp.grabbed = false;

  tp.rect.set(x, y, 30, 30);
  tp.rect.width = MeasureText(tp.text, FONT_SIZE)+tp.padding*2;
  tp.rect.height = FONT_SIZE+tp.padding*2;

  tps.add(tp);
}

void SliceTextParticle(TextParticle tp, int particlePos, int sliceLength, List<TextParticle> tps)
{
  int length = TextLength(tp.text);

  if((length > 1) && ((tps.length+length) < MAX_TEXT_PARTICLES))
  {
    tps.removeAt(particlePos);

    for (int i = 0; i < length; i += sliceLength)
    {
      final text = sliceLength == 1 ? tp.text[i] : TextSubtext(tp.text, i, sliceLength);
      
      CreateTextParticle(tps,
        text,
        tp.rect.x + i * tp.rect.width/length,
        tp.rect.y,
        .color(
          GetRandomValue(0, 255),
          GetRandomValue(0, 255),
          GetRandomValue(0, 255),
          255,
        ),
      );
    }
  }
}

void SliceTextParticleByChar(TextParticle tp, String charToSlice, List<TextParticle> tps)
{
  final tokens = TextSplit(tp.text, charToSlice);

  if (tokens.length > 1)
  {
    tps.removeAt(0);

    int textLength = TextLength(tp.text);
    for (int i = 0; i < textLength; i++)
    {
      if (tp.text[i] == charToSlice)
      {
        CreateTextParticle(tps,
          charToSlice,
          tp.rect.x,
          tp.rect.y,
          .color(
            GetRandomValue(0, 255),
            GetRandomValue(0, 255),
            GetRandomValue(0, 255),
            255,
          ),
        );
      }
    }

    int charIndex = 0;
    for (int i = 0; i < tokens.length; i++)
    {
      int tokenLength = TextLength(tokens[i]);

      if (tokenLength > 0) {
        CreateTextParticle(tps,
          tokens[i],
          tp.rect.x + charIndex * tp.rect.width / tokenLength,
          tp.rect.y,
          .color(
            GetRandomValue(0, 255),
            GetRandomValue(0, 255),
            GetRandomValue(0, 255),
            255,
          ),
        );
      }

      charIndex += tokenLength + 1;
    }
  }
}

void ShatterTextParticle(TextParticle tp, int particlePos, List<TextParticle> tps)
{
  SliceTextParticle(tp, particlePos, 1, tps);
}

void GlueTextParticles(TextParticle grabbed, TextParticle target, List<TextParticle> tps)
{
  int p1 = -1;
  int p2 = -1;

  for (int i = 0; i < tps.length; i++)
  {
    if (tps[i] == grabbed) p1 = i;
    if (tps[i] == target) p2 = i;
  }

  if ((p1 != -1) && (p2 != -1))
  {
    if (p1 < p2)
    {
      tps.removeAt(p2);
      tps.removeAt(p1);
    }
    else
    {
      tps.removeAt(p1);
      tps.removeAt(p2);
    }

    CreateTextParticle(tps,
      "${grabbed.text}${target.text}",
      grabbed.rect.x,
      grabbed.rect.y,
      .RAYWHITE
    );

    tps[tps.length-1].grabbed = true;
    grabbed.grabbed = false;
  }
}