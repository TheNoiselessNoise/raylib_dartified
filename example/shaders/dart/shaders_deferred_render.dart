// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_deferred_render.c
// Run it: dart run shaders_deferred_render.dart
// WARNING: expects resources from the raylib source
import 'dart:io';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_CUBES = 30;
const int MAX_LIGHTS = 4;

class GBuffer {
  int framebuffer = 0;
  int positionTexture = 0;
  int normalTexture = 0;
  int albedoSpecTexture = 0;
  int depthRenderbuffer = 0;
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

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_deferred_render");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(5, 4, 5),
    target: .vec3(0, 1, 0),
    up: .vec3(0, 1, 0),
    fovy: 60,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = rl.CoreD.LoadModelFromMesh(rl.CoreD.GenMeshPlane(10.0, 10.0, 3, 3));
  final cube = rl.CoreD.LoadModelFromMesh(rl.CoreD.GenMeshCube(2.0, 2.0, 2.0));

  final gbufferShader = rl.CoreD.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/gbuffer.vs",
    "../resources/shaders/glsl$GLSL_VERSION/gbuffer.fs",
  );

  final deferredShader = rl.CoreD.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/deferred_shading.vs",
    "../resources/shaders/glsl$GLSL_VERSION/deferred_shading.fs",
  );

  deferredShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    rl.CoreD.GetShaderLocation(deferredShader, "viewPosition");

  final gBuffer = GBuffer();
  gBuffer.framebuffer = rl.RlglD.rlLoadFramebuffer();

  if (!gBuffer.framebuffer.toBool())
  {
    rl.CoreD.TraceLog(.LOG_WARNING, "Failed to create framebuffer");
    exit(1);
  }
  
  rl.RlglD.rlEnableFramebuffer(gBuffer.framebuffer);

  gBuffer.positionTexture = rl.RlglD.rlLoadTexture(
    null, screenWidth, screenHeight, .PIXELFORMAT_UNCOMPRESSED_R32G32B32, 1
  );
  gBuffer.normalTexture = rl.RlglD.rlLoadTexture(
    null, screenWidth, screenHeight, .PIXELFORMAT_UNCOMPRESSED_R32G32B32, 1
  );
  gBuffer.albedoSpecTexture = rl.RlglD.rlLoadTexture(
    null, screenWidth, screenHeight, .PIXELFORMAT_UNCOMPRESSED_R8G8B8A8, 1
  );

  rl.RlglD.rlActiveDrawBuffers(3);

  rl.RlglD.rlFramebufferAttach(
    gBuffer.framebuffer, gBuffer.positionTexture,
    .RL_ATTACHMENT_COLOR_CHANNEL0,
    .RL_ATTACHMENT_TEXTURE2D, 0
  );
  rl.RlglD.rlFramebufferAttach(
    gBuffer.framebuffer, gBuffer.normalTexture,
    .RL_ATTACHMENT_COLOR_CHANNEL1,
    .RL_ATTACHMENT_TEXTURE2D, 0
  );
  rl.RlglD.rlFramebufferAttach(
    gBuffer.framebuffer, gBuffer.albedoSpecTexture,
    .RL_ATTACHMENT_COLOR_CHANNEL2,
    .RL_ATTACHMENT_TEXTURE2D, 0
  );

  gBuffer.depthRenderbuffer = rl.RlglD.rlLoadTextureDepth(screenWidth, screenHeight, true);
  rl.RlglD.rlFramebufferAttach(
    gBuffer.framebuffer, gBuffer.depthRenderbuffer,
    .RL_ATTACHMENT_DEPTH,
    .RL_ATTACHMENT_RENDERBUFFER, 0
  );

  if (!rl.RlglD.rlFramebufferComplete(gBuffer.framebuffer))
  {
    rl.CoreD.TraceLog(.LOG_WARNING, "Framebuffer is not complete");
    exit(1);
  }

  rl.RlglD.rlEnableShader(deferredShader.id);

    rl.RlglD.rlSetUniformSampler(
      rl.RlglD.rlGetLocationUniform(deferredShader.id, "gPosition"), 0
    );
    rl.RlglD.rlSetUniformSampler(
      rl.RlglD.rlGetLocationUniform(deferredShader.id, "gNormal"), 1
    );
    rl.RlglD.rlSetUniformSampler(
      rl.RlglD.rlGetLocationUniform(deferredShader.id, "gAlbedoSpec"), 2
    );

  rl.RlglD.rlDisableShader();

  model.materials[0].shader = gbufferShader;
  cube.materials[0].shader = gbufferShader;

  List<LightD> lights = [];

  lights.add(rl.LightD.CreateLight(
    .LIGHT_POINT, .vec3(-2, 1, -2), .zero(), .YELLOW, deferredShader
  ));

  lights.add(rl.LightD.CreateLight(
    .LIGHT_POINT, .vec3(2, 1, 2), .zero(), .RED, deferredShader
  ));

  lights.add(rl.LightD.CreateLight(
    .LIGHT_POINT, .vec3(-2, 1, 2), .zero(), .GREEN, deferredShader
  ));

  lights.add(rl.LightD.CreateLight(
    .LIGHT_POINT, .vec3(2, 1, -2), .zero(), .BLUE, deferredShader
  ));

  const double CUBE_SCALE = 0.25;
  final List<Vector3D> cubePositions = .generate(MAX_CUBES, (_) => .vec3(
    rl.randC()%10 - 5,
    rl.randC()%5,
    rl.randC()%10 - 5,
  ));
  final List<double> cubeRotations = .generate(MAX_CUBES, (_) => rl.randC()%360);

  DeferredMode mode = .DEFERRED_SHADING;

  rl.RlglD.rlEnableDepthTest();

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    rl.CoreD.SetShaderValue(
      deferredShader,
      deferredShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    if (rl.CoreD.IsKeyPressed(.KEY_Y)) lights[0].enabled = !lights[0].enabled;
    if (rl.CoreD.IsKeyPressed(.KEY_R)) lights[1].enabled = !lights[1].enabled;
    if (rl.CoreD.IsKeyPressed(.KEY_G)) lights[2].enabled = !lights[2].enabled;
    if (rl.CoreD.IsKeyPressed(.KEY_B)) lights[3].enabled = !lights[3].enabled;

    if (rl.CoreD.IsKeyPressed(.KEY_ONE)) mode = .DEFERRED_POSITION;
    if (rl.CoreD.IsKeyPressed(.KEY_TWO)) mode = .DEFERRED_NORMAL;
    if (rl.CoreD.IsKeyPressed(.KEY_THREE)) mode = .DEFERRED_ALBEDO;
    if (rl.CoreD.IsKeyPressed(.KEY_FOUR)) mode = .DEFERRED_SHADING;

    for (int i = 0; i < lights.length; i++) {
      rl.LightD.UpdateLightValues(deferredShader, lights[i]);
    }

    final TextureD texture = .new();

    rl.CoreD.BeginDrawing();
        
      rl.CoreD.ClearBackground(.RAYWHITE);
  
      rl.RlglD.rlEnableFramebuffer(gBuffer.framebuffer);
      rl.RlglD.rlClearScreenBuffers();
      
      rl.RlglD.rlDisableColorBlend();
      rl.CoreD.BeginMode3D(camera);
        rl.RlglD.rlEnableShader(gbufferShader.id);
          rl.CoreD.DrawModel(model, .vec3(0.0, 0.0, 0.0), 1.0, .WHITE);
          rl.CoreD.DrawModel(cube, .vec3(0.0, 1.0, 0.0), 1.0, .WHITE);

          for (int i = 0; i < MAX_CUBES; i++)
          {
            final position = cubePositions[i];
            rl.CoreD.DrawModelEx(
              cube,
              position,
              .vec3(1, 1, 1),
              cubeRotations[i],
              .vec3(CUBE_SCALE, CUBE_SCALE, CUBE_SCALE),
              .WHITE
            );
          }

        rl.RlglD.rlDisableShader();
      rl.CoreD.EndMode3D();
      rl.RlglD.rlEnableColorBlend();

      rl.RlglD.rlDisableFramebuffer();
      rl.RlglD.rlClearScreenBuffers();

      switch (mode)
      {
        case .DEFERRED_SHADING:
        {
          rl.CoreD.BeginMode3D(camera);
            rl.RlglD.rlDisableColorBlend();
            rl.RlglD.rlEnableShader(deferredShader.id);
              rl.RlglD.rlActiveTextureSlot(0);
              rl.RlglD.rlEnableTexture(gBuffer.positionTexture);
              rl.RlglD.rlActiveTextureSlot(1);
              rl.RlglD.rlEnableTexture(gBuffer.normalTexture);
              rl.RlglD.rlActiveTextureSlot(2);
              rl.RlglD.rlEnableTexture(gBuffer.albedoSpecTexture);

              rl.RlglD.rlLoadDrawQuad();
            rl.RlglD.rlDisableShader();
            rl.RlglD.rlEnableColorBlend();
          rl.CoreD.EndMode3D();

          rl.RlglD.rlBindFramebuffer(rl.Rlgl.RL_READ_FRAMEBUFFER, gBuffer.framebuffer);
          rl.RlglD.rlBindFramebuffer(rl.Rlgl.RL_DRAW_FRAMEBUFFER, 0);
          rl.RlglD.rlBlitFramebuffer(0, 0, screenWidth, screenHeight, 0, 0, screenWidth, screenHeight, 0x00000100);
          rl.RlglD.rlDisableFramebuffer();

          rl.CoreD.BeginMode3D(camera);
            rl.RlglD.rlEnableShader(rl.RlglD.rlGetShaderIdDefault());
              for(int i = 0; i < MAX_LIGHTS; i++)
              {
                if (lights[i].enabled) rl.CoreD.DrawSphereEx(
                  lights[i].position, 0.2, 8, 8, lights[i].color
                );
                else rl.CoreD.DrawSphereWires(
                  lights[i].position, 0.2, 8, 8, rl.CoreD.ColorAlpha(lights[i].color, 0.3)
                );
              }
            rl.RlglD.rlDisableShader();
          rl.CoreD.EndMode3D();
          
          rl.CoreD.DrawText(
            "FINAL RESULT",
            10, screenHeight - 30, 20, .DARKGREEN
          );
        } break;
        case .DEFERRED_POSITION:
        {
          texture.id = gBuffer.positionTexture;
          texture.width = screenWidth;
          texture.height = screenHeight;

          rl.CoreD.DrawTextureRec(
            texture,
            .rect(0, 0, screenWidth, -screenHeight),
            .zero(),
            .RAYWHITE
          );
          
          rl.CoreD.DrawText(
            "POSITION TEXTURE",
            10, screenHeight - 30, 20, .DARKGREEN
          );
        } break;
        case .DEFERRED_NORMAL:
        {
          texture.id = gBuffer.normalTexture;
          texture.width = screenWidth;
          texture.height = screenHeight;

          rl.CoreD.DrawTextureRec(
            texture,
            .rect(0, 0, screenWidth, -screenHeight),
            .zero(),
            .RAYWHITE
          );
          
          rl.CoreD.DrawText(
            "NORMAL TEXTURE",
            10, screenHeight - 30, 20, .DARKGREEN
          );
        } break;
        case .DEFERRED_ALBEDO:
        {
          texture.id = gBuffer.albedoSpecTexture;
          texture.width = screenWidth;
          texture.height = screenHeight;

          rl.CoreD.DrawTextureRec(
            texture,
            .rect(0, 0, screenWidth, -screenHeight),
            .zero(),
            .RAYWHITE
          );

          rl.CoreD.DrawText(
            "ALBEDO TEXTURE",
            10, screenHeight - 30, 20, .DARKGREEN
          );
        } break;
      }

      rl.CoreD.DrawText(
        "Toggle lights keys: [Y][R][G][B]",
        10, 40, 20, .DARKGRAY
      );
      rl.CoreD.DrawText(
        "Switch G-buffer textures: [1][2][3][4]",
        10, 70, 20, .DARKGRAY
      );

      rl.CoreD.DrawFPS(10, 10);
        
    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadModel(model);
  rl.CoreD.UnloadModel(cube);

  rl.CoreD.UnloadShader(deferredShader);
  rl.CoreD.UnloadShader(gbufferShader);

  rl.RlglD.rlUnloadFramebuffer(gBuffer.framebuffer);
  rl.RlglD.rlUnloadTexture(gBuffer.positionTexture);
  rl.RlglD.rlUnloadTexture(gBuffer.normalTexture);
  rl.RlglD.rlUnloadTexture(gBuffer.albedoSpecTexture);
  rl.RlglD.rlUnloadTexture(gBuffer.depthRenderbuffer);

  rl.CloseWindowAndDispose();
}