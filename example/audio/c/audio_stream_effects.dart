// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_stream_effects.c
// Run it: dart run audio_stream_effects.dart
// WARNING: expects resources from the raylib source
// WARNING: NO EFFECTS, see LIMITATIONS.md
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Pointer<Float> delayBuffer;
int delayBufferSize = 0;
int delayReadIndex = 2;
int delayWriteIndex = 0;

void main() async {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "audio_stream_effects".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  rl.Audio.InitAudioDevice();

  final music = rl.Audio.LoadMusicStream("../resources/country.mp3".toC);

  delayBufferSize = 48000*2;
  delayBuffer = rl.Temp.Float32$.At('delayBuffer', delayBufferSize);

  rl.Audio.PlayMusicStream(music);

  double timePlayed = 0.0;
  bool pause = false;
  
  bool enableEffectLPF = false;
  bool enableEffectDelay = false;

  final AudioProcessEffectLPF = NativeCallable<AudioCallbackFunctionC>.listener(AudioProcessEffectLPFCallback);
  final AudioProcessEffectDelay = NativeCallable<AudioCallbackFunctionC>.listener(AudioProcessEffectDelayCallback);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Audio.UpdateMusicStream(music);

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value))
    {
      rl.Audio.StopMusicStream(music);
      rl.Audio.PlayMusicStream(music);
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_P.value))
    {
      pause = !pause;

      if (pause) rl.Audio.PauseMusicStream(music);
      else rl.Audio.ResumeMusicStream(music);
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_F.value))
    {
      enableEffectLPF = !enableEffectLPF;
      if (enableEffectLPF) rl.Audio.AttachAudioStreamProcessor(music.stream, AudioProcessEffectLPF.nativeFunction);
      else rl.Audio.DetachAudioStreamProcessor(music.stream, AudioProcessEffectLPF.nativeFunction);
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_D.value))
    {
      enableEffectDelay = !enableEffectDelay;
      if (enableEffectDelay) rl.Audio.AttachAudioStreamProcessor(music.stream, AudioProcessEffectDelay.nativeFunction);
      else rl.Audio.DetachAudioStreamProcessor(music.stream, AudioProcessEffectDelay.nativeFunction);
    }
    
    timePlayed = rl.Audio.GetMusicTimePlayed(music)/rl.Audio.GetMusicTimeLength(music);

    if (timePlayed > 1.0) timePlayed = 1.0;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawText("MUSIC SHOULD BE PLAYING!".toC, 245, 150, 20, rl.Color.LIGHTGRAY);

      rl.Core.DrawRectangle(200, 180, 400, 12, rl.Color.LIGHTGRAY);
      rl.Core.DrawRectangle(200, 180, (timePlayed*400.0).toInt(), 12, rl.Color.MAROON);
      rl.Core.DrawRectangleLines(200, 180, 400, 12, rl.Color.GRAY);

      rl.Core.DrawText("PRESS SPACE TO RESTART MUSIC".toC, 215, 230, 20, rl.Color.LIGHTGRAY);
      rl.Core.DrawText("PRESS P TO PAUSE/RESUME MUSIC".toC, 208, 260, 20, rl.Color.LIGHTGRAY);
      
      rl.Core.DrawText("PRESS F TO TOGGLE LPF EFFECT: ${enableEffectLPF ? "ON" : "OFF"}".toC, 200, 320, 20, rl.Color.GRAY);
      rl.Core.DrawText("PRESS D TO TOGGLE DELAY EFFECT: ${enableEffectDelay ? "ON" : "OFF"}".toC, 180, 350, 20, rl.Color.GRAY);

    rl.Core.EndDrawing();

    // NOTE: crucial, see LIMITATIONS.md
    await Future.delayed(Duration.zero);
  }

  rl.Audio.UnloadMusicStream(music);
  AudioProcessEffectLPF.close();
  AudioProcessEffectDelay.close();

  rl.Audio.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}

void AudioProcessEffectLPFCallback(Pointer<Void> buffer, int frames)
{
  final low = <double>[0.0, 0.0];
  final cutoff = 70.0 / 44100.0;
  final k = cutoff / (cutoff + 0.1591549431);

  final bufferData = buffer.cast<Float>();
  for (int i = 0; i < frames*2; i += 2)
  {
    final l = bufferData[i];
    final r = bufferData[i + 1];

    low[0] += k * (l - low[0]);
    low[1] += k * (r - low[1]);
    bufferData[i] = low[0];
    bufferData[i + 1] = low[1];
  }
}

void AudioProcessEffectDelayCallback(Pointer<Void> buffer, int frames)
{
  final bufferData = buffer.cast<Float>();
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
}
