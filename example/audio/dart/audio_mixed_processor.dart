// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_mixed_processor.c
// Run it: dart run audio_mixed_processor.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

double exponent = 1;
final List<double> averageVolume = .filled(400, 0.0);

void main() async {
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "audio_mixed_processor");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  rl.AudioD.InitAudioDevice();

  rl.AudioD.AttachAudioMixedProcessor(.function((buffer, frames) {
    Pointer<Float> samples = buffer.cast<Float>();
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
  }));

  final music = rl.AudioD.LoadMusicStream("../resources/country.mp3");
  final sound = rl.AudioD.LoadSound("../resources/coin.wav");

  rl.AudioD.PlayMusicStream(music);

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.AudioD.UpdateMusicStream(music);

    if (rl.CoreD.IsKeyPressed(.KEY_LEFT)) exponent -= 0.05;
    if (rl.CoreD.IsKeyPressed(.KEY_RIGHT)) exponent += 0.05;

    if (exponent <= 0.5) exponent = 0.5;
    if (exponent >= 3.0) exponent = 3.0;

    if (rl.CoreD.IsKeyPressed(.KEY_SPACE)) rl.AudioD.PlaySound(sound);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText("MUSIC SHOULD BE PLAYING!", 255, 150, 20, .LIGHTGRAY);

      rl.CoreD.DrawText("EXPONENT = ${exponent.f2}", 215, 180, 20, .LIGHTGRAY);

      rl.CoreD.DrawRectangle(199, 199, 402, 34, .LIGHTGRAY);
      for (int i = 0; i < 400; i++)
      {
        rl.CoreD.DrawLine(201 + i, 232 - (averageVolume[i] * 32).toInt(), 201 + i, 232, .MAROON);
      }
      rl.CoreD.DrawRectangleLines(199, 199, 402, 34, .GRAY);

      rl.CoreD.DrawText("PRESS SPACE TO PLAY OTHER SOUND", 200, 250, 20, .LIGHTGRAY);
      rl.CoreD.DrawText("USE LEFT AND RIGHT ARROWS TO ALTER DISTORTION", 140, 280, 20, .LIGHTGRAY);

    rl.CoreD.EndDrawing();

    // NOTE: crucial, see LIMITATIONS.md
    await Future.delayed(Duration.zero);
  }

  rl.AudioD.UnloadMusicStream(music);

  rl.AudioD.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}