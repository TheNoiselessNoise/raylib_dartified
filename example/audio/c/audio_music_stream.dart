// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_music_stream.c
// Run it: dart run audio_music_stream.dart
// WARNING: expects resources from the raylib source
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "audio_music_stream".toC);
  SetTargetFPS(30);

  SetAudioStreamBufferSizeDefault(8192);
  InitAudioDevice();

  final music = LoadMusicStream("../resources/country.mp3".toC);
  PlayMusicStream(music);

  double timePlayed = 0;
  bool pause = false;

  double pan = 0.5;
  SetMusicPan(music, pan);

  double volume = 0.8;
  SetMusicVolume(music, volume);

  while (!WindowShouldClose())
  {
    UpdateMusicStream(music);

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) {
      StopMusicStream(music);
      PlayMusicStream(music);
    }

    if (IsKeyPressed(KeyboardKey.KEY_P.value)) {
      pause = !pause;

      if (pause) {
        PauseMusicStream(music);
      } else {
        ResumeMusicStream(music);
      }
    }

    if (IsKeyDown(KeyboardKey.KEY_LEFT.value)) {
      pan -= 0.05;
      if (pan < 0) pan = 0;
      SetMusicPan(music, 1 - pan);
    } else if (IsKeyDown(KeyboardKey.KEY_RIGHT.value)) {
      pan += 0.05;
      if (pan > 1) pan = 1;
      SetMusicPan(music, 1 - pan);
    }

    if (IsKeyDown(KeyboardKey.KEY_DOWN.value)) {
      volume -= 0.05;
      if (volume < 0) volume = 0;
      SetMusicVolume(music, volume);
    } else if (IsKeyDown(KeyboardKey.KEY_UP.value)) {
      volume += 0.05;
      if (volume > 1) volume = 1;
      SetMusicVolume(music, volume);
    }

    timePlayed = GetMusicTimePlayed(music) / GetMusicTimeLength(music);
    if (timePlayed > 1) timePlayed = 1;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText("MUSIC SHOULD BE PLAYING!".toC, 255, 150, 20, LIGHTGRAY);

      DrawText("LEFT-RIGHT for PAN CONTROL".toC, 320, 74, 10, DARKBLUE);
      DrawRectangle(300, 100, 200, 12, LIGHTGRAY);
      DrawRectangleLines(300, 100, 200, 12, GRAY);
      DrawRectangle(Remap(pan, 0, 1, 300, 500).toInt(), 92, 10, 28, DARKGRAY);

      DrawRectangle(200, 200, 400, 12, LIGHTGRAY);
      DrawRectangle(200, 200, (timePlayed*400.0).toInt(), 12, MAROON);
      DrawRectangleLines(200, 200, 400, 12, GRAY);

      DrawText("PRESS SPACE TO RESTART MUSIC".toC, 215, 250, 20, LIGHTGRAY);
      DrawText("PRESS P TO PAUSE/RESUME MUSIC".toC, 208, 280, 20, LIGHTGRAY);

      DrawText("UP-DOWN for VOLUME CONTROL".toC, 320, 334, 10, DARKGREEN);
      DrawRectangle(300, 360, 200, 12, LIGHTGRAY);
      DrawRectangleLines(300, 360, 200, 12, GRAY);
      DrawRectangle((300 + volume*200 - 5).toInt(), 352, 10, 28, DARKGRAY);

    EndDrawing();
  }

  UnloadMusicStream(music);
  CloseAudioDevice();

  CloseWindowAndDispose();
}