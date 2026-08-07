// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_bullet_hell.c
// Run it: dart run shapes_bullet_hell.dart
import '../../base_dart.dart';
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
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_bullet_hell");
  SetTargetFPS(60);

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

  final bulletTexture = LoadRenderTexture(24, 24);

  BeginTextureMode(bulletTexture);
    DrawCircle(12, 12, bulletRadius, .WHITE);
    DrawCircleLines(12, 12, bulletRadius, .BLACK);
  EndTextureMode();

  bool drawInPerformanceMode = true;

  final ColorD color = .color(0, 0, 0, 200);

  while (!WindowShouldClose())
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

    if ((IsKeyPressed(.KEY_RIGHT) || IsKeyPressed(.KEY_D)) && (bulletRows < 359)) bulletRows++;
    if ((IsKeyPressed(.KEY_LEFT) || IsKeyPressed(.KEY_A)) && (bulletRows > 1)) bulletRows--;
    if (IsKeyPressed(.KEY_UP) || IsKeyPressed(.KEY_W)) bulletSpeed += 0.25;
    if ((IsKeyPressed(.KEY_DOWN) || IsKeyPressed(.KEY_S)) && (bulletSpeed > 0.50)) bulletSpeed -= 0.25;
    if (IsKeyPressed(.KEY_Z) && (spawnCooldown > 1)) spawnCooldown--;
    if (IsKeyPressed(.KEY_X)) spawnCooldown++;
    if (IsKeyPressed(.KEY_ENTER)) drawInPerformanceMode = !drawInPerformanceMode;

    if (IsKeyDown(.KEY_SPACE))
    {
      angleIncrement += 1;
      angleIncrement %= 360;
    }

    if (IsKeyPressed(.KEY_C))
    {
      bullets.clear();
      bulletDisabledCount = 0;
    }

    BeginDrawing();
      ClearBackground(.RAYWHITE);

      magicCircleRotation++;
      DrawRectanglePro(
        .rect(screenWidth/2, screenHeight/2, 120, 120),
        .vec2(60.0, 60.0),
        magicCircleRotation,
        .PURPLE
      );  

      DrawRectanglePro(
        .rect(screenWidth/2, screenHeight/2, 120, 120),
        .vec2(60.0, 60.0),
        magicCircleRotation + 45,
        .PURPLE
      );

      DrawCircleLines(screenWidth~/2, screenHeight~/2, 70, .BLACK);
      DrawCircleLines(screenWidth~/2, screenHeight~/2, 50, .BLACK);
      DrawCircleLines(screenWidth~/2, screenHeight~/2, 30, .BLACK);

      if (drawInPerformanceMode)
      {
        for (int i = 0; i < bullets.length; i++)
        {
          if (!bullets[i].disabled)
          {
            DrawTexture(
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
            DrawCircleV(
              bullets[i].position,
              bulletRadius,
              bullets[i].color
            );
            DrawCircleLinesV(
              bullets[i].position,
              bulletRadius,
              .BLACK
            );
          }
        }
      }

      DrawRectangle(10, 10, 280, 150, color);
      
      DrawText(
        "Controls:",
        20, 20, 10, .LIGHTGRAY
      );
      DrawText(
        "- Right/Left or A/D: Change rows number",
        40, 40, 10, .LIGHTGRAY
      );
      DrawText(
        "- Up/Down or W/S: Change bullet speed",
        40, 60, 10, .LIGHTGRAY
      );
      DrawText(
        "- Z or X: Change spawn cooldown",
        40, 80, 10, .LIGHTGRAY
      );
      DrawText(
        "- Space (Hold): Change the angle increment",
        40, 100, 10, .LIGHTGRAY
      );
      DrawText(
        "- Enter: Switch draw method (Performance)",
        40, 120, 10, .LIGHTGRAY
      );
      DrawText(
        "- C: Clear bullets",
        40, 140, 10, .LIGHTGRAY
      );

      DrawRectangle(610, 10, 170, 30, color);

      if (drawInPerformanceMode) {
        DrawText(
          "Draw method: DrawTexture(*)",
          620, 20, 10, .GREEN
        );
      } else {
        DrawText(
          "Draw method: DrawCircle(*)",
          620, 20, 10, .RED
        );
      }

      DrawRectangle(135, 410, 530, 30, color);
      DrawText(
        "[ FPS: ${GetFPS()}, Bullets: ${bullets.length - bulletDisabledCount}, Rows: $bulletRows, Bullet speed: ${bulletSpeed.f2}, Angle increment per frame: $angleIncrement, Cooldown: ${spawnCooldown.f0} ]",
        155, 420, 10, .GREEN
      );

    EndDrawing();
  }

  UnloadRenderTexture(bulletTexture);

  CloseWindowAndDispose();
}