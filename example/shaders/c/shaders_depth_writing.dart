// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_depth_writing.c
// Run it: dart run shaders_depth_writing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_depth_writing".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.AtUnique();
  camera.ref.position.set(2.0, 2.0, 3.0);
  camera.ref.target.set(0.0, 0.5, 0.0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final target = LoadRenderTextureDepthTex(screenWidth, screenHeight);

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/depth_write.fs".toC
  );

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    BeginTextureMode(target);
      ClearBackground(WHITE);

      BeginMode3D(camera.ref);
        BeginShaderMode(shader);
          DrawCubeWiresV(Vector3$.$1.set(0.0, 0.5, 1.0), Vector3$.$2.set(1.0, 1.0, 1.0), RED);
          DrawCubeV(Vector3$.$1.set(0.0, 0.5, 1.0), Vector3$.$2.set(1.0, 1.0, 1.0), PURPLE);
          DrawCubeWiresV(Vector3$.$1.set(0.0, 0.5, -1.0), Vector3$.$2.set(1.0, 1.0, 1.0), DARKGREEN);
          DrawCubeV(Vector3$.$1.set(0.0, 0.5, -1.0), Vector3$.$2.set(1.0, 1.0, 1.0), YELLOW);
          DrawGrid(10, 1.0);
        EndShaderMode();
      EndMode3D();
    EndTextureMode();

    BeginDrawing();
      ClearBackground(RAYWHITE);

      DrawTextureRec(
        target.texture,
        Rectangle$.$1.set(0, 0, screenWidth, -screenHeight),
        Vector2$.$zero,
        WHITE
      );

      DrawFPS(10, 10);
    EndDrawing();
  }

  UnloadRenderTextureDepthTex(target);
  UnloadShader(shader);

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