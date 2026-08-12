// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_shadowmap_rendering.c
// Run it: dart run shaders_shadowmap_rendering.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int SHADOWMAP_RESOLUTION = 1024;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shaders_shadowmap_rendering".toC);
  SetTargetFPS(60);

  final cam = Camera3D$.val.$newPtr;
  cam.ref.position.set(10, 10, 10);
  cam.ref.target.set(0, 0, 0);
  cam.ref.up.set(0, 1, 0);
  cam.ref.fovy = 45;
  cam.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final shadowShader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/shadowmap.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/shadowmap.fs".toC,
  );

  shadowShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    GetShaderLocation(shadowShader, "viewPos".toC);

  Vector3D lightDir = .vec3Normalized(0.35, -1.0, -0.35);
  Vector4D lightColor = .colorNormalize(.WHITE);

  void updateShaderLightDir() {
    SetShaderValue(shadowShader,
      GetShaderLocation(shadowShader, "lightDir".toC),
      Vector3$.val.$1Ptr.setD(lightDir).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );
  } updateShaderLightDir();

  SetShaderValue(shadowShader,
    GetShaderLocation(shadowShader, "lightColor".toC),
    Vector4$.val.$1Ptr.setD(lightColor).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value,
  );

  SetShaderValue(shadowShader,
    GetShaderLocation(shadowShader, "ambient".toC),
    Float32$.val.Array([0.1, 0.1, 0.1, 1.0]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value,
  );
  
  int lightVPLoc = GetShaderLocation(shadowShader, "lightVP".toC);
  int shadowMapLoc = GetShaderLocation(shadowShader, "shadowMap".toC);
  SetShaderValue(shadowShader,
    GetShaderLocation(shadowShader, "shadowMapResolution".toC),
    Int$.val.Value(SHADOWMAP_RESOLUTION).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value,
  );

  final cube = LoadModelFromMesh(GenMeshCube(1.0, 1.0, 1.0));
  cube.materials[0].shader = shadowShader;
  
  final robot = LoadModel("../resources/models/robot.glb".toC);
  for (int i = 0; i < robot.materialCount; i++)
  {
    robot.materials[i].shader = shadowShader;
  }

  final animCount = Int$.val.At('animCount');
  final robotAnimations = LoadModelAnimations(
    "../resources/models/robot.glb".toC,
    animCount
  );

  final shadowMap = LoadShadowmapRenderTexture(SHADOWMAP_RESOLUTION, SHADOWMAP_RESOLUTION);

  final lightCam = Camera3D$.val.At('lightCam');
  lightCam.ref.position.setD(lightDir.scale(-15.0));
  lightCam.ref.target.set(0, 0, 0);
  lightCam.ref.up.set(0.0, 1.0, 0.0);
  lightCam.ref.fovy = 20.0;
  lightCam.ref.projection = CameraProjection.CAMERA_ORTHOGRAPHIC.value;

  int fc = 0;

  while (!WindowShouldClose())
  {
    final dt = GetFrameTime();

    SetShaderValue(shadowShader,
      shadowShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      Vector3$.val.$1Ptr.setC(cam.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    UpdateCamera(cam, CameraMode.CAMERA_ORBITAL.value);

    fc++;
    fc %= (robotAnimations[0].keyframeCount);
    UpdateModelAnimation(robot, robotAnimations[0], fc.toDouble());

    final cameraSpeed = 0.05;
    if (IsKeyDown(KeyboardKey.KEY_LEFT.value))
    {
      if (lightDir.x < 0.6)
        lightDir.x += cameraSpeed * 60.0 * dt;
    }
    if (IsKeyDown(KeyboardKey.KEY_RIGHT.value))
    {
      if (lightDir.x > -0.6)
        lightDir.x -= cameraSpeed * 60.0 * dt;
    }
    if (IsKeyDown(KeyboardKey.KEY_UP.value))
    {
      if (lightDir.z < 0.6)
        lightDir.z += cameraSpeed * 60.0 * dt;
    }
    if (IsKeyDown(KeyboardKey.KEY_DOWN.value))
    {
      if (lightDir.z > -0.6)
        lightDir.z -= cameraSpeed * 60.0 * dt;
    }

    lightDir = lightDir.normalize();
    lightCam.ref.position.setD(lightDir.scale(-15.0));
    updateShaderLightDir();

    MatrixC lightView;
    MatrixC lightProj;
    
    BeginTextureMode(shadowMap);
      ClearBackground(WHITE);
      BeginMode3D(lightCam.ref);
        lightView = rlGetMatrixModelview();
        lightProj = rlGetMatrixProjection();
        DrawScene(cube, robot);
      EndMode3D();
    EndTextureMode();
    
    final lightViewProj = Matrix$.val.At('lightViewProj');
    lightViewProj.setD(lightView.toD().mul(lightProj.toD()));

    BeginDrawing();

      ClearBackground(RAYWHITE);

      SetShaderValueMatrix(shadowShader, lightVPLoc, lightViewProj.ref);
      rlEnableShader(shadowShader.id);

      int textureActiveSlot = 10;
      rlActiveTextureSlot(textureActiveSlot);
      rlEnableTexture(shadowMap.depth.id);
      rlSetUniform(shadowMapLoc,
        Int$.val.Value(textureActiveSlot).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_INT.value,
        1
      );

      BeginMode3D(cam.ref);
        DrawScene(cube, robot);
      EndMode3D();

      DrawText(
        "Use the arrow keys to rotate the light!".toC,
        10, 10, 30, RED
      );
      DrawText(
        "Shadows in raylib using the shadowmapping algorithm!".toC,
        screenWidth - 320, screenHeight - 20, 10, GRAY
      );

    EndDrawing();

    if (IsKeyPressed(KeyboardKey.KEY_F.value))
    {
      TakeScreenshot("shaders_shadowmap_rendering.png".toC);
    }
  }

  UnloadShader(shadowShader);
  UnloadModel(cube);
  UnloadModel(robot);
  UnloadModelAnimations(robotAnimations, animCount.value);
  UnloadShadowmapRenderTexture(shadowMap);
  
  CloseWindowAndDispose();
}

RenderTextureC LoadShadowmapRenderTexture(
  int width,
  int height,
) {
  final target = RenderTexture$.val.At('${width}_$height');

  target.ref.id = rlLoadFramebuffer();
  target.ref.texture.width = width;
  target.ref.texture.height = height;

  if (target.ref.id > 0)
  {
    rlEnableFramebuffer(target.ref.id);

    target.ref.depth.id = rlLoadTextureDepth(width, height, false);
    target.ref.depth.width = width;
    target.ref.depth.height = height;
    target.ref.depth.format = 19;
    target.ref.depth.mipmaps = 1;

    rlFramebufferAttach(
      target.ref.id,
      target.ref.depth.id,
      RlFramebufferAttachType.RL_ATTACHMENT_DEPTH.value,
      RlFramebufferAttachTextureType.RL_ATTACHMENT_TEXTURE2D.value,
      0
    );

    if (rlFramebufferComplete(target.ref.id)) {
      TraceLog(
        TraceLogLevel.LOG_INFO.value,
        "FBO: [ID ${target.ref.id}] Framebuffer object created successfully".toC,
      );
    }

    rlDisableFramebuffer();
  }
  else TraceLog(
    TraceLogLevel.LOG_WARNING.value,
    "FBO: Framebuffer object can not be created".toC,
  );

  return target.ref;
}

void UnloadShadowmapRenderTexture(RenderTextureC target)
{
  if (target.id > 0)
  {
    rlUnloadFramebuffer(target.id);
  }
}

void DrawScene(ModelC cube, ModelC robot)
{
  DrawModelEx(
    cube,
    Vector3$.val.$1.set(0.0, 0.0, 0.0),
    Vector3$.val.$2.set(0.0, 1.0, 0.0),
    0.0,
    Vector3$.val.$3.set(10.0, 1.0, 10.0),
    BLUE
  );

  DrawModelEx(
    cube,
    Vector3$.val.$1.set(1.5, 1.0, -1.5),
    Vector3$.val.$2.set(0.0, 1.0, 0.0),
    0.0,
    Vector3$.val.$3.set(1.0, 1.0, 1.0),
    WHITE
  );
  DrawModelEx(
    robot,
    Vector3$.val.$1.set(0.0, 0.5, 0.0),
    Vector3$.val.$2.set(0.0, 1.0, 0.0),
    0.0,
    Vector3$.val.$3.set(1.0, 1.0, 1.0),
    RED
  );
}
