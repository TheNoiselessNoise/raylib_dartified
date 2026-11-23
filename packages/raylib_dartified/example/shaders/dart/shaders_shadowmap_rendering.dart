// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_shadowmap_rendering.c
// WARNING: expects resources from the raylib source
//
//
//
// WARNING: This example is currently broken in WASM/WebGL2.
//
// The root cause is that Raylib's rlLoadTextureDepth() uses GL_DEPTH_COMPONENT
// (unsized internal format, 0x1902) when creating the depth texture, which is
// valid in desktop OpenGL but rejected by WebGL2, which requires a sized format
// such as GL_DEPTH_COMPONENT24 or GL_DEPTH_COMPONENT32F.
//
// This results in the depth texture being created with no storage, causing the
// shadow map FBO to be incomplete or the depth attachment to have no dimensions.
//
// Attempts to work around this via JS interop (manually calling texImage2D with
// GL_DEPTH_COMPONENT24 on the already-allocated texture object) partially work,
// the FBO reports complete, but WebGL2 then throws a feedback loop error:
//   "Texture level 0 would be read by TEXTURE_2D unit 1, but written by
//    framebuffer attachment DEPTH_ATTACHMENT"
// meaning it considers the depth texture simultaneously attached to the FBO and
// bound for sampling, even after explicit detach/reattach attempts via
// framebufferTexture2D and bindFramebuffer.
//
// The underlying issue is that rlgl's WASM backend does not expose enough control
// over framebuffer and texture state to implement shadowmapping correctly, and
// Raylib's own EndTextureMode() does not fully clean up depth-only FBO state in
// a way that satisfies WebGL2's feedback loop validation.
import 'dart:typed_data';
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int SHADOWMAP_RESOLUTION = 1024;

late Camera3D camera;
late Shader shadowShader;
late Vector3 lightDir;
late Vector4 lightColor;
late int lightVPLoc;
late int shadowMapLoc;
late Model cube;
late Model robot;
late List<ModelAnimation> robotAnimations;
late RenderTexture shadowMap;
late Camera3D lightCam;
int fc = 0;

void updateShaderLightDir() => SetShaderValue(shadowShader, GetShaderLocation(shadowShader, "lightDir"), lightDir.toArray(), .SHADER_UNIFORM_VEC3);

