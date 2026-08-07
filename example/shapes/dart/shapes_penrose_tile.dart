// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_penrose_tile.c
// Run it: dart run shapes_penrose_tile.dart
import 'dart:math' as math;
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int STR_MAX_SIZE = 10000;
const int TURTLE_STACK_MAX_SIZE = 50;

class TurtleState {
  Vector2D origin = .zero();
  double angle = 0;
}

class PenroseLSystem {
  int steps = 0;
  String production = '';
  String ruleW = '';
  String ruleX = '';
  String ruleY = '';
  String ruleZ = '';
  double drawLength = 0;
  double theta = 0;
}

final List<TurtleState> turtleStack = .generate(TURTLE_STACK_MAX_SIZE, (_) => .new());
int turtleTop = -1;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shapes_penrose_tile");
  SetTargetFPS(120);

  double drawLength = 460.0;
  int minGenerations = 0;
  int maxGenerations = 4;
  int generations = 0;

  var ls = CreatePenroseLSystem(drawLength*(generations/maxGenerations));
  for (int i = 0; i < generations; i++) BuildProductionStep(ls);

  while (!WindowShouldClose())
  {
    bool rebuild = false;
    if (IsKeyPressed(.KEY_UP))
    {
      if (generations < maxGenerations)
      {
        generations++;
        rebuild = true;
      }
    }
    else if (IsKeyPressed(.KEY_DOWN))
    {
      if (generations > minGenerations)
      {
        generations--;
        if (generations > 0) rebuild = true;
      }
    }

    if (rebuild)
    {
      ls = CreatePenroseLSystem(drawLength*(generations/maxGenerations));
      for (int i = 0; i < generations; i++) BuildProductionStep(ls);
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      if (generations > 0) DrawPenroseLSystem(ls);

      DrawText("penrose l-system", 10, 10, 20, .DARKGRAY);
      DrawText("press up or down to change generations", 10, 30, 20, .DARKGRAY);
      DrawText("generations: $generations", 10, 50, 20, .DARKGRAY);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void PushTurtleState(TurtleState state)
{
  if (turtleTop < (TURTLE_STACK_MAX_SIZE - 1)) {
    turtleStack[++turtleTop] = .new()
      ..origin = state.origin.copy()
      ..angle = state.angle;
  }
  else throw StateError("TURTLE STACK OVERFLOW!");
}

TurtleState PopTurtleState()
{
  if (turtleTop >= 0) return turtleStack[turtleTop--];
  throw StateError("TURTLE STACK UNDERFLOW!");
}

PenroseLSystem CreatePenroseLSystem(double drawLength)
{
  final PenroseLSystem ls = .new();
  ls.steps = 0;
  ls.production = "[X]++[X]++[X]++[X]++[X]";
  ls.ruleW = "YF++ZF4-XF[-YF4-WF]++";
  ls.ruleX = "+YF--ZF[3-WF--XF]+";
  ls.ruleY = "-WF++XF[+++YF++ZF]-";
  ls.ruleZ = "--YF++++WF[+ZF++++XF]--XF";
  ls.drawLength = drawLength;
  ls.theta = 36.0;
  return ls;
}

void BuildProductionStep(PenroseLSystem ls)
{
  StringBuffer newProduction = .new();

  int productionLength = ls.production.length;

  for (int i = 0; i < productionLength; i++)
  {
    final step = ls.production[i];
    
    if (step == 'W') newProduction.write(ls.ruleW);
    else if (step == 'X') newProduction.write(ls.ruleX);
    else if (step == 'Y') newProduction.write(ls.ruleY);
    else if (step == 'Z') newProduction.write(ls.ruleZ);
    else if (step != 'F') newProduction.write(step);
  }

  ls.drawLength *= 0.5;
  ls.production = newProduction.toString();
}

void DrawPenroseLSystem(PenroseLSystem ls)
{
  final Vector2D screenCenter = .vec2(
    GetScreenWidth()/2.0,
    GetScreenHeight()/2.0
  );

  TurtleState turtle = .new();
  turtle.angle = -90.0;

  int repeats = 1;
  int productionLength = ls.production.length;
  ls.steps += 12;

  if (ls.steps > productionLength) ls.steps = productionLength;

  for (int i = 0; i < ls.steps; i++)
  {
    final step = ls.production[i];
    if (step == 'F')
    {
      for (int j = 0; j < repeats; j++)
      {
        final startPosWorld = turtle.origin.copy();
        final radAngle = rl.DEG2RAD*turtle.angle;
        turtle.origin.x += ls.drawLength*math.cos(radAngle);
        turtle.origin.y += ls.drawLength*math.sin(radAngle);

        DrawLineEx(
          .vec2(startPosWorld.x + screenCenter.x, startPosWorld.y + screenCenter.y),
          .vec2(turtle.origin.x + screenCenter.x, turtle.origin.y + screenCenter.y),
          2,
          Fade(.BLACK, 0.2)
        );
      }

      repeats = 1;
    }
    else if (step == '+')
    {
      for (int j = 0; j < repeats; j++) turtle.angle += ls.theta;

      repeats = 1;
    }
    else if (step == '-')
    {
      for (int j = 0; j < repeats; j++) turtle.angle += -ls.theta;

      repeats = 1;
    }
    else if (step == '[') PushTurtleState(turtle);
    else if (step == ']') turtle = PopTurtleState();
    else if ((step.ch >= 48) && (step.ch <= 57)) repeats = step.ch - 48;
  }

  turtleTop = -1;
}
