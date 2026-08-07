// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/others/shaders_rlgl_compute.c
// Run it: dart run shaders_rlgl_compute.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

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
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_rlgl_compute".toC);
  SetTargetFPS(60);

  final resolution = Vector2$.At('resolution').set(GOL_WIDTH, GOL_WIDTH);
  int brushSize = 8;

  final golLogicCode = LoadFileText("../resources/shaders/glsl430/gol.glsl".toC);
  final golLogicShader = rlLoadShader(golLogicCode, RlShaderType.RL_COMPUTE_SHADER.value);
  final golLogicProgram = rlLoadShaderProgramCompute(golLogicShader);
  UnloadFileText(golLogicCode);

  final golRenderShader = LoadShader(
    nullptr,
    "../resources/shaders/glsl430/gol_render.glsl".toC,
  );
  int resUniformLoc = GetShaderLocation(golRenderShader, "resolution".toC);

  final golTransfertCode = LoadFileText("../resources/shaders/glsl430/gol_transfert.glsl".toC);
  final golTransfertShader = rlLoadShader(golTransfertCode, RlShaderType.RL_COMPUTE_SHADER.value);
  final golTransfertProgram = rlLoadShaderProgramCompute(golTransfertShader);
  UnloadFileText(golTransfertCode);

  int ssboA = rlLoadShaderBuffer(
    UnsignedInt$.Size(GOL_WIDTH*GOL_WIDTH),
    nullptr,
    RlUsageHint.RL_DYNAMIC_COPY.value
  );
  int ssboB = rlLoadShaderBuffer(
    UnsignedInt$.Size(GOL_WIDTH*GOL_WIDTH),
    nullptr,
    RlUsageHint.RL_DYNAMIC_COPY.value
  );
  final ssboTransfert = rlLoadShaderBuffer(
    sizeOf<GolUpdateSSBO>(),
    nullptr,
    RlUsageHint.RL_DYNAMIC_COPY.value
  );

  final transfertBuffer = calloc<GolUpdateSSBO>();

  final whiteImage = GenImageColor(GOL_WIDTH, GOL_WIDTH, WHITE);
  final whiteTex = LoadTextureFromImage(whiteImage);
  UnloadImage(whiteImage);

  while (!WindowShouldClose())
  {
    brushSize += GetMouseWheelMove().toInt();

    if (
      (
        IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value) ||
        IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value)
      )
      && (transfertBuffer.ref.count < MAX_BUFFERED_TRANSFERTS))
    {
      transfertBuffer.ref.commands[transfertBuffer.ref.count].x = GetMouseX() - brushSize~/2;
      transfertBuffer.ref.commands[transfertBuffer.ref.count].y = GetMouseY() - brushSize~/2;
      transfertBuffer.ref.commands[transfertBuffer.ref.count].w = brushSize;
      transfertBuffer.ref.commands[transfertBuffer.ref.count].enabled = IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value).toInt();
      transfertBuffer.ref.count++;
    }
    else if (transfertBuffer.ref.count > 0)
    {
      rlUpdateShaderBuffer(ssboTransfert, transfertBuffer.cast(), sizeOf<GolUpdateSSBO>(), 0);

      rlEnableShader(golTransfertProgram);
      rlBindShaderBuffer(ssboA, 1);
      rlBindShaderBuffer(ssboTransfert, 3);
      rlComputeShaderDispatch(transfertBuffer.ref.count, 1, 1);
      rlDisableShader();

      transfertBuffer.ref.count = 0;
    }
    else
    {
      rlEnableShader(golLogicProgram);
      rlBindShaderBuffer(ssboA, 1);
      rlBindShaderBuffer(ssboB, 2);
      rlComputeShaderDispatch(GOL_WIDTH~/16, GOL_WIDTH~/16, 1);
      rlDisableShader();

      int temp = ssboA;
      ssboA = ssboB;
      ssboB = temp;
    }

    rlBindShaderBuffer(ssboA, 1);
    SetShaderValue(golRenderShader, resUniformLoc,
      resolution.cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value
    );

    BeginDrawing();

      ClearBackground(BLANK);

      BeginShaderMode(golRenderShader);
          DrawTexture(whiteTex, 0, 0, WHITE);
      EndShaderMode();

      DrawRectangleLines(
        GetMouseX() - brushSize~/2,
        GetMouseY() - brushSize~/2,
        brushSize, brushSize, RED
      );

      DrawText(
        "Use Mouse wheel to increase/decrease brush size".toC,
        10, 10, 20, WHITE
      );
      DrawFPS(GetScreenWidth() - 100, 10);

    EndDrawing();
  }

  rlUnloadShaderBuffer(ssboA);
  rlUnloadShaderBuffer(ssboB);
  rlUnloadShaderBuffer(ssboTransfert);

  rlUnloadShaderProgram(golTransfertProgram);
  rlUnloadShaderProgram(golLogicProgram);

  UnloadTexture(whiteTex);
  UnloadShader(golRenderShader);

  calloc.free(transfertBuffer);
  
  CloseWindowAndDispose();
}
