// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/others/shaders_rlgl_compute.c
// WARNING: expects resources from the raylib source
import 'dart:typed_data';
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int GOL_WIDTH = 768;
const int MAX_BUFFERED_TRANSFERTS = 48;

final class GolUpdateCmd {
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

final class GolUpdateSSBO {
  int count;
  List<GolUpdateCmd> commands;

  GolUpdateSSBO(this.commands) : count = 0;

  List<int> get data => [count, ...commands.expand((c) => c.data)];
}

late Vector2 resolution;
int brushSize = 8;
late int golLogicProgram;
late Shader golRenderShader;
late int resUniformLoc;
late int golTransfertProgram;
late int ssboA;
late int ssboB;
late GolUpdateSSBO transfertBuffer;
late int ssboTransfert;
late Texture whiteTex;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shaders_rlgl_compute");
    SetTargetFPS(60);

    resolution = .vec2(GOL_WIDTH, GOL_WIDTH);

    final golLogicCode = LoadFileText("../resources/shaders/glsl430/gol.glsl");
    final golLogicShader = rlLoadShader(golLogicCode, .RL_COMPUTE_SHADER);
    golLogicProgram = rlLoadShaderProgramCompute(golLogicShader);

    golRenderShader = LoadShader(
      null,
      "../resources/shaders/glsl430/gol_render.glsl",
    );
    resUniformLoc = GetShaderLocation(golRenderShader, "resolution");

    final golTransfertCode = LoadFileText("../resources/shaders/glsl430/gol_transfert.glsl");
    final golTransfertShader = rlLoadShader(golTransfertCode, .RL_COMPUTE_SHADER);
    golTransfertProgram = rlLoadShaderProgramCompute(golTransfertShader);

    ssboA = rlLoadShaderBuffer(XUnsignedInt.size * GOL_WIDTH * GOL_WIDTH, null, .RL_DYNAMIC_COPY);
    ssboB = rlLoadShaderBuffer(XUnsignedInt.size * GOL_WIDTH * GOL_WIDTH, null, .RL_DYNAMIC_COPY);

    transfertBuffer = GolUpdateSSBO(.generate(MAX_BUFFERED_TRANSFERTS, (_) => .new()));

    ssboTransfert = rlLoadShaderBuffer(XUnsignedInt.size * transfertBuffer.data.length, null, .RL_DYNAMIC_COPY);

    final whiteImage = GenImageColor(GOL_WIDTH, GOL_WIDTH, .WHITE);
    whiteTex = LoadTextureFromImage(whiteImage);
    UnloadImage(whiteImage);
  },
  loop: (_) async {
    brushSize += GetMouseWheelMove().toInt();

    if (
      (IsMouseButtonDown(.MOUSE_BUTTON_LEFT) || IsMouseButtonDown(.MOUSE_BUTTON_RIGHT)) &&
      (transfertBuffer.count < MAX_BUFFERED_TRANSFERTS)
    ) {
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
  },
  close: (_) {
    rlUnloadShaderBuffer(ssboA);
    rlUnloadShaderBuffer(ssboB);
    rlUnloadShaderBuffer(ssboTransfert);
    rlUnloadShaderProgram(golTransfertProgram);
    rlUnloadShaderProgram(golLogicProgram);
    UnloadTexture(whiteTex);
    UnloadShader(golRenderShader);
    CloseWindow();
  },
);