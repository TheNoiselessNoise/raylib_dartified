// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_penrose_tile.c
// Run it: dart run shapes_penrose_tile.dart
import 'dart:ffi';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int STR_MAX_SIZE = 10000;
const int TURTLE_STACK_MAX_SIZE = 50;

final class TurtleState extends Struct {
  external Vector2C origin;
  @Float()
  external double angle;
}

final class PenroseLSystem extends Struct {
  @Int()
  external int steps;
  external Pointer<Char> production;
  external Pointer<Char> ruleW;
  external Pointer<Char> ruleX;
  external Pointer<Char> ruleY;
  external Pointer<Char> ruleZ;
  @Float()
  external double drawLength;
  @Float()
  external double theta;
}

late Pointer<TurtleState> turtleStack;
int turtleTop = -1;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shapes_penrose_tile".toC);
  SetTargetFPS(120);

  turtleStack = calloc(TURTLE_STACK_MAX_SIZE);

  double drawLength = 460.0;
  int minGenerations = 0;
  int maxGenerations = 4;
  int generations = 0;

  var ls = CreatePenroseLSystem(drawLength*(generations/maxGenerations));
  for (int i = 0; i < generations; i++) BuildProductionStep(ls);

  while (!WindowShouldClose())
  {
    bool rebuild = false;
    if (IsKeyPressed(KeyboardKey.KEY_UP.value))
    {
      if (generations < maxGenerations)
      {
        generations++;
        rebuild = true;
      }
    }
    else if (IsKeyPressed(KeyboardKey.KEY_DOWN.value))
    {
      if (generations > minGenerations)
      {
        generations--;
        if (generations > 0) rebuild = true;
      }
    }

    if (rebuild)
    {
      FreePenroseLSystem(ls);
      ls = CreatePenroseLSystem(drawLength*(generations/maxGenerations));
      for (int i = 0; i < generations; i++) BuildProductionStep(ls);
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      if (generations > 0) DrawPenroseLSystem(ls);

      DrawText("penrose l-system".toC, 10, 10, 20, DARKGRAY);
      DrawText("press up or down to change generations".toC, 10, 30, 20, DARKGRAY);
      DrawText("generations: $generations".toC, 10, 50, 20, DARKGRAY);

    EndDrawing();
  }

  calloc.free(turtleStack);

  CloseWindowAndDispose();
}

void FreePenroseLSystem(Pointer<PenroseLSystem> ls) {
  calloc.free(ls.ref.production);
  calloc.free(ls.ref.ruleW);
  calloc.free(ls.ref.ruleX);
  calloc.free(ls.ref.ruleY);
  calloc.free(ls.ref.ruleZ);
  calloc.free(ls);
}

void PushTurtleState(TurtleState state)
{
  if (turtleTop < (TURTLE_STACK_MAX_SIZE - 1)) turtleStack[++turtleTop] = state;
  else throw StateError("TURTLE STACK OVERFLOW!");
}

TurtleState PopTurtleState()
{
  if (turtleTop >= 0) return turtleStack[turtleTop--];
  throw StateError("TURTLE STACK UNDERFLOW!");
}

Pointer<PenroseLSystem> CreatePenroseLSystem(double drawLength)
{
  final Pointer<PenroseLSystem> ls = calloc();
  ls.ref.steps = 0;
  ls.ref.production = String$.RawValue("[X]++[X]++[X]++[X]++[X]", STR_MAX_SIZE);
  ls.ref.ruleW = String$.RawValue("YF++ZF4-XF[-YF4-WF]++");
  ls.ref.ruleX = String$.RawValue("+YF--ZF[3-WF--XF]+");
  ls.ref.ruleY = String$.RawValue("-WF++XF[+++YF++ZF]-");
  ls.ref.ruleZ = String$.RawValue("--YF++++WF[+ZF++++XF]--XF");
  ls.ref.drawLength = drawLength;
  ls.ref.theta = 36.0;
  return ls;
}

void BuildProductionStep(Pointer<PenroseLSystem> ls)
{
  final newProduction = calloc<Char>(STR_MAX_SIZE);
  newProduction[0] = 0;

  int productionLength = strnlen(ls.ref.production.cast(), STR_MAX_SIZE);

  for (int i = 0; i < productionLength; i++)
  {
    final step = ls.ref.production[i];
    int remainingSpace = STR_MAX_SIZE - strnlen(newProduction.cast(), STR_MAX_SIZE) - 1;
    
    if (step == 'W'.ch) strncat(newProduction.cast(), ls.ref.ruleW.cast(), remainingSpace);
    else if (step == 'X'.ch) strncat(newProduction.cast(), ls.ref.ruleX.cast(), remainingSpace);
    else if (step == 'Y'.ch) strncat(newProduction.cast(), ls.ref.ruleY.cast(), remainingSpace);
    else if (step == 'Z'.ch) strncat(newProduction.cast(), ls.ref.ruleZ.cast(), remainingSpace);
    else if (step != 'F'.ch) {
      int t = strnlen(newProduction.cast(), STR_MAX_SIZE);
      newProduction[t] = step;
      newProduction[t + 1] = 0;
    }
  }

  ls.ref.drawLength *= 0.5;
  strncpy(ls.ref.production.cast(), newProduction.cast(), STR_MAX_SIZE);

  calloc.free(newProduction);
}

void DrawPenroseLSystem(Pointer<PenroseLSystem> ls)
{
  final screenCenter = Vector2$.$1.set(
    GetScreenWidth()/2.0,
    GetScreenHeight()/2.0
  );

  final turtle = calloc<TurtleState>();
  turtle.ref.angle = -90.0;

  int repeats = 1;
  int productionLength = strnlen(ls.ref.production.cast(), STR_MAX_SIZE);
  ls.ref.steps += 12;

  if (ls.ref.steps > productionLength) ls.ref.steps = productionLength;

  for (int i = 0; i < ls.ref.steps; i++)
  {
    final step = ls.ref.production[i];
    if (step == 'F'.ch)
    {
      for (int j = 0; j < repeats; j++)
      {
        final startX = turtle.ref.origin.x;
        final startY = turtle.ref.origin.y;
        final radAngle = rl.DEG2RAD*turtle.ref.angle;
        turtle.ref.origin.x += ls.ref.drawLength*math.cos(radAngle);
        turtle.ref.origin.y += ls.ref.drawLength*math.sin(radAngle);

        DrawLineEx(
          Vector2$.$2.set(startX + screenCenter.x, startY + screenCenter.y),
          Vector2$.$3.set(turtle.ref.origin.x + screenCenter.x, turtle.ref.origin.y + screenCenter.y),
          2,
          Fade(BLACK, 0.2)
        );
      }

      repeats = 1;
    }
    else if (step == '+'.ch)
    {
      for (int j = 0; j < repeats; j++) turtle.ref.angle += ls.ref.theta;

      repeats = 1;
    }
    else if (step == '-'.ch)
    {
      for (int j = 0; j < repeats; j++) turtle.ref.angle += -ls.ref.theta;

      repeats = 1;
    }
    else if (step == '['.ch) PushTurtleState(turtle.ref);
    else if (step == ']'.ch) turtle.ref = PopTurtleState();
    else if ((step >= 48) && (step <= 57)) repeats = step - 48;
  }

  turtleTop = -1;
  calloc.free(turtle);
}
