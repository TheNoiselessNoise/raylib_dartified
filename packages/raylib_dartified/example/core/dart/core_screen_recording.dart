// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_screen_recording.c
// WARNING: requires `msf_gif` library
import 'dart:math' as math;
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const int GIF_RECORD_FRAMERATE = 5;
const int MAX_SINEWAVE_POINTS = 256;

bool gifRecording = false;
int gifFrameCounter = 0;
double timeCounter = 0.0;
late MsfGifState gifState;
late Vector2 circlePosition;
late List<Vector2> sinePoints;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "core_screen_recording");
    SetTargetFPS(60);

    gifState = .zero();
    circlePosition = .vec2(0.0, screenHeight/2.0);
    sinePoints = .generate(MAX_SINEWAVE_POINTS, (_) => .zero());
    for (int i = 0; i < MAX_SINEWAVE_POINTS; i++)
    {
      sinePoints[i].x = i*GetScreenWidth()/180.0;
      sinePoints[i].y = screenHeight/2.0 + 150*math.sin((2*PI/1.5)*(1.0/60.0)*i);
    }
  },
  loop: (_) async {
    circlePosition.x += GetScreenWidth()/180.0;
    circlePosition.y = screenHeight/2.0 + 150*math.sin((2*PI/1.5)*timeCounter);
    if (circlePosition.x > screenWidth)
    {
      circlePosition.x = 0.0;
      circlePosition.y = screenHeight/2.0;
      timeCounter = 0.0;
    }

    if (IsKeyDown(.KEY_LEFT_CONTROL) && IsKeyPressed(.KEY_R))
    {
      if (gifRecording)
      {
        gifRecording = false;
        final result = msf_gif_end(gifState);
        SaveFileData("${GetApplicationDirectory()}/screenrecording.gif", result.dataView);
        msf_gif_free(result);
        TraceLog(.LOG_INFO, "Finish animated GIF recording");
      }
      else
      {
        gifRecording = true;
        gifFrameCounter = 0;
        msf_gif_begin(gifState, GetRenderWidth(), GetRenderHeight());
        TraceLog(.LOG_INFO, "Start animated GIF recording");
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
          DrawText("GIF RECORDING", 50, GetScreenHeight() - 25, 10, RED);
        }
      }
      */
    EndDrawing();

    if (gifRecording)
    {
      gifFrameCounter++;

      if (gifFrameCounter > GIF_RECORD_FRAMERATE)
      {
        final imScreen = LoadImageFromScreen();

        msf_gif_frame(gifState, .fromList(imScreen.dataView), (((1.0/60.0)*GIF_RECORD_FRAMERATE)/10).toInt(), 16, imScreen.width*4);
        gifFrameCounter = 0;

        UnloadImage(imScreen);
      }
    }
  },
  close: (_) {
    if (gifRecording)
    {
      msf_gif_free(msf_gif_end(gifState));
      gifRecording = false;
    }

    CloseWindow();
  },
);