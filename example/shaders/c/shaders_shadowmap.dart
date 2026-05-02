// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_shadowmap.c
// Run it: dart run shaders_shadowmap.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int SHADOWMAP_RESOLUTION = 1024;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_shadowmap".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final cam = rl.Temp.Camera3D$.At('camera');
  cam.ref.position.set(10, 10, 10);
  cam.ref.target.set(0, 0, 0);
  cam.ref.up.set(0, 1, 0);
  cam.ref.fovy = 45;
  cam.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final shadowShader = rl.Core.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/shadowmap.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/shadowmap.fs".toC,
  );

  shadowShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    rl.Core.GetShaderLocation(shadowShader, "viewPos".toC);

  Vector3D lightDir = .vec3Normalized(0.35, -1.0, -0.35);
  Vector4D lightColor = .colorNormalize(.WHITE);

  void updateShaderLightDir() {
    rl.Core.SetShaderValue(shadowShader,
      rl.Core.GetShaderLocation(shadowShader, "lightDir".toC),
      rl.Temp.vec31Ptr.setD(lightDir).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );
  } updateShaderLightDir();

  rl.Core.SetShaderValue(shadowShader,
    rl.Core.GetShaderLocation(shadowShader, "lightColor".toC),
    rl.Temp.vec41Ptr.setD(lightColor).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value,
  );

  rl.Core.SetShaderValue(shadowShader,
    rl.Core.GetShaderLocation(shadowShader, "ambient".toC),
    rl.Temp.Float$.Array([0.1, 0.1, 0.1, 1.0]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value,
  );
  
  int lightVPLoc = rl.Core.GetShaderLocation(shadowShader, "lightVP".toC);
  int shadowMapLoc = rl.Core.GetShaderLocation(shadowShader, "shadowMap".toC);
  rl.Core.SetShaderValue(shadowShader,
    rl.Core.GetShaderLocation(shadowShader, "shadowMapResolution".toC),
    rl.Temp.Int$.Value(SHADOWMAP_RESOLUTION).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value,
  );

  final cube = rl.Core.LoadModelFromMesh(rl.Core.GenMeshCube(1.0, 1.0, 1.0));
  cube.materials[0].shader = shadowShader;
  
  final robot = rl.Core.LoadModel("../resources/models/robot.glb".toC);
  for (int i = 0; i < robot.materialCount; i++)
  {
    robot.materials[i].shader = shadowShader;
  }

  final animCount = rl.Temp.Int$.At('animCount');
  final robotAnimations = rl.Core.LoadModelAnimations(
    "../resources/models/robot.glb".toC,
    animCount
  );

  final shadowMap = LoadShadowmapRenderTexture(rl, SHADOWMAP_RESOLUTION, SHADOWMAP_RESOLUTION);

  final lightCam = rl.Temp.Camera3D$.At('lightCam');
  lightCam.ref.position.setD(lightDir.scale(-15.0));
  lightCam.ref.target.set(0, 0, 0);
  lightCam.ref.up.set(0.0, 1.0, 0.0);
  lightCam.ref.fovy = 20.0;
  lightCam.ref.projection = CameraProjection.CAMERA_ORTHOGRAPHIC.value;

  int fc = 0;

  while (!rl.Core.WindowShouldClose())
  {
    final dt = rl.Core.GetFrameTime();

    rl.Core.SetShaderValue(shadowShader,
      shadowShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      rl.Temp.vec31Ptr.setC(cam.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    rl.Core.UpdateCamera(cam, CameraMode.CAMERA_ORBITAL.value);

    fc++;
    fc %= (robotAnimations[0].frameCount);
    rl.Core.UpdateModelAnimation(robot, robotAnimations[0], fc);

    final cameraSpeed = 0.05;
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT.value))
    {
      if (lightDir.x < 0.6)
        lightDir.x += cameraSpeed * 60.0 * dt;
    }
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_RIGHT.value))
    {
      if (lightDir.x > -0.6)
        lightDir.x -= cameraSpeed * 60.0 * dt;
    }
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_UP.value))
    {
      if (lightDir.z < 0.6)
        lightDir.z += cameraSpeed * 60.0 * dt;
    }
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_DOWN.value))
    {
      if (lightDir.z > -0.6)
        lightDir.z -= cameraSpeed * 60.0 * dt;
    }

    lightDir = lightDir.normalize();
    lightCam.ref.position.setD(lightDir.scale(-15.0));
    updateShaderLightDir();

    rl.Core.BeginDrawing();

      MatrixC lightView;
      MatrixC lightProj;
      
      rl.Core.BeginTextureMode(shadowMap);
        rl.Core.ClearBackground(rl.C.WHITE);
        rl.Core.BeginMode3D(lightCam.ref);
          lightView = rl.Rlgl.rlGetMatrixModelview();
          lightProj = rl.Rlgl.rlGetMatrixProjection();
          DrawScene(rl, cube, robot);
        rl.Core.EndMode3D();
      rl.Core.EndTextureMode();
      
      final lightViewProj = lightView.mul(lightProj);

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.SetShaderValueMatrix(shadowShader, lightVPLoc, lightViewProj);

      rl.Rlgl.rlEnableShader(shadowShader.id);

      int slot = 10;
      rl.Rlgl.rlActiveTextureSlot(slot);
      rl.Rlgl.rlEnableTexture(shadowMap.depth.id);
      rl.Rlgl.rlSetUniform(shadowMapLoc,
        rl.Temp.Int$.Value(slot).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_INT.value,
        1
      );

      rl.Core.BeginMode3D(cam.ref);

        DrawScene(rl, cube, robot);
      
      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Shadows in raylib using the shadowmapping algorithm!".toC,
        screenWidth - 320, screenHeight - 20, 10, rl.C.GRAY
      );
      rl.Core.DrawText(
        "Use the arrow keys to rotate the light!".toC,
        10, 10, 30, rl.C.RED
      );

    rl.Core.EndDrawing();

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_F.value))
    {
      rl.Core.TakeScreenshot("shaders_shadowmap.png".toC);
    }
  }

  rl.Core.UnloadShader(shadowShader);
  rl.Core.UnloadModel(cube);
  rl.Core.UnloadModel(robot);
  rl.Core.UnloadModelAnimations(robotAnimations, animCount.value);
  UnloadShadowmapRenderTexture(rl, shadowMap);
  
  rl.CloseWindowAndDispose();
}

