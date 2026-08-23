// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_stream_effects.c
// Run it: dart run audio_stream_effects.dart
// WARNING: expects resources from the raylib source
// WARNING: NO EFFECTS, see LIMITATIONS.md
import 'dart:typed_data';
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late MemoryPointer<RFloat32> delayBuffer;
int delayBufferSize = 0;
int delayReadIndex = 2;
int delayWriteIndex = 0;

AudioCallbackD AudioProcessEffectLPF = .function((buffer, frames) {
  final low = <double>[0.0, 0.0];
  final cutoff = 70.0 / 44100.0;
  final k = cutoff / (cutoff + 0.1591549431);

  final bufferData = buffer.asView<Float32List>(frames * 2);
  for (int i = 0; i < frames*2; i += 2)
  {
    final l = bufferData[i];
    final r = bufferData[i + 1];

    low[0] += k * (l - low[0]);
    low[1] += k * (r - low[1]);
    bufferData[i] = low[0];
    bufferData[i + 1] = low[1];
  }
});

AudioCallbackD AudioProcessEffectDelay = .function((buffer, frames) {
  final bufferData = buffer.asView<Float32List>(frames * 2);
  for (int i = 0; i < frames*2; i += 2)
  {
    final leftDelay = delayBuffer[delayReadIndex++];
    final rightDelay = delayBuffer[delayReadIndex++];

    if (delayReadIndex == delayBufferSize) delayReadIndex = 0;

    bufferData[i] = 0.5*bufferData[i] + 0.5*leftDelay;
    bufferData[i + 1] = 0.5*bufferData[i + 1] + 0.5*rightDelay;

    delayBuffer[delayWriteIndex++] = bufferData[i];
    delayBuffer[delayWriteIndex++] = bufferData[i + 1];
    if (delayWriteIndex == delayBufferSize) delayWriteIndex = 0;
  }
});

void main() async {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "audio_stream_effects");
  SetTargetFPS(60);

  InitAudioDevice();

  final music = LoadMusicStream("../resources/country.mp3");

  delayBufferSize = 48000*2;
  delayBuffer = Float32$.At('delayBuffer', delayBufferSize).cast<RFloat32>();

  PlayMusicStream(music);

  double timePlayed = 0.0;
  bool pause = false;
  
  bool enableEffectLPF = false;
  bool enableEffectDelay = false;

  while (!WindowShouldClose())
  {
    UpdateMusicStream(music);

    if (IsKeyPressed(.KEY_SPACE))
    {
      StopMusicStream(music);
      PlayMusicStream(music);
    }

    if (IsKeyPressed(.KEY_P))
    {
      pause = !pause;

      if (pause) PauseMusicStream(music);
      else ResumeMusicStream(music);
    }

    if (IsKeyPressed(.KEY_F))
    {
      enableEffectLPF = !enableEffectLPF;
      if (enableEffectLPF) AttachAudioStreamProcessor(music.stream, AudioProcessEffectLPF);
      else DetachAudioStreamProcessor(music.stream, AudioProcessEffectLPF, keepAlive: true);
    }

    if (IsKeyPressed(.KEY_D))
    {
      enableEffectDelay = !enableEffectDelay;
      if (enableEffectDelay) AttachAudioStreamProcessor(music.stream, AudioProcessEffectDelay);
      else DetachAudioStreamProcessor(music.stream, AudioProcessEffectDelay, keepAlive: true);
    }
    
    timePlayed = GetMusicTimePlayed(music)/GetMusicTimeLength(music);

    if (timePlayed > 1.0) timePlayed = 1.0;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText("MUSIC SHOULD BE PLAYING!", 245, 150, 20, .LIGHTGRAY);

      DrawRectangle(200, 180, 400, 12, .LIGHTGRAY);
      DrawRectangle(200, 180, (timePlayed*400.0).toInt(), 12, .MAROON);
      DrawRectangleLines(200, 180, 400, 12, .GRAY);

      DrawText("PRESS SPACE TO RESTART MUSIC", 215, 230, 20, .LIGHTGRAY);
      DrawText("PRESS P TO PAUSE/RESUME MUSIC", 208, 260, 20, .LIGHTGRAY);
      
      DrawText("PRESS F TO TOGGLE LPF EFFECT: ${enableEffectLPF ? "ON" : "OFF"}", 200, 320, 20, .GRAY);
      DrawText("PRESS D TO TOGGLE DELAY EFFECT: ${enableEffectDelay ? "ON" : "OFF"}", 180, 350, 20, .GRAY);

    EndDrawing();

    // NOTE: crucial, see LIMITATIONS.md
    await Future.delayed(Duration.zero);
  }

  UnloadMusicStream(music);

  CloseAudioDevice();

  CloseWindowAndDispose();
}