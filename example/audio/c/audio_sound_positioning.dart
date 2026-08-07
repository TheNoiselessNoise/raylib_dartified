// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_sound_positioning.c
// Run it: dart run audio_sound_positioning.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "audio_sound_positioning".toC);
  SetTargetFPS(60);
  DisableCursor();

  InitAudioDevice();

  final sound = LoadSound("../resources/coin.wav".toC);

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(0, 5, 5);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 60;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_FREE.value);

    final th = GetTime().toDouble();

    final spherePos = Vector3$.$1.set(
      5.0*math.cos(th),
      0.0,
      5.0*math.sin(th)
    );

    SetSoundPosition(camera.ref, sound, spherePos, 1.0);

    if (!IsSoundPlaying(sound)) PlaySound(sound);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);
        DrawGrid(10, 2);
        DrawSphere(spherePos, 0.5, RED);
      EndMode3D();

    EndDrawing();
  }

  UnloadSound(sound);
  CloseAudioDevice();

  CloseWindowAndDispose();
}

void SetSoundPosition(Camera3DC listener, SoundC sound, Vector3C position, double maxDist)
{
  // Calculate direction vector and distance between listener and sound source
  final direction = position.toD().sub(listener.position.toD());
  final distance = direction.length;

  // Apply logarithmic distance attenuation and clamp between 0-1
  double attenuation = 1.0/(1.0 + (distance/maxDist));
  attenuation = Clamp(attenuation, 0.0, 1.0);

  // Calculate normalized vectors for spatial positioning
  final normalizedDirection = direction.normalize();
  final forward = listener.target.toD().sub(listener.position.toD()).normalize();
  final right = listener.up.toD().crossProduct(forward).normalize();

  // Reduce volume for sounds behind the listener
  double dotProduct = forward.dotProduct(normalizedDirection);
  if (dotProduct < 0.0) attenuation *= (1.0 + dotProduct*0.5);

  // Set stereo panning based on sound position relative to listener
  final pan = Clamp(normalizedDirection.dotProduct(right), -1.0, 1.0);

  // Apply final sound properties
  SetSoundVolume(sound, attenuation);
  SetSoundPan(sound, pan); // (-1.0 left, 0.0 center, 1.0 right)
}
