// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_depth_rendering.c
// Run it: dart run shaders_depth_rendering.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_depth_rendering");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3DD(
    position: .vec3(4.0, 1.0, 5.0),
    target: .vec3(0.0, 0.0, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final target = LoadRenderTextureDepthTex(screenWidth, screenHeight);

  final depthShader = LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/depth_render.fs");
  int depthLoc = GetShaderLocation(depthShader, "depthTexture");
  int flipTextureLoc = GetShaderLocation(depthShader, "flipY");

  SetShaderValue(depthShader, flipTextureLoc, [1], .SHADER_UNIFORM_INT);

  final cube = LoadModelFromMesh(GenMeshCube(1.0, 1.0, 1.0));
  final floor = LoadModelFromMesh(GenMeshPlane(20.0, 20.0, 1, 1));

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_FREE);

    BeginTextureMode(target);
      ClearBackground(.WHITE);
      
      BeginMode3D(camera);
        BeginShaderMode(depthShader);
          DrawModel(cube, .vec3(0.0, 0.0, 0.0), 3.0, .YELLOW);
          DrawModel(floor, .vec3(10.0, 0.0, 2.0), 2.0, .RED);
        EndShaderMode();
      EndMode3D();
    EndTextureMode();

    BeginDrawing();
      ClearBackground(.RAYWHITE);
  
      BeginShaderMode(depthShader);
        SetShaderValueTexture(depthShader, depthLoc, target.depth);
        DrawTexture(target.depth, 0, 0, .WHITE);
      EndShaderMode();

      DrawRectangle( 10, 10, 320, 93, Fade(.SKYBLUE, 0.5));
      DrawRectangleLines( 10, 10, 320, 93, .BLUE);

      DrawText("Camera Controls:", 20, 20, 10, .BLACK);
      DrawText("- WASD to move", 40, 40, 10, .DARKGRAY);
      DrawText("- Mouse Wheel Pressed to Pan", 40, 60, 10, .DARKGRAY);
      DrawText("- Z to zoom to (0, 0, 0)", 40, 80, 10, .DARKGRAY);
    EndDrawing();
  }

  UnloadModel(cube);
  UnloadModel(floor);
  UnloadRenderTextureDepthTex(target);
  UnloadShader(depthShader);

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