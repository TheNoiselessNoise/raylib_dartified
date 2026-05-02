// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_shadowmap.c
// Run it: dart run shaders_shadowmap.dart
// WARNING: expects resources from the raylib source
import 'dart:typed_data';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int SHADOWMAP_RESOLUTION = 1024;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_shadowmap");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final cam = CameraD(
    position: .vec3(10, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45.0,
    projection: .CAMERA_PERSPECTIVE,
  );

  final shadowShader = rl.CoreD.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/shadowmap.vs",
    "../resources/shaders/glsl$GLSL_VERSION/shadowmap.fs",
  );

  shadowShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    rl.CoreD.GetShaderLocation(shadowShader, "viewPos");

  Vector3D lightDir = .vec3Normalized(0.35, -1.0, -0.35);
  Vector4D lightColor = .colorNormalize(.WHITE);

  void updateShaderLightDir() {
    rl.CoreD.SetShaderValue(shadowShader,
      rl.CoreD.GetShaderLocation(shadowShader, "lightDir"),
      lightDir.toArray(),
      .SHADER_UNIFORM_VEC3,
    );
  } updateShaderLightDir();

  rl.CoreD.SetShaderValue(shadowShader,
    rl.CoreD.GetShaderLocation(shadowShader, "lightColor"),
    lightColor.toArray(),
    .SHADER_UNIFORM_VEC4,
  );

  rl.CoreD.SetShaderValue(shadowShader,
    rl.CoreD.GetShaderLocation(shadowShader, "ambient"),
    [0.1, 0.1, 0.1, 1.0],
    .SHADER_UNIFORM_VEC4,
  );
  
  int lightVPLoc = rl.CoreD.GetShaderLocation(shadowShader, "lightVP");
  int shadowMapLoc = rl.CoreD.GetShaderLocation(shadowShader, "shadowMap");
  rl.CoreD.SetShaderValue(shadowShader,
    rl.CoreD.GetShaderLocation(shadowShader, "shadowMapResolution"),
    [SHADOWMAP_RESOLUTION],
    .SHADER_UNIFORM_INT,
  );

  final cube = rl.CoreD.LoadModelFromMesh(rl.CoreD.GenMeshCube(1.0, 1.0, 1.0));
  cube.materials[0].shader = shadowShader;
  
  final robot = rl.CoreD.LoadModel("../resources/models/robot.glb");
  for (int i = 0; i < robot.materialCount; i++)
  {
    robot.materials[i].shader = shadowShader;
  }

  final robotAnimations = rl.CoreD.LoadModelAnimations("../resources/models/robot.glb");

  final shadowMap = LoadShadowmapRenderTexture(rl, SHADOWMAP_RESOLUTION, SHADOWMAP_RESOLUTION);

  final lightCam = CameraD(
    position: lightDir.scale(-15.0),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 20.0,
    projection: .CAMERA_ORTHOGRAPHIC,
  );

  int fc = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    final dt = rl.CoreD.GetFrameTime();

    rl.CoreD.SetShaderValue(shadowShader,
      shadowShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      cam.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    rl.CoreD.UpdateCamera(cam, .CAMERA_ORBITAL);

    fc++;
    fc %= (robotAnimations[0].frameCount);
    rl.CoreD.UpdateModelAnimation(robot, robotAnimations[0], fc);

    final cameraSpeed = 0.05;
    if (rl.CoreD.IsKeyDown(.KEY_LEFT))
    {
      if (lightDir.x < 0.6)
        lightDir.x += cameraSpeed * 60.0 * dt;
    }
    if (rl.CoreD.IsKeyDown(.KEY_RIGHT))
    {
      if (lightDir.x > -0.6)
        lightDir.x -= cameraSpeed * 60.0 * dt;
    }
    if (rl.CoreD.IsKeyDown(.KEY_UP))
    {
      if (lightDir.z < 0.6)
        lightDir.z += cameraSpeed * 60.0 * dt;
    }
    if (rl.CoreD.IsKeyDown(.KEY_DOWN))
    {
      if (lightDir.z > -0.6)
        lightDir.z -= cameraSpeed * 60.0 * dt;
    }

    lightDir = lightDir.normalize();
    lightCam.position = lightDir.scale(-15.0);
    updateShaderLightDir();

    rl.CoreD.BeginDrawing();

      MatrixD lightView;
      MatrixD lightProj;
      
      rl.CoreD.BeginTextureMode(shadowMap);
        rl.CoreD.ClearBackground(.WHITE);
        rl.CoreD.BeginMode3D(lightCam);
          lightView = rl.RlglD.rlGetMatrixModelview();
          lightProj = rl.RlglD.rlGetMatrixProjection();
          DrawScene(rl, cube, robot);
        rl.CoreD.EndMode3D();
      rl.CoreD.EndTextureMode();
      
      final lightViewProj = lightView.mul(lightProj);

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.SetShaderValueMatrix(shadowShader, lightVPLoc, lightViewProj);

      rl.RlglD.rlEnableShader(shadowShader.id);

      int slot = 10;
      rl.RlglD.rlActiveTextureSlot(slot);
      rl.RlglD.rlEnableTexture(shadowMap.depth.id);
      rl.RlglD.rlSetUniform(shadowMapLoc,
        Int32List.fromList([slot]),
        .RL_SHADER_UNIFORM_INT,
        1
      );

      rl.CoreD.BeginMode3D(cam);

        DrawScene(rl, cube, robot);
      
      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Shadows in raylib using the shadowmapping algorithm!",
        screenWidth - 320, screenHeight - 20, 10, .GRAY
      );
      rl.CoreD.DrawText(
        "Use the arrow keys to rotate the light!",
        10, 10, 30, .RED
      );

    rl.CoreD.EndDrawing();

    if (rl.CoreD.IsKeyPressed(.KEY_F))
    {
      rl.CoreD.TakeScreenshot("shaders_shadowmap.png");
    }
  }

  rl.CoreD.UnloadShader(shadowShader);
  rl.CoreD.UnloadModel(cube);
  rl.CoreD.UnloadModel(robot);
  rl.CoreD.UnloadModelAnimations(robotAnimations);
  UnloadShadowmapRenderTexture(rl, shadowMap);
  
  rl.CloseWindowAndDispose();
}

