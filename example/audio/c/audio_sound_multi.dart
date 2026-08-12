// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_sound_multi.c
// Run it: dart run audio_sound_multi.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_SOUNDS = 10;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "audio_sound_multi".toC);
  SetTargetFPS(60);

  InitAudioDevice();

  int currentSound = 0;
  final soundArray = Sound$.val.FillWith(MAX_SOUNDS, (ptr, i) => switch(i) {
    0 => LoadSound("../resources/sound.wav".toC),
    _ => LoadSoundAlias(ptr[0]),
  });

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value))
    {
      PlaySound(soundArray[currentSound]);
      currentSound++;
      if (currentSound >= MAX_SOUNDS)
        currentSound = 0;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText("Press SPACE to PLAY a WAV sound!".toC, 200, 180, 20, LIGHTGRAY);

    EndDrawing();
  }

  for (int i = 1; i < MAX_SOUNDS; i++)
    UnloadSoundAlias(soundArray[i]);
  UnloadSound(soundArray[0]);

  CloseAudioDevice();

  CloseWindowAndDispose();
}