// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_hybrid_render.c
// Run it: dart run shaders_hybrid_render.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
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
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_hybrid_render".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final shdrRaymarch = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/hybrid_raymarch.fs".toC,
  );

  final shdrRaster = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/hybrid_raster.fs".toC,
  );

  final marchLocs = RayLocs(
    rl.Core.GetShaderLocation(shdrRaymarch, "camPos".toC),
    rl.Core.GetShaderLocation(shdrRaymarch, "camDir".toC),
    rl.Core.GetShaderLocation(shdrRaymarch, "screenCenter".toC),
  );

  final screenCenter = rl.Temp.Vector2$.At('screenCenter').set(
    screenWidth/2.0, screenHeight/2.0
  );
  
  rl.Core.SetShaderValue(shdrRaymarch, marchLocs.screenCenter,
    screenCenter.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
  );

  final target = LoadRenderTextureDepthTex(rl, screenWidth, screenHeight);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(0.5, 1.0, 1.5);
  camera.ref.target.set(0.0, 0.5, 0.0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  double camDist = 1.0/(math.tan(camera.ref.fovy*0.5*rl.DEG2RAD));

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    rl.Core.SetShaderValue(shdrRaymarch, marchLocs.camPos,
      rl.Temp.vec31Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );
    
    final camDir = camera.ref.target.toD()
      .sub(camera.ref.position.toD())
      .normalize()
      .scale(camDist);

    rl.Core.SetShaderValue(shdrRaymarch, marchLocs.camDir,
      rl.Temp.vec31Ptr.setD(camDir).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );
    
    rl.Core.BeginTextureMode(target);
      rl.Core.ClearBackground(rl.Color.WHITE);

      rl.Rlgl.rlEnableDepthTest();
      rl.Core.BeginShaderMode(shdrRaymarch);
        rl.Core.DrawRectangleRec(
          rl.Temp.rect1(0, 0, screenWidth, screenHeight),
          rl.Color.WHITE
        );
      rl.Core.EndShaderMode();
        
      rl.Core.BeginMode3D(camera.ref);
        rl.Core.BeginShaderMode(shdrRaster);
          rl.Core.DrawCubeWiresV(rl.Temp.vec31(0.0, 0.5, 1.0), rl.Temp.vec32(1.0, 1.0, 1.0), rl.Color.RED);
          rl.Core.DrawCubeV(rl.Temp.vec31(0.0, 0.5, 1.0), rl.Temp.vec32(1.0, 1.0, 1.0), rl.Color.BROWN);
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
  rl.Core.UnloadShader(shdrRaymarch);
  rl.Core.UnloadShader(shdrRaster);

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