RenderTexture2DC LoadShadowmapRenderTexture(
  Raylib rl,
  int width,
  int height,
) {
  final target = rl.Temp.RenderTexture$.At('${width}_$height');

  target.ref.id = rl.Rlgl.rlLoadFramebuffer();
  target.ref.texture.width = width;
  target.ref.texture.height = height;

  if (target.ref.id > 0)
  {
    rl.Rlgl.rlEnableFramebuffer(target.ref.id);

    target.ref.depth.id = rl.Rlgl.rlLoadTextureDepth(width, height, false);
    target.ref.depth.width = width;
    target.ref.depth.height = height;
    target.ref.depth.format = 19;
    target.ref.depth.mipmaps = 1;

    rl.Rlgl.rlFramebufferAttach(
      target.ref.id,
      target.ref.depth.id,
      RlFramebufferAttachType.RL_ATTACHMENT_DEPTH.value,
      RlFramebufferAttachTextureType.RL_ATTACHMENT_TEXTURE2D.value,
      0
    );

    if (rl.Rlgl.rlFramebufferComplete(target.ref.id)) {
      rl.Core.TraceLog(
        TraceLogLevel.LOG_INFO.value,
        "FBO: [ID ${target.ref.id}] Framebuffer object created successfully".toC,
      );
    }

    rl.Rlgl.rlDisableFramebuffer();
  }
  else rl.Core.TraceLog(
    TraceLogLevel.LOG_WARNING.value,
    "FBO: Framebuffer object can not be created".toC,
  );

  return target.ref;
}

void UnloadShadowmapRenderTexture(Raylib rl, RenderTexture2DC target)
{
  if (target.id > 0)
  {
    rl.Rlgl.rlUnloadFramebuffer(target.id);
  }
}

void DrawScene(Raylib rl, ModelC cube, ModelC robot)
{
  rl.Core.DrawModelEx(
    cube,
    rl.Temp.vec31(0.0, 0.0, 0.0),
    rl.Temp.vec32(0.0, 1.0, 0.0),
    0.0,
    rl.Temp.vec33(10.0, 1.0, 10.0),
    rl.C.BLUE
  );

  rl.Core.DrawModelEx(
    cube,
    rl.Temp.vec31(1.5, 1.0, -1.5),
    rl.Temp.vec32(0.0, 1.0, 0.0),
    0.0,
    rl.Temp.vec33(1.0, 1.0, 1.0),
    rl.C.WHITE
  );
  rl.Core.DrawModelEx(
    robot,
    rl.Temp.vec31(0.0, 0.5, 0.0),
    rl.Temp.vec32(0.0, 1.0, 0.0),
    0.0,
    rl.Temp.vec33(1.0, 1.0, 1.0),
    rl.C.RED
  );
}
