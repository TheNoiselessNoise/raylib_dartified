// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_raw_stream.c
// Run it: dart run audio_raw_stream.dart
// WARNING: NO SOUND, see LIMITATIONS.md
import 'dart:ffi';
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_SAMPLES = 512;
const int MAX_SAMPLES_PER_UPDATE = 4096;

double frequency = 440.0;
double audioFrequency = 440.0;
double oldFrequency = 1.0;
double sineIdx = 0.0;

late Raylib rl;

void main() async {
  rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "audio_raw_stream".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(30);

  rl.Audio.InitAudioDevice();

  rl.Audio.SetAudioStreamBufferSizeDefault(MAX_SAMPLES_PER_UPDATE);

  final stream = rl.Audio.LoadAudioStream(44100, 16, 1);

  final AudioInputCallback = NativeCallable<AudioCallbackFunctionC>.listener(AudioInputCallbackCallback);
  rl.Audio.SetAudioStreamCallback(stream, AudioInputCallback.nativeFunction);

  final data = rl.Temp.Short$.At('data', MAX_SAMPLES);

  rl.Audio.PlayAudioStream(stream);

  final mousePosition = rl.Temp.Vector2$.At('mousePosition').set(-100.0, -100.0);

  int waveLength = 1;

  final position = rl.Temp.Vector2$.At('position').set(0, 0);

  while (!rl.Core.WindowShouldClose())
  {
    mousePosition.setC(rl.Core.GetMousePosition());

    if (rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value))
    {
      final fp = mousePosition.ref.y;
      frequency = 40.0 + fp;

      final pan = mousePosition.ref.x / screenWidth;
      rl.Audio.SetAudioStreamPan(stream, pan);
    }

    if (frequency != oldFrequency)
    {
      waveLength = 22050~/frequency;
      if (waveLength > MAX_SAMPLES/2) waveLength = MAX_SAMPLES~/2;
      if (waveLength < 1) waveLength = 1;

      for (int i = 0; i < waveLength*2; i++)
      {
        data[i] = (math.sin(((2*rl.PI*i/waveLength)))*32000).toInt();
      }
      for (int j = waveLength*2; j < MAX_SAMPLES; j++)
      {
        data[j] = 0;
      }

      oldFrequency = frequency;
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.DrawText("sine frequency: ${frequency.toInt()}".toC, rl.Core.GetScreenWidth() - 220, 10, 20, rl.C.RED);
      rl.Core.DrawText("click mouse button to change frequency or pan".toC, 10, 10, 20, rl.C.DARKGRAY);

      for (int i = 0; i < screenWidth; i++)
      {
        position.ref.x = i.toDouble();
        position.ref.y = 250 + 50*data[i*MAX_SAMPLES~/screenWidth]/32000.0;

        rl.Core.DrawPixelV(position.ref, rl.C.RED);
      }

    rl.Core.EndDrawing();

    // NOTE: crucial, see LIMITATIONS.md
    await Future.delayed(Duration.zero);
  }

  rl.Audio.UnloadAudioStream(stream);
  AudioInputCallback.close();

  rl.Audio.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}

void AudioInputCallbackCallback(Pointer<Void> buffer, int frames)
{
  audioFrequency = frequency + (audioFrequency - frequency)*0.95;

  final incr = audioFrequency/44100.0;
  final d = buffer.cast<Short>();

  for (int i = 0; i < frames; i++)
  {
    d[i] = (32000.0*math.sin(2*rl.PI*sineIdx)).toInt();
    sineIdx += incr;
    if (sineIdx > 1.0) sineIdx -= 1.0;
  }
}