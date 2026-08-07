// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_framebuffer_rendering.c
// Run it: dart run textures_framebuffer_rendering.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int splitWidth = screenWidth~/2;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_framebuffer_rendering");
  SetTargetFPS(60);
  DisableCursor();

  final subjectCamera = Camera3DD(
    position: .vec3(5.0, 5.0, 5.0),
    target: .vec3(0.0, 0.0, 0.0),
    up: .vec3(0.0, 1.0, 0.0),
    fovy: 45.0,
    projection: .CAMERA_PERSPECTIVE,
  );

  final observerCamera = Camera3DD(
    position: .vec3(10.0, 10.0, 10.0),
    target: .vec3(0.0, 0.0, 0.0),
    up: .vec3(0.0, 1.0, 0.0),
    fovy: 45.0,
    projection: .CAMERA_PERSPECTIVE,
  );

  final observerTarget = LoadRenderTexture(splitWidth, screenHeight);
  final RectangleD observerSource = .rect(0.0, 0.0, observerTarget.texture.width, -observerTarget.texture.height);
  final RectangleD observerDest = .rect(0.0, 0.0, splitWidth, screenHeight);

  final subjectTarget = LoadRenderTexture(splitWidth, screenHeight);
  final RectangleD subjectSource = .rect(0.0, 0.0, subjectTarget.texture.width, -subjectTarget.texture.height);
  final RectangleD subjectDest = .rect(splitWidth, 0.0, splitWidth, screenHeight);
  final textureAspectRatio = subjectTarget.texture.width/subjectTarget.texture.height;

  final captureSize = 128.0;
  final RectangleD cropSource = .rect(
    (subjectTarget.texture.width - captureSize)/2.0, (subjectTarget.texture.height - captureSize)/2.0, captureSize, -captureSize
  );
  final RectangleD cropDest = .rect(splitWidth + 20.0, 20.0, captureSize, captureSize);

  while (!WindowShouldClose())
  {
    UpdateCamera(observerCamera, .CAMERA_FREE);
    UpdateCamera(subjectCamera, .CAMERA_ORBITAL);

    if (IsKeyPressed(.KEY_R)) observerCamera.target.set(0, 0, 0);

    BeginTextureMode(observerTarget);

      ClearBackground(.RAYWHITE);

      BeginMode3D(observerCamera);

        DrawGrid(10, 1.0);
        DrawCube(.zero(), 2.0, 2.0, 2.0, .GOLD);
        DrawCubeWires(.zero(), 2.0, 2.0, 2.0, .PINK);
        DrawCameraPrism(subjectCamera, textureAspectRatio, .GREEN);

      EndMode3D();

      DrawText("Observer View", 10, observerTarget.texture.height - 30, 20, .BLACK);
      DrawText("WASD + Mouse to Move", 10, 10, 20, .DARKGRAY);
      DrawText("Scroll to Zoom", 10, 30, 20, .DARKGRAY);
      DrawText("R to Reset Observer Target", 10, 50, 20, .DARKGRAY);

    EndTextureMode();

    BeginTextureMode(subjectTarget);

      ClearBackground(.RAYWHITE);

      BeginMode3D(subjectCamera);

        DrawCube(.zero(), 2.0, 2.0, 2.0, .GOLD);
        DrawCubeWires(.zero(), 2.0, 2.0, 2.0, .PINK);
        DrawGrid(10, 1.0);

      EndMode3D();

      DrawRectangleLines(
        (subjectTarget.texture.width - captureSize)~/2.0,
        (subjectTarget.texture.height - captureSize)~/2.0,
        captureSize.toInt(),
        captureSize.toInt(),
        .GREEN
      );
      DrawText("Subject View", 10, subjectTarget.texture.height - 30, 20, .BLACK);

    EndTextureMode();

    BeginDrawing();

      ClearBackground(.BLACK);

      DrawTexturePro(observerTarget.texture, observerSource, observerDest, .zero(), 0.0, .WHITE);

      DrawTexturePro(subjectTarget.texture, subjectSource, subjectDest, .zero(), 0.0, .WHITE);

      DrawTexturePro(subjectTarget.texture, cropSource, cropDest, .zero(), 0.0, .WHITE);
      DrawRectangleLinesEx(cropDest, 2, .BLACK);

      DrawLine(splitWidth, 0, splitWidth, screenHeight, .BLACK);

    EndDrawing();
  }

  UnloadRenderTexture(observerTarget);
  UnloadRenderTexture(subjectTarget);

  CloseWindowAndDispose();
}

void DrawCameraPrism(Camera3DD camera, double aspect, ColorD color)
{
  final length = camera.position.distance(camera.target);

  final planeNDC = <Vector3D>[
    .vec3(-1, -1, 1),
    .vec3( 1, -1, 1),
    .vec3( 1,  1, 1),
    .vec3(-1,  1, 1),
  ];

  final view = GetCameraMatrix(camera);
  final MatrixD proj = .perspective(camera.fovy * rl.DEG2RAD, aspect, 0.05, length);
  final viewProj = view.mul(proj);
  final inverseViewProj = viewProj.invert();

  final List<Vector3D> corners = .generate(4, (_) => .zero());
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