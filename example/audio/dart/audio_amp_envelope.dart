// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_amp_envelope.c
// Run it: dart run audio_amp_envelope.dart
import 'dart:math' as math;
import 'dart:typed_data';
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const int BUFFER_SIZE = 4096;
const int SAMPLE_RATE = 44100;

enum ADSRState {
  IDLE,
  ATTACK,
  DECAY,
  SUSTAIN,
  RELEASE,
}

class Envelope {
  double attackTime = 0;
  double decayTime = 0;
  double sustainLevel = 0;
  double releaseTime = 0;
  double currentValue = 0;
  ADSRState state = .IDLE;
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "audio_amp_envelope");
  SetTargetFPS(60);

  InitAudioDevice();

  SetAudioStreamBufferSizeDefault(BUFFER_SIZE);

  final buffer = Float32List(BUFFER_SIZE);
  final stream = LoadAudioStream(SAMPLE_RATE, 32, 1);

  double audioTime = 0.0;

  final env = Envelope();
  env.attackTime = 1.0;
  env.decayTime = 1.0;
  env.sustainLevel = 0.5;
  env.releaseTime = 1.0;
  env.currentValue = 0.0;
  env.state = .IDLE;

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(.KEY_SPACE)) env.state = .ATTACK;

    if (IsKeyReleased(.KEY_SPACE) && (env.state != .IDLE)) env.state = .RELEASE;

    if (IsAudioStreamProcessed(stream))
    {
      if ((env.state != .IDLE) || (env.currentValue > 0.0))
      {
        for (int i = 0; i < BUFFER_SIZE; i++)
        {
          UpdateEnvelope(env);
          audioTime = FillAudioBuffer(i, buffer, env.currentValue, audioTime);
        }
      }
      else
      {
        // Clear buffer if silent to avoid looping noise
        for (int i = 0; i < BUFFER_SIZE; i++) buffer[i] = 0;
        audioTime = 0.0;
      }

      UpdateAudioStream(stream, buffer);
    }

    if (!IsAudioStreamPlaying(stream)) PlayAudioStream(stream);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      double floatEnvValue;

      (_, floatEnvValue) = GuiSliderBar(.rect(100, 60, 400, 30), "Attack (s)", "${env.attackTime.f2}s", env.attackTime, 0.1, 3.0);
      env.attackTime = floatEnvValue;

      (_, floatEnvValue) = GuiSliderBar(.rect(100, 100, 400, 30), "Decay (s)", "${env.decayTime.f2}s", env.decayTime, 0.1, 3.0);
      env.decayTime = floatEnvValue;

      (_, floatEnvValue) = GuiSliderBar(.rect(100, 140, 400, 30), "Sustain", env.sustainLevel.f2, env.sustainLevel, 0.0, 1.0);
      env.sustainLevel = floatEnvValue;

      (_, floatEnvValue) = GuiSliderBar(.rect(100, 180, 400, 30), "Release (s)", "${env.releaseTime.f2}s", env.releaseTime, 0.1, 3.0);
      env.releaseTime = floatEnvValue;

      DrawADSRGraph(env, .rect(100, 250, 400, 100));

      DrawCircleV(.vec2(520, 350 - (env.currentValue * 100)), 5, MAROON);
      DrawText("Current Gain: ${env.currentValue.f2}", 535, 345 - env.currentValue * 100, 10, MAROON);

      DrawText("Press SPACE to PLAY the sound!", 200, 400, 20, LIGHTGRAY);

    EndDrawing();
  }

  UnloadAudioStream(stream);
  CloseAudioDevice();

  CloseWindowAndDispose();
}

double FillAudioBuffer(int i, Float32List buffer, double envelopeValue, double audioTime)
{
  int frequency = 440;
  buffer[i] = envelopeValue*math.sin(2.0*PI*frequency*audioTime);
  return audioTime + 1.0/SAMPLE_RATE;
}

void UpdateEnvelope(Envelope env)
{
  final sampleTime = 1.0/SAMPLE_RATE;

  switch(env.state)
  {
    case .ATTACK: {
      env.currentValue += (1.0/env.attackTime)*sampleTime;
      if (env.currentValue >= 1.0)
      {
        env.currentValue = 1.0;
        env.state = .DECAY;
      }
    }
    case .DECAY: {
      env.currentValue -= ((1.0 - env.sustainLevel)/env.decayTime)*sampleTime;
      if (env.currentValue <= env.sustainLevel)
      {
        env.currentValue = env.sustainLevel;
        env.state = .SUSTAIN;
      }
    }
    case .SUSTAIN: {
      env.currentValue = env.sustainLevel;
    }
    case .RELEASE: {
      env.currentValue -= (env.sustainLevel/env.releaseTime)*sampleTime;
      if (env.currentValue <= 0.001)
      {
        env.currentValue = 0.0;
        env.state = .IDLE;
      }
    }
    default: break;
  }
}

void DrawADSRGraph(Envelope env, RectangleD bounds)
{
  DrawRectangleRec(bounds, Fade(LIGHTGRAY, 0.3));
  DrawRectangleLinesEx(bounds, 1, GRAY);

  final sustainWidth = 1.0;

  final totalTime = env.attackTime + env.decayTime + sustainWidth + env.releaseTime;

  final scaleX = bounds.width/totalTime;
  final scaleY = bounds.height;

  final Vector2D start = .vec2(bounds.x, bounds.y + bounds.height);
  final Vector2D peak = .vec2(start.x + (env.attackTime*scaleX), bounds.y);
  final Vector2D sustain = .vec2(peak.x + (env.decayTime*scaleX), bounds.y + (1.0 - env.sustainLevel)*scaleY);
  final Vector2D rel = .vec2(sustain.x + (sustainWidth*scaleX), sustain.y);
  final Vector2D end = .vec2(rel.x + (env.releaseTime*scaleX), bounds.y + bounds.height);

  DrawLineV(start, peak, SKYBLUE);
  DrawLineV(peak, sustain, BLUE);
  DrawLineV(sustain, rel, DARKBLUE);
  DrawLineV(rel, end, ORANGE);

  DrawText("ADSR Visualizer", bounds.x, bounds.y - 20, 10, DARKGRAY);
}
