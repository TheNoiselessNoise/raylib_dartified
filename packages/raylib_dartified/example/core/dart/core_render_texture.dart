// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_render_texture.c
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

int renderTextureWidth = 300;
int renderTextureHeight = 300;
late RenderTexture target;
late Vector2 ballPosition;
late Vector2 ballSpeed;
int ballRadius = 20;
double rotation = 0.0;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "core_render_texture");
    SetTargetFPS(60);

    target = LoadRenderTexture(renderTextureWidth, renderTextureHeight);
    ballPosition = .vec2(renderTextureWidth/2.0, renderTextureHeight/2.0);
    ballSpeed = .vec2(5.0, 4.0);
  },
  loop: (_) async {
    ballPosition.x += ballSpeed.x;
    ballPosition.y += ballSpeed.y;

    if ((ballPosition.x >= (renderTextureWidth - ballRadius)) || (ballPosition.x <= ballRadius)) ballSpeed.x *= -1.0;
    if ((ballPosition.y >= (renderTextureHeight - ballRadius)) || (ballPosition.y <= ballRadius)) ballSpeed.y *= -1.0;

    rotation += 0.5;

    BeginTextureMode(target);

      ClearBackground(SKYBLUE);

      DrawRectangle(0, 0, 20, 20, RED);
      DrawCircleV(ballPosition, ballRadius, MAROON);

    EndTextureMode();

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTexturePro(
        target.texture,
        .rect(0, 0, target.texture.width, -target.texture.height),
        .rect(screenWidth/2.0, screenHeight/2.0, target.texture.width, target.texture.height),
        .vec2(target.texture.width/2.0, target.texture.height/2.0),
        rotation,
        WHITE
      );

      DrawText("DRAWING BOUNCING BALL INSIDE RENDER TEXTURE!", 10, screenHeight - 40, 20, BLACK);

      DrawFPS(10, 10);

    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);