RenderTexture2DD LoadShadowmapRenderTexture(
  Raylib rl,
  int width,
  int height,
) {
  final RenderTexture2DD target = .new();

  target.id = rl.RlglD.rlLoadFramebuffer();
  target.texture.width = width;
  target.texture.height = height;

  if (target.id > 0)
  {
    rl.RlglD.rlEnableFramebuffer(target.id);

    target.depth.id = rl.RlglD.rlLoadTextureDepth(width, height, false);
    target.depth.width = width;
    target.depth.height = height;
    target.depth.format = PixelFormat.fromValue(19);
    target.depth.mipmaps = 1;

    rl.RlglD.rlFramebufferAttach(
      target.id,
      target.depth.id,
      .RL_ATTACHMENT_DEPTH,
      .RL_ATTACHMENT_TEXTURE2D,
      0
    );

    if (rl.RlglD.rlFramebufferComplete(target.id)) {
      rl.CoreD.TraceLog(.LOG_INFO,
        "FBO: [ID ${target.id}] Framebuffer object created successfully"
      );
    }

    rl.RlglD.rlDisableFramebuffer();
  }
  else rl.CoreD.TraceLog(.LOG_WARNING,
    "FBO: Framebuffer object can not be created"
  );

  return target;
}

void UnloadShadowmapRenderTexture(Raylib rl, RenderTexture2DD target)
{
  if (target.id > 0)
  {
    rl.RlglD.rlUnloadFramebuffer(target.id);
  }
}

void DrawScene(Raylib rl, ModelD cube, ModelD robot)
{
  rl.CoreD.DrawModelEx(
    cube,
    .vec3(0.0, 0.0, 0.0),
    .vec3(0.0, 1.0, 0.0),
    0.0,
    .vec3(10.0, 1.0, 10.0),
    .BLUE
  );

  rl.CoreD.DrawModelEx(
    cube,
    .vec3(1.5, 1.0, -1.5),
    .vec3(0.0, 1.0, 0.0),
    0.0,
    .vec3(1.0, 1.0, 1.0),
    .WHITE
  );
  rl.CoreD.DrawModelEx(
    robot,
    .vec3(0.0, 0.5, 0.0),
    .vec3(0.0, 1.0, 0.0),
    0.0,
    .vec3(1.0, 1.0, 1.0),
    .RED
  );
}
