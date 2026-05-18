// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_mixed_processor.c
// Run it: dart run audio_mixed_processor.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

double exponent = 1.0;
late Pointer<Float> averageVolume;

void main() async {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  averageVolume = rl.Temp.Float32$.At('averageVolume', 400);

  rl.Core.InitWindow(screenWidth, screenHeight, "audio_mixed_processor".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  rl.Audio.InitAudioDevice();

  final ProcessAudio = NativeCallable<AudioCallbackFunctionC>.listener(ProcessAudioCallback);
  rl.Audio.AttachAudioMixedProcessor(ProcessAudio.nativeFunction);

  final music = rl.Audio.LoadMusicStream("../resources/country.mp3".toC);
  final sound = rl.Audio.LoadSound("../resources/coin.wav".toC);

  rl.Audio.PlayMusicStream(music);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Audio.UpdateMusicStream(music);

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_LEFT.value)) exponent -= 0.05;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) exponent += 0.05;

    if (exponent <= 0.5) exponent = 0.5;
    if (exponent >= 3.0) exponent = 3.0;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value)) rl.Audio.PlaySound(sound);

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawText("MUSIC SHOULD BE PLAYING!".toC, 255, 150, 20, rl.Color.LIGHTGRAY);

      rl.Core.DrawText("EXPONENT = ${exponent.f2}".toC, 215, 180, 20, rl.Color.LIGHTGRAY);

      rl.Core.DrawRectangle(199, 199, 402, 34, rl.Color.LIGHTGRAY);
      for (int i = 0; i < 400; i++)
      {
        rl.Core.DrawLine(201 + i, 232 - (averageVolume[i] * 32).toInt(), 201 + i, 232, rl.Color.MAROON);
      }
      rl.Core.DrawRectangleLines(199, 199, 402, 34, rl.Color.GRAY);

      rl.Core.DrawText("PRESS SPACE TO PLAY OTHER SOUND".toC, 200, 250, 20, rl.Color.LIGHTGRAY);
      rl.Core.DrawText("USE LEFT AND RIGHT ARROWS TO ALTER DISTORTION".toC, 140, 280, 20, rl.Color.LIGHTGRAY);

    rl.Core.EndDrawing();

    // NOTE: crucial, see LIMITATIONS.md
    await Future.delayed(Duration.zero);
  }

  rl.Audio.UnloadMusicStream(music);
  rl.Audio.DetachAudioMixedProcessor(ProcessAudio.nativeFunction);
  ProcessAudio.close();

  rl.Audio.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}

void ProcessAudioCallback(Pointer<Void> buffer, int frames)
{
  final samples = buffer.cast<Float>();
  double average = 0.0;

  for (int frame = 0; frame < frames; frame++)
  {
    double left = samples[frame * 2 + 0], right = samples[frame * 2 + 1];

    left = math.pow(left.abs(), exponent) * ( (left < 0.0) ? -1.0 : 1.0 );
    samples[frame * 2 + 0] = left;

    right = math.pow(right.abs(), exponent) * ( (right < 0.0) ? -1.0 : 1.0 );
    samples[frame * 2 + 1] = right;

    average += left.abs() / frames;
    average += right.abs() / frames;
  }

  for (int i = 0; i < 399; i++) averageVolume[i] = averageVolume[i + 1];

  averageVolume[399] = average;
}