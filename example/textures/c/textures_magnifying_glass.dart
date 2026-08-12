// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_magnifying_glass.c
// Run it: dart run textures_magnifying_glass.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_magnifying_glass".toC);
  SetTargetFPS(60);

  final bunny = LoadTexture("../resources/raybunny.png".toC);
  final parrots = LoadTexture("../resources/parrots.png".toC);

  final circle = Image$.val.At('circle');
  circle.ref = GenImageColor(256, 256, BLANK);
  ImageDrawCircle(circle, 128, 128, 128, WHITE);
  final mask = LoadTextureFromImage(circle.ref);
  UnloadImage(circle.ref);

  final magnifiedWorld = LoadRenderTexture(256, 256);

  final camera = Camera2D$.val.$newPtr;
  camera.ref.zoom = 2;
  camera.ref.offset.set(128, 128);

  while (!WindowShouldClose())
  {
    final mPos = GetMousePosition();
    camera.ref.target = mPos;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTexture(parrots, 144, 33, WHITE);
      DrawText("Use the magnifying glass to find hidden bunnies!".toC, 154, 6, 20, BLACK);

      BeginTextureMode(magnifiedWorld);
        ClearBackground(RAYWHITE);

        BeginMode2D(camera.ref);
          DrawTexture(parrots, 144, 33, WHITE);
          DrawText("Use the magnifying glass to find hidden bunnies!".toC, 154, 6, 20, BLACK);

          BeginBlendMode(BlendMode.BLEND_MULTIPLIED.value);
            DrawTexture(bunny, 250, 350, WHITE);
            DrawTexture(bunny, 500, 100, WHITE);
            DrawTexture(bunny, 420, 300, WHITE);
            DrawTexture(bunny, 650, 10, WHITE);
          EndBlendMode();
        EndMode2D();

        BeginBlendMode(BlendMode.BLEND_CUSTOM_SEPARATE.value);
          rlSetBlendFactorsSeparate(RL_ZERO, RL_ONE, RL_ONE, RL_ZERO, RL_FUNC_ADD, RL_FUNC_ADD);
          DrawTexture(mask, 0, 0, WHITE);
        EndBlendMode();
      EndTextureMode();

      DrawTextureRec(magnifiedWorld.texture, Rectangle$.val.$1.set(0, 0, 256, -256), Vector2$.val.$1.set(mPos.x - 128, mPos.y - 128), WHITE);

      DrawRing(mPos, 126, 130, 0, 360, 64, BLACK);

      final rx = mPos.x/800;
      final ry = mPos.y/800;
      DrawCircle(((mPos.x - 64*rx) - 32).toInt(), ((mPos.y - 64*ry) - 32).toInt(), 4, ColorAlpha(WHITE, 0.5));

    EndDrawing();
  }

  UnloadTexture(parrots);
  UnloadTexture(bunny);
  UnloadTexture(mask);
  UnloadRenderTexture(magnifiedWorld);

  CloseWindowAndDispose();
}
