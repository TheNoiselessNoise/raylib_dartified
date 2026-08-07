// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_depth_writing.c
// Run it: dart run shaders_depth_writing.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_depth_writing");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(2.0, 2.0, 3.0),
    target: .vec3(0.0, 0.5, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final target = LoadRenderTextureDepthTex(screenWidth, screenHeight);

  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/depth_write.fs"
  );

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    BeginTextureMode(target);
      ClearBackground(.WHITE);

      BeginMode3D(camera);
        BeginShaderMode(shader);
          DrawCubeWiresV(.vec3(0.0, 0.5, 1.0), .vec3(1.0, 1.0, 1.0), .RED);
          DrawCubeV(.vec3(0.0, 0.5, 1.0), .vec3(1.0, 1.0, 1.0), .PURPLE);
          DrawCubeWiresV(.vec3(0.0, 0.5, -1.0), .vec3(1.0, 1.0, 1.0), .DARKGREEN);
          DrawCubeV(.vec3(0.0, 0.5, -1.0), .vec3(1.0, 1.0, 1.0), .YELLOW);
          DrawGrid(10, 1.0);
        EndShaderMode();
      EndMode3D();
    EndTextureMode();

    BeginDrawing();
      ClearBackground(.RAYWHITE);

      DrawTextureRec(target.texture, .rect(0, 0, screenWidth, -screenHeight), .zero(), .WHITE);

      DrawFPS(10, 10);
    EndDrawing();
  }

  UnloadRenderTextureDepthTex(target);
  UnloadShader(shader);

  CloseWindowAndDispose();
}

RenderTextureD LoadRenderTextureDepthTex(int width, int height)
{
  final RenderTextureD target = .new();

  target.id = rlLoadFramebuffer();

  if (target.id > 0)
  {
    rlEnableFramebuffer(target.id);

    final format = PixelFormat.PIXELFORMAT_UNCOMPRESSED_R8G8B8A8;

    target.texture.id = rlLoadTexture(null, width, height, format, 1);
    target.texture.width = width;
    target.texture.height = height;
    target.texture.format = format;
    target.texture.mipmaps = 1;

    target.depth.id = rlLoadTextureDepth(width, height, false);
    target.depth.width = width;
    target.depth.height = height;
    target.depth.format = .fromValue(19);
    target.depth.mipmaps = 1;

    rlFramebufferAttach(
      target.id,
      target.texture.id,
      .RL_ATTACHMENT_COLOR_CHANNEL0,
      .RL_ATTACHMENT_TEXTURE2D,
      0
    );
    rlFramebufferAttach(
      target.id,
      target.depth.id,
      .RL_ATTACHMENT_DEPTH,
      .RL_ATTACHMENT_TEXTURE2D,
      0
    );

    if (rlFramebufferComplete(target.id)) TraceLog(
      .LOG_INFO,
      "FBO: [ID ${target.id}] Framebuffer object created successfully",
    );

    rlDisableFramebuffer();
  }
  else TraceLog(
    .LOG_WARNING,
    "FBO: Framebuffer object can not be created",
  );

  return target;
}

void UnloadRenderTextureDepthTex(RenderTextureD target)
{
  if (target.id > 0)
  {
    rlUnloadTexture(target.texture.id);
    rlUnloadTexture(target.depth.id);

    rlUnloadFramebuffer(target.id);
  }
}