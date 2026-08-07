// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_module_playing.c
// Run it: dart run audio_module_playing.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

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
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "audio_module_playing");
  SetTargetFPS(30);

  InitAudioDevice();

  final colors = <ColorD>[
    .ORANGE, .RED, .GOLD, .LIME,
    .BLUE, .VIOLET, .BROWN, .LIGHTGRAY,
    .PINK, .YELLOW, .GREEN, .SKYBLUE,
    .PURPLE, .BEIGE
  ];

  final circles = List.generate(MAX_CIRCLES, (i) {
    final circle = CircleWave();
    circle.alpha = 0.0;
    circle.radius = GetRandomValue(10, 40).toDouble();
    circle.position.x = GetRandomValue(circle.radius, screenWidth - circle.radius).toDouble();
    circle.position.y = GetRandomValue(circle.radius, screenHeight - circle.radius).toDouble();
    circle.speed = GetRandomValue(1, 100)/2000.0;
    circle.color = colors[GetRandomValue(0, 13)];
    return circle;
  });

  final music = LoadMusicStream("../resources/mini1111.xm");
  music.looping = false;
  double pitch = 1.0;

  PlayMusicStream(music);

  double timePlayed = 0.0;
  bool pause = false;

  while (!WindowShouldClose())
  {
    UpdateMusicStream(music);

    if (IsKeyPressed(.KEY_SPACE))
    {
      StopMusicStream(music);
      PlayMusicStream(music);
      pause = false;
    }

    if (IsKeyPressed(.KEY_P))
    {
      pause = !pause;

      if (pause) PauseMusicStream(music);
      else ResumeMusicStream(music);
    }

    if (IsKeyDown(.KEY_DOWN)) pitch -= 0.01;
    else if (IsKeyDown(.KEY_UP)) pitch += 0.01;

    SetMusicPitch(music, pitch);

    timePlayed = GetMusicTimePlayed(music)/GetMusicTimeLength(music)*(screenWidth - 40);

    for (int i = MAX_CIRCLES - 1; (i >= 0) && !pause; i--)
    {
      circles[i].alpha += circles[i].speed;
      circles[i].radius += circles[i].speed*10.0;

      if (circles[i].alpha > 1.0) circles[i].speed *= -1;

      if (circles[i].alpha <= 0.0)
      {
        circles[i].alpha = 0.0;
        circles[i].radius = GetRandomValue(10, 40).toDouble();
        circles[i].position.x = GetRandomValue(circles[i].radius, screenWidth - circles[i].radius).toDouble();
        circles[i].position.y = GetRandomValue(circles[i].radius, screenHeight - circles[i].radius).toDouble();
        circles[i].speed = GetRandomValue(1, 100)/2000.0;
        circles[i].color = colors[GetRandomValue(0, 13)];
      }
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      for (int i = MAX_CIRCLES - 1; i >= 0; i--)
      {
        DrawCircleV(
          circles[i].position,
          circles[i].radius,
          Fade(circles[i].color, circles[i].alpha)
        );
      }

      DrawRectangle(20, screenHeight - 20 - 12, screenWidth - 40, 12, .LIGHTGRAY);
      DrawRectangle(20, screenHeight - 20 - 12, timePlayed.toInt(), 12, .MAROON);
      DrawRectangleLines(20, screenHeight - 20 - 12, screenWidth - 40, 12, .GRAY);

      DrawRectangle(20, 20, 425, 145, .WHITE);
      DrawRectangleLines(20, 20, 425, 145, .GRAY);
      DrawText("PRESS SPACE TO RESTART MUSIC", 40, 40, 20, .BLACK);
      DrawText("PRESS P TO PAUSE/RESUME", 40, 70, 20, .BLACK);
      DrawText("PRESS UP/DOWN TO CHANGE SPEED", 40, 100, 20, .BLACK);
      DrawText("SPEED: ${pitch.f2}", 40, 130, 20, .MAROON);

    EndDrawing();
  }

  UnloadMusicStream(music);
  CloseAudioDevice();

  CloseWindowAndDispose();
}