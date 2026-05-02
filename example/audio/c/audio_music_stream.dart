// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_music_stream.c
// Run it: dart run audio_music_stream.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "audio_music_stream".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(30);

  rl.Audio.SetAudioStreamBufferSizeDefault(8192);
  rl.Audio.InitAudioDevice();

  final music = rl.Audio.LoadMusicStream("../resources/country.mp3".toC);
  rl.Audio.PlayMusicStream(music);

  double timePlayed = 0;
  bool pause = false;

  double pan = 0.5;
  rl.Audio.SetMusicPan(music, pan);

  double volume = 0.8;
  rl.Audio.SetMusicVolume(music, volume);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Audio.UpdateMusicStream(music);

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value)) {
      rl.Audio.StopMusicStream(music);
      rl.Audio.PlayMusicStream(music);
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_P.value)) {
      pause = !pause;

      if (pause) {
        rl.Audio.PauseMusicStream(music);
      } else {
        rl.Audio.ResumeMusicStream(music);
      }
    }

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT.value)) {
      pan -= 0.05;
      if (pan < 0) pan = 0;
      rl.Audio.SetMusicPan(music, 1 - pan);
    } else if (rl.Core.IsKeyDown(KeyboardKey.KEY_RIGHT.value)) {
      pan += 0.05;
      if (pan > 1) pan = 1;
      rl.Audio.SetMusicPan(music, 1 - pan);
    }

    if (rl.Core.IsKeyDown(KeyboardKey.KEY_DOWN.value)) {
      volume -= 0.05;
      if (volume < 0) volume = 0;
      rl.Audio.SetMusicVolume(music, volume);
    } else if (rl.Core.IsKeyDown(KeyboardKey.KEY_UP.value)) {
      volume += 0.05;
      if (volume > 1) volume = 1;
      rl.Audio.SetMusicVolume(music, volume);
    }

    timePlayed = rl.Audio.GetMusicTimePlayed(music) / rl.Audio.GetMusicTimeLength(music);
    if (timePlayed > 1) timePlayed = 1;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.DrawText("MUSIC SHOULD BE PLAYING!".toC, 255, 150, 20, rl.C.LIGHTGRAY);

      rl.Core.DrawText("LEFT-RIGHT for PAN CONTROL".toC, 320, 74, 10, rl.C.DARKBLUE);
      rl.Core.DrawRectangle(300, 100, 200, 12, rl.C.LIGHTGRAY);
      rl.Core.DrawRectangleLines(300, 100, 200, 12, rl.C.GRAY);
      rl.Core.DrawRectangle(rl.Remap(pan, 0, 1, 300, 500).toInt(), 92, 10, 28, rl.C.DARKGRAY);

      rl.Core.DrawRectangle(200, 200, 400, 12, rl.C.LIGHTGRAY);
      rl.Core.DrawRectangle(200, 200, (timePlayed*400.0).toInt(), 12, rl.C.MAROON);
      rl.Core.DrawRectangleLines(200, 200, 400, 12, rl.C.GRAY);

      rl.Core.DrawText("PRESS SPACE TO RESTART MUSIC".toC, 215, 250, 20, rl.C.LIGHTGRAY);
      rl.Core.DrawText("PRESS P TO PAUSE/RESUME MUSIC".toC, 208, 280, 20, rl.C.LIGHTGRAY);

      rl.Core.DrawText("UP-DOWN for VOLUME CONTROL".toC, 320, 334, 10, rl.C.DARKGREEN);
      rl.Core.DrawRectangle(300, 360, 200, 12, rl.C.LIGHTGRAY);
      rl.Core.DrawRectangleLines(300, 360, 200, 12, rl.C.GRAY);
      rl.Core.DrawRectangle((300 + volume*200 - 5).toInt(), 352, 10, 28, rl.C.DARKGRAY);

    rl.Core.EndDrawing();
  }

  rl.Audio.UnloadMusicStream(music);
  rl.Audio.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}