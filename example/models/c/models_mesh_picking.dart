// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_mesh_picking.c
// Run it: dart run models_mesh_picking.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "models_mesh_picking".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(20, 20, 20);
  camera.ref.target.set(0, 8, 0);
  camera.ref.up.set(0, 1.6, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final ray = rl.Temp.Ray$.At('ray');

  final tower = rl.Core.LoadModel("../resources/models/obj/turret.obj".toC);
  final texture = rl.Core.LoadTexture("../resources/models/obj/turret_diffuse.png".toC);
  tower.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final towerPos = rl.Temp.Vector3$.At('towerPos');
  final towerBBox = rl.Core.GetMeshBoundingBox(tower.meshes[0]);

  final g0 = rl.Temp.Vector3$.At('g0').set(-50.0, 0.0, -50.0);
  final g1 = rl.Temp.Vector3$.At('g1').set(-50.0, 0.0,  50.0);
  final g2 = rl.Temp.Vector3$.At('g2').set( 50.0, 0.0,  50.0);
  final g3 = rl.Temp.Vector3$.At('g3').set( 50.0, 0.0, -50.0);

  // Test triangle
  final ta = rl.Temp.Vector3$.At('ta').set(-25.0, 0.5, 0.0);
  final tb = rl.Temp.Vector3$.At('tb').set(-4.0, 2.5, 1.0);
  final tc = rl.Temp.Vector3$.At('tc').set(-8.0, 6.5, 0.0);

  final bary = rl.Temp.Vector3$.At('bary');

  // Test sphere
  final sp = rl.Temp.Vector3$.At('sp').set(-30.0, 5.0, 5.0);
  double sr = 4.0;

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsCursorHidden()) rl.Core.UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

    if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_RIGHT.value))
    {
      if (rl.Core.IsCursorHidden()) rl.Core.EnableCursor();
      else rl.Core.DisableCursor();
    }

    final collision = rl.Temp.RayCollision$.At('collision');
    String hitObjectName = "None";
    collision.ref.distance = double.maxFinite;
    collision.ref.hit = false;
    ColorC cursorColor = rl.Color.WHITE;

    // Get ray and test against objects
    ray.ref = rl.Core.GetScreenToWorldRay(rl.Core.GetMousePosition(), camera.ref);

    // Check ray collision against ground quad
    final groundHitInfo = rl.Core.GetRayCollisionQuad(ray.ref, g0.ref, g1.ref, g2.ref, g3.ref);

    if ((groundHitInfo.hit) && (groundHitInfo.distance < collision.ref.distance))
    {
      collision.ref = groundHitInfo;
      cursorColor = rl.Color.GREEN;
      hitObjectName = "Ground";
    }

    // Check ray collision against test triangle
    final triHitInfo = rl.Core.GetRayCollisionTriangle(ray.ref, ta.ref, tb.ref, tc.ref);

    if ((triHitInfo.hit) && (triHitInfo.distance < collision.ref.distance))
    {
      collision.ref = triHitInfo;
      cursorColor = rl.Color.PURPLE;
      hitObjectName = "Triangle";

      bary.setD(rl.Vector.Vector3Barycenter(collision.ref.point.toD(), ta.toD(), tb.toD(), tc.toD()));
    }

    // Check ray collision against test sphere
    final sphereHitInfo = rl.Core.GetRayCollisionSphere(ray.ref, sp.ref, sr);

    if ((sphereHitInfo.hit) && (sphereHitInfo.distance < collision.ref.distance))
    {
      collision.ref = sphereHitInfo;
      cursorColor = rl.Color.ORANGE;
      hitObjectName = "Sphere";
    }

    // Check ray collision against bounding box first, before trying the full ray-mesh test
    final boxHitInfo = rl.Core.GetRayCollisionBox(ray.ref, towerBBox);

    if ((boxHitInfo.hit) && (boxHitInfo.distance < collision.ref.distance))
    {
      collision.ref = boxHitInfo;
      cursorColor = rl.Color.ORANGE;
      hitObjectName = "Box";

      // Check ray collision against model meshes
      final meshHitInfo = rl.Temp.RayCollision$.At('meshHitInfo');
      for (int m = 0; m < tower.meshCount; m++)
      {
        // NOTE: We consider the model.transform for the collision check but 
        // it can be checked against any transform Matrix, used when checking against same
        // model drawn multiple times with multiple transforms
        meshHitInfo.ref = rl.Core.GetRayCollisionMesh(ray.ref, tower.meshes[m], tower.transform);
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
        cursorColor = rl.Color.ORANGE;
        hitObjectName = "Mesh";
      }
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawModel(tower, towerPos.ref, 1.0, rl.Color.WHITE);

        rl.Core.DrawLine3D(ta.ref, tb.ref, rl.Color.PURPLE);
        rl.Core.DrawLine3D(tb.ref, tc.ref, rl.Color.PURPLE);
        rl.Core.DrawLine3D(tc.ref, ta.ref, rl.Color.PURPLE);

        rl.Core.DrawSphereWires(sp.ref, sr, 8, 8, rl.Color.PURPLE);

        if (boxHitInfo.hit) rl.Core.DrawBoundingBox(towerBBox, rl.Color.LIME);

        if (collision.ref.hit)
        {
          rl.Core.DrawCube(collision.ref.point, 0.3, 0.3, 0.3, cursorColor);
          rl.Core.DrawCubeWires(collision.ref.point, 0.3, 0.3, 0.3, rl.Color.RED);

          final normalEnd = rl.Temp.Vector3$.At('normalEnd');
          normalEnd.ref.x = collision.ref.point.x + collision.ref.normal.x;
          normalEnd.ref.y = collision.ref.point.y + collision.ref.normal.y;
          normalEnd.ref.z = collision.ref.point.z + collision.ref.normal.z;

          rl.Core.DrawLine3D(collision.ref.point, normalEnd.ref, rl.Color.RED);
        }

        rl.Core.DrawRay(ray.ref, rl.Color.MAROON);

        rl.Core.DrawGrid(10, 10.0);

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Hit Object: $hitObjectName".toC,
        10, 50, 10, rl.Color.BLACK
      );

      if (collision.ref.hit)
      {
        int ypos = 70;

        rl.Core.DrawText(
          "Distance: ${collision.ref.distance.f2}".toC,
          10, ypos, 10, rl.Color.BLACK
        );

        rl.Core.DrawText(
          "Hit Pos: ${collision.ref.point.x.f2} ${collision.ref.point.y.f2} ${collision.ref.point.z.f2}".toC,
          10, ypos + 15, 10, rl.Color.BLACK
        );

        rl.Core.DrawText(
          "Hit Norm: ${collision.ref.normal.x.f2} ${collision.ref.normal.y.f2} ${collision.ref.normal.z.f2}".toC,
          10, ypos + 30, 10, rl.Color.BLACK
        );

        if (triHitInfo.hit && hitObjectName == "Triangle")
          rl.Core.DrawText(
            "Barycenter: ${bary.ref.x.f2} ${bary.ref.y.f2} ${bary.ref.z.f2}".toC,
            10, ypos + 45, 10, rl.Color.BLACK
          );
      }

      rl.Core.DrawText(
        "Right click mouse to toggle camera controls".toC,
        10, 430, 10, rl.Color.GRAY
      );

      rl.Core.DrawText(
        "(c) Turret 3D model by Alberto Cano".toC,
        screenWidth - 200, screenHeight - 20, 10, rl.Color.GRAY
      );

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadModel(tower);
  rl.Core.UnloadTexture(texture);
  
  rl.CloseWindowAndDispose();
}