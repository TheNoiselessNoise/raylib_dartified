// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_skybox.c
// Run it: dart run models_skybox.dart
// WARNING: expects resources from the raylib source
// ignore_for_file: dead_code
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_skybox".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(1, 1, 1);
  camera.ref.target.set(4, 1, 4);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cube = rl.Core.GenMeshCube(1.0, 1.0, 1.0);
  final skybox = rl.Core.LoadModelFromMesh(cube);

  bool useHDR = true;

  final skyboxShader = rl.Core.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/skybox.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/skybox.fs".toC,
  );
  skybox.materials[0].shader = skyboxShader;

  final shaderIntValue = rl.Temp.Int$.At('shaderValue');

  int environmentMapLoc = rl.Core.GetShaderLocation(skybox.materials[0].shader, "environmentMap".toC);
  shaderIntValue.value = MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value;
  rl.Core.SetShaderValue(
    skybox.materials[0].shader,
    environmentMapLoc,
    shaderIntValue.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value,
  );

  int doGammaLoc = rl.Core.GetShaderLocation(skybox.materials[0].shader, "doGamma".toC);
  shaderIntValue.value = useHDR ? 1 : 0;
  rl.Core.SetShaderValue(
    skybox.materials[0].shader,
    doGammaLoc,
    shaderIntValue.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value,
  );

  int vflippedLoc = rl.Core.GetShaderLocation(skybox.materials[0].shader, "vflipped".toC);
  shaderIntValue.value = useHDR ? 1 : 0;
  rl.Core.SetShaderValue(
    skybox.materials[0].shader,
    vflippedLoc,
    shaderIntValue.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value,
  );

  final shdrCubemap = rl.Core.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/cubemap.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/cubemap.fs".toC,
  );

  int equirectangularMapLoc = rl.Core.GetShaderLocation(shdrCubemap, "equirectangularMap".toC);
  shaderIntValue.value = 0;
  rl.Core.SetShaderValue(
    shdrCubemap,
    equirectangularMapLoc,
    shaderIntValue.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value,
  );

  String skyboxFileName = '';

  void loadSkybox([String? file]) {
    if (useHDR) {
      skyboxFileName = file ?? "../resources/dresden_square_2k.hdr";
      final panorama = rl.Core.LoadTexture(skyboxFileName.toC);
      final texture = GenTextureCubemap(rl, shdrCubemap, panorama, 1024, .PIXELFORMAT_UNCOMPRESSED_R8G8B8A8);
      skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture = texture;
      rl.Core.UnloadTexture(panorama);
    } else {
      skyboxFileName = file ?? "../resources/skybox.png";
      final img = rl.Core.LoadImage(skyboxFileName.toC);
      final texture = rl.Core.LoadTextureCubemap(img, CubemapLayout.CUBEMAP_LAYOUT_AUTO_DETECT.value);
      skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture = texture;
      rl.Core.UnloadImage(img);
    }
  }

  loadSkybox();

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

    if (rl.Core.IsFileDropped())
    {
      final droppedFiles = rl.Core.LoadDroppedFiles();

      if (droppedFiles.count == 1)
      {
        if (rl.Core.IsFileExtension(droppedFiles.paths[0], ".png;.jpg;.hdr;.bmp;.tga".toC))
        {
          rl.Core.UnloadTexture(skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture);

          loadSkybox(droppedFiles.paths[0].toD);          
        }
      }

      rl.Core.UnloadDroppedFiles(droppedFiles);
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Rlgl.rlDisableBackfaceCulling();
        rl.Rlgl.rlDisableDepthMask();
          rl.Core.DrawModel(skybox, rl.Temp.vec3Zero, 1.0, rl.C.WHITE);
        rl.Rlgl.rlEnableBackfaceCulling();
        rl.Rlgl.rlEnableDepthMask();

        rl.Core.DrawGrid(10, 1.0);

      rl.Core.EndMode3D();

      final fileName = rl.Core.GetFileName(skyboxFileName.toC).toD;
      if (useHDR) {
        rl.Core.DrawText(
          "Panorama image from hdrihaven.com: $fileName".toC,
          10, rl.Core.GetScreenHeight() - 20, 10, rl.C.BLACK
        );
      } else {
        rl.Core.DrawText(
          ": $fileName".toC,
          10, rl.Core.GetScreenHeight() - 20, 10, rl.C.BLACK
        );
      }

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(skybox.materials[0].shader);
  rl.Core.UnloadTexture(skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture);
  rl.Core.UnloadModel(skybox);

  rl.CloseWindowAndDispose();
}

