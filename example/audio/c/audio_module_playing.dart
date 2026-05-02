// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_module_playing.c
// Run it: dart run audio_module_playing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base.dart';

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
  final rl = loadBaseRaylib();

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "audio_module_playing".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  rl.Audio.InitAudioDevice();

  final colors = <ColorC>[
    rl.C.ORANGE, rl.C.RED, rl.C.GOLD, rl.C.LIME,
    rl.C.BLUE, rl.C.VIOLET, rl.C.BROWN, rl.C.LIGHTGRAY,
    rl.C.PINK, rl.C.YELLOW, rl.C.GREEN, rl.C.SKYBLUE,
    rl.C.PURPLE, rl.C.BEIGE
  ];

  final circles = calloc<CircleWave>(MAX_CIRCLES);

  for (int i = MAX_CIRCLES - 1; i >= 0; i--)
  {
    circles[i].alpha = 0.0;
    circles[i].radius = rl.Core.GetRandomValue(10, 40).toDouble();
    circles[i].position.x = rl.Core.GetRandomValue(circles[i].radius.toInt(), (screenWidth - circles[i].radius).toInt()).toDouble();
    circles[i].position.y = rl.Core.GetRandomValue(circles[i].radius.toInt(), (screenHeight - circles[i].radius).toInt()).toDouble();
    circles[i].speed = rl.Core.GetRandomValue(1, 100)/2000.0;
    circles[i].color = colors[rl.Core.GetRandomValue(0, 13)];
  }

  final music = rl.Audio.LoadMusicStream("../resources/mini1111.xm".toC);
  music.looping = false;
  double pitch = 1.0;

  rl.Audio.PlayMusicStream(music);

  double timePlayed = 0.0;
  bool pause = false;

  while (!rl.Core.WindowShouldClose())
  {
    rl.Audio.UpdateMusicStream(music);

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value))
    {
      rl.Audio.StopMusicStream(music);
      rl.Audio.PlayMusicStream(music);
      pause = false;
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_P.value))
    {
      pause = !pause;

      if (pause) rl.Audio.PauseMusicStream(music);
      else rl.Audio.ResumeMusicStream(music);
    }

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_DOWN.value)) pitch -= 0.01;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_UP.value)) pitch += 0.01;

    rl.Audio.SetMusicPitch(music, pitch);

    timePlayed = rl.Audio.GetMusicTimePlayed(music)/rl.Audio.GetMusicTimeLength(music)*(screenWidth - 40);

    for (int i = MAX_CIRCLES - 1; (i >= 0) && !pause; i--)
    {
      circles[i].alpha += circles[i].speed;
      circles[i].radius += circles[i].speed*10.0;

      if (circles[i].alpha > 1.0) circles[i].speed *= -1;

      if (circles[i].alpha <= 0.0)
      {
        circles[i].alpha = 0.0;
        circles[i].radius = rl.Core.GetRandomValue(10, 40).toDouble();
        circles[i].position.x = rl.Core.GetRandomValue(circles[i].radius.toInt(), (screenWidth - circles[i].radius).toInt()).toDouble();
        circles[i].position.y = rl.Core.GetRandomValue(circles[i].radius.toInt(), (screenHeight - circles[i].radius).toInt()).toDouble();
        circles[i].speed = rl.Core.GetRandomValue(1, 100)/2000.0;
        circles[i].color = colors[rl.Core.GetRandomValue(0, 13)];
      }
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      for (int i = MAX_CIRCLES - 1; i >= 0; i--)
      {
        rl.Core.DrawCircleV(
          circles[i].position,
          circles[i].radius,
          rl.Core.Fade(circles[i].color, circles[i].alpha)
        );
      }

      rl.Core.DrawRectangle(20, screenHeight - 20 - 12, screenWidth - 40, 12, rl.C.LIGHTGRAY);
      rl.Core.DrawRectangle(20, screenHeight - 20 - 12, timePlayed.toInt(), 12, rl.C.MAROON);
      rl.Core.DrawRectangleLines(20, screenHeight - 20 - 12, screenWidth - 40, 12, rl.C.GRAY);

      rl.Core.DrawRectangle(20, 20, 425, 145, rl.C.WHITE);
      rl.Core.DrawRectangleLines(20, 20, 425, 145, rl.C.GRAY);
      rl.Core.DrawText("PRESS SPACE TO RESTART MUSIC".toC, 40, 40, 20, rl.C.BLACK);
      rl.Core.DrawText("PRESS P TO PAUSE/RESUME".toC, 40, 70, 20, rl.C.BLACK);
      rl.Core.DrawText("PRESS UP/DOWN TO CHANGE SPEED".toC, 40, 100, 20, rl.C.BLACK);
      rl.Core.DrawText("SPEED: ${pitch.f2}".toC, 40, 130, 20, rl.C.MAROON);

    rl.Core.EndDrawing();
  }

  rl.Audio.UnloadMusicStream(music);
  rl.Audio.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}