void main() => runExample(
  init: (_) {
    SetConfigFlags([.FLAG_MSAA_4X_HINT]);
    InitWindow(screenWidth, screenHeight, "shaders_shadowmap_rendering");
    SetTargetFPS(60);

    camera = .new(
      position: .vec3(10, 10, 10),
      target: .vec3(0, 0, 0),
      up: .vec3(0, 1, 0),
      fovy: 45.0,
      projection: .CAMERA_PERSPECTIVE,
    );

    shadowShader = LoadShader(
      "../resources/shaders/glsl${Raylib.glslVersion}/shadowmap.vs",
      "../resources/shaders/glsl${Raylib.glslVersion}/shadowmap.fs",
    );

    shadowShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value]
      = GetShaderLocation(shadowShader, "viewPos");

    lightDir = .normalized(0.35, -1.0, -0.35);
    lightColor = .colorNormalize(.WHITE);

    updateShaderLightDir();

    SetShaderValue(shadowShader, GetShaderLocation(shadowShader, "lightColor"), lightColor.toArray(), .SHADER_UNIFORM_VEC4);
    SetShaderValue(shadowShader, GetShaderLocation(shadowShader, "ambient"), [0.1, 0.1, 0.1, 1.0], .SHADER_UNIFORM_VEC4);
    
    lightVPLoc = GetShaderLocation(shadowShader, "lightVP");
    shadowMapLoc = GetShaderLocation(shadowShader, "shadowMap");
    SetShaderValue(shadowShader, GetShaderLocation(shadowShader, "shadowMapResolution"), [SHADOWMAP_RESOLUTION], .SHADER_UNIFORM_INT);

    cube = LoadModelFromMesh(GenMeshCube(1.0, 1.0, 1.0));
    cube.materials[0].shader = shadowShader;
    
    robot = LoadModel("../resources/models/robot.glb");

    for (int i = 0; i < robot.materialCount; i++)
    {
      robot.materials[i].shader = shadowShader;
    }

    robotAnimations = LoadModelAnimations("../resources/models/robot.glb");

    shadowMap = LoadShadowmapRenderTexture(SHADOWMAP_RESOLUTION, SHADOWMAP_RESOLUTION);

    lightCam = .new(
      position: lightDir.scale(-15.0),
      target: .vec3(0, 0, 0),
      up: .vec3(0, 1, 0),
      fovy: 20.0,
      projection: .CAMERA_ORTHOGRAPHIC,
    );
  },
  loop: (_) async {
    final dt = GetFrameTime();

    SetShaderValue(shadowShader,
      shadowShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    UpdateCamera(camera, .CAMERA_ORBITAL);

    fc++;
    fc %= (robotAnimations[0].keyframeCount);
    UpdateModelAnimation(robot, robotAnimations[0], fc);

    final cameraSpeed = 0.05;
    if (IsKeyDown(.KEY_LEFT))
    {
      if (lightDir.x < 0.6)
        lightDir.x += cameraSpeed * 60.0 * dt;
    }
    if (IsKeyDown(.KEY_RIGHT))
    {
      if (lightDir.x > -0.6)
        lightDir.x -= cameraSpeed * 60.0 * dt;
    }
    if (IsKeyDown(.KEY_UP))
    {
      if (lightDir.z < 0.6)
        lightDir.z += cameraSpeed * 60.0 * dt;
    }
    if (IsKeyDown(.KEY_DOWN))
    {
      if (lightDir.z > -0.6)
        lightDir.z -= cameraSpeed * 60.0 * dt;
    }

    lightDir = lightDir.normalize();
    lightCam.position = lightDir.scale(-15.0);
    updateShaderLightDir();

    Matrix lightView;
    Matrix lightProj;
    
    BeginTextureMode(shadowMap);
      ClearBackground(.WHITE);
      BeginMode3D(lightCam);
        lightView = rlGetMatrixModelview();
        lightProj = rlGetMatrixProjection();
        DrawScene(cube, robot);
      EndMode3D();
    EndTextureMode();
    
    final lightViewProj = lightView.mul(lightProj);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      SetShaderValueMatrix(shadowShader, lightVPLoc, lightViewProj);
      rlEnableShader(shadowShader.id);

      int textureActiveSlot = 10;
      rlActiveTextureSlot(textureActiveSlot);
      rlEnableTexture(shadowMap.depth.id);
      rlSetUniform(shadowMapLoc,
        Int32List.fromList([textureActiveSlot]),
        .RL_SHADER_UNIFORM_INT,
        1
      );

      BeginMode3D(camera);
        DrawScene(cube, robot);
      EndMode3D();

      DrawText(
        "Use the arrow keys to rotate the light!",
        10, 10, 30, .RED
      );
      DrawText(
        "Shadows in raylib using the shadowmapping algorithm!",
        screenWidth - 320, screenHeight - 20, 10, .GRAY
      );

    EndDrawing();

    if (IsKeyPressed(.KEY_F))
    {
      TakeScreenshot("shaders_shadowmap_rendering.png");
    }
  },
  close: (_) {
    UnloadShader(shadowShader);
    UnloadModel(cube);
    UnloadModel(robot);
    UnloadModelAnimations(robotAnimations);
    UnloadShadowmapRenderTexture(shadowMap);
    CloseWindow();
  },
);

RenderTexture LoadShadowmapRenderTexture(
  int width,
  int height,
) {
  final RenderTexture target = .new();

  target.id = rlLoadFramebuffer();
  target.texture.width = width;
  target.texture.height = height;

  if (target.id > 0)
  {
    rlEnableFramebuffer(target.id);

    target.depth.id = rlLoadTextureDepth(width, height, false);
    target.depth.width = width;
    target.depth.height = height;
    target.depth.format = .fromValue(19);
    target.depth.mipmaps = 1;

    rlFramebufferAttach(
      target.id,
      target.depth.id,
      .RL_ATTACHMENT_DEPTH,
      .RL_ATTACHMENT_TEXTURE2D,
      0
    );

    if (rlFramebufferComplete(target.id)) {
      TraceLog(.LOG_INFO,
        "FBO: [ID ${target.id}] Framebuffer object created successfully"
      );
    }

    rlDisableFramebuffer();
  }
  else TraceLog(.LOG_WARNING,
    "FBO: Framebuffer object can not be created"
  );

  return target;
}

void UnloadShadowmapRenderTexture(RenderTexture target)
{
  if (target.id > 0)
  {
    rlUnloadFramebuffer(target.id);
  }
}

void DrawScene(Model cube, Model robot)
{
  DrawModelEx(cube, .vec3(0.0, 0.0, 0.0), .vec3(0.0, 1.0, 0.0), 0.0, .vec3(10.0, 1.0, 10.0), .BLUE);
  DrawModelEx(cube, .vec3(1.5, 1.0, -1.5), .vec3(0.0, 1.0, 0.0), 0.0, .vec3(1.0, 1.0, 1.0), .WHITE);
  DrawModelEx(robot, .vec3(0.0, 0.5, 0.0), .vec3(0.0, 1.0, 0.0), 0.0, .vec3(1.0, 1.0, 1.0), .RED);
}

