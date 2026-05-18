// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_2d_camera_platformer.c
// Run it: dart run core_2d_camera_platformer.dart
import 'dart:math' as math;
import '../../base.dart';

class Player {
  Vector2D position;
  double speed;
  bool canJump;

  Player({
    required this.position,
    required this.speed,
    required this.canJump,
  });
}

class EnvItem {
  RectangleD rect;
  bool blocking;
  ColorD color;

  EnvItem({
    required this.rect,
    required this.blocking,
    required this.color,
  });
}

const int screenWidth = 800;
const int screenHeight = 450;
const int G = 400;
const double PLAYER_JUMP_SPD = 350;
const double PLAYER_HOR_SPD = 200;

Vector2D minVec = .zero();
Vector2D maxVec = .zero();

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_2d_camera_platformer');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final player = Player(
    position: .vec2(400, 280),
    speed: 0,
    canJump: false,
  );

  final envItems = [
    EnvItem(rect: .rect(0, 0, 1000, 400), blocking: false, color: .LIGHTGRAY),
    EnvItem(rect: .rect(0, 400, 1000, 200), blocking: true, color: .GRAY),
    EnvItem(rect: .rect(300, 200, 400, 10), blocking: true, color: .GRAY),
    EnvItem(rect: .rect(250, 300, 100, 10), blocking: true, color: .GRAY),
    EnvItem(rect: .rect(650, 300, 100, 10), blocking: true, color: .GRAY)
  ];

  final cameraUpdaters = [
    UpdateCameraCenter,
    UpdateCameraCenterInsideMap,
    UpdateCameraCenterSmoothFollow,
    UpdateCameraEvenOutOnLanding,
    UpdateCameraPlayerBoundsPush
  ];

  final cameraDescriptions = [
    "Follow player center",
    "Follow player center, but clamp to map edges",
    "Follow player center; smoothed",
    "Follow player center horizontally; update player center vertically after landing",
    "Player push camera on getting too close to screen edge"
  ];

  assert(cameraDescriptions.length == cameraUpdaters.length);

  final camera = Camera2DD(
    target: player.position.copy(),
    offset: .vec2(screenWidth/2, screenHeight/2),
    rotation: 0,
    zoom: 1,
  );

  int cameraOption = 1;

  while (!rl.CoreD.WindowShouldClose()) {
    final deltaTime = rl.CoreD.GetFrameTime();

    UpdatePlayer(rl, player, envItems, deltaTime);

    camera.zoom += (rl.CoreD.GetMouseWheelMove()*0.05);

    if (camera.zoom > 3.0) camera.zoom = 3.0;
    else if (camera.zoom < 0.25) camera.zoom = 0.25;

    if (rl.CoreD.IsKeyPressed(.KEY_R)) {
      camera.zoom = 1;
      player.position = .vec2(400, 280);
    }

    if (rl.CoreD.IsKeyPressed(.KEY_C)) {
      cameraOption = (cameraOption + 1) % cameraUpdaters.length;
    }

    cameraUpdaters[cameraOption](rl, camera, player, envItems, deltaTime);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode2D(camera);

        for (int i = 0; i < envItems.length; i++) {
          rl.CoreD.DrawRectangleRec(
            envItems[i].rect,
            envItems[i].color,
          );
        }

        rl.CoreD.DrawRectangleRec(
          .rect(
            player.position.x - 20, player.position.y - 40,
            40, 40
          ),
          .RED
        );

        rl.CoreD.DrawCircleV(player.position, 5, .GOLD);

      rl.CoreD.EndMode2D();

      rl.CoreD.DrawText("Controls:", 20, 20, 10, .BLACK);
      rl.CoreD.DrawText("- Right/Left to move", 40, 40, 10, .DARKGRAY);
      rl.CoreD.DrawText("- Space to jump", 40, 60, 10, .DARKGRAY);
      rl.CoreD.DrawText("- Mouse Wheel to Zoom in-out, R to reset zoom", 40, 80, 10, .DARKGRAY);
      rl.CoreD.DrawText("- C to change camera mode", 40, 100, 10, .DARKGRAY);
      rl.CoreD.DrawText("Current camera mode:", 20, 120, 10, .BLACK);
      rl.CoreD.DrawText(cameraDescriptions[cameraOption], 40, 140, 10, .DARKGRAY);
      rl.CoreD.DrawText("Player Position: ${player.position.format(1)}", 20, 160, 10, .BLACK);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}

void UpdatePlayer(Raylib rl, Player player, List<EnvItem> envItems, double delta)
{
  if (rl.CoreD.IsKeyDown(.KEY_LEFT)) {
    player.position.x -= PLAYER_HOR_SPD*delta;
  }
  if (rl.CoreD.IsKeyDown(.KEY_RIGHT)) {
    player.position.x += PLAYER_HOR_SPD*delta;
  }
  if (rl.CoreD.IsKeyDown(.KEY_SPACE) && player.canJump)
  {
    player.speed = -PLAYER_JUMP_SPD;
    player.canJump = false;
  }

  bool hitObstacle = false;
  for (int i = 0; i < envItems.length; i++)
  {
    final ei = envItems[i];
    final p = player.position;
    if (
      ei.blocking &&
      ei.rect.x <= p.x &&
      ei.rect.x + ei.rect.width >= p.x &&
      ei.rect.y >= p.y &&
      ei.rect.y <= p.y + player.speed*delta)
    {
      hitObstacle = true;
      player.speed = 0.0;
      p.y = ei.rect.y;
      break;
    }
  }

  if (!hitObstacle)
  {
    player.position.y += player.speed*delta;
    player.speed += G*delta;
    player.canJump = false;
  } else {
    player.canJump = true;
  }
}

