// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/others/rlgl_compute_shader.c
// Run it: dart run rlgl_compute_shader.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int GOL_WIDTH = 768;
const int MAX_BUFFERED_TRANSFERTS = 48;

final class GolUpdateCmd extends Struct {
  @UnsignedInt()
  external int x;
  @UnsignedInt()
  external int y;
  @UnsignedInt()
  external int w;
  @UnsignedInt()
  external int enabled;
}

final class GolUpdateSSBO extends Struct {
  @UnsignedInt()
  external int count;

  @Array.multi([MAX_BUFFERED_TRANSFERTS])
  external Array<GolUpdateCmd> commands;
}

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "rlgl_compute_shader".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final resolution = rl.Temp.Vector2$.At('resolution').set(GOL_WIDTH, GOL_WIDTH);
  int brushSize = 8;

  final golLogicCode = rl.Core.LoadFileText("../resources/shaders/glsl430/gol.glsl".toC);
  final golLogicShader = rl.Rlgl.rlCompileShader(golLogicCode, RlShaderType.RL_COMPUTE_SHADER.value);
  final golLogicProgram = rl.Rlgl.rlLoadComputeShaderProgram(golLogicShader);
  rl.Core.UnloadFileText(golLogicCode);

  final golRenderShader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl430/gol_render.glsl".toC,
  );
  int resUniformLoc = rl.Core.GetShaderLocation(golRenderShader, "resolution".toC);

  final golTransfertCode = rl.Core.LoadFileText("../resources/shaders/glsl430/gol_transfert.glsl".toC);
  final golTransfertShader = rl.Rlgl.rlCompileShader(golTransfertCode, RlShaderType.RL_COMPUTE_SHADER.value);
  final golTransfertProgram = rl.Rlgl.rlLoadComputeShaderProgram(golTransfertShader);
  rl.Core.UnloadFileText(golTransfertCode);

  int ssboA = rl.Rlgl.rlLoadShaderBuffer(
    rl.Temp.UnsignedInt$.Size(GOL_WIDTH*GOL_WIDTH),
    nullptr,
    RlUsageHint.RL_DYNAMIC_COPY.value
  );
  int ssboB = rl.Rlgl.rlLoadShaderBuffer(
    rl.Temp.UnsignedInt$.Size(GOL_WIDTH*GOL_WIDTH),
    nullptr,
    RlUsageHint.RL_DYNAMIC_COPY.value
  );
  final ssboTransfert = rl.Rlgl.rlLoadShaderBuffer(
    sizeOf<GolUpdateSSBO>(),
    nullptr,
    RlUsageHint.RL_DYNAMIC_COPY.value
  );

  final transfertBuffer = calloc<GolUpdateSSBO>();

  final whiteImage = rl.Core.GenImageColor(GOL_WIDTH, GOL_WIDTH, rl.Color.WHITE);
  final whiteTex = rl.Core.LoadTextureFromImage(whiteImage);
  rl.Core.UnloadImage(whiteImage);

  while (!rl.Core.WindowShouldClose())
  {
    brushSize += rl.Core.GetMouseWheelMove().toInt();

    if (
      (
        rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value) ||
        rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value)
      )
      && (transfertBuffer.ref.count < MAX_BUFFERED_TRANSFERTS))
    {
      transfertBuffer.ref.commands[transfertBuffer.ref.count].x = rl.Core.GetMouseX() - brushSize~/2;
      transfertBuffer.ref.commands[transfertBuffer.ref.count].y = rl.Core.GetMouseY() - brushSize~/2;
      transfertBuffer.ref.commands[transfertBuffer.ref.count].w = brushSize;
      transfertBuffer.ref.commands[transfertBuffer.ref.count].enabled = rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value).toInt();
      transfertBuffer.ref.count++;
    }
    else if (transfertBuffer.ref.count > 0)
    {
      rl.Rlgl.rlUpdateShaderBuffer(ssboTransfert, transfertBuffer.cast(), sizeOf<GolUpdateSSBO>(), 0);

      rl.Rlgl.rlEnableShader(golTransfertProgram);
      rl.Rlgl.rlBindShaderBuffer(ssboA, 1);
      rl.Rlgl.rlBindShaderBuffer(ssboTransfert, 3);
      rl.Rlgl.rlComputeShaderDispatch(transfertBuffer.ref.count, 1, 1);
      rl.Rlgl.rlDisableShader();

      transfertBuffer.ref.count = 0;
    }
    else
    {
      rl.Rlgl.rlEnableShader(golLogicProgram);
      rl.Rlgl.rlBindShaderBuffer(ssboA, 1);
      rl.Rlgl.rlBindShaderBuffer(ssboB, 2);
      rl.Rlgl.rlComputeShaderDispatch(GOL_WIDTH~/16, GOL_WIDTH~/16, 1);
      rl.Rlgl.rlDisableShader();

      int temp = ssboA;
      ssboA = ssboB;
      ssboB = temp;
    }

    rl.Rlgl.rlBindShaderBuffer(ssboA, 1);
    rl.Core.SetShaderValue(golRenderShader, resUniformLoc,
      resolution.cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value
    );

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.BLANK);

      rl.Core.BeginShaderMode(golRenderShader);
          rl.Core.DrawTexture(whiteTex, 0, 0, rl.Color.WHITE);
      rl.Core.EndShaderMode();

      rl.Core.DrawRectangleLines(
        rl.Core.GetMouseX() - brushSize~/2,
        rl.Core.GetMouseY() - brushSize~/2,
        brushSize, brushSize, rl.Color.RED
      );

      rl.Core.DrawText(
        "Use Mouse wheel to increase/decrease brush size".toC,
        10, 10, 20, rl.Color.WHITE
      );
      rl.Core.DrawFPS(rl.Core.GetScreenWidth() - 100, 10);

    rl.Core.EndDrawing();
  }

  rl.Rlgl.rlUnloadShaderBuffer(ssboA);
  rl.Rlgl.rlUnloadShaderBuffer(ssboB);
  rl.Rlgl.rlUnloadShaderBuffer(ssboTransfert);

  rl.Rlgl.rlUnloadShaderProgram(golTransfertProgram);
  rl.Rlgl.rlUnloadShaderProgram(golLogicProgram);

  rl.Core.UnloadTexture(whiteTex);
  rl.Core.UnloadShader(golRenderShader);

  calloc.free(transfertBuffer);
  
  rl.CloseWindowAndDispose();
}
