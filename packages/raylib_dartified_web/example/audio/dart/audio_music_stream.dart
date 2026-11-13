// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_music_stream.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

void main() => Raylib((rl) {
  InitWindow(800, 450, "audio_music_stream");
  SetTargetFPS(30);

  SetAudioStreamBufferSizeDefault(8192);
  InitAudioDevice();

  final music = LoadMusicStream("../resources/country.mp3");
  PlayMusicStream(music);

  double timePlayed = 0;
  bool pause = false;

  double pan = 0.5;
  SetMusicPan(music, pan);

  double volume = 0.8;
  SetMusicVolume(music, volume);

  rl.setMainLoop(() {
    UpdateMusicStream(music);

    if (IsKeyPressed(.KEY_SPACE)) {
      StopMusicStream(music);
      PlayMusicStream(music);
    }

    if (IsKeyPressed(.KEY_P)) {
      pause = !pause;

      if (pause) {
        PauseMusicStream(music);
      } else {
        ResumeMusicStream(music);
      }
    }

    if (IsKeyDown(.KEY_LEFT)) {
      pan -= 0.05;
      if (pan < -1) pan = -1;
      SetMusicPan(music, pan);
    } else if (IsKeyDown(.KEY_RIGHT)) {
      pan += 0.05;
      if (pan > 1) pan = 1;
      SetMusicPan(music, pan);
    }

    if (IsKeyDown(.KEY_DOWN)) {
      volume -= 0.05;
      if (volume < 0) volume = 0;
      SetMusicVolume(music, volume);
    } else if (IsKeyDown(.KEY_UP)) {
      volume += 0.05;
      if (volume > 1) volume = 1;
      SetMusicVolume(music, volume);
    }

    timePlayed = GetMusicTimePlayed(music) / GetMusicTimeLength(music);
    if (timePlayed > 1) timePlayed = 1;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText("MUSIC SHOULD BE PLAYING!", 255, 150, 20, .LIGHTGRAY);

      DrawText("LEFT-RIGHT for PAN CONTROL", 320, 74, 10, .DARKBLUE);
      DrawRectangle(300, 100, 200, 12, .LIGHTGRAY);
      DrawRectangleLines(300, 100, 200, 12, .GRAY);
      DrawRectangle(Remap(pan, -1, 1, 300, 500), 92, 10, 28, .DARKGRAY);

      DrawRectangle(200, 200, 400, 12, .LIGHTGRAY);
      DrawRectangle(200, 200, timePlayed*400.0, 12, .MAROON);
      DrawRectangleLines(200, 200, 400, 12, .GRAY);

      DrawText("PRESS SPACE TO RESTART MUSIC", 215, 250, 20, .LIGHTGRAY);
      DrawText("PRESS P TO PAUSE/RESUME MUSIC", 208, 280, 20, .LIGHTGRAY);

      DrawText("UP-DOWN for VOLUME CONTROL", 320, 334, 10, .DARKGREEN);
      DrawRectangle(300, 360, 200, 12, .LIGHTGRAY);
      DrawRectangleLines(300, 360, 200, 12, .GRAY);
      DrawRectangle(300 + volume*200 - 5, 352, 10, 28, .DARKGRAY);

    EndDrawing();
  });
});