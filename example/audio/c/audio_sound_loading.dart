// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_sound_loading.c
// Run it: dart run audio_sound_loading.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "audio_sound_loading".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  rl.Audio.InitAudioDevice();

  final fxWav = rl.Audio.LoadSound("../resources/sound.wav".toC);
  final fxOgg = rl.Audio.LoadSound("../resources/target.ogg".toC);

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value)) {
      rl.Audio.PlaySound(fxWav);
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_ENTER.value)) {
      rl.Audio.PlaySound(fxOgg);
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);
      rl.Core.DrawText(
        "Press SPACE to PLAY the WAV sound!".toC,
        200, 180, 20, rl.Color.LIGHTGRAY
      );
      rl.Core.DrawText(
        "Press ENTER to PLAY the OGG sound!".toC,
        200, 220, 20, rl.Color.LIGHTGRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Audio.UnloadSound(fxWav);
  rl.Audio.UnloadSound(fxOgg);
  rl.Audio.CloseAudioDevice();
  
  rl.CloseWindowAndDispose();
}