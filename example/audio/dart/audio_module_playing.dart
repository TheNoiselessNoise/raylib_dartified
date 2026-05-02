// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_module_playing.c
// Run it: dart run audio_module_playing.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_CIRCLES = 64;

class CircleWave {
  Vector2D position;
  double radius;
  double alpha;
  double speed;
  ColorD color;

  CircleWave({
    Vector2D? position,
    this.radius = 0,
    this.alpha = 0,
    this.speed = 0,
    ColorD? color,
  }) :
    position = position ?? .zero(),
    color = color ?? .zero();
}

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "audio_module_playing");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(30);

  rl.AudioD.InitAudioDevice();

  final colors = <ColorD>[
    .ORANGE, .RED, .GOLD, .LIME,
    .BLUE, .VIOLET, .BROWN, .LIGHTGRAY,
    .PINK, .YELLOW, .GREEN, .SKYBLUE,
    .PURPLE, .BEIGE
  ];

  final circles = List.generate(MAX_CIRCLES, (i) {
    final circle = CircleWave();
    circle.alpha = 0.0;
    circle.radius = rl.CoreD.GetRandomValue(10, 40).toDouble();
    circle.position.x = rl.CoreD.GetRandomValue(circle.radius.toInt(), (screenWidth - circle.radius).toInt()).toDouble();
    circle.position.y = rl.CoreD.GetRandomValue(circle.radius.toInt(), (screenHeight - circle.radius).toInt()).toDouble();
    circle.speed = rl.CoreD.GetRandomValue(1, 100)/2000.0;
    circle.color = colors[rl.CoreD.GetRandomValue(0, 13)];
    return circle;
  });

  final music = rl.AudioD.LoadMusicStream("../resources/mini1111.xm");
  music.looping = false;
  double pitch = 1.0;

  rl.AudioD.PlayMusicStream(music);

  double timePlayed = 0.0;
  bool pause = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.AudioD.UpdateMusicStream(music);

    if (rl.CoreD.IsKeyPressed(.KEY_SPACE))
    {
      rl.AudioD.StopMusicStream(music);
      rl.AudioD.PlayMusicStream(music);
      pause = false;
    }

    if (rl.CoreD.IsKeyPressed(.KEY_P))
    {
      pause = !pause;

      if (pause) rl.AudioD.PauseMusicStream(music);
      else rl.AudioD.ResumeMusicStream(music);
    }

    if (rl.CoreD.IsKeyDown(.KEY_DOWN)) pitch -= 0.01;
    else if (rl.CoreD.IsKeyDown(.KEY_UP)) pitch += 0.01;

    rl.AudioD.SetMusicPitch(music, pitch);

    timePlayed = rl.AudioD.GetMusicTimePlayed(music)/rl.AudioD.GetMusicTimeLength(music)*(screenWidth - 40);

    for (int i = MAX_CIRCLES - 1; (i >= 0) && !pause; i--)
    {
      circles[i].alpha += circles[i].speed;
      circles[i].radius += circles[i].speed*10.0;

      if (circles[i].alpha > 1.0) circles[i].speed *= -1;

      if (circles[i].alpha <= 0.0)
      {
        circles[i].alpha = 0.0;
        circles[i].radius = rl.CoreD.GetRandomValue(10, 40).toDouble();
        circles[i].position.x = rl.CoreD.GetRandomValue(circles[i].radius.toInt(), (screenWidth - circles[i].radius).toInt()).toDouble();
        circles[i].position.y = rl.CoreD.GetRandomValue(circles[i].radius.toInt(), (screenHeight - circles[i].radius).toInt()).toDouble();
        circles[i].speed = rl.CoreD.GetRandomValue(1, 100)/2000.0;
        circles[i].color = colors[rl.CoreD.GetRandomValue(0, 13)];
      }
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      for (int i = MAX_CIRCLES - 1; i >= 0; i--)
      {
        rl.CoreD.DrawCircleV(
          circles[i].position,
          circles[i].radius,
          rl.CoreD.Fade(circles[i].color, circles[i].alpha)
        );
      }

      rl.CoreD.DrawRectangle(20, screenHeight - 20 - 12, screenWidth - 40, 12, .LIGHTGRAY);
      rl.CoreD.DrawRectangle(20, screenHeight - 20 - 12, timePlayed.toInt(), 12, .MAROON);
      rl.CoreD.DrawRectangleLines(20, screenHeight - 20 - 12, screenWidth - 40, 12, .GRAY);

      rl.CoreD.DrawRectangle(20, 20, 425, 145, .WHITE);
      rl.CoreD.DrawRectangleLines(20, 20, 425, 145, .GRAY);
      rl.CoreD.DrawText("PRESS SPACE TO RESTART MUSIC", 40, 40, 20, .BLACK);
      rl.CoreD.DrawText("PRESS P TO PAUSE/RESUME", 40, 70, 20, .BLACK);
      rl.CoreD.DrawText("PRESS UP/DOWN TO CHANGE SPEED", 40, 100, 20, .BLACK);
      rl.CoreD.DrawText("SPEED: ${pitch.f2}", 40, 130, 20, .MAROON);

    rl.CoreD.EndDrawing();
  }

  rl.AudioD.UnloadMusicStream(music);
  rl.AudioD.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}