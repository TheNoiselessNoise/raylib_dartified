// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_raw_stream.c
// Run it: dart run audio_raw_stream.dart
// WARNING: NO SOUND, see LIMITATIONS.md
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_SAMPLES = 512;
const int MAX_SAMPLES_PER_UPDATE = 4096;

double frequency = 440.0;
double audioFrequency = 440.0;
double oldFrequency = 1.0;
double sineIdx = 0.0;

void main() async {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "audio_raw_stream".toC);
  SetTargetFPS(30);

  InitAudioDevice();

  SetAudioStreamBufferSizeDefault(MAX_SAMPLES_PER_UPDATE);

  final stream = LoadAudioStream(44100, 16, 1);

  final AudioInputCallback = NativeCallable<AudioCallbackFunctionC>.listener(AudioInputCallbackCallback);
  SetAudioStreamCallback(stream, AudioInputCallback.nativeFunction);

  final data = Short$.val.At('data', MAX_SAMPLES);

  PlayAudioStream(stream);

  final mousePosition = Vector2$.val.At('mousePosition').set(-100.0, -100.0);

  int waveLength = 1;

  final position = Vector2$.val.At('position').set(0, 0);

  while (!WindowShouldClose())
  {
    mousePosition.setC(GetMousePosition());

    if (IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value))
    {
      final fp = mousePosition.ref.y;
      frequency = 40.0 + fp;

      final pan = mousePosition.ref.x / screenWidth;
      SetAudioStreamPan(stream, pan);
    }

    if (frequency != oldFrequency)
    {
      waveLength = 22050~/frequency;
      if (waveLength > MAX_SAMPLES/2) waveLength = MAX_SAMPLES~/2;
      if (waveLength < 1) waveLength = 1;

      for (int i = 0; i < waveLength*2; i++)
      {
        data[i] = (math.sin(((2*PI*i/waveLength)))*32000).toInt();
      }
      for (int j = waveLength*2; j < MAX_SAMPLES; j++)
      {
        data[j] = 0;
      }

      oldFrequency = frequency;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText("sine frequency: ${frequency.toInt()}".toC, GetScreenWidth() - 220, 10, 20, RED);
      DrawText("click mouse button to change frequency or pan".toC, 10, 10, 20, DARKGRAY);

      for (int i = 0; i < screenWidth; i++)
      {
        position.ref.x = i.toDouble();
        position.ref.y = 250 + 50*data[i*MAX_SAMPLES~/screenWidth]/32000.0;

        DrawPixelV(position.ref, RED);
      }

    EndDrawing();

    // NOTE: crucial, see LIMITATIONS.md
    await Future.delayed(Duration.zero);
  }

  UnloadAudioStream(stream);
  AudioInputCallback.close();

  CloseAudioDevice();

  CloseWindowAndDispose();
}

void AudioInputCallbackCallback(Pointer<Void> buffer, int frames)
{
  audioFrequency = frequency + (audioFrequency - frequency)*0.95;

  final incr = audioFrequency/44100.0;
  final d = buffer.cast<Short>();

  for (int i = 0; i < frames; i++)
  {
    d[i] = (32000.0*math.sin(2*PI*sineIdx)).toInt();
    sineIdx += incr;
    if (sineIdx > 1.0) sineIdx -= 1.0;
  }
}