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

AudioCallbackD AudioProcessEffectLPF = .function((buffer, frames) {
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
});

AudioCallbackD AudioProcessEffectDelay = .function((buffer, frames) {
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
});

void main() async {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.AudioD.debug(true);
  rl.AudioD.debugFilter((c) => c.contains('AudioStreamProcessor'));

  rl.CoreD.InitWindow(screenWidth, screenHeight, "audio_stream_effects");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  rl.AudioD.InitAudioDevice();

  final music = rl.AudioD.LoadMusicStream("../resources/country.mp3");

  delayBufferSize = 48000*2;
  delayBuffer = rl.Temp.Float32$.At('delayBuffer', delayBufferSize);

  rl.AudioD.PlayMusicStream(music);

  double timePlayed = 0.0;
  bool pause = false;
  
  bool enableEffectLPF = false;
  bool enableEffectDelay = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.AudioD.UpdateMusicStream(music);

    if (rl.CoreD.IsKeyPressed(.KEY_SPACE))
    {
      rl.AudioD.StopMusicStream(music);
      rl.AudioD.PlayMusicStream(music);
    }

    if (rl.CoreD.IsKeyPressed(.KEY_P))
    {
      pause = !pause;

      if (pause) rl.AudioD.PauseMusicStream(music);
      else rl.AudioD.ResumeMusicStream(music);
    }

    if (rl.CoreD.IsKeyPressed(.KEY_F))
    {
      enableEffectLPF = !enableEffectLPF;
      if (enableEffectLPF) rl.AudioD.AttachAudioStreamProcessor(music.stream, AudioProcessEffectLPF);
      else rl.AudioD.DetachAudioStreamProcessor(music.stream, AudioProcessEffectLPF, keepAlive: true);
    }

    if (rl.CoreD.IsKeyPressed(.KEY_D))
    {
      enableEffectDelay = !enableEffectDelay;
      if (enableEffectDelay) rl.AudioD.AttachAudioStreamProcessor(music.stream, AudioProcessEffectDelay);
      else rl.AudioD.DetachAudioStreamProcessor(music.stream, AudioProcessEffectDelay, keepAlive: true);
    }
    
    timePlayed = rl.AudioD.GetMusicTimePlayed(music)/rl.AudioD.GetMusicTimeLength(music);

    if (timePlayed > 1.0) timePlayed = 1.0;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText("MUSIC SHOULD BE PLAYING!", 245, 150, 20, .LIGHTGRAY);

      rl.CoreD.DrawRectangle(200, 180, 400, 12, .LIGHTGRAY);
      rl.CoreD.DrawRectangle(200, 180, (timePlayed*400.0).toInt(), 12, .MAROON);
      rl.CoreD.DrawRectangleLines(200, 180, 400, 12, .GRAY);

      rl.CoreD.DrawText("PRESS SPACE TO RESTART MUSIC", 215, 230, 20, .LIGHTGRAY);
      rl.CoreD.DrawText("PRESS P TO PAUSE/RESUME MUSIC", 208, 260, 20, .LIGHTGRAY);
      
      rl.CoreD.DrawText("PRESS F TO TOGGLE LPF EFFECT: ${enableEffectLPF ? "ON" : "OFF"}", 200, 320, 20, .GRAY);
      rl.CoreD.DrawText("PRESS D TO TOGGLE DELAY EFFECT: ${enableEffectDelay ? "ON" : "OFF"}", 180, 350, 20, .GRAY);

    rl.CoreD.EndDrawing();

    // NOTE: crucial, see LIMITATIONS.md
    await Future.delayed(Duration.zero);
  }

  rl.AudioD.UnloadMusicStream(music);

  rl.AudioD.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}