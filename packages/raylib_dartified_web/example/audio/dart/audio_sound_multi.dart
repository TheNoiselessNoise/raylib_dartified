// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_sound_multi.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_SOUNDS = 10;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "audio_sound_multi");
  SetTargetFPS(60);

  InitAudioDevice();

  int currentSound = 0;
  final soundArray = <Sound>[ LoadSound("../resources/sound.wav") ];
  for (int i = 1; i < MAX_SOUNDS; i++) {
    soundArray.add(LoadSoundAlias(soundArray[0]));
  }

  rl.setMainLoop(() {
    if (IsKeyPressed(.KEY_SPACE))
    {
      PlaySound(soundArray[currentSound]);
      currentSound++;
      if (currentSound >= MAX_SOUNDS)
        currentSound = 0;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText("Press SPACE to PLAY a WAV sound!", 200, 180, 20, .LIGHTGRAY);

    EndDrawing();
  });
});