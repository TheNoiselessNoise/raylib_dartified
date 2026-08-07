// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/others/shaders_rlgl_compute.c
// Run it: dart run shaders_rlgl_compute.dart
// WARNING: expects resources from the raylib source
import 'dart:typed_data';
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int GOL_WIDTH = 768;
const int MAX_BUFFERED_TRANSFERTS = 48;

class GolUpdateCmd {
  int x;
  int y;
  int w;
  bool enabled;

  GolUpdateCmd({
    this.x = 0,
    this.y = 0,
    this.w = 0,
    this.enabled = false,
  });

  List<int> get data => [x, y, w, enabled.toInt()];
}

class GolUpdateSSBO {
  int count;
  List<GolUpdateCmd> commands;

  GolUpdateSSBO(this.commands) : count = 0;

  List<int> get data => [count, ...commands.expand((c) => c.data)];
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_rlgl_compute");
  SetTargetFPS(60);

  final Vector2D resolution = .vec2(GOL_WIDTH, GOL_WIDTH);
  int brushSize = 8;

  final golLogicCode = LoadFileText("../resources/shaders/glsl430/gol.glsl");
  final golLogicShader = rlLoadShader(golLogicCode, .RL_COMPUTE_SHADER);
  final golLogicProgram = rlLoadShaderProgramCompute(golLogicShader);

  final golRenderShader = LoadShader(
    null,
    "../resources/shaders/glsl430/gol_render.glsl",
  );
  int resUniformLoc = GetShaderLocation(golRenderShader, "resolution");

  final golTransfertCode = LoadFileText("../resources/shaders/glsl430/gol_transfert.glsl");
  final golTransfertShader = rlLoadShader(golTransfertCode, .RL_COMPUTE_SHADER);
  final golTransfertProgram = rlLoadShaderProgramCompute(golTransfertShader);

  int ssboA = rlLoadShaderBuffer(
    UnsignedInt$.Size(GOL_WIDTH*GOL_WIDTH),
    null,
    .RL_DYNAMIC_COPY
  );
  int ssboB = rlLoadShaderBuffer(
    UnsignedInt$.Size(GOL_WIDTH*GOL_WIDTH),
    null,
    .RL_DYNAMIC_COPY
  );

  final transfertBuffer = GolUpdateSSBO(
    .generate(MAX_BUFFERED_TRANSFERTS, (_) => .new())
  );

  final ssboTransfert = rlLoadShaderBuffer(
    transfertBuffer.data.length*UnsignedInt$.Size(),
    null,
    .RL_DYNAMIC_COPY
  );

  final whiteImage = GenImageColor(GOL_WIDTH, GOL_WIDTH, .WHITE);
  final whiteTex = LoadTextureFromImage(whiteImage);
  UnloadImage(whiteImage);

  while (!WindowShouldClose())
  {
    brushSize += GetMouseWheelMove().toInt();

    if (
      (
        IsMouseButtonDown(.MOUSE_BUTTON_LEFT) ||
        IsMouseButtonDown(.MOUSE_BUTTON_RIGHT)
      )
      && (transfertBuffer.count < MAX_BUFFERED_TRANSFERTS))
    {
      transfertBuffer.commands[transfertBuffer.count].x = GetMouseX() - brushSize~/2;
      transfertBuffer.commands[transfertBuffer.count].y = GetMouseY() - brushSize~/2;
      transfertBuffer.commands[transfertBuffer.count].w = brushSize;
      transfertBuffer.commands[transfertBuffer.count].enabled = IsMouseButtonDown(.MOUSE_BUTTON_LEFT);
      transfertBuffer.count++;
    }
    else if (transfertBuffer.count > 0)
    {
      rlUpdateShaderBuffer(ssboTransfert, Uint32List.fromList(transfertBuffer.data), 0);

      rlEnableShader(golTransfertProgram);
      rlBindShaderBuffer(ssboA, 1);
      rlBindShaderBuffer(ssboTransfert, 3);
      rlComputeShaderDispatch(transfertBuffer.count, 1, 1);
      rlDisableShader();
      transfertBuffer.count = 0;
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
      resolution.toArray(),
      .SHADER_UNIFORM_VEC2
    );

    BeginDrawing();

      ClearBackground(.BLANK);

      BeginShaderMode(golRenderShader);
          DrawTexture(whiteTex, 0, 0, .WHITE);
      EndShaderMode();

      DrawRectangleLines(
        GetMouseX() - brushSize~/2,
        GetMouseY() - brushSize~/2,
        brushSize, brushSize, .RED
      );

      DrawText(
        "Use Mouse wheel to increase/decrease brush size",
        10, 10, 20, .WHITE
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

  CloseWindowAndDispose();
}
