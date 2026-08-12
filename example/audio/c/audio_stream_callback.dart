// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_stream_callback.c
// Run it: dart run audio_stream_callback.dart
// WARNING: NO SOUND, see LIMITATIONS.md
import 'dart:ffi';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const int BUFFER_SIZE = 4096;
const int SAMPLE_RATE = 44100;

enum WaveType {
  SINE,
  SQUARE,
  TRIANGLE,
  SAWTOOTH,
}

int waveFrequency = 440;
int newWaveFrequency = 440;
int waveIndex = 0;

late Pointer<Float> buffer;
List<NativeCallable<AudioCallbackFunctionC>> waveCallbacks = [
  .listener(SineCallback),
  .listener(SquareCallback),
  .listener(TriangleCallback),
  .listener(SawtoothCallback),
];

void main() async {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "audio_stream_callback".toC);
  SetTargetFPS(30);

  InitAudioDevice();

  buffer = calloc(SAMPLE_RATE);

  SetAudioStreamBufferSizeDefault(BUFFER_SIZE);

  final stream = LoadAudioStream(SAMPLE_RATE, 32, 1);
  PlayAudioStream(stream);

  WaveType waveType = .SINE;
  SetAudioStreamCallback(stream, waveCallbacks[waveType.index].nativeFunction);

  while (!WindowShouldClose())
  {
    if (IsKeyDown(KeyboardKey.KEY_UP.value))
    {
      newWaveFrequency += 10;
      if (newWaveFrequency > 12500) newWaveFrequency = 12500;
    }

    if (IsKeyDown(KeyboardKey.KEY_DOWN.value))
    {
      newWaveFrequency -= 10;
      if (newWaveFrequency < 20) newWaveFrequency = 20;
    }

    if (IsKeyPressed(KeyboardKey.KEY_LEFT.value))
    {
      waveType = .values[(waveType.index - 1) % WaveType.values.length];
      SetAudioStreamCallback(stream, waveCallbacks[waveType.index].nativeFunction);
    }

    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value))
    {
      waveType = .values[(waveType.index + 1) % WaveType.values.length];
      SetAudioStreamCallback(stream, waveCallbacks[waveType.index].nativeFunction);
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);
      DrawText("frequency: $newWaveFrequency".toC, screenWidth - 220, 10, 20, RED);
      DrawText("wave type: ${waveType.name}".toC, screenWidth - 220, 30, 20, RED);
      DrawText("Up/down to change frequency".toC, 10, 10, 20, DARKGRAY);
      DrawText("Left/right to change wave type".toC, 10, 30, 20, DARKGRAY);

      for (int i = 0; i < screenWidth; i++)
      {
        DrawLineV(
          Vector2$.val.$1.set(i, 250 - 50*buffer[SAMPLE_RATE - SAMPLE_RATE~/100 + i*SAMPLE_RATE~/100~/screenWidth]),
          Vector2$.val.$2.set(i + 1, 250 - 50*buffer[SAMPLE_RATE - SAMPLE_RATE~/100 + (i + 1)*SAMPLE_RATE~/100~/screenWidth]),
          RED
        );
      }

    EndDrawing();

    // NOTE: crucial, see LIMITATIONS.md
    await Future.delayed(Duration.zero);
  }

  for (final callback in waveCallbacks) callback.close();

  UnloadAudioStream(stream);
  CloseAudioDevice();

  CloseWindowAndDispose();
}

void SineCallback(Pointer<Void> framesOut, int frameCount)
{
  final frames = framesOut.cast<Float>();

  int wavelength = SAMPLE_RATE~/waveFrequency;

  for (int i = 0; i < frameCount; i++)
  {
    frames[i] = math.sin(2*PI*waveIndex/wavelength);

    waveIndex++;

    if (waveIndex >= wavelength)
    {
      waveFrequency = newWaveFrequency;
      waveIndex = 0;
    }
  }

  for (int i = 0; i < SAMPLE_RATE - frameCount; i++) buffer[i] = buffer[i + frameCount];
  for (int i = 0; i < frameCount; i++) buffer[SAMPLE_RATE - frameCount + i] = frames[i];
}

void SquareCallback(Pointer<Void> framesOut, int frameCount)
{
  final frames = framesOut.cast<Float>();

  int wavelength = SAMPLE_RATE~/waveFrequency;

  for (int i = 0; i < frameCount; i++)
  {
    frames[i] = (waveIndex < wavelength/2)? 1 : -1;
    waveIndex++;

    if (waveIndex >= wavelength)
    {
      waveFrequency = newWaveFrequency;
      waveIndex = 0;
    }
  }

  for (int i = 0; i < SAMPLE_RATE - frameCount; i++) buffer[i] = buffer[i + frameCount];
  for (int i = 0; i < frameCount; i++) buffer[SAMPLE_RATE - frameCount + i] = frames[i];
}

void TriangleCallback(Pointer<Void> framesOut, int frameCount)
{
  final frames = framesOut.cast<Float>();

  int wavelength = SAMPLE_RATE~/waveFrequency;

  for (int i = 0; i < frameCount; i++)
  {
    frames[i] = (waveIndex < wavelength/2)? (-1 + 2.0*waveIndex/(wavelength/2)) : (1 - 2.0*(waveIndex - wavelength/2)/(wavelength/2));
    waveIndex++;

    if (waveIndex >= wavelength)
    {
      waveFrequency = newWaveFrequency;
      waveIndex = 0;
    }
  }

  for (int i = 0; i < SAMPLE_RATE - frameCount; i++) buffer[i] = buffer[i + frameCount];
  for (int i = 0; i < frameCount; i++) buffer[SAMPLE_RATE - frameCount + i] = frames[i];
}

void SawtoothCallback(Pointer<Void> framesOut, int frameCount)
{
  final frames = framesOut.cast<Float>();

  int wavelength = SAMPLE_RATE~/waveFrequency;

  for (int i = 0; i < frameCount; i++)
  {
    frames[i] = -1 + 2.0*waveIndex/wavelength;
    waveIndex++;

    if (waveIndex >= wavelength)
    {
      waveFrequency = newWaveFrequency;
      waveIndex = 0;
    }
  }

  for (int i = 0; i < SAMPLE_RATE - frameCount; i++) buffer[i] = buffer[i + frameCount];
  for (int i = 0; i < frameCount; i++) buffer[SAMPLE_RATE - frameCount + i] = frames[i];
}
