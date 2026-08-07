// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_automation_events.c
// Run it: dart run core_automation_events.dart
import 'dart:math' as math;
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const double GRAVITY = 400;
const double PLAYER_JUMP_SPD = 350.0;
const double PLAYER_HOR_SPD = 200.0;

class Player {
  Vector2D position;
  double speed;
  bool canJump;

  Player({
    Vector2D? position,
    this.speed = 0,
    this.canJump = false,
  }) :
    position = position ?? .zero();
}

class EnvElement {
  RectangleD rect;
  bool blocking;
  ColorD color;

  EnvElement(this.rect, this.blocking , this.color);
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_automation_events");
  SetTargetFPS(60);

  final player = Player();
  player.position.set(400, 280);
  player.speed = 0;
  player.canJump = false;
  
  final List<EnvElement> envElements = [
    .new(.rect(  0,   0, 1000, 400), false, .LIGHTGRAY),
    .new(.rect(  0, 400, 1000, 200),  true, .GRAY),
    .new(.rect(300, 200,  400,  10),  true, .GRAY),
    .new(.rect(250, 300,  100,  10),  true, .GRAY),
    .new(.rect(650, 300,  100,  10),  true, .GRAY),
  ];

  final camera = Camera2DD();
  camera.target = player.position;
  camera.offset.set(screenWidth/2.0, screenHeight/2.0);
  camera.rotation = 0.0;
  camera.zoom = 1.0;
  
  var aelist = LoadAutomationEventList(null);
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

