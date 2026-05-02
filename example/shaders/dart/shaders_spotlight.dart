// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_spotlight.c
// Run it: dart run shaders_spotlight.dart
// WARNING: expects resources from the raylib source
import 'dart:math' as math;
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_SPOTS = 3;
const int MAX_STARS = 400;

class Spot {
  Vector2D position;
  Vector2D speed;
  double inner;
  double radius;

  int positionLoc;
  int innerLoc;
  int radiusLoc;

  Spot({
    Vector2D? position,
    Vector2D? speed,
    this.inner = 0,
    this.radius = 0,

    this.positionLoc = -1,
    this.innerLoc = -1,
    this.radiusLoc = -1,
  }) :
    position = position ?? .zero(),
    speed = speed ?? .zero();
}

class Star {
  Vector2D position;
  Vector2D speed;

  Star({
    Vector2D? position,
    Vector2D? speed,
  }) :
    position = position ?? .zero(),
    speed = speed ?? .zero();
}

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_spotlight");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.HideCursor();

  final texRay = rl.CoreD.LoadTexture("../resources/raysan.png");

  List<Star> stars = List.generate(MAX_STARS, (_) => .new());

  stars.forEach((s) => ResetStar(rl, s));

  for (int m = 0; m < screenWidth/2.0; m++)
  {
    stars.forEach((s) => UpdateStar(rl, s));
  }

  int frameCounter = 0;

  final shdrSpot = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/spotlight.fs",
  );

  List<Spot> spots = List.generate(MAX_SPOTS, (_) => .new());

  for (int i = 0; i < MAX_SPOTS; i++)
  {
    String posName = "spots[$i].pos";
    String innerName = "spots[$i].inner";
    String radiusName = "spots[$i].radius";

    spots[i].positionLoc = rl.CoreD.GetShaderLocation(shdrSpot, posName);
    spots[i].innerLoc = rl.CoreD.GetShaderLocation(shdrSpot, innerName);
    spots[i].radiusLoc = rl.CoreD.GetShaderLocation(shdrSpot, radiusName);
  }

  rl.CoreD.SetShaderValue(shdrSpot,
    rl.CoreD.GetShaderLocation(shdrSpot, "screenWidth"),
    [rl.CoreD.GetScreenWidth()],
    .SHADER_UNIFORM_FLOAT,
  );

  for (int i = 0; i < MAX_SPOTS; i++)
  {
    spots[i].position.x = rl.CoreD.GetRandomValue(64, screenWidth - 64).toDouble();
    spots[i].position.y = rl.CoreD.GetRandomValue(64, screenHeight - 64).toDouble();
    spots[i].speed.set(0, 0);

    while (((spots[i].speed.x).abs() + (spots[i].speed.y).abs()) < 2)
    {
      spots[i].speed.x = rl.CoreD.GetRandomValue(-400, 40) / 10.0;
      spots[i].speed.y = rl.CoreD.GetRandomValue(-400, 40) / 10.0;
    }

    spots[i].inner = 28.0 * (i + 1);
    spots[i].radius = 48.0 * (i + 1);

    rl.CoreD.SetShaderValue(shdrSpot, spots[i].positionLoc,
      spots[i].position.toArray(),
      .SHADER_UNIFORM_VEC2,
    );
    rl.CoreD.SetShaderValue(shdrSpot, spots[i].innerLoc,
      [spots[i].inner],
      .SHADER_UNIFORM_FLOAT,
    );
    rl.CoreD.SetShaderValue(shdrSpot, spots[i].radiusLoc,
      [spots[i].radius],
      .SHADER_UNIFORM_FLOAT,
    );
  }

  while (!rl.CoreD.WindowShouldClose())
  {
    frameCounter++;

    stars.forEach((s) => UpdateStar(rl, s));

    for (int i = 0; i < MAX_SPOTS; i++)
    {
      if (i == 0)
      {
        final mp = rl.CoreD.GetMousePosition();
        spots[i].position.x = mp.x;
        spots[i].position.y = screenHeight - mp.y;
      }
      else
      {
        spots[i].position.x += spots[i].speed.x;
        spots[i].position.y += spots[i].speed.y;

        if (spots[i].position.x < 64) spots[i].speed.x = -spots[i].speed.x;
        if (spots[i].position.x > (screenWidth - 64)) spots[i].speed.x = -spots[i].speed.x;
        if (spots[i].position.y < 64) spots[i].speed.y = -spots[i].speed.y;
        if (spots[i].position.y > (screenHeight - 64)) spots[i].speed.y = -spots[i].speed.y;
      }

      rl.CoreD.SetShaderValue(shdrSpot, spots[i].positionLoc,
        spots[i].position.toArray(),
        .SHADER_UNIFORM_VEC2,
      );
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.DARKBLUE);

      for (int n = 0; n < MAX_STARS; n++)
      {
        rl.CoreD.DrawRectangle(
          stars[n].position.x.toInt(),
          stars[n].position.y.toInt(),
          2, 2, .WHITE
        );
      }

      for (int i = 0; i < 16; i++)
      {
        rl.CoreD.DrawTexture(
          texRay,
          ((screenWidth/2.0) + math.cos((frameCounter + i*8)/51.45)*(screenWidth/2.2) - 32).toInt(),
          ((screenHeight/2.0) + math.sin((frameCounter + i*8)/17.87)*(screenHeight/4.2)).toInt(),
          .WHITE
        );
      }

      rl.CoreD.BeginShaderMode(shdrSpot);
        rl.CoreD.DrawRectangle(0, 0, screenWidth, screenHeight, .WHITE);
      rl.CoreD.EndShaderMode();

      rl.CoreD.DrawFPS(10, 10);

      rl.CoreD.DrawText(
        "Move the mouse!",
        10, 30, 20, .GREEN
      );
      rl.CoreD.DrawText(
        "Pitch Black",
        (screenWidth*0.2).toInt(), screenHeight~/2, 20, .GREEN
      );
      rl.CoreD.DrawText(
        "Dark",
        (screenWidth*.66).toInt(), screenHeight~/2, 20, .GREEN
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texRay);
  rl.CoreD.UnloadShader(shdrSpot);
  
  rl.CloseWindowAndDispose();
}

void ResetStar(Raylib rl, Star s)
{
  s.position.set(rl.CoreD.GetScreenWidth()/2.0, rl.CoreD.GetScreenHeight()/2.0);

  do
  {
    s.speed.x = rl.CoreD.GetRandomValue(-1000, 1000)/100.0;
    s.speed.y = rl.CoreD.GetRandomValue(-1000, 1000)/100.0;
  } while (((s.speed.x).abs() + ((s.speed.y).abs() > 1).toInt()) == 0);

  s.position = s.position.add(s.speed.mul(.vec2(8.0, 8.0)));
}

void UpdateStar(Raylib rl, Star s)
{
  s.position = s.position.add(s.speed);

  if (
    (s.position.x < 0) || (s.position.x > rl.CoreD.GetScreenWidth()) ||
    (s.position.y < 0) || (s.position.y > rl.CoreD.GetScreenHeight())
  ) ResetStar(rl, s);
}


