// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_billboard.c
// Run it: dart run models_billboard.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int WORLD_SIZE = 8;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_billboard");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(5, 4, 5),
    target: .vec3(0, 2, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final bill = rl.CoreD.LoadTexture("../resources/billboard.png");
  Vector3D billPositionStatic = .vec3(0.0, 2.0, 0.0);
  Vector3D billPositionRotating = .vec3(1.0, 2.0, 1.0);

  RectangleD source = .rect(0.0, 0.0, bill.width, bill.height);

  Vector3D billUp = .vec3(0.0, 1.0, 0.0);

  Vector2D size = .vec2(source.width/source.height, 1.0);
  Vector2D origin = size.scale(0.5);

  double distanceStatic;
  double distanceRotating;
  double rotation = 0.0;

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    rotation += 0.4;
    distanceStatic = camera.position.distance(billPositionStatic);
    distanceRotating = camera.position.distance(billPositionRotating);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawGrid(10, 1.0);

        if (distanceStatic > distanceRotating) 
        {
          rl.CoreD.DrawBillboard(camera, bill, billPositionStatic, 2.0, .WHITE);
          rl.CoreD.DrawBillboardPro(camera, bill, source, billPositionRotating, billUp, size, origin, rotation, .WHITE);
        } 
        else
        {
          rl.CoreD.DrawBillboardPro(camera, bill, source, billPositionRotating, billUp, size, origin, rotation, .WHITE);
          rl.CoreD.DrawBillboard(camera, bill, billPositionStatic, 2.0, .WHITE);
        }

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(bill);
  
  rl.CloseWindowAndDispose();
}