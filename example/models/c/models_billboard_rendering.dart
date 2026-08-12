// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_billboard_rendering.c
// Run it: dart run models_billboard_rendering.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int WORLD_SIZE = 8;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_billboard_rendering".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(5, 4, 5);
  camera.ref.target.set(0, 2, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final bill = LoadTexture("../resources/billboard.png".toC);
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
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    rotation += 0.4;
    distanceStatic = camera.ref.position.toD().distance(billPositionStatic);
    distanceRotating = camera.ref.position.toD().distance(billPositionRotating);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawGrid(10, 1.0);

        if (distanceStatic > distanceRotating) 
        {
          DrawBillboard(
            camera.ref,
            bill,
            Vector3$.val.$1.setD(billPositionStatic),
            2.0,
            WHITE
          );
          DrawBillboardPro(
            camera.ref,
            bill,
            Rectangle$.val.$1.setD(source),
            Vector3$.val.$1.setD(billPositionRotating),
            Vector3$.val.$2.setD(billUp),
            Vector2$.val.$1.setD(size),
            Vector2$.val.$2.setD(origin),
            rotation,
            WHITE
          );
        } 
        else
        {
          DrawBillboardPro(
            camera.ref,
            bill,
            Rectangle$.val.$1.setD(source),
            Vector3$.val.$1.setD(billPositionRotating),
            Vector3$.val.$2.setD(billUp),
            Vector2$.val.$1.setD(size),
            Vector2$.val.$2.setD(origin),
            rotation,
            WHITE
          );
          DrawBillboard(
            camera.ref,
            bill,
            Vector3$.val.$1.setD(billPositionStatic),
            2.0,
            WHITE
          );
        }

      EndMode3D();

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadTexture(bill);
  
  CloseWindowAndDispose();
}