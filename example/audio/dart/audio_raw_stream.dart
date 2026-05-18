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

void main() async {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "audio_raw_stream");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(30);

  rl.AudioD.InitAudioDevice();

  rl.AudioD.SetAudioStreamBufferSizeDefault(MAX_SAMPLES_PER_UPDATE);

  final stream = rl.AudioD.LoadAudioStream(44100, 16, 1);

  rl.AudioD.SetAudioStreamCallback(stream, .function((buffer, frames) {
    audioFrequency = frequency + (audioFrequency - frequency)*0.95;

    final incr = audioFrequency/44100.0;
    final d = buffer.cast<Short>();

    for (int i = 0; i < frames; i++)
    {
      d[i] = (32000.0*math.sin(2*rl.PI*sineIdx)).toInt();
      sineIdx += incr;
      if (sineIdx > 1.0) sineIdx -= 1.0;
    }
  }));

  final data = rl.Temp.Short$.At('data', MAX_SAMPLES);

  rl.AudioD.PlayAudioStream(stream);

  Vector2D mousePosition = .vec2(-100.0, -100.0);

  int waveLength = 1;

  final Vector2D position = .vec2(0, 0);

  while (!rl.CoreD.WindowShouldClose())
  {
    mousePosition = rl.CoreD.GetMousePosition();

    if (rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT))
    {
      final fp = mousePosition.y;
      frequency = 40.0 + fp;

      final pan = mousePosition.x / screenWidth;
      rl.AudioD.SetAudioStreamPan(stream, pan);
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

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText("sine frequency: ${frequency.toInt()}", rl.CoreD.GetScreenWidth() - 220, 10, 20, .RED);
      rl.CoreD.DrawText("click mouse button to change frequency or pan", 10, 10, 20, .DARKGRAY);

      for (int i = 0; i < screenWidth; i++)
      {
        position.x = i.toDouble();
        position.y = 250 + 50*data[i*MAX_SAMPLES~/screenWidth]/32000.0;

        rl.CoreD.DrawPixelV(position, .RED);
      }

    rl.CoreD.EndDrawing();

    // NOTE: crucial, see LIMITATIONS.md
    await Future.delayed(Duration.zero);
  }

  rl.AudioD.UnloadAudioStream(stream);

  rl.AudioD.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}