// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_amp_envelope.c
// Run it: dart run audio_amp_envelope.dart
import 'dart:ffi';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const int BUFFER_SIZE = 4096;
const int SAMPLE_RATE = 44100;

// ADSRState
const int IDLE = 0;
const int ATTACK = 1;
const int DECAY = 2;
const int SUSTAIN = 3;
const int RELEASE = 4;

final class Envelope extends Struct {
  @Float() external double attackTime;
  @Float() external double decayTime;
  @Float() external double sustainLevel;
  @Float() external double releaseTime;
  @Float() external double currentValue;
  @Int() external int state;
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "audio_amp_envelope".toC);
  SetTargetFPS(60);

  InitAudioDevice();

  SetAudioStreamBufferSizeDefault(BUFFER_SIZE);

  final buffer = Float32$.val.AtUnique(count: BUFFER_SIZE);
  final stream = LoadAudioStream(SAMPLE_RATE, 32, 1);

  final audioTime = Float32$.val.ValueUnique(0.0);

  final env = calloc<Envelope>();
  env.ref.attackTime = 1.0;
  env.ref.decayTime = 1.0;
  env.ref.sustainLevel = 0.5;
  env.ref.releaseTime = 1.0;
  env.ref.currentValue = 0.0;
  env.ref.state = IDLE;

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) env.ref.state = ATTACK;

    if (IsKeyReleased(KeyboardKey.KEY_SPACE.value) && (env.ref.state != IDLE)) env.ref.state = RELEASE;

    if (IsAudioStreamProcessed(stream))
    {
      if ((env.ref.state != IDLE) || (env.ref.currentValue > 0.0))
      {
        for (int i = 0; i < BUFFER_SIZE; i++)
        {
          UpdateEnvelope(env);
          FillAudioBuffer(i, buffer, env.ref.currentValue, audioTime);
        }
      }
      else
      {
        // Clear buffer if silent to avoid looping noise
        for (int i = 0; i < BUFFER_SIZE; i++) buffer[i] = 0;
        audioTime.value = 0.0;
      }

      UpdateAudioStream(stream, buffer.cast(), BUFFER_SIZE);
    }

    if (!IsAudioStreamPlaying(stream)) PlayAudioStream(stream);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      final floatEnvValue = Float32$.val.At('floatEnvValue');

      floatEnvValue.value = env.ref.attackTime;
      GuiSliderBar(Rectangle$.val.$1.set(100, 60, 400, 30), "Attack (s)".toC, "${env.ref.attackTime.f2}s".toC, floatEnvValue, 0.1, 3.0);
      env.ref.attackTime = floatEnvValue.value;

      floatEnvValue.value = env.ref.decayTime;
      GuiSliderBar(Rectangle$.val.$1.set(100, 100, 400, 30), "Decay (s)".toC, "${env.ref.decayTime.f2}s".toC, floatEnvValue, 0.1, 3.0);
      env.ref.decayTime = floatEnvValue.value;

      floatEnvValue.value = env.ref.sustainLevel;
      GuiSliderBar(Rectangle$.val.$1.set(100, 140, 400, 30), "Sustain".toC, env.ref.sustainLevel.f2.toC, floatEnvValue, 0.0, 1.0);
      env.ref.sustainLevel = floatEnvValue.value;

      floatEnvValue.value = env.ref.releaseTime;
      GuiSliderBar(Rectangle$.val.$1.set(100, 180, 400, 30), "Release (s)".toC, "${env.ref.releaseTime.f2}s".toC, floatEnvValue, 0.1, 3.0);
      env.ref.releaseTime = floatEnvValue.value;

      DrawADSRGraph(env, Rectangle$.val.$1.set(100, 250, 400, 100));

      DrawCircleV(Vector2$.val.$1.set(520, 350 - (env.ref.currentValue * 100)), 5, MAROON);
      DrawText("Current Gain: ${env.ref.currentValue.f2}".toC, 535, 345 - (env.ref.currentValue * 100).toInt(), 10, MAROON);

      DrawText("Press SPACE to PLAY the sound!".toC, 200, 400, 20, LIGHTGRAY);

    EndDrawing();
  }

  UnloadAudioStream(stream);
  CloseAudioDevice();

  CloseWindowAndDispose();
}

void FillAudioBuffer(int i, Pointer<Float> buffer, double envelopeValue, Pointer<Float> audioTime)
{
  int frequency = 440;
  buffer[i] = envelopeValue*math.sin(2.0*PI*frequency*audioTime.value);
  audioTime.value += 1.0/SAMPLE_RATE;
}

void UpdateEnvelope(Pointer<Envelope> env)
{
  final sampleTime = 1.0/SAMPLE_RATE;

  switch(env.ref.state)
  {
    case ATTACK: {
      env.ref.currentValue += (1.0/env.ref.attackTime)*sampleTime;
      if (env.ref.currentValue >= 1.0)
      {
        env.ref.currentValue = 1.0;
        env.ref.state = DECAY;
      }
    }
    case DECAY: {
      env.ref.currentValue -= ((1.0 - env.ref.sustainLevel)/env.ref.decayTime)*sampleTime;
      if (env.ref.currentValue <= env.ref.sustainLevel)
      {
        env.ref.currentValue = env.ref.sustainLevel;
        env.ref.state = SUSTAIN;
      }
    }
    case SUSTAIN: {
      env.ref.currentValue = env.ref.sustainLevel;
    }
    case RELEASE: {
      env.ref.currentValue -= (env.ref.sustainLevel/env.ref.releaseTime)*sampleTime;
      if (env.ref.currentValue <= 0.001)
      {
        env.ref.currentValue = 0.0;
        env.ref.state = IDLE;
      }
    }
    default: break;
  }
}

void DrawADSRGraph(Pointer<Envelope> env, RectangleC bounds)
{
  DrawRectangleRec(bounds, Fade(LIGHTGRAY, 0.3));
  DrawRectangleLinesEx(bounds, 1, GRAY);

  final sustainWidth = 1.0;

  final totalTime = env.ref.attackTime + env.ref.decayTime + sustainWidth + env.ref.releaseTime;

  final scaleX = bounds.width/totalTime;
  final scaleY = bounds.height;

  final start = Vector2$.val.At('start').set(bounds.x, bounds.y + bounds.height);
  final peak = Vector2$.val.At('peak').set(start.ref.x + (env.ref.attackTime*scaleX), bounds.y);
  final sustain = Vector2$.val.At('sustain').set(peak.ref.x + (env.ref.decayTime*scaleX), bounds.y + (1.0 - env.ref.sustainLevel)*scaleY);
  final rel = Vector2$.val.At('rel').set(sustain.ref.x + (sustainWidth*scaleX), sustain.ref.y);
  final end = Vector2$.val.At('end').set(rel.ref.x + (env.ref.releaseTime*scaleX), bounds.y + bounds.height);

  DrawLineV(start.ref, peak.ref, SKYBLUE);
  DrawLineV(peak.ref, sustain.ref, BLUE);
  DrawLineV(sustain.ref, rel.ref, DARKBLUE);
  DrawLineV(rel.ref, end.ref, ORANGE);

  DrawText("ADSR Visualizer".toC, bounds.x.toInt(), (bounds.y - 20).toInt(), 10, DARKGRAY);
}
