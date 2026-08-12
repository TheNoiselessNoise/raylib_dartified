// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_hybrid_rendering.c
// Run it: dart run shaders_hybrid_rendering.dart
// WARNING: expects resources from the raylib source
import 'dart:math' as math;
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

class RayLocs {
  int camPos, camDir, screenCenter;
  RayLocs(this.camPos, this.camDir, this.screenCenter);
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_hybrid_rendering");
  SetTargetFPS(60);

  final shdrRaymarch = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/hybrid_raymarch.fs",
  );

  final shdrRaster = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/hybrid_raster.fs",
  );

  final marchLocs = RayLocs(
    GetShaderLocation(shdrRaymarch, "camPos"),
    GetShaderLocation(shdrRaymarch, "camDir"),
    GetShaderLocation(shdrRaymarch, "screenCenter"),
  );

  final Vector2D screenCenter = .vec2(screenWidth/2.0, screenHeight/2.0);
  
  SetShaderValue(shdrRaymarch, marchLocs.screenCenter,
    screenCenter.toArray(),
    .SHADER_UNIFORM_VEC2,
  );

  final target = LoadRenderTextureDepthTex(screenWidth, screenHeight);

  final camera = Camera3DD(
    position: .vec3(0.5, 1.0, 1.5),
    target: .vec3(0.0, 0.5, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  double camDist = 1.0/(math.tan(camera.fovy*0.5*rl.DEG2RAD));

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    SetShaderValue(shdrRaymarch, marchLocs.camPos,
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );
    
    final camDir = camera.target
      .sub(camera.position)
      .normalize()
      .scale(camDist);
      
    SetShaderValue(shdrRaymarch, marchLocs.camDir,
      camDir.toArray(),
      .SHADER_UNIFORM_VEC3,
    );
    
    BeginTextureMode(target);
      ClearBackground(.WHITE);

      rlEnableDepthTest();
      BeginShaderMode(shdrRaymarch);
        DrawRectangleRec(
          .rect(0, 0, screenWidth, screenHeight),
          .WHITE
        );
      EndShaderMode();
        
      BeginMode3D(camera);
        BeginShaderMode(shdrRaster);
          DrawCubeWiresV(.vec3(0.0, 0.5, 1.0), .vec3(1.0, 1.0, 1.0), .RED);
          DrawCubeV(.vec3(0.0, 0.5, 1.0), .vec3(1.0, 1.0, 1.0), .BROWN);
          DrawCubeWiresV(.vec3(0.0, 0.5, -1.0), .vec3(1.0, 1.0, 1.0), .DARKGREEN);
          DrawCubeV(.vec3(0.0, 0.5, -1.0), .vec3(1.0, 1.0, 1.0), .YELLOW);
          DrawGrid(10, 1.0);
        EndShaderMode();
      EndMode3D();
    EndTextureMode();

    BeginDrawing();
      ClearBackground(.RAYWHITE);
  
      DrawTextureRec(
        target.texture,
        .rect(0, 0, screenWidth, -screenHeight),
        .vec2(0, 0),
        .WHITE
      );

      DrawFPS(10, 10);
    EndDrawing();
  }

  UnloadRenderTextureDepthTex(target);
  UnloadShader(shdrRaymarch);
  UnloadShader(shdrRaster);

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

    target.texture.id = rlLoadTexture(null, width, height, .fromValue(format.value), 1);
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

    if (rlFramebufferComplete(target.id)) TraceLog(.LOG_INFO,
      "FBO: [ID ${target.id}] Framebuffer object created successfully"
    );

    rlDisableFramebuffer();
  }
  else TraceLog(.LOG_WARNING,
    "FBO: Framebuffer object can not be created"
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