// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/others/rlgl_compute_shader.c
// Run it: dart run rlgl_compute_shader.dart
// WARNING: expects resources from the raylib source
import 'dart:typed_data';
import '../../base.dart';

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
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "rlgl_compute_shader");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final Vector2D resolution = .vec2(GOL_WIDTH, GOL_WIDTH);
  int brushSize = 8;

  final golLogicCode = rl.CoreD.LoadFileText("../resources/shaders/glsl430/gol.glsl");
  final golLogicShader = rl.RlglD.rlCompileShader(golLogicCode, .RL_COMPUTE_SHADER);
  final golLogicProgram = rl.RlglD.rlLoadComputeShaderProgram(golLogicShader);

  final golRenderShader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl430/gol_render.glsl",
  );
  int resUniformLoc = rl.CoreD.GetShaderLocation(golRenderShader, "resolution");

  final golTransfertCode = rl.CoreD.LoadFileText("../resources/shaders/glsl430/gol_transfert.glsl");
  final golTransfertShader = rl.RlglD.rlCompileShader(golTransfertCode, .RL_COMPUTE_SHADER);
  final golTransfertProgram = rl.RlglD.rlLoadComputeShaderProgram(golTransfertShader);

  int ssboA = rl.RlglD.rlLoadShaderBuffer(
    rl.Temp.UInt$.Size(GOL_WIDTH*GOL_WIDTH),
    null,
    .RL_DYNAMIC_COPY
  );
  int ssboB = rl.RlglD.rlLoadShaderBuffer(
    rl.Temp.UInt$.Size(GOL_WIDTH*GOL_WIDTH),
    null,
    .RL_DYNAMIC_COPY
  );

  final transfertBuffer = GolUpdateSSBO(
    List.generate(MAX_BUFFERED_TRANSFERTS, (_) => .new())
  );

  final ssboTransfert = rl.RlglD.rlLoadShaderBuffer(
    transfertBuffer.data.length*rl.Temp.UInt$.Size(),
    null,
    .RL_DYNAMIC_COPY
  );

  final whiteImage = rl.CoreD.GenImageColor(GOL_WIDTH, GOL_WIDTH, .WHITE);
  final whiteTex = rl.CoreD.LoadTextureFromImage(whiteImage);
  rl.CoreD.UnloadImage(whiteImage);

  while (!rl.CoreD.WindowShouldClose())
  {
    brushSize += rl.CoreD.GetMouseWheelMove().toInt();

    if (
      (
        rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT) ||
        rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_RIGHT)
      )
      && (transfertBuffer.count < MAX_BUFFERED_TRANSFERTS))
    {
      transfertBuffer.commands[transfertBuffer.count].x = rl.CoreD.GetMouseX() - brushSize~/2;
      transfertBuffer.commands[transfertBuffer.count].y = rl.CoreD.GetMouseY() - brushSize~/2;
      transfertBuffer.commands[transfertBuffer.count].w = brushSize;
      transfertBuffer.commands[transfertBuffer.count].enabled = rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT);
      transfertBuffer.count++;
    }
    else if (transfertBuffer.count > 0)
    {
      rl.RlglD.rlUpdateShaderBuffer(ssboTransfert, Uint32List.fromList(transfertBuffer.data), 0);

      rl.RlglD.rlEnableShader(golTransfertProgram);
      rl.RlglD.rlBindShaderBuffer(ssboA, 1);
      rl.RlglD.rlBindShaderBuffer(ssboTransfert, 3);
      rl.RlglD.rlComputeShaderDispatch(transfertBuffer.count, 1, 1);
      rl.RlglD.rlDisableShader();
      transfertBuffer.count = 0;
    }
    else
    {
      rl.RlglD.rlEnableShader(golLogicProgram);
      rl.RlglD.rlBindShaderBuffer(ssboA, 1);
      rl.RlglD.rlBindShaderBuffer(ssboB, 2);
      rl.RlglD.rlComputeShaderDispatch(GOL_WIDTH~/16, GOL_WIDTH~/16, 1);
      rl.RlglD.rlDisableShader();

      int temp = ssboA;
      ssboA = ssboB;
      ssboB = temp;
    }

    rl.RlglD.rlBindShaderBuffer(ssboA, 1);
    rl.CoreD.SetShaderValue(golRenderShader, resUniformLoc,
      resolution.toArray(),
      .SHADER_UNIFORM_VEC2
    );

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.BLANK);

      rl.CoreD.BeginShaderMode(golRenderShader);
          rl.CoreD.DrawTexture(whiteTex, 0, 0, .WHITE);
      rl.CoreD.EndShaderMode();

      rl.CoreD.DrawRectangleLines(
        rl.CoreD.GetMouseX() - brushSize~/2,
        rl.CoreD.GetMouseY() - brushSize~/2,
        brushSize, brushSize, .RED
      );

      rl.CoreD.DrawText(
        "Use Mouse wheel to increase/decrease brush size",
        10, 10, 20, .WHITE
      );
      rl.CoreD.DrawFPS(rl.CoreD.GetScreenWidth() - 100, 10);

    rl.CoreD.EndDrawing();
  }

  rl.RlglD.rlUnloadShaderBuffer(ssboA);
  rl.RlglD.rlUnloadShaderBuffer(ssboB);
  rl.RlglD.rlUnloadShaderBuffer(ssboTransfert);

  rl.RlglD.rlUnloadShaderProgram(golTransfertProgram);
  rl.RlglD.rlUnloadShaderProgram(golLogicProgram);

  rl.CoreD.UnloadTexture(whiteTex);
  rl.CoreD.UnloadShader(golRenderShader);

  rl.CloseWindowAndDispose();
}
