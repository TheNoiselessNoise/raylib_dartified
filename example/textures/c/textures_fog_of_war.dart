// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_fog_of_war.c
// Run it: dart run textures_fog_of_war.dart
import 'dart:ffi';
import '../../base.dart';

const int MAP_TILE_SIZE = 32;
const int PLAYER_SIZE = 16;
const int PLAYER_TILE_VISIBILITY = 2;
const int screenWidth = 800;
const int screenHeight = 450;

class ExampleMap {
  int tilesX;
  int tilesY;
  List<int> tileIds;
  List<int> tileFog;

  ExampleMap({
    this.tilesX = 0,
    this.tilesY = 0,
    this.tileIds = const [],
    this.tileFog = const [],
  });
}

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_fog_of_war".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final map = ExampleMap();
  map.tilesX = screenWidth ~/ MAP_TILE_SIZE;
  map.tilesY = screenHeight ~/ MAP_TILE_SIZE;
  map.tileIds = .filled(map.tilesX*map.tilesY, 0);
  map.tileFog = .filled(map.tilesX*map.tilesY, 0);

  final textureSrc = rl.Temp.Rectangle$.At('textureSrc');
  final textureDst = rl.Temp.Rectangle$.At('textureDst');

  final playerPosition = rl.Temp.Vector2$.At('playerPosition');
  int playerTileX = 0;
  int playerTileY = 0;

  final fogOfWar = rl.Core.LoadRenderTexture(map.tilesX, map.tilesY);
  rl.Core.SetTextureFilter(fogOfWar.texture, TextureFilter.TEXTURE_FILTER_BILINEAR.value);

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_RIGHT.value)) playerPosition.ref.x += 5;
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT.value)) playerPosition.ref.x -= 5;
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_DOWN.value)) playerPosition.ref.y += 5;
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_UP.value)) playerPosition.ref.y -= 5;

    if (playerPosition.ref.x < 0) {
      playerPosition.ref.x = 0;
    } else if ((playerPosition.ref.x + PLAYER_SIZE) > (map.tilesX*MAP_TILE_SIZE)) {
      playerPosition.ref.x = (map.tilesX*MAP_TILE_SIZE - PLAYER_SIZE).toDouble();
    }

    if (playerPosition.ref.y < 0) {
      playerPosition.ref.y = 0;
    } else if ((playerPosition.ref.y + PLAYER_SIZE) > (map.tilesY*MAP_TILE_SIZE)) {
      playerPosition.ref.y = (map.tilesY*MAP_TILE_SIZE - PLAYER_SIZE).toDouble();
    }

    for (int i = 0; i < map.tilesX*map.tilesY; i++) {
      if (map.tileFog[i] == 1) {
        map.tileFog[i] = 2;
      }
    }

    playerTileX = (playerPosition.ref.x + MAP_TILE_SIZE/2)~/MAP_TILE_SIZE;
    playerTileY = (playerPosition.ref.y + MAP_TILE_SIZE/2)~/MAP_TILE_SIZE;

    for (int y = (playerTileY - PLAYER_TILE_VISIBILITY); y < (playerTileY + PLAYER_TILE_VISIBILITY); y++) {
      for (int x = (playerTileX - PLAYER_TILE_VISIBILITY); x < (playerTileX + PLAYER_TILE_VISIBILITY); x++) {
        if (
          (x >= 0) &&
          (x < map.tilesX) &&
          (y >= 0) &&
          (y < map.tilesY)
        ) {
          map.tileFog[y*map.tilesX+x] = 1;
        }
      }
    }

    rl.Core.BeginTextureMode(fogOfWar);
      rl.Core.ClearBackground(rl.Color.BLANK);

      for (int y = 0; y < map.tilesY; y++) {
        for (int x = 0; x < map.tilesX; x++) {
          if (map.tileFog[y*map.tilesX+x] == 0) {
            rl.Core.DrawRectangle(x, y, 1, 1, rl.Color.BLACK);
          } else if (map.tileFog[y*map.tilesX+x] == 2) {
            rl.Core.DrawRectangle(x, y, 1, 1, rl.Core.Fade(rl.Color.BLACK, 0.8));
          }
        }
      }
    rl.Core.EndTextureMode();

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      for (int y = 0; y < map.tilesY; y++) {
        for (int x = 0; x < map.tilesX; x++) {
          rl.Core.DrawRectangle(
            x*MAP_TILE_SIZE, y*MAP_TILE_SIZE,
            MAP_TILE_SIZE, MAP_TILE_SIZE,
            map.tileIds[y*map.tilesX+x] == 0 ? rl.Color.BLUE : rl.Core.Fade(rl.Color.BLUE, 0.9),
          );
          rl.Core.DrawRectangleLines(
            x*MAP_TILE_SIZE, y*MAP_TILE_SIZE,
            MAP_TILE_SIZE, MAP_TILE_SIZE,
            rl.Core.Fade(rl.Color.DARKBLUE, 0.5),
          );
        }
      }

      rl.Core.DrawRectangleV(
        playerPosition.ref,
        rl.Temp.vec21(PLAYER_SIZE, PLAYER_SIZE),
        rl.Color.RED
      );

      textureSrc.set(
        0, 0,
        fogOfWar.texture.width, -fogOfWar.texture.height
      );

      textureDst.set(
        0, 0,
        map.tilesX*MAP_TILE_SIZE, map.tilesY*MAP_TILE_SIZE
      );
      
      rl.Core.DrawTexturePro(
        fogOfWar.texture,
        textureSrc.ref,
        textureDst.ref,
        rl.Temp.vec21(0, 0),
        0,
        rl.Color.WHITE,
      );

      rl.Core.DrawText(
        "Current tile: [$playerTileX, $playerTileY]".toC,
        10, 10, 20, rl.Color.RAYWHITE
      );
      
      rl.Core.DrawText(
        "ARROW KEYS to move".toC,
        10, screenHeight-25, 20, rl.Color.RAYWHITE
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadRenderTexture(fogOfWar);

  rl.CloseWindowAndDispose();
}