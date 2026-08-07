// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_ball_physics.c
// Run it: dart run shapes_ball_physics.dart
import 'dart:math' as math;
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_BALLS = 5000;

class Ball {
  Vector2D pos;
  Vector2D vel;
  Vector2D ppos;
  double radius;
  double friction;
  double elasticity;
  ColorD color;
  bool grabbed;

  Ball({
    required this.pos,
    required this.vel,
    required this.ppos,
    required this.radius,
    required this.friction,
    required this.elasticity,
    required this.color,
    required this.grabbed,
  });
}

double hypot(double x, double y) {
  x = x.abs();
  y = y.abs();
  if (x == 0) return y;
  if (y == 0) return x;
  final min = math.min(x, y);
  final max = math.max(x, y);
  final r = min / max;
  return max * math.sqrt(1 + r * r);
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_ball_physics");
  SetTargetFPS(60);

  List<Ball> balls = [
    .new(
      pos: .vec2(screenWidth/2, screenHeight/2),
      vel: .vec2(200, 200),
      ppos: .zero(),
      radius: 40,
      friction: 0.99,
      elasticity: 0.9,
      color: .BLUE,
      grabbed: false,
    )
  ];

  Ball? grabbedBall;
  Vector2D pressOffset = .zero();
  double gravity = 100;

  while (!WindowShouldClose())
  {
    double delta = GetFrameTime();
    final mousePos = GetMousePosition();

    if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) {
      for (final ball in balls) {
        pressOffset.x = mousePos.x - ball.pos.x;
        pressOffset.y = mousePos.y - ball.pos.y;

        if (hypot(pressOffset.x, pressOffset.y) <= ball.radius) {
          ball.grabbed = true;
          grabbedBall = ball;
          break;
        }
      }
    }

    if (IsMouseButtonReleased(.MOUSE_BUTTON_LEFT)) {
      if (grabbedBall != null) {
        grabbedBall.grabbed = false;
        grabbedBall = null;
      }
    }

    if (
      IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT) ||
      (
        IsKeyDown(.KEY_LEFT_CONTROL) &&
        IsMouseButtonDown(.MOUSE_BUTTON_RIGHT)
      )
    ) {
      if (balls.length < MAX_BALLS) {
        balls.add(.new(
          pos: mousePos,
          vel: .vec2(
            GetRandomValue(-300, 300),
            GetRandomValue(-300, 300),
          ),
          ppos: .zero(),
          radius: 20 + GetRandomValue(0, 30).toDouble(),
          friction: 0.99,
          elasticity: 0.9,
          color: .color(
            GetRandomValue(0, 255),
            GetRandomValue(0, 255),
            GetRandomValue(0, 255),
            255,
          ),
          grabbed: false
        ));
      }
    }

    if (IsMouseButtonPressed(.MOUSE_BUTTON_MIDDLE)) {
      for (final ball in balls) {
        if (!ball.grabbed) {
          ball.vel = .vec2(
            GetRandomValue(-2000, 2000),
            GetRandomValue(-2000, 2000),
          );
        }
      }
    }

    gravity += GetMouseWheelMove()*5;

    for (final ball in balls) {
      if (!ball.grabbed) {
        ball.pos.x += ball.vel.x * delta;
        ball.pos.y += ball.vel.y * delta;

        if ((ball.pos.x + ball.radius) >= screenWidth) {
          ball.pos.x = screenWidth - ball.radius;
          ball.vel.x = -ball.vel.x*ball.elasticity;
        } 
        else if ((ball.pos.x - ball.radius) <= 0) {
          ball.pos.x = ball.radius;
          ball.vel.x = -ball.vel.x*ball.elasticity;
        }

        if ((ball.pos.y + ball.radius) >= screenHeight) {
          ball.pos.y = screenHeight - ball.radius;
          ball.vel.y = -ball.vel.y*ball.elasticity;
        } 
        else if ((ball.pos.y - ball.radius) <= 0) {
          ball.pos.y = ball.radius;
          ball.vel.y = -ball.vel.y*ball.elasticity;
        }

        ball.vel.x = ball.vel.x*ball.friction;
        ball.vel.y = ball.vel.y*ball.friction + gravity;
      } else {
        ball.pos.x = mousePos.x - pressOffset.x;
        ball.pos.y = mousePos.y - pressOffset.y;

        ball.vel.x = (ball.pos.x - ball.ppos.x)/delta;
        ball.vel.y = (ball.pos.y - ball.ppos.y)/delta;
        ball.ppos = ball.pos;
      }
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      for (final ball in balls) {
        DrawCircleV(ball.pos, ball.radius, ball.color);
        DrawCircleLinesV(ball.pos, ball.radius, .BLACK);
      }

      DrawText(
        "grab a ball by pressing with the mouse and throw it by releasing",
        10, 10, 10, .DARKGRAY
      );
      DrawText(
        "right click to create new balls (keep left control pressed to create a lot)",
        10, 30, 10, .DARKGRAY
      );
      DrawText(
        "use mouse wheel to change gravity",
        10, 50, 10, .DARKGRAY
      );
      DrawText(
        "middle click to shake",
        10, 70, 10, .DARKGRAY
      );
      DrawText(
        "BALL COUNT: ${balls.length}",
        10, GetScreenHeight() - 70, 20, .BLACK
      );
      DrawText(
        "GRAVITY: ${gravity.f2}",
        10, GetScreenHeight() - 40, 20, .BLACK
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}