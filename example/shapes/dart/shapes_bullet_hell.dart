// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_bullet_hell.c
// Run it: dart run shapes_bullet_hell.dart
import '../../base.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_BULLETS = 500000;

class Bullet {
  Vector2D position;
  Vector2D acceleration;
  bool disabled;
  ColorD color;

  Bullet({
    required this.position,
    required this.acceleration,
    required this.disabled,
    required this.color,
  });
}

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_bullet_hell");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  List<Bullet> bullets = [];
  int bulletDisabledCount = 0;
  int bulletRadius = 10;
  double bulletSpeed = 3.0;
  int bulletRows = 6;
  List<ColorD> bulletColor = [ .RED, .BLUE ];

  double baseDirection = 0;
  int angleIncrement = 5;
  double spawnCooldown = 2;
  double spawnCooldownTimer = spawnCooldown;

  double magicCircleRotation = 0;

  final bulletTexture = rl.CoreD.LoadRenderTexture(24, 24);

  rl.CoreD.BeginTextureMode(bulletTexture);
    rl.CoreD.DrawCircle(12, 12, bulletRadius, .WHITE);
    rl.CoreD.DrawCircleLines(12, 12, bulletRadius, .BLACK);
  rl.CoreD.EndTextureMode();

  bool drawInPerformanceMode = true;

  final ColorD color = .color(0, 0, 0, 200);

  while (!rl.CoreD.WindowShouldClose())
  {
    if (bullets.length >= MAX_BULLETS) {
      bullets.clear();
      bulletDisabledCount = 0;
    }

    spawnCooldownTimer--;
    if (spawnCooldownTimer < 0) {
      spawnCooldownTimer = spawnCooldown;

      double degreesPerRow = 360.0/bulletRows;
      for (int row = 0; row < bulletRows; row++) {
        if (bullets.length < MAX_BULLETS) {
          double bulletDirection = baseDirection + (degreesPerRow*row);

          bullets.add(Bullet(
            position: .vec2(screenWidth / 2, screenHeight / 2),
            acceleration: .vec2(
              bulletSpeed*math.cos(bulletDirection*rl.DEG2RAD),
              bulletSpeed*math.sin(bulletDirection*rl.DEG2RAD)
            ),
            disabled: false,
            color: bulletColor[row%2],
          ));
        }
      }

      baseDirection += angleIncrement;
    }

    for (int i = 0; i < bullets.length; i++)
    {
      if (!bullets[i].disabled)
      {
        bullets[i].position.x += bullets[i].acceleration.x;
        bullets[i].position.y += bullets[i].acceleration.y;

        if (
          (bullets[i].position.x < -bulletRadius*2) ||
          (bullets[i].position.x > screenWidth + bulletRadius*2) ||
          (bullets[i].position.y < -bulletRadius*2) ||
          (bullets[i].position.y > screenHeight + bulletRadius*2)
        ) {
          bullets[i].disabled = true;
          bulletDisabledCount++;
        }
      }
    }

    if ((rl.CoreD.IsKeyPressed(.KEY_RIGHT) || rl.CoreD.IsKeyPressed(.KEY_D)) && (bulletRows < 359)) bulletRows++;
    if ((rl.CoreD.IsKeyPressed(.KEY_LEFT) || rl.CoreD.IsKeyPressed(.KEY_A)) && (bulletRows > 1)) bulletRows--;
    if (rl.CoreD.IsKeyPressed(.KEY_UP) || rl.CoreD.IsKeyPressed(.KEY_W)) bulletSpeed += 0.25;
    if ((rl.CoreD.IsKeyPressed(.KEY_DOWN) || rl.CoreD.IsKeyPressed(.KEY_S)) && (bulletSpeed > 0.50)) bulletSpeed -= 0.25;
    if (rl.CoreD.IsKeyPressed(.KEY_Z) && (spawnCooldown > 1)) spawnCooldown--;
    if (rl.CoreD.IsKeyPressed(.KEY_X)) spawnCooldown++;
    if (rl.CoreD.IsKeyPressed(.KEY_ENTER)) drawInPerformanceMode = !drawInPerformanceMode;

    if (rl.CoreD.IsKeyDown(.KEY_SPACE))
    {
      angleIncrement += 1;
      angleIncrement %= 360;
    }

    if (rl.CoreD.IsKeyPressed(.KEY_C))
    {
      bullets.clear();
      bulletDisabledCount = 0;
    }

    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.RAYWHITE);

      magicCircleRotation++;
      rl.CoreD.DrawRectanglePro(
        .rect(screenWidth/2, screenHeight/2, 120, 120),
        .vec2(60.0, 60.0),
        magicCircleRotation,
        .PURPLE
      );  

      rl.CoreD.DrawRectanglePro(
        .rect(screenWidth/2, screenHeight/2, 120, 120),
        .vec2(60.0, 60.0),
        magicCircleRotation + 45,
        .PURPLE
      );

      rl.CoreD.DrawCircleLines(screenWidth~/2, screenHeight~/2, 70, .BLACK);
      rl.CoreD.DrawCircleLines(screenWidth~/2, screenHeight~/2, 50, .BLACK);
      rl.CoreD.DrawCircleLines(screenWidth~/2, screenHeight~/2, 30, .BLACK);

      if (drawInPerformanceMode)
      {
        for (int i = 0; i < bullets.length; i++)
        {
          if (!bullets[i].disabled)
          {
            rl.CoreD.DrawTexture(
              bulletTexture.texture,
              bullets[i].position.x - bulletTexture.texture.width*0.5,
              bullets[i].position.y - bulletTexture.texture.height*0.5,
              bullets[i].color
            );
          }
        }
      }
      else
      {
        for (int i = 0; i < bullets.length; i++)
        {
          if (!bullets[i].disabled)
          {
            rl.CoreD.DrawCircleV(
              bullets[i].position,
              bulletRadius,
              bullets[i].color
            );
            rl.CoreD.DrawCircleLinesV(
              bullets[i].position,
              bulletRadius,
              .BLACK
            );
          }
        }
      }

      rl.CoreD.DrawRectangle(10, 10, 280, 150, color);
      
      rl.CoreD.DrawText(
        "Controls:",
        20, 20, 10, .LIGHTGRAY
      );
      rl.CoreD.DrawText(
        "- Right/Left or A/D: Change rows number",
        40, 40, 10, .LIGHTGRAY
      );
      rl.CoreD.DrawText(
        "- Up/Down or W/S: Change bullet speed",
        40, 60, 10, .LIGHTGRAY
      );
      rl.CoreD.DrawText(
        "- Z or X: Change spawn cooldown",
        40, 80, 10, .LIGHTGRAY
      );
      rl.CoreD.DrawText(
        "- Space (Hold): Change the angle increment",
        40, 100, 10, .LIGHTGRAY
      );
      rl.CoreD.DrawText(
        "- Enter: Switch draw method (Performance)",
        40, 120, 10, .LIGHTGRAY
      );
      rl.CoreD.DrawText(
        "- C: Clear bullets",
        40, 140, 10, .LIGHTGRAY
      );

      rl.CoreD.DrawRectangle(610, 10, 170, 30, color);

      if (drawInPerformanceMode) {
        rl.CoreD.DrawText(
          "Draw method: DrawTexture(*)",
          620, 20, 10, .GREEN
        );
      } else {
        rl.CoreD.DrawText(
          "Draw method: DrawCircle(*)",
          620, 20, 10, .RED
        );
      }

      rl.CoreD.DrawRectangle(135, 410, 530, 30, color);
      rl.CoreD.DrawText(
        "[ FPS: ${rl.CoreD.GetFPS()}, Bullets: ${bullets.length - bulletDisabledCount}, Rows: $bulletRows, Bullet speed: ${bulletSpeed.f2}, Angle increment per frame: $angleIncrement, Cooldown: ${spawnCooldown.f0} ]",
        155, 420, 10, .GREEN
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadRenderTexture(bulletTexture);

  rl.CloseWindowAndDispose();
}