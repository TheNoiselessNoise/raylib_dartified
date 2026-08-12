// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_deferred_rendering.c
// Run it: dart run shaders_deferred_rendering.dart
// WARNING: expects resources from the raylib source
import 'dart:io';
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

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
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_deferred_rendering".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(5, 4, 5);
  camera.ref.target.set(0, 1, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 60;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = LoadModelFromMesh(GenMeshPlane(10.0, 10.0, 3, 3));
  final cube = LoadModelFromMesh(GenMeshCube(2.0, 2.0, 2.0));

  final gbufferShader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/gbuffer.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/gbuffer.fs".toC,
  );

  final deferredShader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/deferred_shading.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/deferred_shading.fs".toC,
  );

  deferredShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    GetShaderLocation(deferredShader, "viewPosition".toC);

  final gBuffer = calloc<GBuffer>();
  gBuffer.ref.framebuffer = rlLoadFramebuffer();

  if (!gBuffer.ref.framebuffer.toBool())
  {
    TraceLog(
      TraceLogLevel.LOG_WARNING.value,
      "Failed to create framebuffer".toC,
    );
    calloc.free(gBuffer);
    exit(1);
  }
  
  rlEnableFramebuffer(gBuffer.ref.framebuffer);

  gBuffer.ref.positionTexture = rlLoadTexture(
    nullptr, screenWidth, screenHeight, PixelFormat.PIXELFORMAT_UNCOMPRESSED_R32G32B32.value, 1
  );
  gBuffer.ref.normalTexture = rlLoadTexture(
    nullptr, screenWidth, screenHeight, PixelFormat.PIXELFORMAT_UNCOMPRESSED_R32G32B32.value, 1
  );
  gBuffer.ref.albedoSpecTexture = rlLoadTexture(
    nullptr, screenWidth, screenHeight, PixelFormat.PIXELFORMAT_UNCOMPRESSED_R8G8B8A8.value, 1
  );

  rlActiveDrawBuffers(3);

  rlFramebufferAttach(
    gBuffer.ref.framebuffer, gBuffer.ref.positionTexture,
    RlFramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL0.value,
    RlFramebufferAttachTextureType.RL_ATTACHMENT_TEXTURE2D.value, 0
  );
  rlFramebufferAttach(
    gBuffer.ref.framebuffer, gBuffer.ref.normalTexture,
    RlFramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL1.value,
    RlFramebufferAttachTextureType.RL_ATTACHMENT_TEXTURE2D.value, 0
  );
  rlFramebufferAttach(
    gBuffer.ref.framebuffer, gBuffer.ref.albedoSpecTexture,
    RlFramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL2.value,
    RlFramebufferAttachTextureType.RL_ATTACHMENT_TEXTURE2D.value, 0
  );

  gBuffer.ref.depthRenderbuffer = rlLoadTextureDepth(screenWidth, screenHeight, true);
  rlFramebufferAttach(
    gBuffer.ref.framebuffer, gBuffer.ref.depthRenderbuffer,
    RlFramebufferAttachType.RL_ATTACHMENT_DEPTH.value,
    RlFramebufferAttachTextureType.RL_ATTACHMENT_RENDERBUFFER.value, 0
  );

  if (!rlFramebufferComplete(gBuffer.ref.framebuffer))
  {
    TraceLog(
      TraceLogLevel.LOG_WARNING.value,
      "Framebuffer is not complete".toC,
    );
    exit(1);
  }

  rlEnableShader(deferredShader.id);

    rlSetUniformSampler(
      rlGetLocationUniform(deferredShader.id, "gPosition".toC), 0
    );
    rlSetUniformSampler(
      rlGetLocationUniform(deferredShader.id, "gNormal".toC), 1
    );
    rlSetUniformSampler(
      rlGetLocationUniform(deferredShader.id, "gAlbedoSpec".toC), 2
    );

  rlDisableShader();

  model.materials[0].shader = gbufferShader;
  cube.materials[0].shader = gbufferShader;

  List<LightC> lights = [];

  lights.add(CreateLight(
    LightType.LIGHT_POINT.value,
    Vector3$.val.$1.set(-2, 1, -2), Vector3$.val.$zero, YELLOW, deferredShader
  ));

  lights.add(CreateLight(
    LightType.LIGHT_POINT.value,
    Vector3$.val.$1.set(2, 1, 2), Vector3$.val.$zero, RED, deferredShader
  ));

  lights.add(CreateLight(
    LightType.LIGHT_POINT.value,
    Vector3$.val.$1.set(-2, 1, 2), Vector3$.val.$zero, GREEN, deferredShader
  ));

  lights.add(CreateLight(
    LightType.LIGHT_POINT.value,
    Vector3$.val.$1.set(2, 1, -2), Vector3$.val.$zero, BLUE, deferredShader
  ));

  const double CUBE_SCALE = 0.25;
  final cubePositions = Vector3$.val.At('cubePositions', MAX_CUBES);
  final cubeRotations = Float32$.val.At('cubeRotations', MAX_CUBES);

  for (int i = 0; i < MAX_CUBES; i++) {
    cubePositions[i].set(
      rl.randC()%10 - 5,
      rl.randC()%5,
      rl.randC()%10 - 5,
    );

    cubeRotations[i] = rl.randC()%360;
  }

  DeferredMode mode = .DEFERRED_SHADING;

  rlEnableDepthTest();

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    SetShaderValue(deferredShader,
      deferredShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      Vector3$.val.$1Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    if (IsKeyPressed(KeyboardKey.KEY_Y.value)) lights[0].enabled = !lights[0].enabled;
    if (IsKeyPressed(KeyboardKey.KEY_R.value)) lights[1].enabled = !lights[1].enabled;
    if (IsKeyPressed(KeyboardKey.KEY_G.value)) lights[2].enabled = !lights[2].enabled;
    if (IsKeyPressed(KeyboardKey.KEY_B.value)) lights[3].enabled = !lights[3].enabled;

    if (IsKeyPressed(KeyboardKey.KEY_ONE.value)) mode = .DEFERRED_POSITION;
    if (IsKeyPressed(KeyboardKey.KEY_TWO.value)) mode = .DEFERRED_NORMAL;
    if (IsKeyPressed(KeyboardKey.KEY_THREE.value)) mode = .DEFERRED_ALBEDO;
    if (IsKeyPressed(KeyboardKey.KEY_FOUR.value)) mode = .DEFERRED_SHADING;

    for (int i = 0; i < lights.length; i++) {
      UpdateLightValues(deferredShader, lights[i]);
    }

    final texture = Texture$.val.At('texture');

    BeginDrawing();
        
      ClearBackground(RAYWHITE);
  
      rlEnableFramebuffer(gBuffer.ref.framebuffer);
      rlClearScreenBuffers();
      
      rlDisableColorBlend();
      BeginMode3D(camera.ref);
        rlEnableShader(gbufferShader.id);
          DrawModel(model, Vector3$.val.$1.set(0.0, 0.0, 0.0), 1.0, WHITE);
          DrawModel(cube, Vector3$.val.$1.set(0.0, 1.0, 0.0), 1.0, WHITE);

          for (int i = 0; i < MAX_CUBES; i++)
          {
            final position = cubePositions[i];
            DrawModelEx(
              cube,
              position,
              Vector3$.val.$1.set(1, 1, 1),
              cubeRotations[i],
              Vector3$.val.$2.set(CUBE_SCALE, CUBE_SCALE, CUBE_SCALE),
              WHITE
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
          BeginMode3D(camera.ref);
            rlDisableColorBlend();
            rlEnableShader(deferredShader.id);
              rlActiveTextureSlot(0);
              rlEnableTexture(gBuffer.ref.positionTexture);
              rlActiveTextureSlot(1);
              rlEnableTexture(gBuffer.ref.normalTexture);
              rlActiveTextureSlot(2);
              rlEnableTexture(gBuffer.ref.albedoSpecTexture);

              rlLoadDrawQuad();
            rlDisableShader();
            rlEnableColorBlend();
          EndMode3D();

          rlBindFramebuffer(RL_READ_FRAMEBUFFER, gBuffer.ref.framebuffer);
          rlBindFramebuffer(RL_DRAW_FRAMEBUFFER, 0);
          rlBlitFramebuffer(0, 0, screenWidth, screenHeight, 0, 0, screenWidth, screenHeight, 0x00000100);
          rlDisableFramebuffer();

          BeginMode3D(camera.ref);
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
            "FINAL RESULT".toC,
            10, screenHeight - 30, 20, DARKGREEN
          );
        } break;
        case .DEFERRED_POSITION:
        {
          texture.ref.id = gBuffer.ref.positionTexture;
          texture.ref.width = screenWidth;
          texture.ref.height = screenHeight;

          DrawTextureRec(
            texture.ref,
            Rectangle$.val.$1.set(0, 0, screenWidth, -screenHeight),
            Vector2$.val.$zero,
            RAYWHITE
          );
          
          DrawText(
            "POSITION TEXTURE".toC,
            10, screenHeight - 30, 20, DARKGREEN
          );
        } break;
        case .DEFERRED_NORMAL:
        {
          texture.ref.id = gBuffer.ref.normalTexture;
          texture.ref.width = screenWidth;
          texture.ref.height = screenHeight;

          DrawTextureRec(
            texture.ref,
            Rectangle$.val.$1.set(0, 0, screenWidth, -screenHeight),
            Vector2$.val.$zero,
            RAYWHITE
          );
          
          DrawText(
            "NORMAL TEXTURE".toC,
            10, screenHeight - 30, 20, DARKGREEN
          );
        } break;
        case .DEFERRED_ALBEDO:
        {
          texture.ref.id = gBuffer.ref.albedoSpecTexture;
          texture.ref.width = screenWidth;
          texture.ref.height = screenHeight;

          DrawTextureRec(
            texture.ref,
            Rectangle$.val.$1.set(0, 0, screenWidth, -screenHeight),
            Vector2$.val.$zero,
            RAYWHITE
          );

          DrawText(
            "ALBEDO TEXTURE".toC,
            10, screenHeight - 30, 20, DARKGREEN
          );
        } break;
      }

      DrawText(
        "Toggle lights keys: [Y][R][G][B]".toC,
        10, 40, 20, DARKGRAY
      );
      DrawText(
        "Switch G-buffer textures: [1][2][3][4]".toC,
        10, 70, 20, DARKGRAY
      );

      DrawFPS(10, 10);
        
    EndDrawing();
  }

  UnloadModel(model);
  UnloadModel(cube);

  UnloadShader(deferredShader);
  UnloadShader(gbufferShader);

  rlUnloadFramebuffer(gBuffer.ref.framebuffer);
  rlUnloadTexture(gBuffer.ref.positionTexture);
  rlUnloadTexture(gBuffer.ref.normalTexture);
  rlUnloadTexture(gBuffer.ref.albedoSpecTexture);
  rlUnloadTexture(gBuffer.ref.depthRenderbuffer);

  calloc.free(gBuffer);
  
  CloseWindowAndDispose();
}