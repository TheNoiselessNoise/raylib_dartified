// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_2d_camera_platformer.c
// Run it: dart run core_2d_camera_platformer.dart
import 'dart:ffi';
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
  ColorC color;

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

late Pointer<Vector2C> minVec;
late Pointer<Vector2C> maxVec;

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  minVec = rl.Temp.Vector2$.At('minVec');
  maxVec = rl.Temp.Vector2$.At('maxVec');

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_2d_camera_platformer'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  Player player = Player(
    position: .vec2(400, 280),
    speed: 0,
    canJump: false,
  );

  List<EnvItem> envItems = [
    EnvItem(rect: .rect(0, 0, 1000, 400), blocking: false, color: rl.Color.LIGHTGRAY),
    EnvItem(rect: .rect(0, 400, 1000, 200), blocking: true, color: rl.Color.GRAY),
    EnvItem(rect: .rect(300, 200, 400, 10), blocking: true, color: rl.Color.GRAY),
    EnvItem(rect: .rect(250, 300, 100, 10), blocking: true, color: rl.Color.GRAY),
    EnvItem(rect: .rect(650, 300, 100, 10), blocking: true, color: rl.Color.GRAY)
  ];

  List<void Function(Raylib, Pointer<Camera2DC>, Player, List<EnvItem>, double)> cameraUpdaters = [
    UpdateCameraCenter,
    UpdateCameraCenterInsideMap,
    UpdateCameraCenterSmoothFollow,
    UpdateCameraEvenOutOnLanding,
    UpdateCameraPlayerBoundsPush
  ];

  List<String> cameraDescriptions = [
    "Follow player center",
    "Follow player center, but clamp to map edges",
    "Follow player center; smoothed",
    "Follow player center horizontally; update player center vertically after landing",
    "Player push camera on getting too close to screen edge"
  ];

  final camera = rl.Temp.Camera2D$.At('camera');
  camera.ref.target.setD(player.position);
  camera.ref.offset.setD(.vec2(screenWidth/2, screenHeight/2));
  camera.ref.rotation = 0;
  camera.ref.zoom = 1;

  int cameraOption = 1;

  while (!rl.Core.WindowShouldClose()) {
    double deltaTime = rl.Core.GetFrameTime();

    UpdatePlayer(rl, player, envItems, deltaTime);

    camera.ref.zoom += (rl.Core.GetMouseWheelMove()*0.05);

    if (camera.ref.zoom > 3.0) camera.ref.zoom = 3.0;
    else if (camera.ref.zoom < 0.25) camera.ref.zoom = 0.25;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_R.value)) {
      camera.ref.zoom = 1;
      player.position = .vec2(400, 280);
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_C.value)) {
      cameraOption = (cameraOption + 1) % cameraUpdaters.length;
    }

    cameraUpdaters[cameraOption](rl, camera, player, envItems, deltaTime);

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode2D(camera.ref);

        for (int i = 0; i < envItems.length; i++) {
          rl.Core.DrawRectangleRec(
            rl.Temp.rect1D(envItems[i].rect),
            envItems[i].color
          );
        }

        rl.Core.DrawRectangleRec(
          rl.Temp.rect1(player.position.x - 20, player.position.y - 40, 40, 40),
          rl.Color.RED
        );

        rl.Core.DrawCircleV(rl.Temp.vec21D(player.position), 5, rl.Color.GOLD);

      rl.Core.EndMode2D();

      rl.Core.DrawText("Controls:".toC, 20, 20, 10, rl.Color.BLACK);
      rl.Core.DrawText("- Right/Left to move".toC, 40, 40, 10, rl.Color.DARKGRAY);
      rl.Core.DrawText("- Space to jump".toC, 40, 60, 10, rl.Color.DARKGRAY);
      rl.Core.DrawText("- Mouse Wheel to Zoom in-out, R to reset zoom".toC, 40, 80, 10, rl.Color.DARKGRAY);
      rl.Core.DrawText("- C to change camera mode".toC, 40, 100, 10, rl.Color.DARKGRAY);
      rl.Core.DrawText("Current camera mode:".toC, 20, 120, 10, rl.Color.BLACK);
      rl.Core.DrawText(cameraDescriptions[cameraOption].toC, 40, 140, 10, rl.Color.DARKGRAY);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}

