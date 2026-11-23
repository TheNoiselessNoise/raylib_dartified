// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_sound_loading.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

late Sound fxWav;
late Sound fxOgg;

void main() => runExample(
  init: (_) {
    InitWindow(800, 450, "audio_sound_loading");
    SetTargetFPS(60);
    InitAudioDevice();

    fxWav = LoadSound("../resources/sound.wav");
    fxOgg = LoadSound("../resources/target.ogg");
  },
  loop: (_) async {
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
  },
  close: (_) {
    UnloadSound(fxWav);
    UnloadSound(fxOgg);
    CloseAudioDevice();
    CloseWindow();
  },
);