// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_first_person_maze.c
// Run it: dart run models_first_person_maze.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_first_person_maze".toC);
  SetTargetFPS(60);
  DisableCursor();

  final mapPosition = Vector3$.At('mapPosition').set(-16.0, 0.0, -8.0);
  final oldCamPos = Vector3$.At('oldCamPos');

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(0.2, 0.4, 0.2);
  camera.ref.target.set(0.185, 0.4, 0.0);
  camera.ref.up.set(0.0, 1.0, 0.0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final imMap = LoadImage("../resources/cubicmap.png".toC);
  final cubicmap = LoadTextureFromImage(imMap);

  final mesh = GenMeshCubicmap(imMap, Vector3$.$1.set(1.0, 1.0, 1.0));
  final model = LoadModelFromMesh(mesh); 

  final texture = LoadTexture("../resources/cubicmap_atlas.png".toC);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final mapPixels = LoadImageColors(imMap);
  UnloadImage(imMap);

  while (!WindowShouldClose())
  {
    oldCamPos.setC(camera.ref.position);

    UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

    final Vector2D playerPos = .vec2(camera.ref.position.x, camera.ref.position.z);
    double playerRadius = 0.1;

    int playerCellX = (playerPos.x - mapPosition.ref.x + 0.5).toInt();
    int playerCellY = (playerPos.y - mapPosition.ref.z + 0.5).toInt();

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
              Vector2$.$1.setD(playerPos), playerRadius,
              Rectangle$.$1.set(mapPosition.ref.x - 0.5 + x*1.0, mapPosition.ref.z - 0.5 + y*1.0, 1.0, 1.0),
            ))
          ) {
            camera.ref.position.setC(oldCamPos.ref);
          }
        }
      }
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);
        DrawModel(model, mapPosition.ref, 1.0, WHITE);
      EndMode3D();

      DrawTextureEx(
        cubicmap,
        Vector2$.$1.set(GetScreenWidth() - cubicmap.width*4.0 - 20, 20.0),
        0.0, 4.0, WHITE
      );
      DrawRectangleLines(
        GetScreenWidth() - cubicmap.width*4 - 20, 20, cubicmap.width*4,
        cubicmap.height*4,
        GREEN
      );

      DrawRectangle(
        GetScreenWidth() - cubicmap.width*4 - 20 + playerCellX*4,
        20 + playerCellY*4, 4, 4,
        RED
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadImageColors(mapPixels);
  UnloadTexture(cubicmap);
  UnloadTexture(texture);
  UnloadModel(model);
  
  CloseWindowAndDispose();
}