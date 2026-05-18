// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_write_depth.c
// Run it: dart run shaders_write_depth.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_write_depth".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(2.0, 2.0, 3.0);
  camera.ref.target.set(0.0, 0.5, 0.0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final shader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/write_depth.fs".toC,
  );

  final target = LoadRenderTextureDepthTex(rl, screenWidth, screenHeight);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    rl.Core.BeginTextureMode(target);
      rl.Core.ClearBackground(rl.Color.WHITE);
      
      rl.Core.BeginMode3D(camera.ref);
        rl.Core.BeginShaderMode(shader);
          rl.Core.DrawCubeWiresV(rl.Temp.vec31(0.0, 0.5, 1.0), rl.Temp.vec32(1.0, 1.0, 1.0), rl.Color.RED);
          rl.Core.DrawCubeV(rl.Temp.vec31(0.0, 0.5, 1.0), rl.Temp.vec32(1.0, 1.0, 1.0), rl.Color.PURPLE);
          rl.Core.DrawCubeWiresV(rl.Temp.vec31(0.0, 0.5, -1.0), rl.Temp.vec32(1.0, 1.0, 1.0), rl.Color.DARKGREEN);
          rl.Core.DrawCubeV(rl.Temp.vec31(0.0, 0.5, -1.0), rl.Temp.vec32(1.0, 1.0, 1.0), rl.Color.YELLOW);
          rl.Core.DrawGrid(10, 1.0);
        rl.Core.EndShaderMode();
      rl.Core.EndMode3D();
    rl.Core.EndTextureMode();

    rl.Core.BeginDrawing();
      rl.Core.ClearBackground(rl.Color.RAYWHITE);
  
      rl.Core.DrawTextureRec(
        target.texture,
        rl.Temp.rect1(0, 0, screenWidth, -screenHeight),
        rl.Temp.vec21(0, 0),
        rl.Color.WHITE
      );
      rl.Core.DrawFPS(10, 10);
    rl.Core.EndDrawing();
  }

  UnloadRenderTextureDepthTex(rl, target);
  rl.Core.UnloadShader(shader);

  rl.CloseWindowAndDispose();
}

RenderTextureC LoadRenderTextureDepthTex(Raylib rl, int width, int height)
{
  final target = rl.Temp.RenderTexture$.At('${width}_$height');

  target.ref.id = rl.Rlgl.rlLoadFramebuffer();

  if (target.ref.id > 0)
  {
    rl.Rlgl.rlEnableFramebuffer(target.ref.id);

    final format = PixelFormat.PIXELFORMAT_UNCOMPRESSED_R8G8B8A8.value;

    target.ref.texture.id = rl.Rlgl.rlLoadTexture(nullptr, width, height, format, 1);
    target.ref.texture.width = width;
    target.ref.texture.height = height;
    target.ref.texture.format = format;
    target.ref.texture.mipmaps = 1;

    target.ref.depth.id = rl.Rlgl.rlLoadTextureDepth(width, height, false);
    target.ref.depth.width = width;
    target.ref.depth.height = height;
    target.ref.depth.format = 19;
    target.ref.depth.mipmaps = 1;

    rl.Rlgl.rlFramebufferAttach(
      target.ref.id,
      target.ref.texture.id,
      RlFramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL0.value,
      RlFramebufferAttachTextureType.RL_ATTACHMENT_TEXTURE2D.value,
      0
    );
    rl.Rlgl.rlFramebufferAttach(
      target.ref.id,
      target.ref.depth.id,
      RlFramebufferAttachType.RL_ATTACHMENT_DEPTH.value,
      RlFramebufferAttachTextureType.RL_ATTACHMENT_TEXTURE2D.value,
      0
    );

    if (rl.Rlgl.rlFramebufferComplete(target.ref.id)) rl.Core.TraceLog(
      TraceLogLevel.LOG_INFO.value,
      "FBO: [ID ${target.ref.id}] Framebuffer object created successfully".toC,
    );

    rl.Rlgl.rlDisableFramebuffer();
  }
  else rl.Core.TraceLog(
    TraceLogLevel.LOG_WARNING.value,
    "FBO: Framebuffer object can not be created".toC,
  );

  return target.ref;
}

void UnloadRenderTextureDepthTex(Raylib rl, RenderTextureC target)
{
  if (target.id > 0)
  {
    rl.Rlgl.rlUnloadTexture(target.texture.id);
    rl.Rlgl.rlUnloadTexture(target.depth.id);

    rl.Rlgl.rlUnloadFramebuffer(target.id);
  }
}