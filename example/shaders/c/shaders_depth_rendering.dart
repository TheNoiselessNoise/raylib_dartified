// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_depth_rendering.c
// Run it: dart run shaders_depth_rendering.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_depth_rendering".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.AtUnique();
  camera.ref.position.set(4.0, 1.0, 5.0);
  camera.ref.target.set(0.0, 0.0, 0.0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final target = LoadRenderTextureDepthTex(screenWidth, screenHeight);

  final depthShader = LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/depth_render.fs".toC);
  int depthLoc = GetShaderLocation(depthShader, "depthTexture".toC);
  int flipTextureLoc = GetShaderLocation(depthShader, "flipY".toC);

  final flipTexture = Int$.ValueUnique(1);
  SetShaderValue(
    depthShader, flipTextureLoc, flipTexture.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value
  );

  final cube = LoadModelFromMesh(GenMeshCube(1.0, 1.0, 1.0));
  final floor = LoadModelFromMesh(GenMeshPlane(20.0, 20.0, 1, 1));

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_FREE.value);

    BeginTextureMode(target);
      ClearBackground(WHITE);
      
      BeginMode3D(camera.ref);
        BeginShaderMode(depthShader);
          DrawModel(cube, Vector3$.$1.set(0.0, 0.0, 0.0), 3.0, YELLOW);
          DrawModel(floor, Vector3$.$1.set(10.0, 0.0, 2.0), 2.0, RED);
        EndShaderMode();
      EndMode3D();
    EndTextureMode();

    BeginDrawing();
      ClearBackground(RAYWHITE);
  
      BeginShaderMode(depthShader);
        SetShaderValueTexture(depthShader, depthLoc, target.depth);
        DrawTexture(target.depth, 0, 0, WHITE);
      EndShaderMode();

      DrawRectangle( 10, 10, 320, 93, Fade(SKYBLUE, 0.5));
      DrawRectangleLines( 10, 10, 320, 93, BLUE);

      DrawText("Camera Controls:".toC, 20, 20, 10, BLACK);
      DrawText("- WASD to move".toC, 40, 40, 10, DARKGRAY);
      DrawText("- Mouse Wheel Pressed to Pan".toC, 40, 60, 10, DARKGRAY);
      DrawText("- Z to zoom to (0, 0, 0)".toC, 40, 80, 10, DARKGRAY);
    EndDrawing();
  }

  UnloadModel(cube);
  UnloadModel(floor);
  UnloadRenderTextureDepthTex(target);
  UnloadShader(depthShader);

  CloseWindowAndDispose();
}

RenderTextureC LoadRenderTextureDepthTex(int width, int height)
{
  final target = RenderTexture$.At('${width}_$height');

  target.ref.id = rlLoadFramebuffer();

  if (target.ref.id > 0)
  {
    rlEnableFramebuffer(target.ref.id);

    final format = PixelFormat.PIXELFORMAT_UNCOMPRESSED_R8G8B8A8.value;

    target.ref.texture.id = rlLoadTexture(nullptr, width, height, format, 1);
    target.ref.texture.width = width;
    target.ref.texture.height = height;
    target.ref.texture.format = format;
    target.ref.texture.mipmaps = 1;

    target.ref.depth.id = rlLoadTextureDepth(width, height, false);
    target.ref.depth.width = width;
    target.ref.depth.height = height;
    target.ref.depth.format = 19;
    target.ref.depth.mipmaps = 1;

    rlFramebufferAttach(
      target.ref.id,
      target.ref.texture.id,
      RlFramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL0.value,
      RlFramebufferAttachTextureType.RL_ATTACHMENT_TEXTURE2D.value,
      0
    );
    rlFramebufferAttach(
      target.ref.id,
      target.ref.depth.id,
      RlFramebufferAttachType.RL_ATTACHMENT_DEPTH.value,
      RlFramebufferAttachTextureType.RL_ATTACHMENT_TEXTURE2D.value,
      0
    );

    if (rlFramebufferComplete(target.ref.id)) TraceLog(
      TraceLogLevel.LOG_INFO.value,
      "FBO: [ID ${target.ref.id}] Framebuffer object created successfully".toC,
    );

    rlDisableFramebuffer();
  }
  else TraceLog(
    TraceLogLevel.LOG_WARNING.value,
    "FBO: Framebuffer object can not be created".toC,
  );

  return target.ref;
}

void UnloadRenderTextureDepthTex(RenderTextureC target)
{
  if (target.id > 0)
  {
    rlUnloadTexture(target.texture.id);
    rlUnloadTexture(target.depth.id);

    rlUnloadFramebuffer(target.id);
  }
}