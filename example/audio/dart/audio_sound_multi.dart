// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_sound_multi.c
// Run it: dart run audio_sound_multi.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_SOUNDS = 10;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "audio_sound_multi");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  rl.AudioD.InitAudioDevice();

  int currentSound = 0;
  final soundArray = <SoundD>[ rl.AudioD.LoadSound("../resources/sound.wav") ];
  for (int i = 1; i < MAX_SOUNDS; i++) {
    soundArray.add(rl.AudioD.LoadSoundAlias(soundArray[0]));
  }

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyPressed(.KEY_SPACE))
    {
      rl.AudioD.PlaySound(soundArray[currentSound]);
      currentSound++;
      if (currentSound >= MAX_SOUNDS)
        currentSound = 0;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText("Press SPACE to PLAY a WAV sound!", 200, 180, 20, .LIGHTGRAY);

    rl.CoreD.EndDrawing();
  }

  for (int i = 1; i < MAX_SOUNDS; i++)
    rl.AudioD.UnloadSoundAlias(soundArray[i]);
  rl.AudioD.UnloadSound(soundArray[0]);

  rl.AudioD.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}