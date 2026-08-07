// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_sound_positioning.c
// Run it: dart run audio_sound_positioning.dart
// WARNING: expects resources from the raylib source
import 'dart:math' as math;
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "audio_sound_positioning");
  SetTargetFPS(60);
  DisableCursor();

  InitAudioDevice();

  final sound = LoadSound("../resources/coin.wav");

  final camera = Camera3DD(
    position: .vec3(0, 5, 5),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 60,
    projection: .CAMERA_PERSPECTIVE,
  );

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_FREE);

    final th = GetTime().toDouble();

    final Vector3D spherePos = .vec3(
      5.0*math.cos(th),
      0.0,
      5.0*math.sin(th)
    );

    SetSoundPosition(camera, sound, spherePos, 1.0);

    if (!IsSoundPlaying(sound)) PlaySound(sound);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera);
        DrawGrid(10, 2);
        DrawSphere(spherePos, 0.5, RED);
      EndMode3D();

    EndDrawing();
  }

  UnloadSound(sound);
  CloseAudioDevice();

  CloseWindowAndDispose();
}

void SetSoundPosition(Camera3DD listener, SoundD sound, Vector3D position, double maxDist)
{
  // Calculate direction vector and distance between listener and sound source
  final direction = position.sub(listener.position);
  final distance = direction.length;

  // Apply logarithmic distance attenuation and clamp between 0-1
  double attenuation = 1.0/(1.0 + (distance/maxDist));
  attenuation = Clamp(attenuation, 0.0, 1.0);

  // Calculate normalized vectors for spatial positioning
  final normalizedDirection = direction.normalize();
  final forward = listener.target.sub(listener.position).normalize();
  // final right = listener.up.crossProduct(forward).normalize();
  final right = forward.crossProduct(listener.up).normalize();

  // Reduce volume for sounds behind the listener
  double dotProduct = forward.dotProduct(normalizedDirection);
  if (dotProduct < 0.0) attenuation *= (1.0 + dotProduct*0.5);

  // Set stereo panning based on sound position relative to listener
  final pan = Clamp(normalizedDirection.dotProduct(right), -1.0, 1.0);
  
  // Apply final sound properties
  SetSoundVolume(sound, attenuation);
  SetSoundPan(sound, pan); // (-1.0 left, 0.0 center, 1.0 right)
}
