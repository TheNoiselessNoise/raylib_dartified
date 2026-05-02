// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_music_stream.c
// Run it: dart run audio_music_stream.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(800, 450, "audio_music_stream");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(30);

  rl.AudioD.SetAudioStreamBufferSizeDefault(8192);
  rl.AudioD.InitAudioDevice();

  final music = rl.AudioD.LoadMusicStream("../resources/country.mp3");
  rl.AudioD.PlayMusicStream(music);

  double timePlayed = 0;
  bool pause = false;

  double pan = 0.5;
  rl.AudioD.SetMusicPan(music, pan);

  double volume = 0.8;
  rl.AudioD.SetMusicVolume(music, volume);

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.AudioD.UpdateMusicStream(music);

    if (rl.CoreD.IsKeyPressed(.KEY_SPACE)) {
      rl.AudioD.StopMusicStream(music);
      rl.AudioD.PlayMusicStream(music);
    }

    if (rl.CoreD.IsKeyPressed(.KEY_P)) {
      pause = !pause;

      if (pause) {
        rl.AudioD.PauseMusicStream(music);
      } else {
        rl.AudioD.ResumeMusicStream(music);
      }
    }

    if (rl.CoreD.IsKeyDown(.KEY_LEFT)) {
      pan -= 0.05;
      if (pan < 0) pan = 0;
      rl.AudioD.SetMusicPan(music, 1 - pan);
    } else if (rl.CoreD.IsKeyDown(.KEY_RIGHT)) {
      pan += 0.05;
      if (pan > 1) pan = 1;
      rl.AudioD.SetMusicPan(music, 1 - pan);
    }

    if (rl.CoreD.IsKeyDown(.KEY_DOWN)) {
      volume -= 0.05;
      if (volume < 0) volume = 0;
      rl.AudioD.SetMusicVolume(music, volume);
    } else if (rl.CoreD.IsKeyDown(.KEY_UP)) {
      volume += 0.05;
      if (volume > 1) volume = 1;
      rl.AudioD.SetMusicVolume(music, volume);
    }

    timePlayed = rl.AudioD.GetMusicTimePlayed(music) / rl.AudioD.GetMusicTimeLength(music);
    if (timePlayed > 1) timePlayed = 1;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText("MUSIC SHOULD BE PLAYING!", 255, 150, 20, .LIGHTGRAY);

      rl.CoreD.DrawText("LEFT-RIGHT for PAN CONTROL", 320, 74, 10, .DARKBLUE);
      rl.CoreD.DrawRectangle(300, 100, 200, 12, .LIGHTGRAY);
      rl.CoreD.DrawRectangleLines(300, 100, 200, 12, .GRAY);
      rl.CoreD.DrawRectangle(rl.Remap(pan, 0, 1, 300, 500), 92, 10, 28, .DARKGRAY);

      rl.CoreD.DrawRectangle(200, 200, 400, 12, .LIGHTGRAY);
      rl.CoreD.DrawRectangle(200, 200, timePlayed*400.0, 12, .MAROON);
      rl.CoreD.DrawRectangleLines(200, 200, 400, 12, .GRAY);

      rl.CoreD.DrawText("PRESS SPACE TO RESTART MUSIC", 215, 250, 20, .LIGHTGRAY);
      rl.CoreD.DrawText("PRESS P TO PAUSE/RESUME MUSIC", 208, 280, 20, .LIGHTGRAY);

      rl.CoreD.DrawText("UP-DOWN for VOLUME CONTROL", 320, 334, 10, .DARKGREEN);
      rl.CoreD.DrawRectangle(300, 360, 200, 12, .LIGHTGRAY);
      rl.CoreD.DrawRectangleLines(300, 360, 200, 12, .GRAY);
      rl.CoreD.DrawRectangle(300 + volume*200 - 5, 352, 10, 28, .DARKGRAY);

    rl.CoreD.EndDrawing();
  }

  rl.AudioD.UnloadMusicStream(music);
  rl.AudioD.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}