// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_billboard_rendering.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int WORLD_SIZE = 8;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "models_billboard_rendering");
  SetTargetFPS(60);

  final camera = Camera3D(
    position: .vec3(5, 4, 5),
    target: .vec3(0, 2, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final bill = LoadTexture("../resources/billboard.png");
  Vector3 billPositionStatic = .vec3(0.0, 2.0, 0.0);
  Vector3 billPositionRotating = .vec3(1.0, 2.0, 1.0);

  Rectangle source = .rect(0.0, 0.0, bill.width, bill.height);

  Vector3 billUp = .vec3(0.0, 1.0, 0.0);

  Vector2 size = .vec2(source.width/source.height, 1.0);
  Vector2 origin = size.scale(0.5);

  double distanceStatic;
  double distanceRotating;
  double rotation = 0.0;

  rl.setMainLoop(() {
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
  });
});