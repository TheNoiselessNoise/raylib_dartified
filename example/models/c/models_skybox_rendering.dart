// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_skybox_rendering.c
// Run it: dart run models_skybox_rendering.dart
// WARNING: expects resources from the raylib source
// ignore_for_file: dead_code
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_skybox_rendering".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(1, 1, 1);
  camera.ref.target.set(4, 1, 4);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cube = GenMeshCube(1.0, 1.0, 1.0);
  final skybox = LoadModelFromMesh(cube);

  bool useHDR = false;

  final skyboxShader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/skybox.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/skybox.fs".toC,
  );
  skybox.materials[0].shader = skyboxShader;

  final shaderIntValue = Int$.At('shaderValue');

  int environmentMapLoc = GetShaderLocation(skybox.materials[0].shader, "environmentMap".toC);
  shaderIntValue.value = MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value;
  SetShaderValue(
    skybox.materials[0].shader,
    environmentMapLoc,
    shaderIntValue.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value,
  );

  int doGammaLoc = GetShaderLocation(skybox.materials[0].shader, "doGamma".toC);
  shaderIntValue.value = useHDR ? 1 : 0;
  SetShaderValue(
    skybox.materials[0].shader,
    doGammaLoc,
    shaderIntValue.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value,
  );

  int vflippedLoc = GetShaderLocation(skybox.materials[0].shader, "vflipped".toC);
  shaderIntValue.value = useHDR ? 1 : 0;
  SetShaderValue(
    skybox.materials[0].shader,
    vflippedLoc,
    shaderIntValue.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value,
  );

  final shdrCubemap = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/cubemap.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/cubemap.fs".toC,
  );

  int equirectangularMapLoc = GetShaderLocation(shdrCubemap, "equirectangularMap".toC);
  shaderIntValue.value = 0;
  SetShaderValue(
    shdrCubemap,
    equirectangularMapLoc,
    shaderIntValue.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value,
  );

  String skyboxFileName = '';

  void loadSkybox([String? file]) {
    if (useHDR) {
      skyboxFileName = file ?? "../resources/dresden_square_2k.hdr";
      final panorama = LoadTexture(skyboxFileName.toC);
      final texture = GenTextureCubemap(shdrCubemap, panorama, 1024, .PIXELFORMAT_UNCOMPRESSED_R8G8B8A8);
      skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture = texture;
      UnloadTexture(panorama);
    } else {
      skyboxFileName = file ?? "../resources/skybox.png";
      final img = LoadImage(skyboxFileName.toC);
      final texture = LoadTextureCubemap(img, CubemapLayout.CUBEMAP_LAYOUT_AUTO_DETECT.value);
      skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture = texture;
      UnloadImage(img);
    }
  }

  loadSkybox();

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_FIRST_PERSON.value);

    if (IsFileDropped())
    {
      final droppedFiles = LoadDroppedFiles();

      if (droppedFiles.count == 1)
      {
        if (IsFileExtension(droppedFiles.paths[0], ".png;.jpg;.hdr;.bmp;.tga".toC))
        {
          UnloadTexture(skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture);

          loadSkybox(droppedFiles.paths[0].toD);          
        }
      }

      UnloadDroppedFiles(droppedFiles);
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        rlDisableBackfaceCulling();
        rlDisableDepthMask();
          DrawModel(skybox, Vector3$.$zero, 1.0, WHITE);
        rlEnableBackfaceCulling();
        rlEnableDepthMask();

        DrawGrid(10, 1.0);

      EndMode3D();

      final fileName = GetFileName(skyboxFileName.toC).toD;
      if (useHDR) {
        DrawText(
          "Panorama image from hdrihaven.com: $fileName".toC,
          10, GetScreenHeight() - 20, 10, BLACK
        );
      } else {
        DrawText(
          ": $fileName".toC,
          10, GetScreenHeight() - 20, 10, BLACK
        );
      }

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadShader(skybox.materials[0].shader);
  UnloadTexture(skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture);
  UnloadModel(skybox);

  CloseWindowAndDispose();
}

TextureC GenTextureCubemap(ShaderC shader, TextureC panorama, int size, PixelFormat format)
{
  final cubemap = Texture$.At('cubemap').ref;

  rlDisableBackfaceCulling();

  // STEP 1: Setup framebuffer
  //------------------------------------------------------------------------------------------
  int rbo = rlLoadTextureDepth(size, size, true);
  cubemap.id = rlLoadTextureCubemap(nullptr, size, format.value, 1);

  int fbo = rlLoadFramebuffer();
  rlFramebufferAttach(
    fbo,
    rbo,
    RlFramebufferAttachType.RL_ATTACHMENT_DEPTH.value,
    RlFramebufferAttachTextureType.RL_ATTACHMENT_RENDERBUFFER.value,
    0
  );
  rlFramebufferAttach(
    fbo,
    cubemap.id,
    RlFramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL0.value,
    RlFramebufferAttachTextureType.RL_ATTACHMENT_CUBEMAP_POSITIVE_X.value,
    0
  );

  if (rlFramebufferComplete(fbo))
    TraceLog(TraceLogLevel.LOG_INFO.value, "FBO: [ID $fbo] Framebuffer object created successfully".toC);

  // STEP 2: Draw to framebuffer
  //------------------------------------------------------------------------------------------
  rlEnableShader(shader.id);

  final matFboProjection = Matrix$.At('matFboProjection').setD(
    rl.Matrix.MatrixPerspective(
      90.0*rl.DEG2RAD,
      1.0,
      rlGetCullDistanceNear(),
      rlGetCullDistanceFar()
    ));

  rlSetUniformMatrix(shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_PROJECTION.value], matFboProjection.ref);

  final fboViews = Matrix$.Array(key: 'fboViews', [
    .lookAt(.vec3(0, 0, 0), .vec3( 1.0,  0.0,  0.0), .vec3(0.0, -1.0,  0.0)),
    .lookAt(.vec3(0, 0, 0), .vec3(-1.0,  0.0,  0.0), .vec3(0.0, -1.0,  0.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0,  1.0,  0.0), .vec3(0.0,  0.0,  1.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0, -1.0,  0.0), .vec3(0.0,  0.0, -1.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0,  0.0,  1.0), .vec3(0.0, -1.0,  0.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0,  0.0, -1.0), .vec3(0.0, -1.0,  0.0)),
  ]);

  rlViewport(0, 0, size, size);
  
  rlActiveTextureSlot(0);
  rlEnableTexture(panorama.id);

  for (int i = 0; i < 6; i++)
  {
    rlSetUniformMatrix(shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_VIEW.value], fboViews[i]);
    
    rlFramebufferAttach(
      fbo,
      cubemap.id,
      RlFramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL0.value,
      RlFramebufferAttachTextureType.RL_ATTACHMENT_CUBEMAP_POSITIVE_X.value + i,
      0
    );
    rlEnableFramebuffer(fbo);

    rlClearScreenBuffers();
    rlLoadDrawCube();
  }

  // STEP 3: Unload framebuffer and reset state
  //------------------------------------------------------------------------------------------
  rlDisableShader();
  rlDisableTexture();
  rlDisableFramebuffer();
  rlUnloadFramebuffer(fbo);

  rlViewport(0, 0, rlGetFramebufferWidth(), rlGetFramebufferHeight());
  rlEnableBackfaceCulling();

  cubemap.width = size;
  cubemap.height = size;
  cubemap.mipmaps = 1;
  cubemap.format = format.value;

  return cubemap;
}
