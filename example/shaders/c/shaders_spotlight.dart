// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_spotlight.c
// Run it: dart run shaders_spotlight.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
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

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_spotlight".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.HideCursor();

  final texRay = rl.Core.LoadTexture("../resources/raysan.png".toC);

  List<Star> stars = List.generate(MAX_STARS, (_) => .new());

  stars.forEach((s) => ResetStar(rl, s));

  for (int m = 0; m < screenWidth/2.0; m++)
  {
    stars.forEach((s) => UpdateStar(rl, s));
  }

  int frameCounter = 0;

  final shdrSpot = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/spotlight.fs".toC,
  );

  List<Spot> spots = List.generate(MAX_SPOTS, (_) => .new());

  for (int i = 0; i < MAX_SPOTS; i++)
  {
    String posName = "spots[$i].pos";
    String innerName = "spots[$i].inner";
    String radiusName = "spots[$i].radius";

    spots[i].positionLoc = rl.Core.GetShaderLocation(shdrSpot, posName.toC);
    spots[i].innerLoc = rl.Core.GetShaderLocation(shdrSpot, innerName.toC);
    spots[i].radiusLoc = rl.Core.GetShaderLocation(shdrSpot, radiusName.toC);
  }

  rl.Core.SetShaderValue(shdrSpot,
    rl.Core.GetShaderLocation(shdrSpot, "screenWidth".toC),
    rl.Temp.Float$.Value(rl.Core.GetScreenWidth()).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
  );

  for (int i = 0; i < MAX_SPOTS; i++)
  {
    spots[i].position.x = rl.Core.GetRandomValue(64, screenWidth - 64).toDouble();
    spots[i].position.y = rl.Core.GetRandomValue(64, screenHeight - 64).toDouble();
    spots[i].speed.set(0, 0);

    while (((spots[i].speed.x).abs() + (spots[i].speed.y).abs()) < 2)
    {
      spots[i].speed.x = rl.Core.GetRandomValue(-400, 40) / 10.0;
      spots[i].speed.y = rl.Core.GetRandomValue(-400, 40) / 10.0;
    }

    spots[i].inner = 28.0 * (i + 1);
    spots[i].radius = 48.0 * (i + 1);

    rl.Core.SetShaderValue(shdrSpot, spots[i].positionLoc,
      rl.Temp.vec21Ptr.setD(spots[i].position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
    );
    rl.Core.SetShaderValue(shdrSpot, spots[i].innerLoc,
      rl.Temp.Float$.Value(spots[i].inner).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
    rl.Core.SetShaderValue(shdrSpot, spots[i].radiusLoc,
      rl.Temp.Float$.Value(spots[i].radius).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value,
    );
  }

  while (!rl.Core.WindowShouldClose())
  {
    frameCounter++;

    stars.forEach((s) => UpdateStar(rl, s));

    for (int i = 0; i < MAX_SPOTS; i++)
    {
      if (i == 0)
      {
        final mp = rl.Core.GetMousePosition();
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

      rl.Core.SetShaderValue(shdrSpot, spots[i].positionLoc,
        rl.Temp.vec21Ptr.setD(spots[i].position).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
      );
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.DARKBLUE);

      for (int n = 0; n < MAX_STARS; n++)
      {
        rl.Core.DrawRectangle(
          stars[n].position.x.toInt(),
          stars[n].position.y.toInt(),
          2, 2, rl.C.WHITE
        );
      }

      for (int i = 0; i < 16; i++)
      {
        rl.Core.DrawTexture(
          texRay,
          ((screenWidth/2.0) + math.cos((frameCounter + i*8)/51.45)*(screenWidth/2.2) - 32).toInt(),
          ((screenHeight/2.0) + math.sin((frameCounter + i*8)/17.87)*(screenHeight/4.2)).toInt(),
          rl.C.WHITE
        );
      }

      rl.Core.BeginShaderMode(shdrSpot);
        rl.Core.DrawRectangle(0, 0, screenWidth, screenHeight, rl.C.WHITE);
      rl.Core.EndShaderMode();

      rl.Core.DrawFPS(10, 10);

      rl.Core.DrawText(
        "Move the mouse!".toC,
        10, 30, 20, rl.C.GREEN
      );
      rl.Core.DrawText(
        "Pitch Black".toC,
        (screenWidth*0.2).toInt(), screenHeight~/2, 20, rl.C.GREEN
      );
      rl.Core.DrawText(
        "Dark".toC,
        (screenWidth*.66).toInt(), screenHeight~/2, 20, rl.C.GREEN
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texRay);
  rl.Core.UnloadShader(shdrSpot);
  
  rl.CloseWindowAndDispose();
}

void ResetStar(Raylib rl, Star s)
{
  s.position.set(rl.Core.GetScreenWidth()/2.0, rl.Core.GetScreenHeight()/2.0);

  do
  {
    s.speed.x = rl.Core.GetRandomValue(-1000, 1000)/100.0;
    s.speed.y = rl.Core.GetRandomValue(-1000, 1000)/100.0;
  } while (((s.speed.x).abs() + ((s.speed.y).abs() > 1).toInt()) == 0);

  s.position = s.position.add(s.speed.mul(.vec2(8.0, 8.0)));
}

void UpdateStar(Raylib rl, Star s)
{
  s.position = s.position.add(s.speed);

  if (
    (s.position.x < 0) || (s.position.x > rl.Core.GetScreenWidth()) ||
    (s.position.y < 0) || (s.position.y > rl.Core.GetScreenHeight())
  ) ResetStar(rl, s);
}


