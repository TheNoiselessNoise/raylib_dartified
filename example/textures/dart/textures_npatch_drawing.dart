// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_npatch_drawing.c
// Run it: dart run textures_npatch_drawing.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_npatch_drawing");
  SetTargetFPS(60);

  final nPatchTexture = LoadTexture("../resources/ninepatch_button.png");

  Vector2D mousePosition = .zero();
  final Vector2D origin = .zero();

  final RectangleD dstRec1 = .rect(480.0, 160.0, 32.0, 32.0);
  final RectangleD dstRec2 = .rect(160.0, 160.0, 32.0, 32.0);
  final RectangleD dstRecH = .rect(160.0, 93.0, 32.0, 32.0);
  final RectangleD dstRecV = .rect(92.0, 160.0, 32.0, 32.0);

  final NPatchInfoD ninePatchInfo1 = .new(
    source: .rect(0.0, 0.0, 64.0, 64.0),
    left: 12, top: 40, right: 12, bottom: 12,
    layout: .NPATCH_NINE_PATCH
  );

  final NPatchInfoD ninePatchInfo2 = .new(
    source: .rect(0.0, 128.0, 64.0, 64.0),
    left: 16, top: 16, right: 16, bottom: 16,
    layout: .NPATCH_NINE_PATCH
  );

  final NPatchInfoD h3PatchInfo = .new(
    source: .rect(0.0,  64.0, 64.0, 64.0),
    left: 8, top: 8, right: 8, bottom: 8,
    layout: .NPATCH_THREE_PATCH_HORIZONTAL
  );

  final NPatchInfoD v3PatchInfo = .new(
    source: .rect(0.0, 192.0, 64.0, 64.0),
    left: 6, top: 6, right: 6, bottom: 6,
    layout: .NPATCH_THREE_PATCH_VERTICAL
  );

  while (!WindowShouldClose())
  {
    mousePosition = GetMousePosition();

    dstRec1.width = mousePosition.x - dstRec1.x;
    dstRec1.height = mousePosition.y - dstRec1.y;
    dstRec2.width = mousePosition.x - dstRec2.x;
    dstRec2.height = mousePosition.y - dstRec2.y;
    dstRecH.width = mousePosition.x - dstRecH.x;
    dstRecV.height = mousePosition.y - dstRecV.y;

    if (dstRec1.width < 1.0) dstRec1.width = 1.0;
    if (dstRec1.width > 300.0) dstRec1.width = 300.0;
    if (dstRec1.height < 1.0) dstRec1.height = 1.0;
    if (dstRec2.width < 1.0) dstRec2.width = 1.0;
    if (dstRec2.width > 300.0) dstRec2.width = 300.0;
    if (dstRec2.height < 1.0) dstRec2.height = 1.0;
    if (dstRecH.width < 1.0) dstRecH.width = 1.0;
    if (dstRecV.height < 1.0) dstRecV.height = 1.0;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawTextureNPatch(nPatchTexture, ninePatchInfo2, dstRec2, origin, 0.0, .WHITE);
      DrawTextureNPatch(nPatchTexture, ninePatchInfo1, dstRec1, origin, 0.0, .WHITE);
      DrawTextureNPatch(nPatchTexture, h3PatchInfo, dstRecH, origin, 0.0, .WHITE);
      DrawTextureNPatch(nPatchTexture, v3PatchInfo, dstRecV, origin, 0.0, .WHITE);

      DrawRectangleLines(5, 88, 74, 266, .BLUE);
      DrawTexture(nPatchTexture, 10, 93, .WHITE);
      DrawText(
        "TEXTURE",
        15, 360, 10, .DARKGRAY
      );

      DrawText(
        "Move the mouse to stretch or shrink the n-patches",
        10, 20, 20, .DARKGRAY
      );

    EndDrawing();
  }

  UnloadTexture(nPatchTexture);

  CloseWindowAndDispose();
}