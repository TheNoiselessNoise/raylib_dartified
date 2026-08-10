// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_screen_recording.c
// Run it: dart run core_screen_recording.dart
// WARNING: requires `msf_gif` library
import 'dart:ffi';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const int GIF_RECORD_FRAMERATE = 5;
const int MAX_SINEWAVE_POINTS = 256;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_screen_recording".toC);
  SetTargetFPS(60);

  bool gifRecording = false;
  int gifFrameCounter = 0;
  final gifState = calloc<MsfGifState>();

  final circlePosition = Vector2$.$new.set(0.0, screenHeight/2.0);
  double timeCounter = 0.0;

  final sinePoints = Vector2$.AtUnique(count: MAX_SINEWAVE_POINTS);
  for (int i = 0; i < MAX_SINEWAVE_POINTS; i++)
  {
    sinePoints[i].x = i*GetScreenWidth()/180.0;
    sinePoints[i].y = screenHeight/2.0 + 150*math.sin((2*PI/1.5)*(1.0/60.0)*i);
  }

  while (!WindowShouldClose()) {
    circlePosition.x += GetScreenWidth()/180.0;
    circlePosition.y = screenHeight/2.0 + 150*math.sin((2*PI/1.5)*timeCounter);
    if (circlePosition.x > screenWidth)
    {
      circlePosition.x = 0.0;
      circlePosition.y = screenHeight/2.0;
      timeCounter = 0.0;
    }

    if (IsKeyDown(KeyboardKey.KEY_LEFT_CONTROL.value) && IsKeyPressed(KeyboardKey.KEY_R.value))
    {
      if (gifRecording)
      {
        gifRecording = false;
        final result = msf_gif_end(gifState);
        SaveFileData("${GetApplicationDirectory().toD}/screenrecording.gif".toC, result.data, result.dataSize);
        msf_gif_free(result);
        TraceLog(TraceLogLevel.LOG_INFO.value, "Finish animated GIF recording".toC);
      }
      else
      {
        gifRecording = true;
        gifFrameCounter = 0;
        msf_gif_begin(gifState, GetRenderWidth(), GetRenderHeight());
        TraceLog(TraceLogLevel.LOG_INFO.value, "Start animated GIF recording".toC);
      }
    }

    if (gifRecording)
    {
      gifFrameCounter++;

      if (gifFrameCounter > GIF_RECORD_FRAMERATE)
      {
        final imScreen = LoadImageFromScreen();

        msf_gif_frame(gifState, imScreen.data.cast(), (((1.0/60.0)*GIF_RECORD_FRAMERATE)/10).toInt(), 16, imScreen.width*4);
        gifFrameCounter = 0;

        UnloadImage(imScreen);
      }
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      for (int i = 0; i < (MAX_SINEWAVE_POINTS - 1); i++)
      {
        DrawLineV(sinePoints[i], sinePoints[i + 1], MAROON);
        DrawCircleV(sinePoints[i], 3, MAROON);
      }

      DrawCircleV(circlePosition, 30, RED);

      DrawFPS(10, 10);

      /*
      // Draw record indicator
      // WARNING: If drawn here, it will appear in the recorded image,
      // use a render texture instead for the recording and LoadImageFromTexture(rt.texture)
      if (gifRecording)
      {
        // Display the recording indicator every half-second
        if ((GetTime()/0.5)%2 == 1)
        {
          DrawCircle(30, GetScreenHeight() - 20, 10, MAROON);
          DrawText("GIF RECORDING".toC, 50, GetScreenHeight() - 25, 10, RED);
        }
      }
      */
    EndDrawing();
  }

  if (gifRecording)
  {
    MsfGifResult result = msf_gif_end(gifState);
    msf_gif_free(result);
    gifRecording = false;
  }

  CloseWindowAndDispose();
}