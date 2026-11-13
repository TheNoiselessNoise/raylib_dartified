// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_sound_loading.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

void main() => Raylib((rl) {
  InitWindow(800, 450, "audio_sound_loading");
  SetTargetFPS(60);

  InitAudioDevice();

  final fxWav = LoadSound("../resources/sound.wav");
  final fxOgg = LoadSound("../resources/target.ogg");

  rl.setMainLoop(() {
    if (IsKeyPressed(.KEY_SPACE)) {
      PlaySound(fxWav);
    }

    if (IsKeyPressed(.KEY_ENTER)) {
      PlaySound(fxOgg);
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);
      DrawText(
        "Press SPACE to PLAY the WAV sound!",
        200, 180, 20, .LIGHTGRAY
      );
      DrawText(
        "Press ENTER to PLAY the OGG sound!",
        200, 220, 20, .LIGHTGRAY
      );

    EndDrawing();
  });
});