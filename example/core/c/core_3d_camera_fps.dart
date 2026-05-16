// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_3d_camera_fps.c
// Run it: dart run core_3d_camera_fps.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base.dart';

class Body {
  Vector3D position;
  Vector3D velocity;
  Vector3D dir;
  bool isGrounded;

  Body({
    required this.position,
    required this.velocity,
    required this.dir,
    required this.isGrounded,
  });
}

const double GRAVITY = 32.0;
const double MAX_SPEED = 20.0;
const double CROUCH_SPEED = 5.0;
const double JUMP_FORCE = 12.0;
const double MAX_ACCEL = 150.0;
const double FRICTION = 0.86;
const double AIR_DRAG = 0.98;
const double CONTROL = 15.0;
const double CROUCH_HEIGHT = 0.0;
const double STAND_HEIGHT = 1.0;
const double BOTTOM_HEIGHT = 0.5;
const bool NORMALIZE_INPUT = false;

final Vector2D sensitivity = .vec2(0.001, 0.001);
Body player = Body(
  position: .zero(),
  velocity: .zero(),
  dir: .zero(),
  isGrounded: false,
);
final Vector2D lookRotation = .zero();
double headTimer = 0.0;
double walkLerp = 0.0;
double headLerp = STAND_HEIGHT;
final Vector2D lean = .zero();

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_3d_camera_fps'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(
    player.position.x,
    player.position.y + (BOTTOM_HEIGHT + headLerp),
    player.position.z,
  );
  camera.ref.fovy = 60;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  UpdateCameraFPS(rl, camera);

  while (!rl.Core.WindowShouldClose()) {
    final mouseDelta = rl.Core.GetMouseDelta();
    lookRotation.x -= mouseDelta.x*sensitivity.x;
    lookRotation.y += mouseDelta.y*sensitivity.y;

    int sideway = (
      rl.Core.IsKeyDown(KeyboardKey.KEY_D.value).toInt() -
      rl.Core.IsKeyDown(KeyboardKey.KEY_A.value).toInt()
    );
    int forward = (
      rl.Core.IsKeyDown(KeyboardKey.KEY_W.value).toInt() -
      rl.Core.IsKeyDown(KeyboardKey.KEY_S.value).toInt()
    );
    bool crouching = rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT_CONTROL.value);
    bool jumping = rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value);
    UpdateBody(rl, player, lookRotation.x, sideway, forward, jumping, crouching);

    double delta = rl.Core.GetFrameTime();
    headLerp = rl.Lerp(headLerp, (crouching ? CROUCH_HEIGHT : STAND_HEIGHT), 20*delta);
    camera.ref.position.set(
      player.position.x,
      player.position.y + (BOTTOM_HEIGHT + headLerp),
      player.position.z,
    );

    if (player.isGrounded && ((forward != 0) || (sideway != 0))) {
      headTimer += delta*3;
      walkLerp = rl.Lerp(walkLerp, 1, 10*delta);
      camera.ref.fovy = rl.Lerp(camera.ref.fovy, 55, 5*delta);
    } else {
      walkLerp = rl.Lerp(walkLerp, 0, 10*delta);
      camera.ref.fovy = rl.Lerp(camera.ref.fovy, 60, 5*delta);
    }

    lean.x = rl.Lerp(lean.x, sideway*0.02, 10*delta);
    lean.y = rl.Lerp(lean.y, forward*0.015, 10*delta);

    UpdateCameraFPS(rl, camera);

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);
        DrawLevel(rl);
      rl.Core.EndMode3D();

      rl.Core.DrawRectangle(5, 5, 330, 75, rl.Core.Fade(rl.Color.SKYBLUE, 0.5));
      rl.Core.DrawRectangleLines(5, 5, 330, 75, rl.Color.BLUE);

      rl.Core.DrawText("Camera controls:".toC, 15, 15, 10, rl.Color.BLACK);
      rl.Core.DrawText("- Move keys: W, A, S, D, Space, Left-Ctrl".toC, 15, 30, 10, rl.Color.BLACK);
      rl.Core.DrawText("- Look around: arrow keys or mouse".toC, 15, 45, 10, rl.Color.BLACK);

      double velLen = Vector2D.vec2(player.velocity.x, player.velocity.z).length;
      rl.Core.DrawText("- Velocity Len: (${velLen.f3})".toC, 15, 60, 10, rl.Color.BLACK);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}

