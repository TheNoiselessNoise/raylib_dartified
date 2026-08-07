// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_bullet_hell.c
// Run it: dart run shapes_bullet_hell.dart
import '../../base_c.dart';
import 'dart:math' as math;

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_BULLETS = 500000;

class Bullet {
  Vector2D position;
  Vector2D acceleration;
  bool disabled;
  ColorC color;

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

  InitWindow(screenWidth, screenHeight, "shapes_bullet_hell".toC);
  SetTargetFPS(60);

  List<Bullet> bullets = [];
  int bulletDisabledCount = 0;
  int bulletRadius = 10;
  double bulletSpeed = 3.0;
  int bulletRows = 6;
  List<ColorC> bulletColor = [ RED, BLUE ];

  double baseDirection = 0;
  int angleIncrement = 5;
  double spawnCooldown = 2;
  double spawnCooldownTimer = spawnCooldown;

  double magicCircleRotation = 0;

  RenderTextureC bulletTexture = LoadRenderTexture(24, 24);

  BeginTextureMode(bulletTexture);
    DrawCircle(12, 12, bulletRadius.toDouble(), WHITE);
    DrawCircleLines(12, 12, bulletRadius.toDouble(), BLACK);
  EndTextureMode();

  bool drawInPerformanceMode = true;

  final color = Color$.$1.set(0, 0, 0, 200);

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

    if ((IsKeyPressed(KeyboardKey.KEY_RIGHT.value) || IsKeyPressed(KeyboardKey.KEY_D.value)) && (bulletRows < 359)) bulletRows++;
    if ((IsKeyPressed(KeyboardKey.KEY_LEFT.value) || IsKeyPressed(KeyboardKey.KEY_A.value)) && (bulletRows > 1)) bulletRows--;
    if (IsKeyPressed(KeyboardKey.KEY_UP.value) || IsKeyPressed(KeyboardKey.KEY_W.value)) bulletSpeed += 0.25;
    if ((IsKeyPressed(KeyboardKey.KEY_DOWN.value) || IsKeyPressed(KeyboardKey.KEY_S.value)) && (bulletSpeed > 0.50)) bulletSpeed -= 0.25;
    if (IsKeyPressed(KeyboardKey.KEY_Z.value) && (spawnCooldown > 1)) spawnCooldown--;
    if (IsKeyPressed(KeyboardKey.KEY_X.value)) spawnCooldown++;
    if (IsKeyPressed(KeyboardKey.KEY_ENTER.value)) drawInPerformanceMode = !drawInPerformanceMode;

    if (IsKeyDown(KeyboardKey.KEY_SPACE.value))
    {
      angleIncrement += 1;
      angleIncrement %= 360;
    }

    if (IsKeyPressed(KeyboardKey.KEY_C.value))
    {
      bullets.clear();
      bulletDisabledCount = 0;
    }

    BeginDrawing();
      ClearBackground(RAYWHITE);

      magicCircleRotation++;
      DrawRectanglePro(
        Rectangle$.$1.set(screenWidth/2, screenHeight/2, 120, 120),
        Vector2$.$1.set(60.0, 60.0),
        magicCircleRotation,
        PURPLE
      );  

      DrawRectanglePro(
        Rectangle$.$1.set(screenWidth/2, screenHeight/2, 120, 120),
        Vector2$.$1.set(60.0, 60.0),
        magicCircleRotation + 45,
        PURPLE
      );

      DrawCircleLines(screenWidth~/2, screenHeight~/2, 70, BLACK);
      DrawCircleLines(screenWidth~/2, screenHeight~/2, 50, BLACK);
      DrawCircleLines(screenWidth~/2, screenHeight~/2, 30, BLACK);

      if (drawInPerformanceMode)
      {
        for (int i = 0; i < bullets.length; i++)
        {
          if (!bullets[i].disabled)
          {
            DrawTexture(
              bulletTexture.texture,
              (bullets[i].position.x - bulletTexture.texture.width*0.5).toInt(),
              (bullets[i].position.y - bulletTexture.texture.height*0.5).toInt(),
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
              Vector2$.$1.setD(bullets[i].position),
              bulletRadius.toDouble(),
              bullets[i].color
            );
            DrawCircleLinesV(
              Vector2$.$1.setD(bullets[i].position),
              bulletRadius.toDouble(),
              BLACK
            );
          }
        }
      }

      DrawRectangle(10, 10, 280, 150, color);
      
      DrawText(
        "Controls:".toC,
        20, 20, 10, LIGHTGRAY
      );
      DrawText(
        "- Right/Left or A/D: Change rows number".toC,
        40, 40, 10, LIGHTGRAY
      );
      DrawText(
        "- Up/Down or W/S: Change bullet speed".toC,
        40, 60, 10, LIGHTGRAY
      );
      DrawText(
        "- Z or X: Change spawn cooldown".toC,
        40, 80, 10, LIGHTGRAY
      );
      DrawText(
        "- Space (Hold): Change the angle increment".toC,
        40, 100, 10, LIGHTGRAY
      );
      DrawText(
        "- Enter: Switch draw method (Performance)".toC,
        40, 120, 10, LIGHTGRAY
      );
      DrawText(
        "- C: Clear bullets".toC,
        40, 140, 10, LIGHTGRAY
      );

      DrawRectangle(610, 10, 170, 30, color);

      if (drawInPerformanceMode) {
        DrawText(
          "Draw method: DrawTexture(*)".toC,
          620, 20, 10, GREEN
        );
      } else {
        DrawText(
          "Draw method: DrawCircle(*)".toC,
          620, 20, 10, RED
        );
      }

      DrawRectangle(135, 410, 530, 30, color);
      DrawText(
        "[ FPS: ${GetFPS()}, Bullets: ${bullets.length - bulletDisabledCount}, Rows: $bulletRows, Bullet speed: ${bulletSpeed.f2}, Angle increment per frame: $angleIncrement, Cooldown: ${spawnCooldown.f0} ]".toC,
        155, 420, 10, GREEN
      );

    EndDrawing();
  }

  UnloadRenderTexture(bulletTexture);

  CloseWindowAndDispose();
}