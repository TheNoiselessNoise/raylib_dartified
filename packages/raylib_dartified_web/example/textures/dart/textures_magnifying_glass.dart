// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_magnifying_glass.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "textures_magnifying_glass");
  SetTargetFPS(60);

  final bunny = LoadTexture("../resources/raybunny.png");
  final parrots = LoadTexture("../resources/parrots.png");

  final circle = GenImageColor(256, 256, .BLANK);
  ImageDrawCircle(circle, 128, 128, 128, .WHITE);
  final mask = LoadTextureFromImage(circle);
  UnloadImage(circle);

  final magnifiedWorld = LoadRenderTexture(256, 256);

  final camera = Camera2D(
    zoom: 2,
    offset: .vec2(128, 128),
  );

  rl.setMainLoop(() {
    final mPos = GetMousePosition();
    camera.target = mPos;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawTexture(parrots, 144, 33, .WHITE);
      DrawText("Use the magnifying glass to find hidden bunnies!", 154, 6, 20, .BLACK);

      BeginTextureMode(magnifiedWorld);
        ClearBackground(.RAYWHITE);

        BeginMode2D(camera);
          DrawTexture(parrots, 144, 33, .WHITE);
          DrawText("Use the magnifying glass to find hidden bunnies!", 154, 6, 20, .BLACK);

          BeginBlendMode(.BLEND_MULTIPLIED);
            DrawTexture(bunny, 250, 350, .WHITE);
            DrawTexture(bunny, 500, 100, .WHITE);
            DrawTexture(bunny, 420, 300, .WHITE);
            DrawTexture(bunny, 650, 10, .WHITE);
          EndBlendMode();
        EndMode2D();

        BeginBlendMode(.BLEND_CUSTOM_SEPARATE);
          rlSetBlendFactorsSeparate(RL_ZERO, RL_ONE, RL_ONE, RL_ZERO, RL_FUNC_ADD, RL_FUNC_ADD);
          DrawTexture(mask, 0, 0, .WHITE);
        EndBlendMode();
      EndTextureMode();

      DrawTextureRec(magnifiedWorld.texture, .rect(0, 0, 256, -256), .vec2(mPos.x - 128, mPos.y - 128), .WHITE);

      DrawRing(mPos, 126, 130, 0, 360, 64, .BLACK);

      final rx = mPos.x/800;
      final ry = mPos.y/800;
      DrawCircle((mPos.x - 64*rx) - 32, (mPos.y - 64*ry) - 32, 4, ColorAlpha(.WHITE, 0.5));

    EndDrawing();
  });
});