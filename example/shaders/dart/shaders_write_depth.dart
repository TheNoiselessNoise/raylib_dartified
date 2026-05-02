// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_write_depth.c
// Run it: dart run shaders_write_depth.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_write_depth");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = CameraD(
    position: .vec3(2.0, 2.0, 3.0),
    target: .vec3(0, 0.5, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final shader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/write_depth.fs",
  );

  final target = LoadRenderTextureDepthTex(rl, screenWidth, screenHeight);

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    rl.CoreD.BeginTextureMode(target);
      rl.CoreD.ClearBackground(.WHITE);
      
      rl.CoreD.BeginMode3D(camera);
        rl.CoreD.BeginShaderMode(shader);
          rl.CoreD.DrawCubeWiresV(.vec3(0.0, 0.5, 1.0), .vec3(1.0, 1.0, 1.0), .RED);
          rl.CoreD.DrawCubeV(.vec3(0.0, 0.5, 1.0), .vec3(1.0, 1.0, 1.0), .PURPLE);
          rl.CoreD.DrawCubeWiresV(.vec3(0.0, 0.5, -1.0), .vec3(1.0, 1.0, 1.0), .DARKGREEN);
          rl.CoreD.DrawCubeV(.vec3(0.0, 0.5, -1.0), .vec3(1.0, 1.0, 1.0), .YELLOW);
          rl.CoreD.DrawGrid(10, 1.0);
        rl.CoreD.EndShaderMode();
      rl.CoreD.EndMode3D();
    rl.CoreD.EndTextureMode();

    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.RAYWHITE);
  
      rl.CoreD.DrawTextureRec(
        target.texture,
        .rect(0, 0, screenWidth, -screenHeight),
        .vec2(0, 0),
        .WHITE
      );
      rl.CoreD.DrawFPS(10, 10);
    rl.CoreD.EndDrawing();
  }

  UnloadRenderTextureDepthTex(rl, target);
  rl.CoreD.UnloadShader(shader);

  rl.CloseWindowAndDispose();
}

RenderTexture2DD LoadRenderTextureDepthTex(Raylib rl, int width, int height)
{
  final RenderTexture2DD target = .new();

  target.id = rl.RlglD.rlLoadFramebuffer();

  if (target.id > 0)
  {
    rl.RlglD.rlEnableFramebuffer(target.id);

    final format = PixelFormat.PIXELFORMAT_UNCOMPRESSED_R8G8B8A8;

    target.texture.id = rl.RlglD.rlLoadTexture(null, width, height, RlPixelFormat.fromValue(format.value), 1);
    target.texture.width = width;
    target.texture.height = height;
    target.texture.format = format;
    target.texture.mipmaps = 1;

    target.depth.id = rl.RlglD.rlLoadTextureDepth(width, height, false);
    target.depth.width = width;
    target.depth.height = height;
    target.depth.format = PixelFormat.fromValue(19);
    target.depth.mipmaps = 1;

    rl.RlglD.rlFramebufferAttach(
      target.id,
      target.texture.id,
      .RL_ATTACHMENT_COLOR_CHANNEL0,
      .RL_ATTACHMENT_TEXTURE2D,
      0
    );
    rl.RlglD.rlFramebufferAttach(
      target.id,
      target.depth.id,
      .RL_ATTACHMENT_DEPTH,
      .RL_ATTACHMENT_TEXTURE2D,
      0
    );

    if (rl.RlglD.rlFramebufferComplete(target.id)) rl.CoreD.TraceLog(.LOG_INFO,
      "FBO: [ID ${target.id}] Framebuffer object created successfully"
    );

    rl.RlglD.rlDisableFramebuffer();
  }
  else rl.CoreD.TraceLog(.LOG_WARNING,
    "FBO: Framebuffer object can not be created"
  );

  return target;
}

void UnloadRenderTextureDepthTex(Raylib rl, RenderTexture2DD target)
{
  if (target.id > 0)
  {
    rl.RlglD.rlUnloadTexture(target.texture.id);
    rl.RlglD.rlUnloadTexture(target.depth.id);

    rl.RlglD.rlUnloadFramebuffer(target.id);
  }
}