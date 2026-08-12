// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_automation_events.c
// Run it: dart run core_automation_events.dart
import 'dart:ffi';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const double GRAVITY = 400;
const double PLAYER_JUMP_SPD = 350.0;
const double PLAYER_HOR_SPD = 200.0;
const int MAX_ENVIRONMENT_ELEMENTS = 5;

final class Player extends Struct {
  external Vector2C position;
  @Float()
  external double speed;
  @Bool()
  external bool canJump;
}

final class EnvElement extends Struct {
  external RectangleC rect;
  @Bool()
  external bool blocking;
  external ColorC color;

  void set(num x, num y, num w, num h, bool blocking, ColorC color) {
    rect.set(x, y, w, h);
    this.blocking = blocking;
    this.color = color;
  }
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_automation_events".toC);
  SetTargetFPS(60);

  final player = calloc<Player>();
  player.ref.position.set(400, 280);
  player.ref.speed = 0;
  player.ref.canJump = false;
  
  final envElements = calloc<EnvElement>(MAX_ENVIRONMENT_ELEMENTS);
  envElements[0].set(  0,   0, 1000, 400, false, LIGHTGRAY);
  envElements[1].set(  0, 400, 1000, 200,  true, GRAY);
  envElements[2].set(300, 200,  400,  10,  true, GRAY);
  envElements[3].set(250, 300,  100,  10,  true, GRAY);
  envElements[4].set(650, 300,  100,  10,  true, GRAY);

  final camera = Camera2D$.val.$newPtr;
  camera.ref.target = player.ref.position;
  camera.ref.offset.set(screenWidth/2.0, screenHeight/2.0);
  camera.ref.rotation = 0.0;
  camera.ref.zoom = 1.0;
  
  final aelist = AutomationEventList$.val.At('aelist');
  aelist.ref = LoadAutomationEventList(nullptr);
  SetAutomationEventList(aelist);
  bool eventRecording = false;
  bool eventPlaying = false;
  
  int frameCounter = 0;
  int playFrameCounter = 0;
  int currentPlayFrame = 0;

