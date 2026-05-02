// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_sound_multi.c
// Run it: dart run audio_sound_multi.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_SOUNDS = 10;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "audio_sound_multi".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  rl.Audio.InitAudioDevice();

  int currentSound = 0;
  final soundArray = rl.Temp.Sound$.FillWith(MAX_SOUNDS, (ptr, i) => switch(i) {
    0 => rl.Audio.LoadSound("../resources/sound.wav".toC),
    _ => rl.Audio.LoadSoundAlias(ptr[0]),
  });

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value))
    {
      rl.Audio.PlaySound(soundArray[currentSound]);
      currentSound++;
      if (currentSound >= MAX_SOUNDS)
        currentSound = 0;
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.DrawText("Press SPACE to PLAY a WAV sound!".toC, 200, 180, 20, rl.C.LIGHTGRAY);

    rl.Core.EndDrawing();
  }

  for (int i = 1; i < MAX_SOUNDS; i++)
    rl.Audio.UnloadSoundAlias(soundArray[i]);
  rl.Audio.UnloadSound(soundArray[0]);

  rl.Audio.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}