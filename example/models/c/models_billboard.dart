// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_billboard.c
// Run it: dart run models_billboard.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int WORLD_SIZE = 8;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "models_billboard".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(5, 4, 5);
  camera.ref.target.set(0, 2, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final bill = rl.Core.LoadTexture("../resources/billboard.png".toC);
  Vector3D billPositionStatic = .vec3(0.0, 2.0, 0.0);
  Vector3D billPositionRotating = .vec3(1.0, 2.0, 1.0);

  RectangleD source = .rect(0.0, 0.0, bill.width, bill.height);

  Vector3D billUp = .vec3(0.0, 1.0, 0.0);

  Vector2D size = .vec2(source.width/source.height, 1.0);
  Vector2D origin = size.scale(0.5);

  double distanceStatic;
  double distanceRotating;
  double rotation = 0.0;

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    rotation += 0.4;
    distanceStatic = camera.ref.position.toD().distance(billPositionStatic);
    distanceRotating = camera.ref.position.toD().distance(billPositionRotating);

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawGrid(10, 1.0);

        if (distanceStatic > distanceRotating) 
        {
          rl.Core.DrawBillboard(
            camera.ref,
            bill,
            rl.Temp.vec31D(billPositionStatic),
            2.0,
            rl.Color.WHITE
          );
          rl.Core.DrawBillboardPro(
            camera.ref,
            bill,
            rl.Temp.rect1D(source),
            rl.Temp.vec31D(billPositionRotating),
            rl.Temp.vec32D(billUp),
            rl.Temp.vec21D(size),
            rl.Temp.vec22D(origin),
            rotation,
            rl.Color.WHITE
          );
        } 
        else
        {
          rl.Core.DrawBillboardPro(
            camera.ref,
            bill,
            rl.Temp.rect1D(source),
            rl.Temp.vec31D(billPositionRotating),
            rl.Temp.vec32D(billUp),
            rl.Temp.vec21D(size),
            rl.Temp.vec22D(origin),
            rotation,
            rl.Color.WHITE
          );
          rl.Core.DrawBillboard(
            camera.ref,
            bill,
            rl.Temp.vec31D(billPositionStatic),
            2.0,
            rl.Color.WHITE
          );
        }

      rl.Core.EndMode3D();

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(bill);
  
  rl.CloseWindowAndDispose();
}