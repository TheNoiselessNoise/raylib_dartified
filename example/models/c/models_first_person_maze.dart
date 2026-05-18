// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_first_person_maze.c
// Run it: dart run models_first_person_maze.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "models_first_person_maze".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final mapPosition = rl.Temp.Vector3$.At('mapPosition').set(-16.0, 0.0, -8.0);
  final oldCamPos = rl.Temp.Vector3$.At('oldCamPos');

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(0.2, 0.4, 0.2);
  camera.ref.target.set(0.185, 0.4, 0.0);
  camera.ref.up.set(0.0, 1.0, 0.0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final imMap = rl.Core.LoadImage("../resources/cubicmap.png".toC);
  final cubicmap = rl.Core.LoadTextureFromImage(imMap);

  final mesh = rl.Core.GenMeshCubicmap(imMap, rl.Temp.vec31(1.0, 1.0, 1.0));
  final model = rl.Core.LoadModelFromMesh(mesh); 

  final texture = rl.Core.LoadTexture("../resources/cubicmap_atlas.png".toC);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final mapPixels = rl.Core.LoadImageColors(imMap);
  rl.Core.UnloadImage(imMap);

  while (!rl.Core.WindowShouldClose())
  {
    oldCamPos.setC(camera.ref.position);

    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

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
            (rl.Core.CheckCollisionCircleRec(
              rl.Temp.vec21Ptr.setD(playerPos).ref, playerRadius,
              rl.Temp.rect1(mapPosition.ref.x - 0.5 + x*1.0, mapPosition.ref.z - 0.5 + y*1.0, 1.0, 1.0),
            ))
          ) {
            camera.ref.position.setC(oldCamPos.ref);
          }
        }
      }
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);
        rl.Core.DrawModel(model, mapPosition.ref, 1.0, rl.Color.WHITE);
      rl.Core.EndMode3D();

      rl.Core.DrawTextureEx(
        cubicmap,
        rl.Temp.vec21(rl.Core.GetScreenWidth() - cubicmap.width*4.0 - 20, 20.0),
        0.0, 4.0, rl.Color.WHITE
      );
      rl.Core.DrawRectangleLines(
        rl.Core.GetScreenWidth() - cubicmap.width*4 - 20, 20, cubicmap.width*4,
        cubicmap.height*4,
        rl.Color.GREEN
      );

      rl.Core.DrawRectangle(
        rl.Core.GetScreenWidth() - cubicmap.width*4 - 20 + playerCellX*4,
        20 + playerCellY*4, 4, 4,
        rl.Color.RED
      );

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadImageColors(mapPixels);
  rl.Core.UnloadTexture(cubicmap);
  rl.Core.UnloadTexture(texture);
  rl.Core.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}