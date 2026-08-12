// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_2d_camera_platformer.c
// Run it: dart run core_2d_camera_platformer.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

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
  findRaylib('raylib-6.0_linux_amd64/lib');

  minVec = Vector2$.val.At('minVec');
  maxVec = Vector2$.val.At('maxVec');

  InitWindow(screenWidth, screenHeight, "core_2d_camera_platformer".toC);
  SetTargetFPS(60);

  Player player = Player(
    position: .vec2(400, 280),
    speed: 0,
    canJump: false,
  );

  List<EnvItem> envItems = [
    EnvItem(rect: .rect(0, 0, 1000, 400), blocking: false, color: LIGHTGRAY),
    EnvItem(rect: .rect(0, 400, 1000, 200), blocking: true, color: GRAY),
    EnvItem(rect: .rect(300, 200, 400, 10), blocking: true, color: GRAY),
    EnvItem(rect: .rect(250, 300, 100, 10), blocking: true, color: GRAY),
    EnvItem(rect: .rect(650, 300, 100, 10), blocking: true, color: GRAY)
  ];

  List<void Function(Pointer<Camera2DC>, Player, List<EnvItem>, double)> cameraUpdaters = [
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

  final camera = Camera2D$.val.$newPtr;
  camera.ref.target.setD(player.position);
  camera.ref.offset.setD(.vec2(screenWidth/2, screenHeight/2));
  camera.ref.rotation = 0;
  camera.ref.zoom = 1;

  int cameraOption = 1;

  while (!WindowShouldClose()) {
    double deltaTime = GetFrameTime();

    UpdatePlayer(player, envItems, deltaTime);

    camera.ref.zoom += (GetMouseWheelMove()*0.05);

    if (camera.ref.zoom > 3.0) camera.ref.zoom = 3.0;
    else if (camera.ref.zoom < 0.25) camera.ref.zoom = 0.25;

    if (IsKeyPressed(KeyboardKey.KEY_R.value)) {
      camera.ref.zoom = 1;
      player.position = .vec2(400, 280);
    }

    if (IsKeyPressed(KeyboardKey.KEY_C.value)) {
      cameraOption = (cameraOption + 1) % cameraUpdaters.length;
    }

    cameraUpdaters[cameraOption](camera, player, envItems, deltaTime);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode2D(camera.ref);

        for (int i = 0; i < envItems.length; i++) {
          DrawRectangleRec(
            Rectangle$.val.$1.setD(envItems[i].rect),
            envItems[i].color
          );
        }

        DrawRectangleRec(
          Rectangle$.val.$1.set(player.position.x - 20, player.position.y - 40, 40, 40),
          RED
        );

        DrawCircleV(Vector2$.val.$1.setD(player.position), 5, GOLD);

      EndMode2D();

      DrawText("Controls:".toC, 20, 20, 10, BLACK);
      DrawText("- Right/Left to move".toC, 40, 40, 10, DARKGRAY);
      DrawText("- Space to jump".toC, 40, 60, 10, DARKGRAY);
      DrawText("- Mouse Wheel to Zoom in-out, R to reset zoom".toC, 40, 80, 10, DARKGRAY);
      DrawText("- C to change camera mode".toC, 40, 100, 10, DARKGRAY);
      DrawText("Current camera mode:".toC, 20, 120, 10, BLACK);
      DrawText(cameraDescriptions[cameraOption].toC, 40, 140, 10, DARKGRAY);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void UpdatePlayer(Player player, List<EnvItem> envItems, double delta)
{
  if (IsKeyDown(KeyboardKey.KEY_LEFT.value)) {
    player.position.x -= PLAYER_HOR_SPD*delta;
  }
  if (IsKeyDown(KeyboardKey.KEY_RIGHT.value)) {
    player.position.x += PLAYER_HOR_SPD*delta;
  }
  if (IsKeyDown(KeyboardKey.KEY_SPACE.value) && player.canJump)
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

void UpdateCameraCenter(Pointer<Camera2DC> camera, Player player, List<EnvItem> envItems, double deltaTime) {
  camera.ref.offset.set(screenWidth/2, screenHeight/2);
  camera.ref.target.setD(player.position);
}

void UpdateCameraCenterInsideMap(Pointer<Camera2DC> camera, Player player, List<EnvItem> envItems, double deltaTime) {
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
  final max = GetWorldToScreen2D(maxVec.ref, camera.ref);
  final min = GetWorldToScreen2D(minVec.ref, camera.ref);
  if (max.x < screenWidth) camera.ref.offset.x = screenWidth - (max.x - screenWidth/2);
  if (max.y < screenHeight) camera.ref.offset.y = screenHeight - (max.y - screenHeight/2);
  if (min.x > 0) camera.ref.offset.x = screenWidth/2 - min.x;
  if (min.y > 0) camera.ref.offset.y = screenHeight/2 - min.y;
}

void UpdateCameraCenterSmoothFollow(Pointer<Camera2DC> camera, Player player, List<EnvItem> envItems, double deltaTime) {
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
void UpdateCameraEvenOutOnLanding(Pointer<Camera2DC> camera, Player player, List<EnvItem> envItems, double deltaTime) {
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

void UpdateCameraPlayerBoundsPush(Pointer<Camera2DC> camera, Player player, List<EnvItem> envItems, double deltaTime) {
  final Vector2D bbox = .vec2(0.2, 0.2);

  final minVec = Vector2$.val.At('UpdateCameraPlayerBoundsPush_minVec').set(
    (1 - bbox.x)*0.5*screenWidth,
    (1 - bbox.y)*0.5*screenHeight
  );
  final maxVec = Vector2$.val.At('UpdateCameraPlayerBoundsPush_maxVec').set(
    (1 + bbox.x)*0.5*screenWidth,
    (1 + bbox.y)*0.5*screenHeight
  );

  final bboxWorldMin = GetWorldToScreen2D(minVec.ref, camera.ref);
  final bboxWorldMax = GetWorldToScreen2D(maxVec.ref, camera.ref);

  camera.ref.offset.set((1 - bbox.x)*0.5*screenWidth, (1 - bbox.y)*0.5*screenHeight);
  
  if (player.position.x < bboxWorldMin.x) camera.ref.target.x = player.position.x;
  if (player.position.y < bboxWorldMin.y) camera.ref.target.y = player.position.y;
  if (player.position.x > bboxWorldMax.x) camera.ref.target.x = bboxWorldMin.x + (player.position.x - bboxWorldMax.x);
  if (player.position.y > bboxWorldMax.y) camera.ref.target.y = bboxWorldMin.y + (player.position.y - bboxWorldMax.y);
}