// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_sound_loading.c
// Run it: dart run audio_sound_loading.dart
// WARNING: expects resources from the raylib source
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "audio_sound_loading".toC);
  SetTargetFPS(60);

  InitAudioDevice();

  final fxWav = LoadSound("../resources/sound.wav".toC);
  final fxOgg = LoadSound("../resources/target.ogg".toC);

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) {
      PlaySound(fxWav);
    }

    if (IsKeyPressed(KeyboardKey.KEY_ENTER.value)) {
      PlaySound(fxOgg);
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);
      DrawText(
        "Press SPACE to PLAY the WAV sound!".toC,
        200, 180, 20, LIGHTGRAY
      );
      DrawText(
        "Press ENTER to PLAY the OGG sound!".toC,
        200, 220, 20, LIGHTGRAY
      );

    EndDrawing();
  }

  UnloadSound(fxWav);
  UnloadSound(fxOgg);
  CloseAudioDevice();
  
  CloseWindowAndDispose();
}