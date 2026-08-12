// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_framebuffer_rendering.c
// Run it: dart run textures_framebuffer_rendering.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int splitWidth = screenWidth~/2;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_framebuffer_rendering".toC);
  SetTargetFPS(60);
  DisableCursor();

  final subjectCamera = Camera3D$.val.At('subjectCamera');
  subjectCamera.ref.position.set(5.0, 5.0, 5.0);
  subjectCamera.ref.target.set(0.0, 0.0, 0.0);
  subjectCamera.ref.up.set(0.0, 1.0, 0.0);
  subjectCamera.ref.fovy = 45.0;
  subjectCamera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final observerCamera = Camera3D$.val.At('observerCamera');
  observerCamera.ref.position.set(10.0, 10.0, 10.0);
  observerCamera.ref.target.set(0.0, 0.0, 0.0);
  observerCamera.ref.up.set(0.0, 1.0, 0.0);
  observerCamera.ref.fovy = 45.0;
  observerCamera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final observerTarget = LoadRenderTexture(splitWidth, screenHeight);
  final observerSource = Rectangle$.val.At('observerSource').set(
    0.0, 0.0, observerTarget.texture.width, -observerTarget.texture.height
  );
  final observerDest = Rectangle$.val.At('observerDest').set(
    0.0, 0.0, splitWidth, screenHeight
  );

  final subjectTarget = LoadRenderTexture(splitWidth, screenHeight);
  final subjectSource = Rectangle$.val.At('subjectSource').set(
    0.0, 0.0, subjectTarget.texture.width, -subjectTarget.texture.height
  );
  final subjectDest = Rectangle$.val.At('subjectDest').set(
    splitWidth, 0.0, splitWidth, screenHeight
  );
  final textureAspectRatio = subjectTarget.texture.width/subjectTarget.texture.height;

  final captureSize = 128.0;
  final cropSource = Rectangle$.val.At('cropSource').set(
    (subjectTarget.texture.width - captureSize)/2.0, (subjectTarget.texture.height - captureSize)/2.0, captureSize, -captureSize
  );
  final cropDest = Rectangle$.val.At('cropDest').set(
    splitWidth + 20.0, 20.0, captureSize, captureSize
  );

  while (!WindowShouldClose())
  {
    UpdateCamera(observerCamera, CameraMode.CAMERA_FREE.value);
    UpdateCamera(subjectCamera, CameraMode.CAMERA_ORBITAL.value);

    if (IsKeyPressed(KeyboardKey.KEY_R.value)) observerCamera.ref.target.set(0, 0, 0);

    BeginTextureMode(observerTarget);

      ClearBackground(RAYWHITE);

      BeginMode3D(observerCamera.ref);

        DrawGrid(10, 1.0);
        DrawCube(Vector3$.val.$zero, 2.0, 2.0, 2.0, GOLD);
        DrawCubeWires(Vector3$.val.$zero, 2.0, 2.0, 2.0, PINK);
        DrawCameraPrism(subjectCamera.ref, textureAspectRatio, GREEN);

      EndMode3D();

      DrawText("Observer View".toC, 10, observerTarget.texture.height - 30, 20, BLACK);
      DrawText("WASD + Mouse to Move".toC, 10, 10, 20, DARKGRAY);
      DrawText("Scroll to Zoom".toC, 10, 30, 20, DARKGRAY);
      DrawText("R to Reset Observer Target".toC, 10, 50, 20, DARKGRAY);

    EndTextureMode();

    BeginTextureMode(subjectTarget);

      ClearBackground(RAYWHITE);

      BeginMode3D(subjectCamera.ref);

        DrawCube(Vector3$.val.$zero, 2.0, 2.0, 2.0, GOLD);
        DrawCubeWires(Vector3$.val.$zero, 2.0, 2.0, 2.0, PINK);
        DrawGrid(10, 1.0);

      EndMode3D();

      DrawRectangleLines(
        (subjectTarget.texture.width - captureSize)~/2.0,
        (subjectTarget.texture.height - captureSize)~/2.0,
        captureSize.toInt(),
        captureSize.toInt(),
        GREEN
      );
      DrawText("Subject View".toC, 10, subjectTarget.texture.height - 30, 20, BLACK);

    EndTextureMode();

    BeginDrawing();

      ClearBackground(BLACK);

      DrawTexturePro(observerTarget.texture, observerSource.ref, observerDest.ref, Vector2$.val.$zero, 0.0, WHITE);

      DrawTexturePro(subjectTarget.texture, subjectSource.ref, subjectDest.ref, Vector2$.val.$zero, 0.0, WHITE);

      DrawTexturePro(subjectTarget.texture, cropSource.ref, cropDest.ref, Vector2$.val.$zero, 0.0, WHITE);
      DrawRectangleLinesEx(cropDest.ref, 2, BLACK);

      DrawLine(splitWidth, 0, splitWidth, screenHeight, BLACK);

    EndDrawing();
  }

  UnloadRenderTexture(observerTarget);
  UnloadRenderTexture(subjectTarget);

  CloseWindowAndDispose();
}

void DrawCameraPrism(Camera3DC camera, double aspect, ColorC color)
{
  final length = camera.position.toD().distance(camera.target.toD());

  final planeNDC = Vector3$.val.At('planeNDC', 4);
  planeNDC[0].set(-1, -1, 1);
  planeNDC[1].set( 1, -1, 1);
  planeNDC[2].set( 1,  1, 1);
  planeNDC[3].set(-1,  1, 1);

  final view = GetCameraMatrix(camera).toD();
  final MatrixD proj = .perspective(camera.fovy * rl.DEG2RAD, aspect, 0.05, length);
  final viewProj = view.mul(proj);
  final inverseViewProj = viewProj.invert();

  final corners = Vector3$.val.At('corners', 4);
  for (int i = 0; i < 4; i++)
  {
    final x = planeNDC[i].x;
    final y = planeNDC[i].y;
    final z = planeNDC[i].z;

    final vx = inverseViewProj.m0*x + inverseViewProj.m4*y + inverseViewProj.m8*z + inverseViewProj.m12;
    final vy = inverseViewProj.m1*x + inverseViewProj.m5*y + inverseViewProj.m9*z + inverseViewProj.m13;
    final vz = inverseViewProj.m2*x + inverseViewProj.m6*y + inverseViewProj.m10*z + inverseViewProj.m14;
    final vw = inverseViewProj.m3*x + inverseViewProj.m7*y + inverseViewProj.m11*z + inverseViewProj.m15;

    corners[i].set(vx/vw, vy/vw, vz/vw);
  }

  DrawLine3D(corners[0], corners[1], color);
  DrawLine3D(corners[1], corners[2], color);
  DrawLine3D(corners[2], corners[3], color);
  DrawLine3D(corners[3], corners[0], color);

  for (int i = 0; i < 4; i++)
  {
    DrawLine3D(camera.position, corners[i], color);
  }
}