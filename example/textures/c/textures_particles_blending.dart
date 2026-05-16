// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_particles_blending.c
// Run it: dart run textures_particles_blending.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_PARTICLES = 200;

class Particle {
  Vector2C position;
  ColorC color;
  double alpha;
  double size;
  double rotation;
  bool active;

  Particle({
    required this.position,
    required this.color,
    required this.alpha,
    required this.size,
    required this.rotation,
    required this.active,
  });
}

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_particles_blending".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final mouseTail = <Particle>[];

  for (int i = 0; i < MAX_PARTICLES; i++)
  {
    mouseTail.add(Particle(
      position: rl.Temp.Vector2$.At('position_$i').ref,
      color: rl.Temp.Color$.At('color_$i').set(
        rl.Core.GetRandomValue(0, 255),
        rl.Core.GetRandomValue(0, 255),
        rl.Core.GetRandomValue(0, 255),
        255,
      ).ref,
      alpha: 1.0,
      size: rl.Core.GetRandomValue(1, 30)/20.0,
      rotation: rl.Core.GetRandomValue(0, 360).toDouble(),
      active: false,
    ));
  }

  final smoke = rl.Core.LoadTexture("../resources/spark_flame.png".toC);

  double gravity = 3.0;
  int blending = BlendMode.BLEND_ALPHA.value;

  while (!rl.Core.WindowShouldClose())
  {
    for (int i = 0; i < MAX_PARTICLES; i++)
    {
      if (!mouseTail[i].active)
      {
        mouseTail[i].active = true;
        mouseTail[i].alpha = 1.0;
        mouseTail[i].position.setC(rl.Core.GetMousePosition());
        i = MAX_PARTICLES;
      }
    }

    for (int i = 0; i < MAX_PARTICLES; i++)
    {
      if (mouseTail[i].active)
      {
        mouseTail[i].position.y += gravity/2;
        mouseTail[i].alpha -= 0.005;

        if (mouseTail[i].alpha <= 0.0) mouseTail[i].active = false;

        mouseTail[i].rotation += 2.0;
      }
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value))
    {
      if (blending == BlendMode.BLEND_ALPHA.value)
        blending = BlendMode.BLEND_ADDITIVE.value;
      else blending = BlendMode.BLEND_ALPHA.value;
    }
    
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.DARKGRAY);

      rl.Core.BeginBlendMode(blending);

        for (int i = 0; i < MAX_PARTICLES; i++)
        {
          if (!mouseTail[i].active) continue;
          
          rl.Core.DrawTexturePro(
            smoke,
            rl.Temp.rect1(
              0.0, 0.0,
              smoke.width, smoke.height
            ),
            rl.Temp.rect2(
              mouseTail[i].position.x, mouseTail[i].position.y,
              smoke.width*mouseTail[i].size, smoke.height*mouseTail[i].size
            ),
            rl.Temp.vec21(
              smoke.width*mouseTail[i].size/2.0,
              smoke.height*mouseTail[i].size/2.0
            ),
            mouseTail[i].rotation,
            rl.Core.Fade(mouseTail[i].color, mouseTail[i].alpha)
          );
        }

      rl.Core.EndBlendMode();

      rl.Core.DrawText(
        "PRESS SPACE to CHANGE BLENDING MODE".toC,
        180, 20, 20, rl.Color.BLACK
      );

      if (blending == BlendMode.BLEND_ALPHA.value) {
        rl.Core.DrawText(
          "ALPHA BLENDING".toC,
          290, screenHeight - 40, 20, rl.Color.BLACK
        );
      }
      else
      {
        rl.Core.DrawText(
          "ADDITIVE BLENDING".toC,
          280, screenHeight - 40, 20, rl.Color.RAYWHITE
        );
      }

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(smoke);

  rl.CloseWindowAndDispose();
}