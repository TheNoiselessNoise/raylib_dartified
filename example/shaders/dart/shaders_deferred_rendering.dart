// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_deferred_rendering.c
// Run it: dart run shaders_deferred_rendering.dart
// WARNING: expects resources from the raylib source
import 'dart:io';
import '../../base_dart.dart';

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
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_deferred_rendering");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(5, 4, 5),
    target: .vec3(0, 1, 0),
    up: .vec3(0, 1, 0),
    fovy: 60,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = LoadModelFromMesh(GenMeshPlane(10.0, 10.0, 3, 3));
  final cube = LoadModelFromMesh(GenMeshCube(2.0, 2.0, 2.0));

  final gbufferShader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/gbuffer.vs",
    "../resources/shaders/glsl$GLSL_VERSION/gbuffer.fs",
  );

  final deferredShader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/deferred_shading.vs",
    "../resources/shaders/glsl$GLSL_VERSION/deferred_shading.fs",
  );

  deferredShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    GetShaderLocation(deferredShader, "viewPosition");

  final gBuffer = GBuffer();
  gBuffer.framebuffer = rlLoadFramebuffer();

  if (!gBuffer.framebuffer.toBool())
  {
    TraceLog(.LOG_WARNING, "Failed to create framebuffer");
    exit(1);
  }
  
  rlEnableFramebuffer(gBuffer.framebuffer);

  gBuffer.positionTexture = rlLoadTexture(
    null, screenWidth, screenHeight, .PIXELFORMAT_UNCOMPRESSED_R32G32B32, 1
  );
  gBuffer.normalTexture = rlLoadTexture(
    null, screenWidth, screenHeight, .PIXELFORMAT_UNCOMPRESSED_R32G32B32, 1
  );
  gBuffer.albedoSpecTexture = rlLoadTexture(
    null, screenWidth, screenHeight, .PIXELFORMAT_UNCOMPRESSED_R8G8B8A8, 1
  );

  rlActiveDrawBuffers(3);

  rlFramebufferAttach(
    gBuffer.framebuffer, gBuffer.positionTexture,
    .RL_ATTACHMENT_COLOR_CHANNEL0,
    .RL_ATTACHMENT_TEXTURE2D, 0
  );
  rlFramebufferAttach(
    gBuffer.framebuffer, gBuffer.normalTexture,
    .RL_ATTACHMENT_COLOR_CHANNEL1,
    .RL_ATTACHMENT_TEXTURE2D, 0
  );
  rlFramebufferAttach(
    gBuffer.framebuffer, gBuffer.albedoSpecTexture,
    .RL_ATTACHMENT_COLOR_CHANNEL2,
    .RL_ATTACHMENT_TEXTURE2D, 0
  );

  gBuffer.depthRenderbuffer = rlLoadTextureDepth(screenWidth, screenHeight, true);
  rlFramebufferAttach(
    gBuffer.framebuffer, gBuffer.depthRenderbuffer,
    .RL_ATTACHMENT_DEPTH,
    .RL_ATTACHMENT_RENDERBUFFER, 0
  );

  if (!rlFramebufferComplete(gBuffer.framebuffer))
  {
    TraceLog(.LOG_WARNING, "Framebuffer is not complete");
    exit(1);
  }

  rlEnableShader(deferredShader.id);

    rlSetUniformSampler(
      rlGetLocationUniform(deferredShader.id, "gPosition"), 0
    );
    rlSetUniformSampler(
      rlGetLocationUniform(deferredShader.id, "gNormal"), 1
    );
    rlSetUniformSampler(
      rlGetLocationUniform(deferredShader.id, "gAlbedoSpec"), 2
    );

  rlDisableShader();

  model.materials[0].shader = gbufferShader;
  cube.materials[0].shader = gbufferShader;

  List<LightD> lights = [];

  lights.add(CreateLight(
    .LIGHT_POINT, .vec3(-2, 1, -2), .zero(), .YELLOW, deferredShader
  ));

  lights.add(CreateLight(
    .LIGHT_POINT, .vec3(2, 1, 2), .zero(), .RED, deferredShader
  ));

  lights.add(CreateLight(
    .LIGHT_POINT, .vec3(-2, 1, 2), .zero(), .GREEN, deferredShader
  ));

  lights.add(CreateLight(
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

  rlEnableDepthTest();

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    SetShaderValue(
      deferredShader,
      deferredShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    if (IsKeyPressed(.KEY_Y)) lights[0].enabled = !lights[0].enabled;
    if (IsKeyPressed(.KEY_R)) lights[1].enabled = !lights[1].enabled;
    if (IsKeyPressed(.KEY_G)) lights[2].enabled = !lights[2].enabled;
    if (IsKeyPressed(.KEY_B)) lights[3].enabled = !lights[3].enabled;

    if (IsKeyPressed(.KEY_ONE)) mode = .DEFERRED_POSITION;
    if (IsKeyPressed(.KEY_TWO)) mode = .DEFERRED_NORMAL;
    if (IsKeyPressed(.KEY_THREE)) mode = .DEFERRED_ALBEDO;
    if (IsKeyPressed(.KEY_FOUR)) mode = .DEFERRED_SHADING;

    for (int i = 0; i < lights.length; i++) {
      UpdateLightValues(deferredShader, lights[i]);
    }

    final TextureD texture = .new();

    BeginDrawing();
        
      ClearBackground(.RAYWHITE);
  
      rlEnableFramebuffer(gBuffer.framebuffer);
      rlClearScreenBuffers();
      
      rlDisableColorBlend();
      BeginMode3D(camera);
        rlEnableShader(gbufferShader.id);
          DrawModel(model, .vec3(0.0, 0.0, 0.0), 1.0, .WHITE);
          DrawModel(cube, .vec3(0.0, 1.0, 0.0), 1.0, .WHITE);

          for (int i = 0; i < MAX_CUBES; i++)
          {
            final position = cubePositions[i];
            DrawModelEx(
              cube,
              position,
              .vec3(1, 1, 1),
              cubeRotations[i],
              .vec3(CUBE_SCALE, CUBE_SCALE, CUBE_SCALE),
              .WHITE
            );
          }

        rlDisableShader();
      EndMode3D();
      rlEnableColorBlend();

      rlDisableFramebuffer();
      rlClearScreenBuffers();

      switch (mode)
      {
        case .DEFERRED_SHADING:
        {
          BeginMode3D(camera);
            rlDisableColorBlend();
            rlEnableShader(deferredShader.id);
              rlActiveTextureSlot(0);
              rlEnableTexture(gBuffer.positionTexture);
              rlActiveTextureSlot(1);
              rlEnableTexture(gBuffer.normalTexture);
              rlActiveTextureSlot(2);
              rlEnableTexture(gBuffer.albedoSpecTexture);

              rlLoadDrawQuad();
            rlDisableShader();
            rlEnableColorBlend();
          EndMode3D();

          rlBindFramebuffer(rl.Rlgl.RL_READ_FRAMEBUFFER, gBuffer.framebuffer);
          rlBindFramebuffer(rl.Rlgl.RL_DRAW_FRAMEBUFFER, 0);
          rlBlitFramebuffer(0, 0, screenWidth, screenHeight, 0, 0, screenWidth, screenHeight, 0x00000100);
          rlDisableFramebuffer();

          BeginMode3D(camera);
            rlEnableShader(rlGetShaderIdDefault());
              for(int i = 0; i < MAX_LIGHTS; i++)
              {
                if (lights[i].enabled) DrawSphereEx(
                  lights[i].position, 0.2, 8, 8, lights[i].color
                );
                else DrawSphereWires(
                  lights[i].position, 0.2, 8, 8, ColorAlpha(lights[i].color, 0.3)
                );
              }
            rlDisableShader();
          EndMode3D();
          
          DrawText(
            "FINAL RESULT",
            10, screenHeight - 30, 20, .DARKGREEN
          );
        } break;
        case .DEFERRED_POSITION:
        {
          texture.id = gBuffer.positionTexture;
          texture.width = screenWidth;
          texture.height = screenHeight;

          DrawTextureRec(
            texture,
            .rect(0, 0, screenWidth, -screenHeight),
            .zero(),
            .RAYWHITE
          );
          
          DrawText(
            "POSITION TEXTURE",
            10, screenHeight - 30, 20, .DARKGREEN
          );
        } break;
        case .DEFERRED_NORMAL:
        {
          texture.id = gBuffer.normalTexture;
          texture.width = screenWidth;
          texture.height = screenHeight;

          DrawTextureRec(
            texture,
            .rect(0, 0, screenWidth, -screenHeight),
            .zero(),
            .RAYWHITE
          );
          
          DrawText(
            "NORMAL TEXTURE",
            10, screenHeight - 30, 20, .DARKGREEN
          );
        } break;
        case .DEFERRED_ALBEDO:
        {
          texture.id = gBuffer.albedoSpecTexture;
          texture.width = screenWidth;
          texture.height = screenHeight;

          DrawTextureRec(
            texture,
            .rect(0, 0, screenWidth, -screenHeight),
            .zero(),
            .RAYWHITE
          );

          DrawText(
            "ALBEDO TEXTURE",
            10, screenHeight - 30, 20, .DARKGREEN
          );
        } break;
      }

      DrawText(
        "Toggle lights keys: [Y][R][G][B]",
        10, 40, 20, .DARKGRAY
      );
      DrawText(
        "Switch G-buffer textures: [1][2][3][4]",
        10, 70, 20, .DARKGRAY
      );

      DrawFPS(10, 10);
        
    EndDrawing();
  }

  UnloadModel(model);
  UnloadModel(cube);

  UnloadShader(deferredShader);
  UnloadShader(gbufferShader);

  rlUnloadFramebuffer(gBuffer.framebuffer);
  rlUnloadTexture(gBuffer.positionTexture);
  rlUnloadTexture(gBuffer.normalTexture);
  rlUnloadTexture(gBuffer.albedoSpecTexture);
  rlUnloadTexture(gBuffer.depthRenderbuffer);

  CloseWindowAndDispose();
}