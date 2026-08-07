// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_mesh_picking.c
// Run it: dart run models_mesh_picking.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_mesh_picking");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(20, 20, 20),
    target: .vec3(0, 8, 0),
    up: .vec3(0, 1.6, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  late RayD ray;

  final tower = LoadModel("../resources/models/obj/turret.obj");
  final texture = LoadTexture("../resources/models/obj/turret_diffuse.png");
  tower.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final Vector3D towerPos = .zero();
  final towerBBox = GetMeshBoundingBox(tower.meshes[0]);

  final Vector3D g0 = .vec3(-50.0, 0.0, -50.0);
  final Vector3D g1 = .vec3(-50.0, 0.0,  50.0);
  final Vector3D g2 = .vec3( 50.0, 0.0,  50.0);
  final Vector3D g3 = .vec3( 50.0, 0.0, -50.0);

  // Test triangle
  final Vector3D ta = .vec3(-25.0, 0.5, 0.0);
  final Vector3D tb = .vec3(-4.0, 2.5, 1.0);
  final Vector3D tc = .vec3(-8.0, 6.5, 0.0);

  Vector3D bary = .zero();

  // Test sphere
  final Vector3D sp = .vec3(-30.0, 5.0, 5.0);
  double sr = 4.0;

  while (!WindowShouldClose())
  {
    if (IsCursorHidden()) UpdateCamera(camera, .CAMERA_FIRST_PERSON);

    if (IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT))
    {
      if (IsCursorHidden()) EnableCursor();
      else DisableCursor();
    }

    RayCollisionD collision = .zero();
    String hitObjectName = "None";
    collision.distance = double.maxFinite;
    collision.hit = false;
    ColorD cursorColor = .WHITE;

    // Get ray and test against objects
    ray = GetScreenToWorldRay(GetMousePosition(), camera);

    // Check ray collision against ground quad
    final groundHitInfo = GetRayCollisionQuad(ray, g0, g1, g2, g3);

    if ((groundHitInfo.hit) && (groundHitInfo.distance < collision.distance))
    {
      collision = groundHitInfo;
      cursorColor = .GREEN;
      hitObjectName = "Ground";
    }

    // Check ray collision against test triangle
    final triHitInfo = GetRayCollisionTriangle(ray, ta, tb, tc);

    if ((triHitInfo.hit) && (triHitInfo.distance < collision.distance))
    {
      collision = triHitInfo;
      cursorColor = .PURPLE;
      hitObjectName = "Triangle";

      bary = .barycenter(collision.point, ta, tb, tc);
    }

    // Check ray collision against test sphere
    final sphereHitInfo = GetRayCollisionSphere(ray, sp, sr);

    if ((sphereHitInfo.hit) && (sphereHitInfo.distance < collision.distance))
    {
      collision = sphereHitInfo;
      cursorColor = .ORANGE;
      hitObjectName = "Sphere";
    }

    // Check ray collision against bounding box first, before trying the full ray-mesh test
    final boxHitInfo = GetRayCollisionBox(ray, towerBBox);

    if ((boxHitInfo.hit) && (boxHitInfo.distance < collision.distance))
    {
      collision = boxHitInfo;
      cursorColor = .ORANGE;
      hitObjectName = "Box";

      // Check ray collision against model meshes
      RayCollisionD meshHitInfo = .zero();
      for (int m = 0; m < tower.meshCount; m++)
      {
        // NOTE: We consider the model.transform for the collision check but 
        // it can be checked against any transform Matrix, used when checking against same
        // model drawn multiple times with multiple transforms
        meshHitInfo = GetRayCollisionMesh(ray, tower.meshes[m], tower.transform);
        if (meshHitInfo.hit)
        {
          // Save the closest hit mesh
          if ((!collision.hit) || (collision.distance > meshHitInfo.distance)) collision = meshHitInfo;
          
          break;  // Stop once one mesh collision is detected, the colliding mesh is m
        }
      }

      if (meshHitInfo.hit)
      {
        collision = meshHitInfo;
        cursorColor = .ORANGE;
        hitObjectName = "Mesh";
      }
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawModel(tower, towerPos, 1.0, .WHITE);

        DrawLine3D(ta, tb, .PURPLE);
        DrawLine3D(tb, tc, .PURPLE);
        DrawLine3D(tc, ta, .PURPLE);

        DrawSphereWires(sp, sr, 8, 8, .PURPLE);

        if (boxHitInfo.hit) DrawBoundingBox(towerBBox, .LIME);

        if (collision.hit)
        {
          DrawCube(collision.point, 0.3, 0.3, 0.3, cursorColor);
          DrawCubeWires(collision.point, 0.3, 0.3, 0.3, .RED);

          final normalEnd = collision.point.add(collision.normal);
          DrawLine3D(collision.point, normalEnd, .RED);
        }

        DrawRay(ray, .MAROON);

        DrawGrid(10, 10.0);

      EndMode3D();

      DrawText(
        "Hit Object: $hitObjectName",
        10, 50, 10, .BLACK
      );

      if (collision.hit)
      {
        int ypos = 70;

        DrawText(
          "Distance: ${collision.distance.f2}",
          10, ypos, 10, .BLACK
        );

        DrawText(
          "Hit Pos: ${collision.point.x.f2} ${collision.point.y.f2} ${collision.point.z.f2}",
          10, ypos + 15, 10, .BLACK
        );

        DrawText(
          "Hit Norm: ${collision.normal.x.f2} ${collision.normal.y.f2} ${collision.normal.z.f2}",
          10, ypos + 30, 10, .BLACK
        );

        if (triHitInfo.hit && hitObjectName == "Triangle")
          DrawText(
            "Barycenter: ${bary.x.f2} ${bary.y.f2} ${bary.z.f2}",
            10, ypos + 45, 10, .BLACK
          );
      }

      DrawText(
        "Right click mouse to toggle camera controls",
        10, 430, 10, .GRAY
      );

      DrawText(
        "(c) Turret 3D model by Alberto Cano",
        screenWidth - 200, screenHeight - 20, 10, .GRAY
      );

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadModel(tower);
  UnloadTexture(texture);
  
  CloseWindowAndDispose();
}