void UpdateCameraCenter(Raylib rl, Camera2DD camera, Player player, List<EnvItem> envItems, double deltaTime) {
  camera.offset.set(screenWidth/2, screenHeight/2);
  camera.target.setD(player.position);
}

void UpdateCameraCenterInsideMap(Raylib rl, Camera2DD camera, Player player, List<EnvItem> envItems, double deltaTime) {
  camera.target.setD(player.position);
  camera.offset.set(screenWidth/2, screenHeight/2);
  double minX = 1000, minY = 1000, maxX = -1000, maxY = -1000;

  for (int i = 0; i < envItems.length; i++) {
    EnvItem ei = envItems[i];
    minX = math.min(ei.rect.x, minX);
    maxX = math.max(ei.rect.x + ei.rect.width, maxX);
    minY = math.min(ei.rect.y, minY);
    maxY = math.max(ei.rect.y + ei.rect.height, maxY);
  }

  maxVec.set(maxX, maxY);
  minVec.set(minX, minY);
  final max = rl.CoreD.GetWorldToScreen2D(maxVec, camera);
  final min = rl.CoreD.GetWorldToScreen2D(minVec, camera);
  if (max.x < screenWidth) camera.offset.x = screenWidth - (max.x - screenWidth/2);
  if (max.y < screenHeight) camera.offset.y = screenHeight - (max.y - screenHeight/2);
  if (min.x > 0) camera.offset.x = screenWidth/2 - min.x;
  if (min.y > 0) camera.offset.y = screenHeight/2 - min.y;
}

void UpdateCameraCenterSmoothFollow(Raylib rl, Camera2DD camera, Player player, List<EnvItem> envItems, double deltaTime) {
  final minSpeed = 30;
  final minEffectLength = 10;
  final fractionSpeed = 0.8;

  camera.offset.set(screenWidth/2.0, screenHeight/2.0);
  final diff = player.position.sub(camera.target);
  final length = diff.length;

  if (length > minEffectLength)
  {
    final speed = math.max(fractionSpeed*length, minSpeed);
    final target = camera.target.add(diff.scale(speed*deltaTime/length));
    camera.target.setD(target);
  }
}

bool eveningOut = false;
double evenOutTarget = 0;
void UpdateCameraEvenOutOnLanding(Raylib rl, Camera2DD camera, Player player, List<EnvItem> envItems, double deltaTime) {
  double evenOutSpeed = 700;

  camera.offset.set(screenWidth/2.0, screenHeight/2.0);
  camera.target.x = player.position.x;

  if (eveningOut)
  {
    if (evenOutTarget > camera.target.y)
    {
      camera.target.y += evenOutSpeed*deltaTime;

      if (camera.target.y > evenOutTarget)
      {
        camera.target.y = evenOutTarget;
        eveningOut = false;
      }
    }
    else
    {
      camera.target.y -= evenOutSpeed*deltaTime;

      if (camera.target.y < evenOutTarget)
      {
        camera.target.y = evenOutTarget;
        eveningOut = false;
      }
    }
  }
  else
  {
    if (player.canJump && (player.speed == 0) && (player.position.y != camera.target.y))
    {
      eveningOut = true;
      evenOutTarget = player.position.y;
    }
  }
}

void UpdateCameraPlayerBoundsPush(Raylib rl, Camera2DD camera, Player player, List<EnvItem> envItems, double deltaTime) {
  final Vector2D bbox = .vec2(0.2, 0.2);

  minVec.set(
    (1 - bbox.x)*0.5*screenWidth,
    (1 - bbox.y)*0.5*screenHeight,
  );

  maxVec.set(
    (1 + bbox.x)*0.5*screenWidth,
    (1 + bbox.y)*0.5*screenHeight,
  );

  final bboxWorldMin = rl.CoreD.GetWorldToScreen2D(minVec, camera);
  final bboxWorldMax = rl.CoreD.GetWorldToScreen2D(maxVec, camera);

  camera.offset.set(
    (1 - bbox.x)*0.5*screenWidth,
    (1 - bbox.y)*0.5*screenHeight,
  );
  
  if (player.position.x < bboxWorldMin.x) camera.target.x = player.position.x;
  if (player.position.y < bboxWorldMin.y) camera.target.y = player.position.y;
  if (player.position.x > bboxWorldMax.x) camera.target.x = bboxWorldMin.x + (player.position.x - bboxWorldMax.x);
  if (player.position.y > bboxWorldMax.y) camera.target.y = bboxWorldMin.y + (player.position.y - bboxWorldMax.y);
}