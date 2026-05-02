// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_fog_of_war.c
// Run it: dart run textures_fog_of_war.dart
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
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_fog_of_war");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final map = ExampleMap();
  map.tilesX = screenWidth ~/ MAP_TILE_SIZE;
  map.tilesY = screenHeight ~/ MAP_TILE_SIZE;
  map.tileIds = List.filled(map.tilesX*map.tilesY, 0);
  map.tileFog = List.filled(map.tilesX*map.tilesY, 0);

  final Vector2D playerPosition = .zero();
  int playerTileX = 0;
  int playerTileY = 0;

  final fogOfWar = rl.CoreD.LoadRenderTexture(map.tilesX, map.tilesY);
  rl.CoreD.SetTextureFilter(fogOfWar.texture, .TEXTURE_FILTER_BILINEAR);

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsKeyDown(.KEY_RIGHT)) playerPosition.x += 5;
    if (rl.CoreD.IsKeyDown(.KEY_LEFT)) playerPosition.x -= 5;
    if (rl.CoreD.IsKeyDown(.KEY_DOWN)) playerPosition.y += 5;
    if (rl.CoreD.IsKeyDown(.KEY_UP)) playerPosition.y -= 5;

    if (playerPosition.x < 0) {
      playerPosition.x = 0;
    } else if ((playerPosition.x + PLAYER_SIZE) > (map.tilesX*MAP_TILE_SIZE)) {
      playerPosition.x = (map.tilesX*MAP_TILE_SIZE - PLAYER_SIZE).toDouble();
    }

    if (playerPosition.y < 0) {
      playerPosition.y = 0;
    } else if ((playerPosition.y + PLAYER_SIZE) > (map.tilesY*MAP_TILE_SIZE)) {
      playerPosition.y = (map.tilesY*MAP_TILE_SIZE - PLAYER_SIZE).toDouble();
    }

    for (int i = 0; i < map.tilesX*map.tilesY; i++) {
      if (map.tileFog[i] == 1) {
        map.tileFog[i] = 2;
      }
    }

    playerTileX = (playerPosition.x + MAP_TILE_SIZE/2)~/MAP_TILE_SIZE;
    playerTileY = (playerPosition.y + MAP_TILE_SIZE/2)~/MAP_TILE_SIZE;

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

    rl.CoreD.BeginTextureMode(fogOfWar);
      rl.CoreD.ClearBackground(.BLANK);

      for (int y = 0; y < map.tilesY; y++) {
        for (int x = 0; x < map.tilesX; x++) {
          if (map.tileFog[y*map.tilesX+x] == 0) {
            rl.CoreD.DrawRectangle(x, y, 1, 1, .BLACK);
          } else if (map.tileFog[y*map.tilesX+x] == 2) {
            rl.CoreD.DrawRectangle(x, y, 1, 1, rl.CoreD.Fade(.BLACK, 0.8));
          }
        }
      }
    rl.CoreD.EndTextureMode();

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      for (int y = 0; y < map.tilesY; y++) {
        for (int x = 0; x < map.tilesX; x++) {
          rl.CoreD.DrawRectangle(
            x*MAP_TILE_SIZE, y*MAP_TILE_SIZE,
            MAP_TILE_SIZE, MAP_TILE_SIZE,
            map.tileIds[y*map.tilesX+x] == 0 ? .BLUE : rl.CoreD.Fade(.BLUE, 0.9),
          );
          rl.CoreD.DrawRectangleLines(
            x*MAP_TILE_SIZE, y*MAP_TILE_SIZE,
            MAP_TILE_SIZE, MAP_TILE_SIZE,
            rl.CoreD.Fade(.DARKBLUE, 0.5),
          );
        }
      }

      rl.CoreD.DrawRectangleV(playerPosition, .vec2(PLAYER_SIZE, PLAYER_SIZE), .RED);

      rl.CoreD.DrawTexturePro(
        fogOfWar.texture,
        .rect(0, 0, fogOfWar.texture.width, -fogOfWar.texture.height),
        .rect(0, 0, map.tilesX*MAP_TILE_SIZE, map.tilesY*MAP_TILE_SIZE),
        .zero(), 0, .WHITE,
      );

      rl.CoreD.DrawText(
        "Current tile: [$playerTileX, $playerTileY]",
        10, 10, 20, .RAYWHITE
      );
      
      rl.CoreD.DrawText(
        "ARROW KEYS to move",
        10, screenHeight-25, 20, .RAYWHITE
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadRenderTexture(fogOfWar);

  rl.CloseWindowAndDispose();
}