  while (!WindowShouldClose()) {
    double deltaTime = 0.015;//GetFrameTime();
       
    if (IsFileDropped())
    {
      final droppedFiles = LoadDroppedFiles();

      if (IsFileExtension(droppedFiles.paths[0], ".txt;.rae".toC))
      {
        UnloadAutomationEventList(aelist.ref);
        aelist.ref = LoadAutomationEventList(droppedFiles.paths[0]);
        
        eventRecording = false;
        
        eventPlaying = true;
        playFrameCounter = 0;
        currentPlayFrame = 0;
        
        player.ref.position.set(400, 280);
        player.ref.speed = 0;
        player.ref.canJump = false;

        camera.ref.target = player.ref.position;
        camera.ref.offset.set(screenWidth/2.0, screenHeight/2.0);
        camera.ref.rotation = 0.0;
        camera.ref.zoom = 1.0;
      }

      UnloadDroppedFiles(droppedFiles);
    }

    if (IsKeyDown(KeyboardKey.KEY_LEFT.value)) player.ref.position.x -= PLAYER_HOR_SPD*deltaTime;
    if (IsKeyDown(KeyboardKey.KEY_RIGHT.value)) player.ref.position.x += PLAYER_HOR_SPD*deltaTime;
    if (IsKeyDown(KeyboardKey.KEY_SPACE.value) && player.ref.canJump)
    {
      player.ref.speed = -PLAYER_JUMP_SPD;
      player.ref.canJump = false;
    }

    bool hitObstacle = false;
    for (int i = 0; i < MAX_ENVIRONMENT_ELEMENTS; i++)
    {
      final element = envElements[i];
      final p = player.ref.position;
      if (
        element.blocking &&
        element.rect.x <= p.x &&
        element.rect.x + element.rect.width >= p.x &&
        element.rect.y >= p.y &&
        element.rect.y <= p.y + player.ref.speed*deltaTime
      ) {
        hitObstacle = true;
        player.ref.speed = 0.0;
        player.ref.position.y = element.rect.y;
      }
    }

    if (!hitObstacle)
    {
      player.ref.position.y += player.ref.speed*deltaTime;
      player.ref.speed += GRAVITY*deltaTime;
      player.ref.canJump = false;
    }
    else player.ref.canJump = true;

    if (IsKeyPressed(KeyboardKey.KEY_R.value))
    {
      player.ref.position.set(400, 280);
      player.ref.speed = 0;
      player.ref.canJump = false;

      camera.ref.target = player.ref.position;
      camera.ref.offset.set(screenWidth/2.0, screenHeight/2.0);
      camera.ref.rotation = 0.0;
      camera.ref.zoom = 1.0;
    }

    if (eventPlaying)
    {
      while (playFrameCounter == aelist.ref.events[currentPlayFrame].frame)
      {
        PlayAutomationEvent(aelist.ref.events[currentPlayFrame]);
        currentPlayFrame++;

        if (currentPlayFrame == aelist.ref.count)
        {
          eventPlaying = false;
          currentPlayFrame = 0;
          playFrameCounter = 0;

          TraceLog(
            TraceLogLevel.LOG_INFO.value,
            "FINISH PLAYING!".toC
          );
          break;
        }
      }

      playFrameCounter++;
    }

    camera.ref.target = player.ref.position;
    camera.ref.offset.set(screenWidth/2.0, screenHeight/2.0);
    double minX = 1000, minY = 1000, maxX = -1000, maxY = -1000;

    camera.ref.zoom += (GetMouseWheelMove()*0.05);
    if (camera.ref.zoom > 3.0) camera.ref.zoom = 3.0;
    else if (camera.ref.zoom < 0.25) camera.ref.zoom = 0.25;

    for (int i = 0; i < MAX_ENVIRONMENT_ELEMENTS; i++)
    {
      final element = envElements[i];
      minX = math.min(element.rect.x, minX);
      maxX = math.max(element.rect.x + element.rect.width, maxX);
      minY = math.min(element.rect.y, minY);
      maxY = math.max(element.rect.y + element.rect.height, maxY);
    }

    final max = GetWorldToScreen2D(Vector2$.val.$1.set(maxX, maxY), camera.ref);
    final min = GetWorldToScreen2D(Vector2$.val.$1.set(minX, minY), camera.ref);

    if (max.x < screenWidth) camera.ref.offset.x = screenWidth - (max.x - screenWidth/2);
    if (max.y < screenHeight) camera.ref.offset.y = screenHeight - (max.y - screenHeight/2);
    if (min.x > 0) camera.ref.offset.x = screenWidth/2 - min.x;
    if (min.y > 0) camera.ref.offset.y = screenHeight/2 - min.y;

    if (IsKeyPressed(KeyboardKey.KEY_S.value))
    {
      if (!eventPlaying)
      {
        if (eventRecording)
        {
          StopAutomationEventRecording();
          eventRecording = false;
          
          ExportAutomationEventList(aelist.ref, "automation.rae".toC);
          
          TraceLog(
            TraceLogLevel.LOG_INFO.value,
            "RECORDED FRAMES: ${aelist.ref.count}".toC
          );
        }
        else 
        {
          SetAutomationEventBaseFrame(180);
          StartAutomationEventRecording();
          eventRecording = true;
        }
      }
    }
    else if (IsKeyPressed(KeyboardKey.KEY_A.value))
    {
      if (!eventRecording && (aelist.ref.count > 0))
      {
        eventPlaying = true;
        playFrameCounter = 0;
        currentPlayFrame = 0;

        player.ref.position.set(400, 280);
        player.ref.speed = 0;
        player.ref.canJump = false;

        camera.ref.target = player.ref.position;
        camera.ref.offset.set(screenWidth/2.0, screenHeight/2.0);
        camera.ref.rotation = 0.0;
        camera.ref.zoom = 1.0;
      }
    }

    if (eventRecording || eventPlaying) frameCounter++;
    else frameCounter = 0;

    BeginDrawing();

      ClearBackground(LIGHTGRAY);

      BeginMode2D(camera.ref);

        for (int i = 0; i < MAX_ENVIRONMENT_ELEMENTS; i++)
        {
          DrawRectangleRec(envElements[i].rect, envElements[i].color);
        }

        DrawRectangleRec(Rectangle$.val.$1.set(player.ref.position.x - 20, player.ref.position.y - 40, 40, 40), RED);

      EndMode2D();
      
      DrawRectangle(10, 10, 290, 145, Fade(SKYBLUE, 0.5));
      DrawRectangleLines(10, 10, 290, 145, Fade(BLUE, 0.8));

      DrawText("Controls:".toC, 20, 20, 10, BLACK);
      DrawText("- RIGHT | LEFT: Player movement".toC, 30, 40, 10, DARKGRAY);
      DrawText("- SPACE: Player jump".toC, 30, 60, 10, DARKGRAY);
      DrawText("- R: Reset game state".toC, 30, 80, 10, DARKGRAY);

      DrawText("- S: START/STOP RECORDING INPUT EVENTS".toC, 30, 110, 10, BLACK);
      DrawText("- A: REPLAY LAST RECORDED INPUT EVENTS".toC, 30, 130, 10, BLACK);

      if (eventRecording)
      {
        DrawRectangle(10, 160, 290, 30, Fade(RED, 0.3));
        DrawRectangleLines(10, 160, 290, 30, Fade(MAROON, 0.8));
        DrawCircle(30, 175, 10, MAROON);

        if (((frameCounter/15)%2) == 1) DrawText(
          "RECORDING EVENTS... [${aelist.ref.count}]".toC,
          50, 170, 10, MAROON
        );
      }
      else if (eventPlaying)
      {
        DrawRectangle(10, 160, 290, 30, Fade(LIME, 0.3));
        DrawRectangleLines(10, 160, 290, 30, Fade(DARKGREEN, 0.8));
        DrawTriangle(
          Vector2$.val.$1.set(20, 155 + 10),
          Vector2$.val.$2.set(20, 155 + 30),
          Vector2$.val.$3.set(40, 155 + 20),
          DARKGREEN
        );

        if (((frameCounter/15)%2) == 1) DrawText(
          "PLAYING RECORDED EVENTS... [$currentPlayFrame]".toC,
          50, 170, 10, DARKGREEN
        );
      }

    EndDrawing();
  }

  calloc.free(player);
  calloc.free(envElements);

  CloseWindowAndDispose();
}