TextureCubemapC GenTextureCubemap(Raylib rl, ShaderC shader, Texture2DC panorama, int size, PixelFormat format)
{
  final cubemap = rl.Temp.Texture$.At('cubemap').ref;

  rl.Rlgl.rlDisableBackfaceCulling();

  // STEP 1: Setup framebuffer
  //------------------------------------------------------------------------------------------
  int rbo = rl.Rlgl.rlLoadTextureDepth(size, size, true);
  cubemap.id = rl.Rlgl.rlLoadTextureCubemap(nullptr, size, format.value, 1);

  int fbo = rl.Rlgl.rlLoadFramebuffer();
  rl.Rlgl.rlFramebufferAttach(
    fbo,
    rbo,
    RlFramebufferAttachType.RL_ATTACHMENT_DEPTH.value,
    RlFramebufferAttachTextureType.RL_ATTACHMENT_RENDERBUFFER.value,
    0
  );
  rl.Rlgl.rlFramebufferAttach(
    fbo,
    cubemap.id,
    RlFramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL0.value,
    RlFramebufferAttachTextureType.RL_ATTACHMENT_CUBEMAP_POSITIVE_X.value,
    0
  );

  if (rl.Rlgl.rlFramebufferComplete(fbo))
    rl.Core.TraceLog(TraceLogLevel.LOG_INFO.value, "FBO: [ID $fbo] Framebuffer object created successfully".toC);

  // STEP 2: Draw to framebuffer
  //------------------------------------------------------------------------------------------
  rl.Rlgl.rlEnableShader(shader.id);

  final matFboProjection = rl.Temp.Matrix$.At('matFboProjection').setD(
    rl.Matrix.MatrixPerspective(
      90.0*rl.DEG2RAD,
      1.0,
      rl.Rlgl.rlGetCullDistanceNear(),
      rl.Rlgl.rlGetCullDistanceFar()
    ));

  rl.Rlgl.rlSetUniformMatrix(shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_PROJECTION.value], matFboProjection.ref);

  final fboViews = rl.Temp.Matrix$.Array(key: 'fboViews', [
    .lookAt(.vec3(0, 0, 0), .vec3( 1.0,  0.0,  0.0), .vec3(0.0, -1.0,  0.0)),
    .lookAt(.vec3(0, 0, 0), .vec3(-1.0,  0.0,  0.0), .vec3(0.0, -1.0,  0.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0,  1.0,  0.0), .vec3(0.0,  0.0,  1.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0, -1.0,  0.0), .vec3(0.0,  0.0, -1.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0,  0.0,  1.0), .vec3(0.0, -1.0,  0.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0,  0.0, -1.0), .vec3(0.0, -1.0,  0.0)),
  ]);

  rl.Rlgl.rlViewport(0, 0, size, size);
  
  rl.Rlgl.rlActiveTextureSlot(0);
  rl.Rlgl.rlEnableTexture(panorama.id);

  for (int i = 0; i < 6; i++)
  {
    rl.Rlgl.rlSetUniformMatrix(shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_VIEW.value], fboViews[i]);
    
    rl.Rlgl.rlFramebufferAttach(
      fbo,
      cubemap.id,
      RlFramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL0.value,
      RlFramebufferAttachTextureType.RL_ATTACHMENT_CUBEMAP_POSITIVE_X.value + i,
      0
    );
    rl.Rlgl.rlEnableFramebuffer(fbo);

    rl.Rlgl.rlClearScreenBuffers();
    rl.Rlgl.rlLoadDrawCube();
  }

  // STEP 3: Unload framebuffer and reset state
  //------------------------------------------------------------------------------------------
  rl.Rlgl.rlDisableShader();
  rl.Rlgl.rlDisableTexture();
  rl.Rlgl.rlDisableFramebuffer();
  rl.Rlgl.rlUnloadFramebuffer(fbo);

  rl.Rlgl.rlViewport(0, 0, rl.Rlgl.rlGetFramebufferWidth(), rl.Rlgl.rlGetFramebufferHeight());
  rl.Rlgl.rlEnableBackfaceCulling();

  cubemap.width = size;
  cubemap.height = size;
  cubemap.mipmaps = 1;
  cubemap.format = format.value;

  return cubemap;
}
