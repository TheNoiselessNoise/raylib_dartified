// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_mixed_processor.c
// Run it: dart run audio_mixed_processor.dart
// WARNING: expects resources from the raylib source
import 'dart:math' as math;
import 'dart:typed_data';
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

double exponent = 1;
final List<double> averageVolume = .filled(400, 0.0);

void main() async {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "audio_mixed_processor");
  SetTargetFPS(60);

  InitAudioDevice();

  AttachAudioMixedProcessor(AudioCallbackD.function((buffer, frames) {
    final samples = buffer.asView<Float32List>(frames * 2);

    double average = 0.0;

    for (int frame = 0; frame < frames; frame++)
    {
      double left = samples[frame * 2 + 0], right = samples[frame * 2 + 1];

      if (left.abs() > 2.0 || right.abs() > 2.0 || left.isNaN || right.isNaN) {
        continue;
      }

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

  final music = LoadMusicStream("../resources/country.mp3");
  final sound = LoadSound("../resources/coin.wav");

  PlayMusicStream(music);

  while (!WindowShouldClose())
  {
    UpdateMusicStream(music);

    if (IsKeyPressed(.KEY_LEFT)) exponent -= 0.05;
    if (IsKeyPressed(.KEY_RIGHT)) exponent += 0.05;

    if (exponent <= 0.5) exponent = 0.5;
    if (exponent >= 3.0) exponent = 3.0;

    if (IsKeyPressed(.KEY_SPACE)) PlaySound(sound);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText("MUSIC SHOULD BE PLAYING!", 255, 150, 20, .LIGHTGRAY);

      DrawText("EXPONENT = ${exponent.f2}", 215, 180, 20, .LIGHTGRAY);

      DrawRectangle(199, 199, 402, 34, .LIGHTGRAY);
      for (int i = 0; i < 400; i++)
      {
        DrawLine(201 + i, 232 - averageVolume[i] * 32, 201 + i, 232, .MAROON);
      }
      DrawRectangleLines(199, 199, 402, 34, .GRAY);

      DrawText("PRESS SPACE TO PLAY OTHER SOUND", 200, 250, 20, .LIGHTGRAY);
      DrawText("USE LEFT AND RIGHT ARROWS TO ALTER DISTORTION", 140, 280, 20, .LIGHTGRAY);

    EndDrawing();

    // NOTE: crucial, see LIMITATIONS.md
    await Future.delayed(Duration.zero);
  }

  UnloadMusicStream(music);

  CloseAudioDevice();

  CloseWindowAndDispose();
}