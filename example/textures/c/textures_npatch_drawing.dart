// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_npatch_drawing.c
// Run it: dart run textures_npatch_drawing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_npatch_drawing".toC);
  SetTargetFPS(60);

  final nPatchTexture = LoadTexture("../resources/ninepatch_button.png".toC);

  final mousePosition = Vector2$.val.At('mousePosition');
  final origin = Vector2$.val.At('origin');

  final dstRec1 = Rectangle$.val.At('dstRec1').set(480.0, 160.0, 32.0, 32.0);
  final dstRec2 = Rectangle$.val.At('dstRec2').set(160.0, 160.0, 32.0, 32.0);
  final dstRecH = Rectangle$.val.At('dstRecH').set(160.0, 93.0, 32.0, 32.0);
  final dstRecV = Rectangle$.val.At('dstRecV').set(92.0, 160.0, 32.0, 32.0);

  final ninePatchInfo1 = NPatchInfo$.val.At('ninePatchInfo1');
  ninePatchInfo1.ref.source.set(0.0, 0.0, 64.0, 64.0);
  ninePatchInfo1.ref.left = 12;
  ninePatchInfo1.ref.top = 40;
  ninePatchInfo1.ref.right = 12;
  ninePatchInfo1.ref.bottom = 12;
  ninePatchInfo1.ref.layout = NPatchLayout.NPATCH_NINE_PATCH.value;

  final ninePatchInfo2 = NPatchInfo$.val.At('ninePatchInfo2');
  ninePatchInfo2.ref.source.set(0.0, 128.0, 64.0, 64.0);
  ninePatchInfo2.ref.left = 16;
  ninePatchInfo2.ref.top = 16;
  ninePatchInfo2.ref.right = 16;
  ninePatchInfo2.ref.bottom = 16;
  ninePatchInfo2.ref.layout = NPatchLayout.NPATCH_NINE_PATCH.value;

  final h3PatchInfo = NPatchInfo$.val.At('h3PatchInfo');
  h3PatchInfo.ref.source.set(0.0, 64.0, 64.0, 64.0);
  h3PatchInfo.ref.left = 8;
  h3PatchInfo.ref.top = 8;
  h3PatchInfo.ref.right = 8;
  h3PatchInfo.ref.bottom = 8;
  h3PatchInfo.ref.layout = NPatchLayout.NPATCH_THREE_PATCH_HORIZONTAL.value;

  final v3PatchInfo = NPatchInfo$.val.At('v3PatchInfo');
  v3PatchInfo.ref.source.set(0.0, 192.0, 64.0, 64.0);
  v3PatchInfo.ref.left = 6;
  v3PatchInfo.ref.top = 6;
  v3PatchInfo.ref.right = 6;
  v3PatchInfo.ref.bottom = 6;
  v3PatchInfo.ref.layout = NPatchLayout.NPATCH_THREE_PATCH_VERTICAL.value;

  while (!WindowShouldClose())
  {
    mousePosition.setC(GetMousePosition());

    dstRec1.ref.width = mousePosition.ref.x - dstRec1.ref.x;
    dstRec1.ref.height = mousePosition.ref.y - dstRec1.ref.y;
    dstRec2.ref.width = mousePosition.ref.x - dstRec2.ref.x;
    dstRec2.ref.height = mousePosition.ref.y - dstRec2.ref.y;
    dstRecH.ref.width = mousePosition.ref.x - dstRecH.ref.x;
    dstRecV.ref.height = mousePosition.ref.y - dstRecV.ref.y;

    if (dstRec1.ref.width < 1.0) dstRec1.ref.width = 1.0;
    if (dstRec1.ref.width > 300.0) dstRec1.ref.width = 300.0;
    if (dstRec1.ref.height < 1.0) dstRec1.ref.height = 1.0;
    if (dstRec2.ref.width < 1.0) dstRec2.ref.width = 1.0;
    if (dstRec2.ref.width > 300.0) dstRec2.ref.width = 300.0;
    if (dstRec2.ref.height < 1.0) dstRec2.ref.height = 1.0;
    if (dstRecH.ref.width < 1.0) dstRecH.ref.width = 1.0;
    if (dstRecV.ref.height < 1.0) dstRecV.ref.height = 1.0;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTextureNPatch(nPatchTexture, ninePatchInfo2.ref, dstRec2.ref, origin.ref, 0.0, WHITE);
      DrawTextureNPatch(nPatchTexture, ninePatchInfo1.ref, dstRec1.ref, origin.ref, 0.0, WHITE);
      DrawTextureNPatch(nPatchTexture, h3PatchInfo.ref, dstRecH.ref, origin.ref, 0.0, WHITE);
      DrawTextureNPatch(nPatchTexture, v3PatchInfo.ref, dstRecV.ref, origin.ref, 0.0, WHITE);

      DrawRectangleLines(5, 88, 74, 266, BLUE);
      DrawTexture(nPatchTexture, 10, 93, WHITE);
      DrawText(
        "TEXTURE".toC,
        15, 360, 10, DARKGRAY
      );

      DrawText(
        "Move the mouse to stretch or shrink the n-patches".toC,
        10, 20, 20, DARKGRAY
      );

    EndDrawing();
  }

  UnloadTexture(nPatchTexture);

  CloseWindowAndDispose();
}