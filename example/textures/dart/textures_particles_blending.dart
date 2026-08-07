// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_particles_blending.c
// Run it: dart run textures_particles_blending.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_PARTICLES = 200;

class Particle {
  Vector2D position;
  ColorD color;
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
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_particles_blending");
  SetTargetFPS(60);

  final mouseTail = <Particle>[];

  for (int i = 0; i < MAX_PARTICLES; i++)
  {
    mouseTail.add(Particle(
      position: .zero(),
      color: .color(
        GetRandomValue(0, 255),
        GetRandomValue(0, 255),
        GetRandomValue(0, 255),
        255,
      ),
      alpha: 1.0,
      size: GetRandomValue(1, 30)/20.0,
      rotation: GetRandomValue(0, 360).toDouble(),
      active: false,
    ));
  }

  final smoke = LoadTexture("../resources/spark_flame.png");

  double gravity = 3.0;
  BlendMode blending = .BLEND_ALPHA;

  while (!WindowShouldClose())
  {
    for (int i = 0; i < MAX_PARTICLES; i++)
    {
      if (!mouseTail[i].active)
      {
        mouseTail[i].active = true;
        mouseTail[i].alpha = 1.0;
        mouseTail[i].position = GetMousePosition();
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

    if (IsKeyPressed(.KEY_SPACE))
    {
      if (blending == .BLEND_ALPHA)
        blending = .BLEND_ADDITIVE;
      else blending = .BLEND_ALPHA;
    }
    
    BeginDrawing();

      ClearBackground(.DARKGRAY);

      BeginBlendMode(blending);

        for (int i = 0; i < MAX_PARTICLES; i++)
        {
          if (!mouseTail[i].active) continue;
          
          DrawTexturePro(
            smoke,
            .rect(
              0.0, 0.0,
              smoke.width, smoke.height
            ),
            .rect(
              mouseTail[i].position.x, mouseTail[i].position.y,
              smoke.width*mouseTail[i].size, smoke.height*mouseTail[i].size
            ),
            .vec2(
              smoke.width*mouseTail[i].size/2.0,
              smoke.height*mouseTail[i].size/2.0
            ),
            mouseTail[i].rotation,
            Fade(mouseTail[i].color, mouseTail[i].alpha)
          );
        }

      EndBlendMode();

      DrawText(
        "PRESS SPACE to CHANGE BLENDING MODE",
        180, 20, 20, .BLACK
      );

      if (blending == .BLEND_ALPHA) {
        DrawText(
          "ALPHA BLENDING",
          290, screenHeight - 40, 20, .BLACK
        );
      }
      else
      {
        DrawText(
          "ADDITIVE BLENDING",
          280, screenHeight - 40, 20, .RAYWHITE
        );
      }

    EndDrawing();
  }

  UnloadTexture(smoke);

  CloseWindowAndDispose();
}