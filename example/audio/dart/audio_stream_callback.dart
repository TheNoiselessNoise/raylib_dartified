// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_stream_callback.c
// Run it: dart run audio_stream_callback.dart
// WARNING: NO SOUND, see LIMITATIONS.md
import 'dart:math' as math;
import 'dart:typed_data';
import '../../base_dart.dart';

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

Float32List buffer = .new(SAMPLE_RATE);
List<AudioCallbackD> waveCallbacks = [
  .function(SineCallback),
  .function(SquareCallback),
  .function(TriangleCallback),
  .function(SawtoothCallback),
];

void main() async {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "audio_stream_callback");
  SetTargetFPS(30);

  InitAudioDevice();

  SetAudioStreamBufferSizeDefault(BUFFER_SIZE);

  final stream = LoadAudioStream(SAMPLE_RATE, 32, 1);
  PlayAudioStream(stream);

  WaveType waveType = .SINE;
  SetAudioStreamCallback(stream, waveCallbacks[waveType.index]);

  while (!WindowShouldClose())
  {
    if (IsKeyDown(.KEY_UP))
    {
      newWaveFrequency += 10;
      if (newWaveFrequency > 12500) newWaveFrequency = 12500;
    }

    if (IsKeyDown(.KEY_DOWN))
    {
      newWaveFrequency -= 10;
      if (newWaveFrequency < 20) newWaveFrequency = 20;
    }

    if (IsKeyPressed(.KEY_LEFT))
    {
      waveType = .values[(waveType.index - 1) % WaveType.values.length];
      SetAudioStreamCallback(stream, waveCallbacks[waveType.index]);
    }

    if (IsKeyPressed(.KEY_RIGHT))
    {
      waveType = .values[(waveType.index + 1) % WaveType.values.length];
      SetAudioStreamCallback(stream, waveCallbacks[waveType.index]);
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);
      DrawText("frequency: $newWaveFrequency", screenWidth - 220, 10, 20, RED);
      DrawText("wave type: ${waveType.name}", screenWidth - 220, 30, 20, RED);
      DrawText("Up/down to change frequency", 10, 10, 20, DARKGRAY);
      DrawText("Left/right to change wave type", 10, 30, 20, DARKGRAY);

      for (int i = 0; i < screenWidth; i++)
      {
        final idx1 = (SAMPLE_RATE - SAMPLE_RATE~/100 + i*(SAMPLE_RATE~/100)~/screenWidth).clamp(0, SAMPLE_RATE - 1);
        final idx2 = (SAMPLE_RATE - SAMPLE_RATE~/100 + (i+1)*(SAMPLE_RATE~/100)~/screenWidth).clamp(0, SAMPLE_RATE - 1);

        DrawLineV(
          .vec2(i, 250 - 50*buffer[idx1]),
          .vec2(i + 1, 250 - 50*buffer[idx2]),
          RED
        );
      }

    EndDrawing();

    // NOTE: crucial, see LIMITATIONS.md
    await Future.delayed(Duration.zero);
  }

  UnloadAudioStream(stream);
  CloseAudioDevice();

  CloseWindowAndDispose();
}

void SineCallback(MemoryPointer framesOut, int frameCount)
{
  final frames = framesOut.asView<Float32List>(frameCount * 2);

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

void SquareCallback(MemoryPointer framesOut, int frameCount)
{
  final frames = framesOut.asView<Float32List>(frameCount * 2);

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

void TriangleCallback(MemoryPointer framesOut, int frameCount)
{
  final frames = framesOut.asView<Float32List>(frameCount * 2);

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

void SawtoothCallback(MemoryPointer framesOut, int frameCount)
{
  final frames = framesOut.asView<Float32List>(frameCount * 2);

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
