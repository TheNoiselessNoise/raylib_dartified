// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_automation_events.c
// Run it: dart run core_automation_events.dart
import 'dart:ffi';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import '../../base.dart';

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
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_automation_events'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final player = calloc<Player>();
  player.ref.position.set(400, 280);
  player.ref.speed = 0;
  player.ref.canJump = false;
  
  final envElements = calloc<EnvElement>(MAX_ENVIRONMENT_ELEMENTS);
  envElements[0].set(  0,   0, 1000, 400, false, rl.C.LIGHTGRAY);
  envElements[1].set(  0, 400, 1000, 200,  true, rl.C.GRAY);
  envElements[2].set(300, 200,  400,  10,  true, rl.C.GRAY);
  envElements[3].set(250, 300,  100,  10,  true, rl.C.GRAY);
  envElements[4].set(650, 300,  100,  10,  true, rl.C.GRAY);

  final camera = rl.Temp.Camera2D$.At('camera');
  camera.ref.target = player.ref.position;
  camera.ref.offset.set(screenWidth/2.0, screenHeight/2.0);
  camera.ref.rotation = 0.0;
  camera.ref.zoom = 1.0;
  
  final aelist = rl.Temp.AutomationEventList$.At('aelist');
  aelist.ref = rl.Core.LoadAutomationEventList(nullptr);
  rl.Core.SetAutomationEventList(aelist);
  bool eventRecording = false;
  bool eventPlaying = false;
  
  int frameCounter = 0;
  int playFrameCounter = 0;
  int currentPlayFrame = 0;

  while (!rl.Core.WindowShouldClose()) {
    double deltaTime = 0.015;//GetFrameTime();
       
    if (rl.Core.IsFileDropped())
    {
      final droppedFiles = rl.Core.LoadDroppedFiles();

      if (rl.Core.IsFileExtension(droppedFiles.paths[0], ".txt;.rae".toC))
      {
        rl.Core.UnloadAutomationEventList(aelist.ref);
        aelist.ref = rl.Core.LoadAutomationEventList(droppedFiles.paths[0]);
        
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

      rl.Core.UnloadDroppedFiles(droppedFiles);
    }

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT.value)) player.ref.position.x -= PLAYER_HOR_SPD*deltaTime;
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_RIGHT.value)) player.ref.position.x += PLAYER_HOR_SPD*deltaTime;
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_SPACE.value) && player.ref.canJump)
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

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_R.value))
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
        rl.Core.PlayAutomationEvent(aelist.ref.events[currentPlayFrame]);
        currentPlayFrame++;

        if (currentPlayFrame == aelist.ref.count)
        {
          eventPlaying = false;
          currentPlayFrame = 0;
          playFrameCounter = 0;

          rl.Core.TraceLog(
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

    camera.ref.zoom += (rl.Core.GetMouseWheelMove()*0.05);
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

    final max = rl.Core.GetWorldToScreen2D(rl.Temp.vec21(maxX, maxY), camera.ref);
    final min = rl.Core.GetWorldToScreen2D(rl.Temp.vec21(minX, minY), camera.ref);

    if (max.x < screenWidth) camera.ref.offset.x = screenWidth - (max.x - screenWidth/2);
    if (max.y < screenHeight) camera.ref.offset.y = screenHeight - (max.y - screenHeight/2);
    if (min.x > 0) camera.ref.offset.x = screenWidth/2 - min.x;
    if (min.y > 0) camera.ref.offset.y = screenHeight/2 - min.y;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_S.value))
    {
      if (!eventPlaying)
      {
        if (eventRecording)
        {
          rl.Core.StopAutomationEventRecording();
          eventRecording = false;
          
          rl.Core.ExportAutomationEventList(aelist.ref, "automation.rae".toC);
          
          rl.Core.TraceLog(
            TraceLogLevel.LOG_INFO.value,
            "RECORDED FRAMES: ${aelist.ref.count}".toC
          );
        }
        else 
        {
          rl.Core.SetAutomationEventBaseFrame(180);
          rl.Core.StartAutomationEventRecording();
          eventRecording = true;
        }
      }
    }
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_A.value))
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

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.LIGHTGRAY);

      rl.Core.BeginMode2D(camera.ref);

        for (int i = 0; i < MAX_ENVIRONMENT_ELEMENTS; i++)
        {
          rl.Core.DrawRectangleRec(envElements[i].rect, envElements[i].color);
        }

        rl.Core.DrawRectangleRec(rl.Temp.rect1(player.ref.position.x - 20, player.ref.position.y - 40, 40, 40), rl.C.RED);

      rl.Core.EndMode2D();
      
      rl.Core.DrawRectangle(10, 10, 290, 145, rl.Core.Fade(rl.C.SKYBLUE, 0.5));
      rl.Core.DrawRectangleLines(10, 10, 290, 145, rl.Core.Fade(rl.C.BLUE, 0.8));

      rl.Core.DrawText("Controls:".toC, 20, 20, 10, rl.C.BLACK);
      rl.Core.DrawText("- RIGHT | LEFT: Player movement".toC, 30, 40, 10, rl.C.DARKGRAY);
      rl.Core.DrawText("- SPACE: Player jump".toC, 30, 60, 10, rl.C.DARKGRAY);
      rl.Core.DrawText("- R: Reset game state".toC, 30, 80, 10, rl.C.DARKGRAY);

      rl.Core.DrawText("- S: START/STOP RECORDING INPUT EVENTS".toC, 30, 110, 10, rl.C.BLACK);
      rl.Core.DrawText("- A: REPLAY LAST RECORDED INPUT EVENTS".toC, 30, 130, 10, rl.C.BLACK);

      if (eventRecording)
      {
        rl.Core.DrawRectangle(10, 160, 290, 30, rl.Core.Fade(rl.C.RED, 0.3));
        rl.Core.DrawRectangleLines(10, 160, 290, 30, rl.Core.Fade(rl.C.MAROON, 0.8));
        rl.Core.DrawCircle(30, 175, 10, rl.C.MAROON);

        if (((frameCounter/15)%2) == 1) rl.Core.DrawText(
          "RECORDING EVENTS... [${aelist.ref.count}]".toC,
          50, 170, 10, rl.C.MAROON
        );
      }
      else if (eventPlaying)
      {
        rl.Core.DrawRectangle(10, 160, 290, 30, rl.Core.Fade(rl.C.LIME, 0.3));
        rl.Core.DrawRectangleLines(10, 160, 290, 30, rl.Core.Fade(rl.C.DARKGREEN, 0.8));
        rl.Core.DrawTriangle(
          rl.Temp.vec21(20, 155 + 10),
          rl.Temp.vec22(20, 155 + 30),
          rl.Temp.vec23(40, 155 + 20),
          rl.C.DARKGREEN
        );

        if (((frameCounter/15)%2) == 1) rl.Core.DrawText(
          "PLAYING RECORDED EVENTS... [$currentPlayFrame]".toC,
          50, 170, 10, rl.C.DARKGREEN
        );
      }

    rl.Core.EndDrawing();
  }

  calloc.free(player);
  calloc.free(envElements);

  rl.CloseWindowAndDispose();
}