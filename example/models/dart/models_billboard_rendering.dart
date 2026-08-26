// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_billboard_rendering.c
// Run it: dart run models_billboard_rendering.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int WORLD_SIZE = 8;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_billboard_rendering");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(5, 4, 5),
    target: .vec3(0, 2, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final bill = LoadTexture("../resources/billboard.png");
  Vector3D billPositionStatic = .vec3(0.0, 2.0, 0.0);
  Vector3D billPositionRotating = .vec3(1.0, 2.0, 1.0);

  RectangleD source = .rect(0.0, 0.0, bill.width, bill.height);

  Vector3D billUp = .vec3(0.0, 1.0, 0.0);

  Vector2D size = .vec2(source.width/source.height, 1.0);
  Vector2D origin = size.scale(0.5);

  double distanceStatic;
  double distanceRotating;
  double rotation = 0.0;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    rotation += 0.4;
    distanceStatic = camera.position.distance(billPositionStatic);
    distanceRotating = camera.position.distance(billPositionRotating);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawGrid(10, 1.0);

        if (distanceStatic > distanceRotating) 
        {
          DrawBillboard(camera, bill, billPositionStatic, 2.0, .WHITE);
          // ignore: deprecated_member_use
          DrawBillboardPro(camera, bill, source, billPositionRotating, billUp, size, origin, rotation, .WHITE);
        } 
        else
        {
          // ignore: deprecated_member_use
          DrawBillboardPro(camera, bill, source, billPositionRotating, billUp, size, origin, rotation, .WHITE);
          DrawBillboard(camera, bill, billPositionStatic, 2.0, .WHITE);
        }

      EndMode3D();

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadTexture(bill);
  
  CloseWindowAndDispose();
}