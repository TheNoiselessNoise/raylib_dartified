// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_render_texture.c
// Run it: dart run core_render_texture.dart
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_render_texture".toC);
  SetTargetFPS(60);

  int renderTextureWidth = 300;
  int renderTextureHeight = 300;
  final target = LoadRenderTexture(renderTextureWidth, renderTextureHeight);

  final ballPosition = Vector2$.val.$new.set(renderTextureWidth/2.0, renderTextureHeight/2.0);
  final ballSpeed = Vector2$.val.$new.set(5.0, 4.0);
  int ballRadius = 20;

  double rotation = 0.0;

  while (!WindowShouldClose()) {
    ballPosition.x += ballSpeed.x;
    ballPosition.y += ballSpeed.y;

    if ((ballPosition.x >= (renderTextureWidth - ballRadius)) || (ballPosition.x <= ballRadius)) ballSpeed.x *= -1.0;
    if ((ballPosition.y >= (renderTextureHeight - ballRadius)) || (ballPosition.y <= ballRadius)) ballSpeed.y *= -1.0;

    rotation += 0.5;

    BeginTextureMode(target);

      ClearBackground(SKYBLUE);

      DrawRectangle(0, 0, 20, 20, RED);
      DrawCircleV(ballPosition, ballRadius.toDouble(), MAROON);

    EndTextureMode();

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTexturePro(
        target.texture,
        Rectangle$.val.$1.set(0, 0, target.texture.width, -target.texture.height),
        Rectangle$.val.$2.set(screenWidth/2.0, screenHeight/2.0, target.texture.width, target.texture.height),
        Vector2$.val.$1.set(target.texture.width/2.0, target.texture.height/2.0),
        rotation,
        WHITE
      );

      DrawText("DRAWING BOUNCING BALL INSIDE RENDER TEXTURE!".toC, 10, screenHeight - 40, 20, BLACK);

      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}
