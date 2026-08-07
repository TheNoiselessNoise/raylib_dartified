// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_module_playing.c
// Run it: dart run audio_module_playing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_CIRCLES = 64;

final class CircleWave extends Struct {
  external Vector2C position;
  @Float()
  external double radius;
  @Float()
  external double alpha;
  @Float()
  external double speed;
  external ColorC color;
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "audio_module_playing".toC);
  SetTargetFPS(60);

  InitAudioDevice();

  final colors = <ColorC>[
    ORANGE, RED, GOLD, LIME,
    BLUE, VIOLET, BROWN, LIGHTGRAY,
    PINK, YELLOW, GREEN, SKYBLUE,
    PURPLE, BEIGE
  ];

  final circles = calloc<CircleWave>(MAX_CIRCLES);

  for (int i = MAX_CIRCLES - 1; i >= 0; i--)
  {
    circles[i].alpha = 0.0;
    circles[i].radius = GetRandomValue(10, 40).toDouble();
    circles[i].position.x = GetRandomValue(circles[i].radius.toInt(), (screenWidth - circles[i].radius).toInt()).toDouble();
    circles[i].position.y = GetRandomValue(circles[i].radius.toInt(), (screenHeight - circles[i].radius).toInt()).toDouble();
    circles[i].speed = GetRandomValue(1, 100)/2000.0;
    circles[i].color = colors[GetRandomValue(0, 13)];
  }

  final music = LoadMusicStream("../resources/mini1111.xm".toC);
  music.looping = false;
  double pitch = 1.0;

  PlayMusicStream(music);

  double timePlayed = 0.0;
  bool pause = false;

  while (!WindowShouldClose())
  {
    UpdateMusicStream(music);

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value))
    {
      StopMusicStream(music);
      PlayMusicStream(music);
      pause = false;
    }

    if (IsKeyPressed(KeyboardKey.KEY_P.value))
    {
      pause = !pause;

      if (pause) PauseMusicStream(music);
      else ResumeMusicStream(music);
    }

    if (IsKeyDown(KeyboardKey.KEY_DOWN.value)) pitch -= 0.01;
    else if (IsKeyDown(KeyboardKey.KEY_UP.value)) pitch += 0.01;

    SetMusicPitch(music, pitch);

    timePlayed = GetMusicTimePlayed(music)/GetMusicTimeLength(music)*(screenWidth - 40);

    for (int i = MAX_CIRCLES - 1; (i >= 0) && !pause; i--)
    {
      circles[i].alpha += circles[i].speed;
      circles[i].radius += circles[i].speed*10.0;

      if (circles[i].alpha > 1.0) circles[i].speed *= -1;

      if (circles[i].alpha <= 0.0)
      {
        circles[i].alpha = 0.0;
        circles[i].radius = GetRandomValue(10, 40).toDouble();
        circles[i].position.x = GetRandomValue(circles[i].radius.toInt(), (screenWidth - circles[i].radius).toInt()).toDouble();
        circles[i].position.y = GetRandomValue(circles[i].radius.toInt(), (screenHeight - circles[i].radius).toInt()).toDouble();
        circles[i].speed = GetRandomValue(1, 100)/2000.0;
        circles[i].color = colors[GetRandomValue(0, 13)];
      }
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      for (int i = MAX_CIRCLES - 1; i >= 0; i--)
      {
        DrawCircleV(
          circles[i].position,
          circles[i].radius,
          Fade(circles[i].color, circles[i].alpha)
        );
      }

      DrawRectangle(20, screenHeight - 20 - 12, screenWidth - 40, 12, LIGHTGRAY);
      DrawRectangle(20, screenHeight - 20 - 12, timePlayed.toInt(), 12, MAROON);
      DrawRectangleLines(20, screenHeight - 20 - 12, screenWidth - 40, 12, GRAY);

      DrawRectangle(20, 20, 425, 145, WHITE);
      DrawRectangleLines(20, 20, 425, 145, GRAY);
      DrawText("PRESS SPACE TO RESTART MUSIC".toC, 40, 40, 20, BLACK);
      DrawText("PRESS P TO PAUSE/RESUME".toC, 40, 70, 20, BLACK);
      DrawText("PRESS UP/DOWN TO CHANGE SPEED".toC, 40, 100, 20, BLACK);
      DrawText("SPEED: ${pitch.f2}".toC, 40, 130, 20, MAROON);

    EndDrawing();
  }

  UnloadMusicStream(music);
  CloseAudioDevice();

  CloseWindowAndDispose();
}