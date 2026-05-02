// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_sound_loading.c
// Run it: dart run audio_sound_loading.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(800, 450, "audio_sound_loading");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  rl.AudioD.InitAudioDevice();

  final fxWav = rl.AudioD.LoadSound("../resources/sound.wav");
  final fxOgg = rl.AudioD.LoadSound("../resources/target.ogg");

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyPressed(.KEY_SPACE)) {
      rl.AudioD.PlaySound(fxWav);
    }

    if (rl.CoreD.IsKeyPressed(.KEY_ENTER)) {
      rl.AudioD.PlaySound(fxOgg);
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);
      rl.CoreD.DrawText(
        "Press SPACE to PLAY the WAV sound!",
        200, 180, 20, .LIGHTGRAY
      );
      rl.CoreD.DrawText(
        "Press ENTER to PLAY the OGG sound!",
        200, 220, 20, .LIGHTGRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.AudioD.UnloadSound(fxWav);
  rl.AudioD.UnloadSound(fxOgg);
  rl.AudioD.CloseAudioDevice();
  
  rl.CloseWindowAndDispose();
}