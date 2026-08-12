// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_mesh_picking.c
// Run it: dart run models_mesh_picking.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_mesh_picking".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(20, 20, 20);
  camera.ref.target.set(0, 8, 0);
  camera.ref.up.set(0, 1.6, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final ray = Ray$.val.At('ray');

  final tower = LoadModel("../resources/models/obj/turret.obj".toC);
  final texture = LoadTexture("../resources/models/obj/turret_diffuse.png".toC);
  tower.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final towerPos = Vector3$.val.At('towerPos');
  final towerBBox = GetMeshBoundingBox(tower.meshes[0]);

  final g0 = Vector3$.val.At('g0').set(-50.0, 0.0, -50.0);
  final g1 = Vector3$.val.At('g1').set(-50.0, 0.0,  50.0);
  final g2 = Vector3$.val.At('g2').set( 50.0, 0.0,  50.0);
  final g3 = Vector3$.val.At('g3').set( 50.0, 0.0, -50.0);

  // Test triangle
  final ta = Vector3$.val.At('ta').set(-25.0, 0.5, 0.0);
  final tb = Vector3$.val.At('tb').set(-4.0, 2.5, 1.0);
  final tc = Vector3$.val.At('tc').set(-8.0, 6.5, 0.0);

  final bary = Vector3$.val.At('bary');

  // Test sphere
  final sp = Vector3$.val.At('sp').set(-30.0, 5.0, 5.0);
  double sr = 4.0;

  while (!WindowShouldClose())
  {
    if (IsCursorHidden()) UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_RIGHT.value))
    {
      if (IsCursorHidden()) EnableCursor();
      else DisableCursor();
    }

    final collision = RayCollision$.val.At('collision');
    String hitObjectName = "None";
    collision.ref.distance = double.maxFinite;
    collision.ref.hit = false;
    ColorC cursorColor = WHITE;

    // Get ray and test against objects
    ray.ref = GetScreenToWorldRay(GetMousePosition(), camera.ref);

    // Check ray collision against ground quad
    final groundHitInfo = GetRayCollisionQuad(ray.ref, g0.ref, g1.ref, g2.ref, g3.ref);

    if ((groundHitInfo.hit) && (groundHitInfo.distance < collision.ref.distance))
    {
      collision.ref = groundHitInfo;
      cursorColor = GREEN;
      hitObjectName = "Ground";
    }

    // Check ray collision against test triangle
    final triHitInfo = GetRayCollisionTriangle(ray.ref, ta.ref, tb.ref, tc.ref);

    if ((triHitInfo.hit) && (triHitInfo.distance < collision.ref.distance))
    {
      collision.ref = triHitInfo;
      cursorColor = PURPLE;
      hitObjectName = "Triangle";

      bary.setD(rl.Vector.Vector3Barycenter(collision.ref.point.toD(), ta.toD(), tb.toD(), tc.toD()));
    }

    // Check ray collision against test sphere
    final sphereHitInfo = GetRayCollisionSphere(ray.ref, sp.ref, sr);

    if ((sphereHitInfo.hit) && (sphereHitInfo.distance < collision.ref.distance))
    {
      collision.ref = sphereHitInfo;
      cursorColor = ORANGE;
      hitObjectName = "Sphere";
    }

    // Check ray collision against bounding box first, before trying the full ray-mesh test
    final boxHitInfo = GetRayCollisionBox(ray.ref, towerBBox);

    if ((boxHitInfo.hit) && (boxHitInfo.distance < collision.ref.distance))
    {
      collision.ref = boxHitInfo;
      cursorColor = ORANGE;
      hitObjectName = "Box";

      // Check ray collision against model meshes
      final meshHitInfo = RayCollision$.val.At('meshHitInfo');
      for (int m = 0; m < tower.meshCount; m++)
      {
        // NOTE: We consider the model.transform for the collision check but 
        // it can be checked against any transform Matrix, used when checking against same
        // model drawn multiple times with multiple transforms
        meshHitInfo.ref = GetRayCollisionMesh(ray.ref, tower.meshes[m], tower.transform);
        if (meshHitInfo.ref.hit)
        {
          // Save the closest hit mesh
          if ((!collision.ref.hit) || (collision.ref.distance > meshHitInfo.ref.distance)) collision.ref = meshHitInfo.ref;
          
          break;  // Stop once one mesh collision is detected, the colliding mesh is m
        }
      }

      if (meshHitInfo.ref.hit)
      {
        collision.ref = meshHitInfo.ref;
        cursorColor = ORANGE;
        hitObjectName = "Mesh";
      }
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawModel(tower, towerPos.ref, 1.0, WHITE);

        DrawLine3D(ta.ref, tb.ref, PURPLE);
        DrawLine3D(tb.ref, tc.ref, PURPLE);
        DrawLine3D(tc.ref, ta.ref, PURPLE);

        DrawSphereWires(sp.ref, sr, 8, 8, PURPLE);

        if (boxHitInfo.hit) DrawBoundingBox(towerBBox, LIME);

        if (collision.ref.hit)
        {
          DrawCube(collision.ref.point, 0.3, 0.3, 0.3, cursorColor);
          DrawCubeWires(collision.ref.point, 0.3, 0.3, 0.3, RED);

          final normalEnd = Vector3$.val.At('normalEnd');
          normalEnd.ref.x = collision.ref.point.x + collision.ref.normal.x;
          normalEnd.ref.y = collision.ref.point.y + collision.ref.normal.y;
          normalEnd.ref.z = collision.ref.point.z + collision.ref.normal.z;

          DrawLine3D(collision.ref.point, normalEnd.ref, RED);
        }

        DrawRay(ray.ref, MAROON);

        DrawGrid(10, 10.0);

      EndMode3D();

      DrawText(
        "Hit Object: $hitObjectName".toC,
        10, 50, 10, BLACK
      );

      if (collision.ref.hit)
      {
        int ypos = 70;

        DrawText(
          "Distance: ${collision.ref.distance.f2}".toC,
          10, ypos, 10, BLACK
        );

        DrawText(
          "Hit Pos: ${collision.ref.point.x.f2} ${collision.ref.point.y.f2} ${collision.ref.point.z.f2}".toC,
          10, ypos + 15, 10, BLACK
        );

        DrawText(
          "Hit Norm: ${collision.ref.normal.x.f2} ${collision.ref.normal.y.f2} ${collision.ref.normal.z.f2}".toC,
          10, ypos + 30, 10, BLACK
        );

        if (triHitInfo.hit && hitObjectName == "Triangle")
          DrawText(
            "Barycenter: ${bary.ref.x.f2} ${bary.ref.y.f2} ${bary.ref.z.f2}".toC,
            10, ypos + 45, 10, BLACK
          );
      }

      DrawText(
        "Right click mouse to toggle camera controls".toC,
        10, 430, 10, GRAY
      );

      DrawText(
        "(c) Turret 3D model by Alberto Cano".toC,
        screenWidth - 200, screenHeight - 20, 10, GRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadModel(tower);
  UnloadTexture(texture);
  
  CloseWindowAndDispose();
}