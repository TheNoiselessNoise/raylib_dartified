// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_hybrid_render.c
// Run it: dart run shaders_hybrid_render.dart
// WARNING: expects resources from the raylib source
import 'dart:math' as math;
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

class RayLocs {
  int camPos, camDir, screenCenter;
  RayLocs(this.camPos, this.camDir, this.screenCenter);
}

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_hybrid_render");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final shdrRaymarch = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/hybrid_raymarch.fs",
  );

  final shdrRaster = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/hybrid_raster.fs",
  );

  final marchLocs = RayLocs(
    rl.CoreD.GetShaderLocation(shdrRaymarch, "camPos"),
    rl.CoreD.GetShaderLocation(shdrRaymarch, "camDir"),
    rl.CoreD.GetShaderLocation(shdrRaymarch, "screenCenter"),
  );

  final Vector2D screenCenter = .vec2(screenWidth/2.0, screenHeight/2.0);
  
  rl.CoreD.SetShaderValue(shdrRaymarch, marchLocs.screenCenter,
    screenCenter.toArray(),
    .SHADER_UNIFORM_VEC2,
  );

  final target = LoadRenderTextureDepthTex(rl, screenWidth, screenHeight);

  final camera = Camera3DD(
    position: .vec3(0.5, 1.0, 1.5),
    target: .vec3(0.0, 0.5, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  double camDist = 1.0/(math.tan(camera.fovy*0.5*rl.DEG2RAD));

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    rl.CoreD.SetShaderValue(shdrRaymarch, marchLocs.camPos,
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );
    
    final camDir = camera.target
      .sub(camera.position)
      .normalize()
      .scale(camDist);
      
    rl.CoreD.SetShaderValue(shdrRaymarch, marchLocs.camDir,
      camDir.toArray(),
      .SHADER_UNIFORM_VEC3,
    );
    
    rl.CoreD.BeginTextureMode(target);
      rl.CoreD.ClearBackground(.WHITE);

      rl.Rlgl.rlEnableDepthTest();
      rl.CoreD.BeginShaderMode(shdrRaymarch);
        rl.CoreD.DrawRectangleRec(
          .rect(0, 0, screenWidth, screenHeight),
          .WHITE
        );
      rl.CoreD.EndShaderMode();
        
      rl.CoreD.BeginMode3D(camera);
        rl.CoreD.BeginShaderMode(shdrRaster);
          rl.CoreD.DrawCubeWiresV(.vec3(0.0, 0.5, 1.0), .vec3(1.0, 1.0, 1.0), .RED);
          rl.CoreD.DrawCubeV(.vec3(0.0, 0.5, 1.0), .vec3(1.0, 1.0, 1.0), .BROWN);
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
  rl.CoreD.UnloadShader(shdrRaymarch);
  rl.CoreD.UnloadShader(shdrRaster);

  rl.CloseWindowAndDispose();
}

RenderTextureD LoadRenderTextureDepthTex(Raylib rl, int width, int height)
{
  final RenderTextureD target = .new();

  target.id = rl.RlglD.rlLoadFramebuffer();

  if (target.id > 0)
  {
    rl.RlglD.rlEnableFramebuffer(target.id);

    final format = PixelFormat.PIXELFORMAT_UNCOMPRESSED_R8G8B8A8;

    target.texture.id = rl.RlglD.rlLoadTexture(null, width, height, .fromValue(format.value), 1);
    target.texture.width = width;
    target.texture.height = height;
    target.texture.format = format;
    target.texture.mipmaps = 1;

    target.depth.id = rl.RlglD.rlLoadTextureDepth(width, height, false);
    target.depth.width = width;
    target.depth.height = height;
    target.depth.format = .fromValue(19);
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

void UnloadRenderTextureDepthTex(Raylib rl, RenderTextureD target)
{
  if (target.id > 0)
  {
    rl.RlglD.rlUnloadTexture(target.texture.id);
    rl.RlglD.rlUnloadTexture(target.depth.id);

    rl.RlglD.rlUnloadFramebuffer(target.id);
  }
}