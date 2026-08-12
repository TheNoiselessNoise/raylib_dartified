// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_ball_physics.c
// Run it: dart run shapes_ball_physics.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

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

  InitWindow(screenWidth, screenHeight, "shapes_ball_physics".toC);
  SetTargetFPS(60);

  List<Ball> balls = [
    Ball(
      pos: .vec2(screenWidth/2, screenHeight/2),
      vel: .vec2(200, 200),
      ppos: .zero(),
      radius: 40,
      friction: 0.99,
      elasticity: 0.9,
      color: BLUE.toD(),
      grabbed: false,
    )
  ];

  Ball? grabbedBall;
  final pressOffset = Vector2$.val.At('pressOffset');
  double gravity = 100;

  final ballColor = Color$.val.At('ballColor');
  final ballPosition = Vector2$.val.At('ballPosition');

  while (!WindowShouldClose())
  {
    double delta = GetFrameTime();
    final mousePos = GetMousePosition();

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      for (final ball in balls) {
        pressOffset.ref.x = mousePos.x - ball.pos.x;
        pressOffset.ref.y = mousePos.y - ball.pos.y;

        if (hypot(pressOffset.ref.x, pressOffset.ref.y) <= ball.radius) {
          ball.grabbed = true;
          grabbedBall = ball;
          break;
        }
      }
    }

    if (IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      if (grabbedBall != null) {
        grabbedBall.grabbed = false;
        grabbedBall = null;
      }
    }

    if (
      IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_RIGHT.value) ||
      (
        IsKeyDown(KeyboardKey.KEY_LEFT_CONTROL.value) &&
        IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value)
      )
    ) {
      if (balls.length < MAX_BALLS) {
        balls.add(Ball(
          pos: mousePos.toD(),
          vel: .vec2(
            GetRandomValue(-300, 300).toDouble(),
            GetRandomValue(-300, 300).toDouble(),
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

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_MIDDLE.value)) {
      for (final ball in balls) {
        if (!ball.grabbed) {
          ball.vel = .vec2(
            GetRandomValue(-2000, 2000).toDouble(),
            GetRandomValue(-2000, 2000).toDouble(),
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
        ball.pos.x = mousePos.x - pressOffset.ref.x;
        ball.pos.y = mousePos.y - pressOffset.ref.y;

        ball.vel.x = (ball.pos.x - ball.ppos.x)/delta;
        ball.vel.y = (ball.pos.y - ball.ppos.y)/delta;
        ball.ppos = ball.pos;
      }
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      for (final ball in balls) {
        ballPosition.setD(ball.pos);
        ballColor.setD(ball.color);
        DrawCircleV(ballPosition.ref, ball.radius, ballColor.ref);
        DrawCircleLinesV(ballPosition.ref, ball.radius, BLACK);
      }

      DrawText(
        "grab a ball by pressing with the mouse and throw it by releasing".toC,
        10, 10, 10, DARKGRAY
      );
      DrawText(
        "right click to create new balls (keep left control pressed to create a lot)".toC,
        10, 30, 10, DARKGRAY
      );
      DrawText(
        "use mouse wheel to change gravity".toC,
        10, 50, 10, DARKGRAY
      );
      DrawText(
        "middle click to shake".toC,
        10, 70, 10, DARKGRAY
      );
      DrawText(
        "BALL COUNT: ${balls.length}".toC,
        10, GetScreenHeight() - 70, 20, BLACK
      );
      DrawText(
        "GRAVITY: ${gravity.f2}".toC,
        10, GetScreenHeight() - 40, 20, BLACK
      );

    EndDrawing();
  }

  CloseWindowAndDispose();
}