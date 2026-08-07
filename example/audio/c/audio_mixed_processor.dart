// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_mixed_processor.c
// Run it: dart run audio_mixed_processor.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

double exponent = 1.0;
late Pointer<Float> averageVolume;

void main() async {
  findRaylib('raylib-6.0_linux_amd64/lib');

  averageVolume = Float32$.At('averageVolume', 400);

  InitWindow(screenWidth, screenHeight, "audio_mixed_processor".toC);
  SetTargetFPS(60);

  InitAudioDevice();

  final ProcessAudio = NativeCallable<AudioCallbackFunctionC>.listener(ProcessAudioCallback);
  AttachAudioMixedProcessor(ProcessAudio.nativeFunction);

  final music = LoadMusicStream("../resources/country.mp3".toC);
  final sound = LoadSound("../resources/coin.wav".toC);

  PlayMusicStream(music);

  while (!WindowShouldClose())
  {
    UpdateMusicStream(music);

    if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) exponent -= 0.05;
    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) exponent += 0.05;

    if (exponent <= 0.5) exponent = 0.5;
    if (exponent >= 3.0) exponent = 3.0;

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) PlaySound(sound);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText("MUSIC SHOULD BE PLAYING!".toC, 255, 150, 20, LIGHTGRAY);

      DrawText("EXPONENT = ${exponent.f2}".toC, 215, 180, 20, LIGHTGRAY);

      DrawRectangle(199, 199, 402, 34, LIGHTGRAY);
      for (int i = 0; i < 400; i++)
      {
        DrawLine(201 + i, 232 - (averageVolume[i] * 32).toInt(), 201 + i, 232, MAROON);
      }
      DrawRectangleLines(199, 199, 402, 34, GRAY);

      DrawText("PRESS SPACE TO PLAY OTHER SOUND".toC, 200, 250, 20, LIGHTGRAY);
      DrawText("USE LEFT AND RIGHT ARROWS TO ALTER DISTORTION".toC, 140, 280, 20, LIGHTGRAY);

    EndDrawing();

    // NOTE: crucial, see LIMITATIONS.md
    await Future.delayed(Duration.zero);
  }

  UnloadMusicStream(music);
  DetachAudioMixedProcessor(ProcessAudio.nativeFunction);
  ProcessAudio.close();

  CloseAudioDevice();

  CloseWindowAndDispose();
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