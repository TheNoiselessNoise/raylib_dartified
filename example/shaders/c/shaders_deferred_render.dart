// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_deferred_render.c
// Run it: dart run shaders_deferred_render.dart
// WARNING: expects resources from the raylib source
import 'dart:io';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_CUBES = 30;
const int MAX_LIGHTS = 4;

final class GBuffer extends Struct {
  @UnsignedInt()
  external int framebuffer;
  @UnsignedInt()
  external int positionTexture;
  @UnsignedInt()
  external int normalTexture;
  @UnsignedInt()
  external int albedoSpecTexture;
  @UnsignedInt()
  external int depthRenderbuffer;
}

enum DeferredMode {
  DEFERRED_POSITION,
  DEFERRED_NORMAL,
  DEFERRED_ALBEDO,
  DEFERRED_SHADING
}

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_deferred_render".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(5, 4, 5);
  camera.ref.target.set(0, 1, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 60;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = rl.Core.LoadModelFromMesh(rl.Core.GenMeshPlane(10.0, 10.0, 3, 3));
  final cube = rl.Core.LoadModelFromMesh(rl.Core.GenMeshCube(2.0, 2.0, 2.0));

  final gbufferShader = rl.Core.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/gbuffer.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/gbuffer.fs".toC,
  );

  final deferredShader = rl.Core.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/deferred_shading.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/deferred_shading.fs".toC,
  );

  deferredShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    rl.Core.GetShaderLocation(deferredShader, "viewPosition".toC);

  final gBuffer = calloc<GBuffer>();
  gBuffer.ref.framebuffer = rl.Rlgl.rlLoadFramebuffer();

  if (!gBuffer.ref.framebuffer.toBool())
  {
    rl.Core.TraceLog(
      TraceLogLevel.LOG_WARNING.value,
      "Failed to create framebuffer".toC,
    );
    calloc.free(gBuffer);
    exit(1);
  }
  
  rl.Rlgl.rlEnableFramebuffer(gBuffer.ref.framebuffer);

  gBuffer.ref.positionTexture = rl.Rlgl.rlLoadTexture(
    nullptr, screenWidth, screenHeight, PixelFormat.PIXELFORMAT_UNCOMPRESSED_R32G32B32.value, 1
  );
  gBuffer.ref.normalTexture = rl.Rlgl.rlLoadTexture(
    nullptr, screenWidth, screenHeight, PixelFormat.PIXELFORMAT_UNCOMPRESSED_R32G32B32.value, 1
  );
  gBuffer.ref.albedoSpecTexture = rl.Rlgl.rlLoadTexture(
    nullptr, screenWidth, screenHeight, PixelFormat.PIXELFORMAT_UNCOMPRESSED_R8G8B8A8.value, 1
  );

  rl.Rlgl.rlActiveDrawBuffers(3);

  rl.Rlgl.rlFramebufferAttach(
    gBuffer.ref.framebuffer, gBuffer.ref.positionTexture,
    RlFramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL0.value,
    RlFramebufferAttachTextureType.RL_ATTACHMENT_TEXTURE2D.value, 0
  );
  rl.Rlgl.rlFramebufferAttach(
    gBuffer.ref.framebuffer, gBuffer.ref.normalTexture,
    RlFramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL1.value,
    RlFramebufferAttachTextureType.RL_ATTACHMENT_TEXTURE2D.value, 0
  );
  rl.Rlgl.rlFramebufferAttach(
    gBuffer.ref.framebuffer, gBuffer.ref.albedoSpecTexture,
    RlFramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL2.value,
    RlFramebufferAttachTextureType.RL_ATTACHMENT_TEXTURE2D.value, 0
  );

  gBuffer.ref.depthRenderbuffer = rl.Rlgl.rlLoadTextureDepth(screenWidth, screenHeight, true);
  rl.Rlgl.rlFramebufferAttach(
    gBuffer.ref.framebuffer, gBuffer.ref.depthRenderbuffer,
    RlFramebufferAttachType.RL_ATTACHMENT_DEPTH.value,
    RlFramebufferAttachTextureType.RL_ATTACHMENT_RENDERBUFFER.value, 0
  );

  if (!rl.Rlgl.rlFramebufferComplete(gBuffer.ref.framebuffer))
  {
    rl.Core.TraceLog(
      TraceLogLevel.LOG_WARNING.value,
      "Framebuffer is not complete".toC,
    );
    exit(1);
  }

  rl.Rlgl.rlEnableShader(deferredShader.id);

    rl.Rlgl.rlSetUniformSampler(
      rl.Rlgl.rlGetLocationUniform(deferredShader.id, "gPosition".toC), 0
    );
    rl.Rlgl.rlSetUniformSampler(
      rl.Rlgl.rlGetLocationUniform(deferredShader.id, "gNormal".toC), 1
    );
    rl.Rlgl.rlSetUniformSampler(
      rl.Rlgl.rlGetLocationUniform(deferredShader.id, "gAlbedoSpec".toC), 2
    );

  rl.Rlgl.rlDisableShader();

  model.materials[0].shader = gbufferShader;
  cube.materials[0].shader = gbufferShader;

  List<LightC> lights = [];

  lights.add(rl.Light.CreateLight(
    LightType.LIGHT_POINT.value,
    rl.Temp.vec31(-2, 1, -2), rl.Temp.vec3Zero, rl.Color.YELLOW, deferredShader
  ));

  lights.add(rl.Light.CreateLight(
    LightType.LIGHT_POINT.value,
    rl.Temp.vec31(2, 1, 2), rl.Temp.vec3Zero, rl.Color.RED, deferredShader
  ));

  lights.add(rl.Light.CreateLight(
    LightType.LIGHT_POINT.value,
    rl.Temp.vec31(-2, 1, 2), rl.Temp.vec3Zero, rl.Color.GREEN, deferredShader
  ));

  lights.add(rl.Light.CreateLight(
    LightType.LIGHT_POINT.value,
    rl.Temp.vec31(2, 1, -2), rl.Temp.vec3Zero, rl.Color.BLUE, deferredShader
  ));

  const double CUBE_SCALE = 0.25;
  final cubePositions = rl.Temp.Vector3$.At('cubePositions', MAX_CUBES);
  final cubeRotations = rl.Temp.Float32$.At('cubeRotations', MAX_CUBES);

  for (int i = 0; i < MAX_CUBES; i++) {
    cubePositions[i].set(
      rl.randC()%10 - 5,
      rl.randC()%5,
      rl.randC()%10 - 5,
    );

    cubeRotations[i] = rl.randC()%360;
  }

  DeferredMode mode = .DEFERRED_SHADING;

  rl.Rlgl.rlEnableDepthTest();

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    rl.Core.SetShaderValue(deferredShader,
      deferredShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      rl.Temp.vec31Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_Y.value)) lights[0].enabled = !lights[0].enabled;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_R.value)) lights[1].enabled = !lights[1].enabled;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_G.value)) lights[2].enabled = !lights[2].enabled;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_B.value)) lights[3].enabled = !lights[3].enabled;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_ONE.value)) mode = .DEFERRED_POSITION;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_TWO.value)) mode = .DEFERRED_NORMAL;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_THREE.value)) mode = .DEFERRED_ALBEDO;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_FOUR.value)) mode = .DEFERRED_SHADING;

    for (int i = 0; i < lights.length; i++) {
      rl.Light.UpdateLightValues(deferredShader, lights[i]);
    }

    final texture = rl.Temp.Texture$.At('texture');

    rl.Core.BeginDrawing();
        
      rl.Core.ClearBackground(rl.Color.RAYWHITE);
  
      rl.Rlgl.rlEnableFramebuffer(gBuffer.ref.framebuffer);
      rl.Rlgl.rlClearScreenBuffers();
      
      rl.Rlgl.rlDisableColorBlend();
      rl.Core.BeginMode3D(camera.ref);
        rl.Rlgl.rlEnableShader(gbufferShader.id);
          rl.Core.DrawModel(model, rl.Temp.vec31(0.0, 0.0, 0.0), 1.0, rl.Color.WHITE);
          rl.Core.DrawModel(cube, rl.Temp.vec31(0.0, 1.0, 0.0), 1.0, rl.Color.WHITE);

          for (int i = 0; i < MAX_CUBES; i++)
          {
            final position = cubePositions[i];
            rl.Core.DrawModelEx(
              cube,
              position,
              rl.Temp.vec31(1, 1, 1),
              cubeRotations[i],
              rl.Temp.vec32(CUBE_SCALE, CUBE_SCALE, CUBE_SCALE),
              rl.Color.WHITE
            );
          }

        rl.Rlgl.rlDisableShader();
      rl.Core.EndMode3D();
      rl.Rlgl.rlEnableColorBlend();

      rl.Rlgl.rlDisableFramebuffer();
      rl.Rlgl.rlClearScreenBuffers();

      switch (mode)
      {
        case .DEFERRED_SHADING:
        {
          rl.Core.BeginMode3D(camera.ref);
            rl.Rlgl.rlDisableColorBlend();
            rl.Rlgl.rlEnableShader(deferredShader.id);
              rl.Rlgl.rlActiveTextureSlot(0);
              rl.Rlgl.rlEnableTexture(gBuffer.ref.positionTexture);
              rl.Rlgl.rlActiveTextureSlot(1);
              rl.Rlgl.rlEnableTexture(gBuffer.ref.normalTexture);
              rl.Rlgl.rlActiveTextureSlot(2);
              rl.Rlgl.rlEnableTexture(gBuffer.ref.albedoSpecTexture);

              rl.Rlgl.rlLoadDrawQuad();
            rl.Rlgl.rlDisableShader();
            rl.Rlgl.rlEnableColorBlend();
          rl.Core.EndMode3D();

          rl.Rlgl.rlBindFramebuffer(rl.Rlgl.RL_READ_FRAMEBUFFER, gBuffer.ref.framebuffer);
          rl.Rlgl.rlBindFramebuffer(rl.Rlgl.RL_DRAW_FRAMEBUFFER, 0);
          rl.Rlgl.rlBlitFramebuffer(0, 0, screenWidth, screenHeight, 0, 0, screenWidth, screenHeight, 0x00000100);
          rl.Rlgl.rlDisableFramebuffer();

          rl.Core.BeginMode3D(camera.ref);
            rl.Rlgl.rlEnableShader(rl.Rlgl.rlGetShaderIdDefault());
              for(int i = 0; i < MAX_LIGHTS; i++)
              {
                if (lights[i].enabled) rl.Core.DrawSphereEx(
                  lights[i].position, 0.2, 8, 8, lights[i].color
                );
                else rl.Core.DrawSphereWires(
                  lights[i].position, 0.2, 8, 8, rl.Core.ColorAlpha(lights[i].color, 0.3)
                );
              }
            rl.Rlgl.rlDisableShader();
          rl.Core.EndMode3D();
          
          rl.Core.DrawText(
            "FINAL RESULT".toC,
            10, screenHeight - 30, 20, rl.Color.DARKGREEN
          );
        } break;
        case .DEFERRED_POSITION:
        {
          texture.ref.id = gBuffer.ref.positionTexture;
          texture.ref.width = screenWidth;
          texture.ref.height = screenHeight;

          rl.Core.DrawTextureRec(
            texture.ref,
            rl.Temp.rect1(0, 0, screenWidth, -screenHeight),
            rl.Temp.vec2Zero,
            rl.Color.RAYWHITE
          );
          
          rl.Core.DrawText(
            "POSITION TEXTURE".toC,
            10, screenHeight - 30, 20, rl.Color.DARKGREEN
          );
        } break;
        case .DEFERRED_NORMAL:
        {
          texture.ref.id = gBuffer.ref.normalTexture;
          texture.ref.width = screenWidth;
          texture.ref.height = screenHeight;

          rl.Core.DrawTextureRec(
            texture.ref,
            rl.Temp.rect1(0, 0, screenWidth, -screenHeight),
            rl.Temp.vec2Zero,
            rl.Color.RAYWHITE
          );
          
          rl.Core.DrawText(
            "NORMAL TEXTURE".toC,
            10, screenHeight - 30, 20, rl.Color.DARKGREEN
          );
        } break;
        case .DEFERRED_ALBEDO:
        {
          texture.ref.id = gBuffer.ref.albedoSpecTexture;
          texture.ref.width = screenWidth;
          texture.ref.height = screenHeight;

          rl.Core.DrawTextureRec(
            texture.ref,
            rl.Temp.rect1(0, 0, screenWidth, -screenHeight),
            rl.Temp.vec2Zero,
            rl.Color.RAYWHITE
          );

          rl.Core.DrawText(
            "ALBEDO TEXTURE".toC,
            10, screenHeight - 30, 20, rl.Color.DARKGREEN
          );
        } break;
      }

      rl.Core.DrawText(
        "Toggle lights keys: [Y][R][G][B]".toC,
        10, 40, 20, rl.Color.DARKGRAY
      );
      rl.Core.DrawText(
        "Switch G-buffer textures: [1][2][3][4]".toC,
        10, 70, 20, rl.Color.DARKGRAY
      );

      rl.Core.DrawFPS(10, 10);
        
    rl.Core.EndDrawing();
  }

  rl.Core.UnloadModel(model);
  rl.Core.UnloadModel(cube);

  rl.Core.UnloadShader(deferredShader);
  rl.Core.UnloadShader(gbufferShader);

  rl.Rlgl.rlUnloadFramebuffer(gBuffer.ref.framebuffer);
  rl.Rlgl.rlUnloadTexture(gBuffer.ref.positionTexture);
  rl.Rlgl.rlUnloadTexture(gBuffer.ref.normalTexture);
  rl.Rlgl.rlUnloadTexture(gBuffer.ref.albedoSpecTexture);
  rl.Rlgl.rlUnloadTexture(gBuffer.ref.depthRenderbuffer);

  calloc.free(gBuffer);
  
  rl.CloseWindowAndDispose();
}