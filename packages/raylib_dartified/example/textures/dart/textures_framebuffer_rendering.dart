// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_framebuffer_rendering.c
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int splitWidth = screenWidth~/2;

late Camera3D subjectCamera;
late Camera3D observerCamera;
late RenderTexture observerTarget;
late Rectangle observerSource;
late Rectangle observerDest;
late RenderTexture subjectTarget;
late Rectangle subjectSource;
late Rectangle subjectDest;
late double textureAspectRatio;

final captureSize = 128.0;
late Rectangle cropSource;
late Rectangle cropDest;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "textures_framebuffer_rendering");
    SetTargetFPS(60);
    DisableCursor();

    subjectCamera = .new(
      position: .vec3(5.0, 5.0, 5.0),
      target: .vec3(0.0, 0.0, 0.0),
      up: .vec3(0.0, 1.0, 0.0),
      fovy: 45.0,
      projection: .CAMERA_PERSPECTIVE,
    );

    observerCamera = .new(
      position: .vec3(10.0, 10.0, 10.0),
      target: .vec3(0.0, 0.0, 0.0),
      up: .vec3(0.0, 1.0, 0.0),
      fovy: 45.0,
      projection: .CAMERA_PERSPECTIVE,
    );

    observerTarget = LoadRenderTexture(splitWidth, screenHeight);
    observerSource = .rect(0.0, 0.0, observerTarget.texture.width, -observerTarget.texture.height);
    observerDest = .rect(0.0, 0.0, splitWidth, screenHeight);

    subjectTarget = LoadRenderTexture(splitWidth, screenHeight);
    subjectSource = .rect(0.0, 0.0, subjectTarget.texture.width, -subjectTarget.texture.height);
    subjectDest = .rect(splitWidth, 0.0, splitWidth, screenHeight);
    textureAspectRatio = subjectTarget.texture.width/subjectTarget.texture.height;

    cropSource = .rect(
      (subjectTarget.texture.width - captureSize)/2.0, (subjectTarget.texture.height - captureSize)/2.0,
      captureSize, -captureSize
    );
    cropDest = .rect(splitWidth + 20.0, 20.0, captureSize, captureSize);
  },
  loop: (_) async {
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
  },
  close: (_) {
    UnloadRenderTexture(observerTarget);
    UnloadRenderTexture(subjectTarget);
    CloseWindow();
  },
);

void DrawCameraPrism(Camera3D camera, double aspect, Color color)
{
  final length = camera.position.distance(camera.target);

  final planeNDC = <Vector3>[
    .vec3(-1, -1, 1),
    .vec3( 1, -1, 1),
    .vec3( 1,  1, 1),
    .vec3(-1,  1, 1),
  ];

  final view = GetCameraMatrix(camera);
  final Matrix proj = .perspective(camera.fovy * DEG2RAD, aspect, 0.05, length);
  final viewProj = view.mul(proj);
  final inverseViewProj = viewProj.invert();

  final List<Vector3> corners = .generate(4, (_) => .zero());
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