void UpdateCameraFPS(Raylib rl, Pointer<Camera3DC> camera)
{
  final Vector3D up = .vec3(0.0, 1.0, 0.0);
  final Vector3D targetOffset = .vec3(0.0, 0.0, -1.0);

  Vector3D yaw = targetOffset.rotateByAxisAngle(up, lookRotation.x);

  double maxAngleUp = up.angle(yaw);
  maxAngleUp -= 0.001;
  if (-(lookRotation.y) > maxAngleUp) { lookRotation.y = -maxAngleUp; }

  double maxAngleDown = up.negate().angle(yaw);
  maxAngleDown *= -1.0;
  maxAngleDown += 0.001;
  if (-(lookRotation.y) < maxAngleDown) { lookRotation.y = -maxAngleDown; }

  Vector3D right = yaw.crossProduct(up).normalize();

  double pitchAngle = -lookRotation.y - lean.y;
  pitchAngle = rl.Clamp(pitchAngle, -rl.PI/2 + 0.0001, rl.PI/2 - 0.0001);
  Vector3D pitch = yaw.rotateByAxisAngle(right, pitchAngle);

  double headSin = math.sin(headTimer*rl.PI);
  double headCos = math.cos(headTimer*rl.PI);
  final double stepRotation = 0.01;
  camera.ref.up.setD(up.rotateByAxisAngle(pitch, headSin*stepRotation + lean.x));

  final double bobSide = 0.1;
  final double bobUp = 0.15;
  Vector3D bobbing = right.scale(headSin*bobSide);
  bobbing.y = (headCos*bobUp).abs();

  camera.ref.position.setD(
    camera.ref.position.toD().add(
      bobbing.scale(walkLerp),
    ),
  );

  camera.ref.target.setD(
    camera.ref.position.toD().add(pitch)
  );
}

void UpdateBody(Raylib rl, Body body, double rot, int side, int forward, bool jumpPressed, bool crouchHold)
{
  Vector2D input = .vec2(side, -forward);

  if (NORMALIZE_INPUT) {
    if ((side != 0) && (forward != 0)) input = input.normalize();
  }

  double delta = rl.Core.GetFrameTime();

  if (!body.isGrounded) body.velocity.y -= GRAVITY*delta;

  if (body.isGrounded && jumpPressed)
  {
    body.velocity.y = JUMP_FORCE;
    body.isGrounded = false;

    //rl.Audio.SetSoundPitch(fxJump, 1.0 + (rl.Core.GetRandomValue(-100, 100)*0.001));
    //rl.Audio.PlaySound(fxJump);
  }

  final Vector3D front = .vec3(math.sin(rot), 0, math.cos(rot));
  final Vector3D right = .vec3(math.cos(-rot), 0, math.sin(-rot));

  final Vector3D desiredDir = .vec3(
    input.x*right.x + input.y*front.x,
    0.0,
    input.x*right.z + input.y*front.z
  );
  body.dir = body.dir.lerp(desiredDir, CONTROL*delta);

  double decel = (body.isGrounded ? FRICTION : AIR_DRAG);
  Vector3D hvel = .vec3(body.velocity.x*decel, 0.0, body.velocity.z*decel);

  double hvelLength = hvel.length;
  if (hvelLength < (MAX_SPEED*0.01)) hvel = .zero();

  double speed = hvel.dotProduct(body.dir);

  double maxSpeed = (crouchHold? CROUCH_SPEED : MAX_SPEED);
  double accel = rl.Clamp(maxSpeed - speed, 0, MAX_ACCEL*delta);
  hvel.x += body.dir.x*accel;
  hvel.z += body.dir.z*accel;

  body.velocity.x = hvel.x;
  body.velocity.z = hvel.z;

  body.position.x += body.velocity.x*delta;
  body.position.y += body.velocity.y*delta;
  body.position.z += body.velocity.z*delta;

  if (body.position.y <= 0.0)
  {
    body.position.y = 0.0;
    body.velocity.y = 0.0;
    body.isGrounded = true;
  }
}

void DrawLevel(Raylib rl)
{
  final int floorExtent = 25;
  final double tileSize = 5.0;

  final towerColor = rl.Temp.color1(150, 200, 200, 255);

  for (int y = -floorExtent; y < floorExtent; y++)
  {
    for (int x = -floorExtent; x < floorExtent; x++)
    {
      if ((y & 1) != 0 && (x & 1) != 0)
      {
        rl.Core.DrawPlane(
          rl.Temp.vec31(x*tileSize, 0.0, y*tileSize),
          rl.Temp.vec21(tileSize, tileSize),
          towerColor
        );
      }
      else if ((y & 1) == 0 && (x & 1) == 0)
      {
        rl.Core.DrawPlane(
          rl.Temp.vec31(x*tileSize, 0.0, y*tileSize),
          rl.Temp.vec21(tileSize, tileSize),
          rl.Color.LIGHTGRAY
        );
      }
    }
  }

  final towerSize = rl.Temp.vec31(16.0, 32.0, 16.0);
  final towerPos = rl.Temp.vec32(16.0, 16.0, 16.0);

  rl.Core.DrawCubeV(towerPos, towerSize, towerColor);
  rl.Core.DrawCubeWiresV(towerPos, towerSize, rl.Color.DARKBLUE);

  towerPos.x *= -1;
  rl.Core.DrawCubeV(towerPos, towerSize, towerColor);
  rl.Core.DrawCubeWiresV(towerPos, towerSize, rl.Color.DARKBLUE);

  towerPos.z *= -1;
  rl.Core.DrawCubeV(towerPos, towerSize, towerColor);
  rl.Core.DrawCubeWiresV(towerPos, towerSize, rl.Color.DARKBLUE);

  towerPos.x *= -1;
  rl.Core.DrawCubeV(towerPos, towerSize, towerColor);
  rl.Core.DrawCubeWiresV(towerPos, towerSize, rl.Color.DARKBLUE);

  towerPos.set(300.0, 300.0, 0.0);
  towerColor.set(255, 0, 0, 255);
  rl.Core.DrawSphere(towerPos, 100.0, towerColor);
}