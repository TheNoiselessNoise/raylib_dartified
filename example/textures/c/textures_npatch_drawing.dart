// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_npatch_drawing.c
// Run it: dart run textures_npatch_drawing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_npatch_drawing".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final nPatchTexture = rl.Core.LoadTexture("../resources/ninepatch_button.png".toC);

  final mousePosition = rl.Temp.Vector2$.At('mousePosition');
  final origin = rl.Temp.Vector2$.At('origin');

  final dstRec1 = rl.Temp.Rectangle$.At('dstRec1').set(480.0, 160.0, 32.0, 32.0);
  final dstRec2 = rl.Temp.Rectangle$.At('dstRec2').set(160.0, 160.0, 32.0, 32.0);
  final dstRecH = rl.Temp.Rectangle$.At('dstRecH').set(160.0, 93.0, 32.0, 32.0);
  final dstRecV = rl.Temp.Rectangle$.At('dstRecV').set(92.0, 160.0, 32.0, 32.0);

  final ninePatchInfo1 = rl.Temp.NPatchInfo$.At('ninePatchInfo1');
  ninePatchInfo1.set(0.0, 0.0, 64.0, 64.0, 12, 40, 12, 12, NPatchLayout.NPATCH_NINE_PATCH.value);

  final ninePatchInfo2 = rl.Temp.NPatchInfo$.At('ninePatchInfo2');
  ninePatchInfo2.set(0.0, 128.0, 64.0, 64.0, 16, 16, 16, 16, NPatchLayout.NPATCH_NINE_PATCH.value);

  final h3PatchInfo = rl.Temp.NPatchInfo$.At('h3PatchInfo');
  h3PatchInfo.set(0.0,  64.0, 64.0, 64.0, 8, 8, 8, 8, NPatchLayout.NPATCH_THREE_PATCH_HORIZONTAL.value);

  final v3PatchInfo = rl.Temp.NPatchInfo$.At('v3PatchInfo');
  v3PatchInfo.set(0.0, 192.0, 64.0, 64.0, 6, 6, 6, 6, NPatchLayout.NPATCH_THREE_PATCH_VERTICAL.value);

  while (!rl.Core.WindowShouldClose())
  {
    mousePosition.setC(rl.Core.GetMousePosition());

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

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawTextureNPatch(nPatchTexture, ninePatchInfo2.ref, dstRec2.ref, origin.ref, 0.0, rl.Color.WHITE);
      rl.Core.DrawTextureNPatch(nPatchTexture, ninePatchInfo1.ref, dstRec1.ref, origin.ref, 0.0, rl.Color.WHITE);
      rl.Core.DrawTextureNPatch(nPatchTexture, h3PatchInfo.ref, dstRecH.ref, origin.ref, 0.0, rl.Color.WHITE);
      rl.Core.DrawTextureNPatch(nPatchTexture, v3PatchInfo.ref, dstRecV.ref, origin.ref, 0.0, rl.Color.WHITE);

      rl.Core.DrawRectangleLines(5, 88, 74, 266, rl.Color.BLUE);
      rl.Core.DrawTexture(nPatchTexture, 10, 93, rl.Color.WHITE);
      rl.Core.DrawText(
        "TEXTURE".toC,
        15, 360, 10, rl.Color.DARKGRAY
      );

      rl.Core.DrawText(
        "Move the mouse to stretch or shrink the n-patches".toC,
        10, 20, 20, rl.Color.DARKGRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(nPatchTexture);

  rl.CloseWindowAndDispose();
}