void UpdatePlayer(Raylib rl, Player player, List<EnvItem> envItems, double delta)
{
  if (rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT.value)) {
    player.position.x -= PLAYER_HOR_SPD*delta;
  }
  if (rl.Core.IsKeyDown(KeyboardKey.KEY_RIGHT.value)) {
    player.position.x += PLAYER_HOR_SPD*delta;
  }
  if (rl.Core.IsKeyDown(KeyboardKey.KEY_SPACE.value) && player.canJump)
  {
    player.speed = -PLAYER_JUMP_SPD;
    player.canJump = false;
  }

  bool hitObstacle = false;
  for (int i = 0; i < envItems.length; i++)
  {
    EnvItem ei = envItems[i];
    Vector2D p = player.position;
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

void UpdateCameraCenter(Raylib rl, Pointer<Camera2DC> camera, Player player, List<EnvItem> envItems, double deltaTime) {
  camera.ref.offset.set(screenWidth/2, screenHeight/2);
  camera.ref.target.setD(player.position);
}

void UpdateCameraCenterInsideMap(Raylib rl, Pointer<Camera2DC> camera, Player player, List<EnvItem> envItems, double deltaTime) {
  camera.ref.target.setD(player.position);
  camera.ref.offset.set(screenWidth/2, screenHeight/2);
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
  final max = rl.Core.GetWorldToScreen2D(maxVec.ref, camera.ref);
  final min = rl.Core.GetWorldToScreen2D(minVec.ref, camera.ref);
  if (max.x < screenWidth) camera.ref.offset.x = screenWidth - (max.x - screenWidth/2);
  if (max.y < screenHeight) camera.ref.offset.y = screenHeight - (max.y - screenHeight/2);
  if (min.x > 0) camera.ref.offset.x = screenWidth/2 - min.x;
  if (min.y > 0) camera.ref.offset.y = screenHeight/2 - min.y;
}

void UpdateCameraCenterSmoothFollow(Raylib rl, Pointer<Camera2DC> camera, Player player, List<EnvItem> envItems, double deltaTime) {
  double minSpeed = 30;
  double minEffectLength = 10;
  double fractionSpeed = 0.8;

  camera.ref.offset.set(screenWidth/2.0, screenHeight/2.0);
  Vector2D diff = player.position.sub(camera.ref.target.toD());
  double length = diff.length;

  if (length > minEffectLength)
  {
    double speed = math.max(fractionSpeed*length, minSpeed);
    Vector2D target = camera.ref.target.toD().add(
      diff.scale(speed*deltaTime/length),
    );
    camera.ref.target.setD(target);
  }
}

bool eveningOut = false;
double evenOutTarget = 0;
void UpdateCameraEvenOutOnLanding(Raylib rl, Pointer<Camera2DC> camera, Player player, List<EnvItem> envItems, double deltaTime) {
  double evenOutSpeed = 700;

  camera.ref.offset.set(screenWidth/2.0, screenHeight/2.0);
  camera.ref.target.x = player.position.x;

  if (eveningOut)
  {
    if (evenOutTarget > camera.ref.target.y)
    {
      camera.ref.target.y += evenOutSpeed*deltaTime;

      if (camera.ref.target.y > evenOutTarget)
      {
        camera.ref.target.y = evenOutTarget;
        eveningOut = false;
      }
    }
    else
    {
      camera.ref.target.y -= evenOutSpeed*deltaTime;

      if (camera.ref.target.y < evenOutTarget)
      {
        camera.ref.target.y = evenOutTarget;
        eveningOut = false;
      }
    }
  }
  else
  {
    if (player.canJump && (player.speed == 0) && (player.position.y != camera.ref.target.y))
    {
      eveningOut = true;
      evenOutTarget = player.position.y;
    }
  }
}

void UpdateCameraPlayerBoundsPush(Raylib rl, Pointer<Camera2DC> camera, Player player, List<EnvItem> envItems, double deltaTime) {
  final Vector2D bbox = .vec2(0.2, 0.2);

  final minVec = rl.Temp.Vector2$.At('UpdateCameraPlayerBoundsPush_minVec').set(
    (1 - bbox.x)*0.5*screenWidth,
    (1 - bbox.y)*0.5*screenHeight
  );
  final maxVec = rl.Temp.Vector2$.At('UpdateCameraPlayerBoundsPush_maxVec').set(
    (1 + bbox.x)*0.5*screenWidth,
    (1 + bbox.y)*0.5*screenHeight
  );

  final bboxWorldMin = rl.Core.GetWorldToScreen2D(minVec.ref, camera.ref);
  final bboxWorldMax = rl.Core.GetWorldToScreen2D(maxVec.ref, camera.ref);

  camera.ref.offset.set((1 - bbox.x)*0.5*screenWidth, (1 - bbox.y)*0.5*screenHeight);
  
  if (player.position.x < bboxWorldMin.x) camera.ref.target.x = player.position.x;
  if (player.position.y < bboxWorldMin.y) camera.ref.target.y = player.position.y;
  if (player.position.x > bboxWorldMax.x) camera.ref.target.x = bboxWorldMin.x + (player.position.x - bboxWorldMax.x);
  if (player.position.y > bboxWorldMax.y) camera.ref.target.y = bboxWorldMin.y + (player.position.y - bboxWorldMax.y);
}