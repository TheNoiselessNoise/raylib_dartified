// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_first_person_maze.c
// Run it: dart run models_first_person_maze.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_first_person_maze");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final Vector3D mapPosition = .vec3(-16.0, 0.0, -8.0);
  final Vector3D oldCamPos = .zero();

  final camera = Camera3DD(
    position: .vec3(0.2, 0.4, 0.2),
    target: .vec3(0.185, 0.4, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final imMap = rl.CoreD.LoadImage("../resources/cubicmap.png");
  final cubicmap = rl.CoreD.LoadTextureFromImage(imMap);

  final mesh = rl.CoreD.GenMeshCubicmap(imMap, .vec3(1.0, 1.0, 1.0));
  final model = rl.CoreD.LoadModelFromMesh(mesh); 

  final texture = rl.CoreD.LoadTexture("../resources/cubicmap_atlas.png");
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final mapPixels = rl.CoreD.LoadImageColors(imMap);
  rl.CoreD.UnloadImage(imMap);

  while (!rl.CoreD.WindowShouldClose())
  {
    oldCamPos.setD(camera.position);

    rl.CoreD.UpdateCamera(camera, .CAMERA_FIRST_PERSON);

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
            (rl.CoreD.CheckCollisionCircleRec(
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

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);
        rl.CoreD.DrawModel(model, mapPosition, 1.0, .WHITE);
      rl.CoreD.EndMode3D();

      rl.CoreD.DrawTextureEx(
        cubicmap,
        .vec2(rl.CoreD.GetScreenWidth() - cubicmap.width*4.0 - 20, 20.0),
        0.0, 4.0, .WHITE
      );
      rl.CoreD.DrawRectangleLines(
        rl.CoreD.GetScreenWidth() - cubicmap.width*4 - 20, 20, cubicmap.width*4,
        cubicmap.height*4,
        .GREEN
      );

      rl.CoreD.DrawRectangle(
        rl.CoreD.GetScreenWidth() - cubicmap.width*4 - 20 + playerCellX*4,
        20 + playerCellY*4, 4, 4,
        .RED
      );

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(cubicmap);
  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}