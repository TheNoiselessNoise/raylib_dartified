// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_first_person_maze.c
// Run it: dart run models_first_person_maze.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_first_person_maze");
  SetTargetFPS(60);
  DisableCursor();

  final Vector3D mapPosition = .vec3(-16.0, 0.0, -8.0);
  final Vector3D oldCamPos = .zero();

  final camera = Camera3DD(
    position: .vec3(0.2, 0.4, 0.2),
    target: .vec3(0.185, 0.4, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final imMap = LoadImage("../resources/cubicmap.png");
  final cubicmap = LoadTextureFromImage(imMap);

  final mesh = GenMeshCubicmap(imMap, .vec3(1.0, 1.0, 1.0));
  final model = LoadModelFromMesh(mesh); 

  final texture = LoadTexture("../resources/cubicmap_atlas.png");
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final mapPixels = LoadImageColors(imMap);
  UnloadImage(imMap);

  while (!WindowShouldClose())
  {
    oldCamPos.setD(camera.position);

    UpdateCamera(camera, .CAMERA_FIRST_PERSON);

    final Vector2D playerPos = .vec2(camera.position.x, camera.position.z);
    double playerRadius = 0.1;

    int playerCellX = (playerPos.x - mapPosition.x + 0.5).toInt();
    int playerCellY = (playerPos.y - mapPosition.z + 0.5).toInt();

    if (playerCellX < 0) playerCellX = 0;
    else if (playerCellX >= cubicmap.width) playerCellX = cubicmap.width - 1;

    if (playerCellY < 0) playerCellY = 0;
    else if (playerCellY >= cubicmap.height) playerCellY = cubicmap.height - 1;

    for (int y = playerCellY - 1; y <= playerCellY + 1; y++)
    {
      if ((y >= 0) && (y < cubicmap.height))
      {
        for (int x = playerCellX - 1; x <= playerCellX + 1; x++)
        {
          if (
            ((x >= 0) && (x < cubicmap.width)) &&
            (mapPixels[y*cubicmap.width + x].r == 255) &&
            (CheckCollisionCircleRec(
              playerPos,
              playerRadius,
              .rect(
                mapPosition.x - 0.5 + x*1.0, mapPosition.z - 0.5 + y*1.0,
                1.0, 1.0,
              ),
            ))
          ) {
            camera.position.setD(oldCamPos);
          }
        }
      }
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);
        DrawModel(model, mapPosition, 1.0, .WHITE);
      EndMode3D();

      DrawTextureEx(
        cubicmap,
        .vec2(GetScreenWidth() - cubicmap.width*4.0 - 20, 20.0),
        0.0, 4.0, .WHITE
      );
      DrawRectangleLines(
        GetScreenWidth() - cubicmap.width*4 - 20, 20, cubicmap.width*4,
        cubicmap.height*4,
        .GREEN
      );

      DrawRectangle(
        GetScreenWidth() - cubicmap.width*4 - 20 + playerCellX*4,
        20 + playerCellY*4, 4, 4,
        .RED
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadTexture(cubicmap);
  UnloadTexture(texture);
  UnloadModel(model);
  
  CloseWindowAndDispose();
}