      if (IsFileExtension(droppedFiles.paths[0], ".txt;.rae"))
      {
        UnloadAutomationEventList(aelist);
        aelist = LoadAutomationEventList(droppedFiles.paths[0]);
        
        eventRecording = false;
        
        eventPlaying = true;
        playFrameCounter = 0;
        currentPlayFrame = 0;
        
        player.position.set(400, 280);
        player.speed = 0;
        player.canJump = false;

        camera.target = player.position;
        camera.offset.set(screenWidth/2.0, screenHeight/2.0);
        camera.rotation = 0.0;
        camera.zoom = 1.0;
      }
    }

    if (IsKeyDown(.KEY_LEFT)) player.position.x -= PLAYER_HOR_SPD*deltaTime;
    if (IsKeyDown(.KEY_RIGHT)) player.position.x += PLAYER_HOR_SPD*deltaTime;
    if (IsKeyDown(.KEY_SPACE) && player.canJump)
    {
      player.speed = -PLAYER_JUMP_SPD;
      player.canJump = false;
    }

    bool hitObstacle = false;
    for (int i = 0; i < envElements.length; i++)
    {
      final element = envElements[i];
      final p = player.position;
      if (
        element.blocking &&
        element.rect.x <= p.x &&
        element.rect.x + element.rect.width >= p.x &&
        element.rect.y >= p.y &&
        element.rect.y <= p.y + player.speed*deltaTime
      ) {
        hitObstacle = true;
        player.speed = 0.0;
        player.position.y = element.rect.y;
      }
    }

    if (!hitObstacle)
    {
      player.position.y += player.speed*deltaTime;
      player.speed += GRAVITY*deltaTime;
      player.canJump = false;
    }
    else player.canJump = true;

    if (IsKeyPressed(.KEY_R))
    {
      player.position.set(400, 280);
      player.speed = 0;
      player.canJump = false;

      camera.target = player.position;
      camera.offset.set(screenWidth/2.0, screenHeight/2.0);
      camera.rotation = 0.0;
      camera.zoom = 1.0;
    }

    if (eventPlaying)
    {
      while (playFrameCounter == aelist.events[currentPlayFrame].frame)
      {
        PlayAutomationEvent(aelist.events[currentPlayFrame]);
        currentPlayFrame++;

        if (currentPlayFrame == aelist.count)
        {
          eventPlaying = false;
          currentPlayFrame = 0;
          playFrameCounter = 0;

          TraceLog(.LOG_INFO, "FINISH PLAYING!");
          break;
        }
      }

      playFrameCounter++;
    }

    camera.target = player.position;
    camera.offset.set(screenWidth/2.0, screenHeight/2.0);
    double minX = 1000, minY = 1000, maxX = -1000, maxY = -1000;

    camera.zoom += (GetMouseWheelMove()*0.05);
    if (camera.zoom > 3.0) camera.zoom = 3.0;
    else if (camera.zoom < 0.25) camera.zoom = 0.25;

    for (int i = 0; i < envElements.length; i++)
    {
      final element = envElements[i];
      minX = math.min(element.rect.x, minX);
      maxX = math.max(element.rect.x + element.rect.width, maxX);
      minY = math.min(element.rect.y, minY);
      maxY = math.max(element.rect.y + element.rect.height, maxY);
    }

    final max = GetWorldToScreen2D(.vec2(maxX, maxY), camera);
    final min = GetWorldToScreen2D(.vec2(minX, minY), camera);

    if (max.x < screenWidth) camera.offset.x = screenWidth - (max.x - screenWidth/2);
    if (max.y < screenHeight) camera.offset.y = screenHeight - (max.y - screenHeight/2);
    if (min.x > 0) camera.offset.x = screenWidth/2 - min.x;
    if (min.y > 0) camera.offset.y = screenHeight/2 - min.y;

    if (IsKeyPressed(.KEY_S))
    {
      if (!eventPlaying)
      {
        if (eventRecording)
        {
          StopAutomationEventRecording();
          eventRecording = false;
          
          ExportAutomationEventList(aelist, "automation.rae");
          
          TraceLog(.LOG_INFO, "RECORDED FRAMES: ${aelist.count}");
        }
        else 
        {
          SetAutomationEventBaseFrame(180);
          StartAutomationEventRecording();
          eventRecording = true;
        }
      }
    }
    else if (IsKeyPressed(.KEY_A))
    {
      if (!eventRecording && (aelist.count > 0))
      {
        eventPlaying = true;
        playFrameCounter = 0;
        currentPlayFrame = 0;

        player.position.set(400, 280);
        player.speed = 0;
        player.canJump = false;

        camera.target = player.position;
        camera.offset.set(screenWidth/2.0, screenHeight/2.0);
        camera.rotation = 0.0;
        camera.zoom = 1.0;
      }
    }

    if (eventRecording || eventPlaying) frameCounter++;
    else frameCounter = 0;

    BeginDrawing();

      ClearBackground(.LIGHTGRAY);

      BeginMode2D(camera);

        for (int i = 0; i < envElements.length; i++)
        {
          DrawRectangleRec(envElements[i].rect, envElements[i].color);
        }

        DrawRectangleRec(.rect(player.position.x - 20, player.position.y - 40, 40, 40), .RED);

      EndMode2D();
      
      DrawRectangle(10, 10, 290, 145, Fade(.SKYBLUE, 0.5));
      DrawRectangleLines(10, 10, 290, 145, Fade(.BLUE, 0.8));

      DrawText("Controls:", 20, 20, 10, .BLACK);
      DrawText("- RIGHT | LEFT: Player movement", 30, 40, 10, .DARKGRAY);
      DrawText("- SPACE: Player jump", 30, 60, 10, .DARKGRAY);
      DrawText("- R: Reset game state", 30, 80, 10, .DARKGRAY);

      DrawText("- S: START/STOP RECORDING INPUT EVENTS", 30, 110, 10, .BLACK);
      DrawText("- A: REPLAY LAST RECORDED INPUT EVENTS", 30, 130, 10, .BLACK);

      if (eventRecording)
      {
        DrawRectangle(10, 160, 290, 30, Fade(.RED, 0.3));
        DrawRectangleLines(10, 160, 290, 30, Fade(.MAROON, 0.8));
        DrawCircle(30, 175, 10, .MAROON);

        if (((frameCounter/15)%2) == 1) DrawText(
          "RECORDING EVENTS... [${aelist.count}]",
          50, 170, 10, .MAROON
        );
      }
      else if (eventPlaying)
      {
        DrawRectangle(10, 160, 290, 30, Fade(.LIME, 0.3));
        DrawRectangleLines(10, 160, 290, 30, Fade(.DARKGREEN, 0.8));
        DrawTriangle(
          .vec2(20, 155 + 10),
          .vec2(20, 155 + 30),
          .vec2(40, 155 + 20),
          .DARKGREEN
        );

        if (((frameCounter/15)%2) == 1) DrawText(
          "PLAYING RECORDED EVENTS... [$currentPlayFrame]",
          50, 170, 10, .DARKGREEN
        );
      }

    EndDrawing();
  }

  CloseWindowAndDispose();
}