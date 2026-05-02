// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_skybox.c
// Run it: dart run models_skybox.dart
// WARNING: expects resources from the raylib source
// ignore_for_file: dead_code
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_skybox");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = CameraD(
    position: .vec3(1, 1, 1),
    target: .vec3(4, 1, 4),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final cube = rl.CoreD.GenMeshCube(1.0, 1.0, 1.0);
  final skybox = rl.CoreD.LoadModelFromMesh(cube);

  bool useHDR = true;

  final skyboxShader = rl.CoreD.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/skybox.vs",
    "../resources/shaders/glsl$GLSL_VERSION/skybox.fs"
  );
  skybox.materials[0].shader = skyboxShader;

  int environmentMapLoc = rl.CoreD.GetShaderLocation(skybox.materials[0].shader, "environmentMap");
  rl.CoreD.SetShaderValue(
    skybox.materials[0].shader,
    environmentMapLoc,
    [MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value],
    .SHADER_UNIFORM_INT,
  );

  int doGammaLoc = rl.CoreD.GetShaderLocation(skybox.materials[0].shader, "doGamma");
  rl.CoreD.SetShaderValue(
    skybox.materials[0].shader,
    doGammaLoc,
    [useHDR ? 1 : 0],
    .SHADER_UNIFORM_INT,
  );

  int vflippedLoc = rl.CoreD.GetShaderLocation(skybox.materials[0].shader, "vflipped");
  rl.CoreD.SetShaderValue(
    skybox.materials[0].shader,
    vflippedLoc,
    [useHDR ? 1 : 0],
    .SHADER_UNIFORM_INT,
  );

  final shdrCubemap = rl.CoreD.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/cubemap.vs",
    "../resources/shaders/glsl$GLSL_VERSION/cubemap.fs"
  );

  int equirectangularMapLoc = rl.CoreD.GetShaderLocation(shdrCubemap, "equirectangularMap");
  rl.CoreD.SetShaderValue(
    shdrCubemap,
    equirectangularMapLoc,
    [0],
    .SHADER_UNIFORM_INT,
  );

  String skyboxFileName = '';

  void loadSkybox([String? file]) {
    if (useHDR) {
      skyboxFileName = file ?? "../resources/dresden_square_2k.hdr";
      final panorama = rl.CoreD.LoadTexture(skyboxFileName);
      final texture = GenTextureCubemap(rl, shdrCubemap, panorama, 1024, .PIXELFORMAT_UNCOMPRESSED_R8G8B8A8);
      skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture = texture;
      rl.CoreD.UnloadTexture(panorama);
    } else {
      skyboxFileName = file ?? "../resources/skybox.png";
      final img = rl.CoreD.LoadImage(skyboxFileName);
      final texture = rl.CoreD.LoadTextureCubemap(img, .CUBEMAP_LAYOUT_AUTO_DETECT);
      skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture = texture;
      rl.CoreD.UnloadImage(img);
    }
  }

  loadSkybox();

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_FIRST_PERSON);

    if (rl.CoreD.IsFileDropped())
    {
      final droppedFiles = rl.CoreD.LoadDroppedFiles();

      if (droppedFiles.count == 1)
      {
        if (rl.CoreD.IsFileExtension(droppedFiles.paths[0], ".png;.jpg;.hdr;.bmp;.tga"))
        {
          rl.CoreD.UnloadTexture(skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture);

          loadSkybox(droppedFiles.paths[0]);
        }
      }
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.RlglD.rlDisableBackfaceCulling();
        rl.RlglD.rlDisableDepthMask();
          rl.CoreD.DrawModel(skybox, .zero(), 1.0, .WHITE);
        rl.RlglD.rlEnableBackfaceCulling();
        rl.RlglD.rlEnableDepthMask();

        rl.CoreD.DrawGrid(10, 1.0);

      rl.CoreD.EndMode3D();

      final fileName = rl.CoreD.GetFileName(skyboxFileName);
      if (useHDR) {
        rl.CoreD.DrawText(
          "Panorama image from hdrihaven.com: $fileName",
          10, rl.CoreD.GetScreenHeight() - 20, 10, .BLACK
        );
      } else {
        rl.CoreD.DrawText(
          ": $fileName",
          10, rl.CoreD.GetScreenHeight() - 20, 10, .BLACK
        );
      }

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture);

  rl.CoreD.UnloadShader(skybox.materials[0].shader);
  rl.CoreD.UnloadModel(skybox);
  
  rl.CloseWindowAndDispose();
}

TextureCubemapD GenTextureCubemap(Raylib rl, ShaderD shader, Texture2DD panorama, int size, PixelFormat format)
{
  final cubemap = TextureCubemapD();

  rl.RlglD.rlDisableBackfaceCulling();

  // STEP 1: Setup framebuffer
  //------------------------------------------------------------------------------------------
  int rbo = rl.RlglD.rlLoadTextureDepth(size, size, true);

  final rlFormat = RlPixelFormat.fromValue(format.value);
  cubemap.id = rl.RlglD.rlLoadTextureCubemap(null, size, rlFormat, 1);

  int fbo = rl.RlglD.rlLoadFramebuffer();
  rl.RlglD.rlFramebufferAttach(
    fbo,
    rbo,
    .RL_ATTACHMENT_DEPTH,
    .RL_ATTACHMENT_RENDERBUFFER,
    0
  );
  rl.RlglD.rlFramebufferAttach(
    fbo,
    cubemap.id,
    .RL_ATTACHMENT_COLOR_CHANNEL0,
    .RL_ATTACHMENT_CUBEMAP_POSITIVE_X,
    0
  );

  if (rl.RlglD.rlFramebufferComplete(fbo))
    rl.CoreD.TraceLog(.LOG_INFO, "FBO: [ID $fbo] Framebuffer object created successfully");

  // STEP 2: Draw to framebuffer
  //------------------------------------------------------------------------------------------
  rl.RlglD.rlEnableShader(shader.id);

  final matFboProjection = rl.Matrix.MatrixPerspective(
    90.0*rl.DEG2RAD,
    1.0,
    rl.RlglD.rlGetCullDistanceNear(),
    rl.RlglD.rlGetCullDistanceFar()
  );

  rl.RlglD.rlSetUniformMatrix(shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_PROJECTION.value], matFboProjection);

  final fboViews = <MatrixD>[
    .lookAt(.vec3(0, 0, 0), .vec3( 1.0,  0.0,  0.0), .vec3(0.0, -1.0,  0.0)),
    .lookAt(.vec3(0, 0, 0), .vec3(-1.0,  0.0,  0.0), .vec3(0.0, -1.0,  0.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0,  1.0,  0.0), .vec3(0.0,  0.0,  1.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0, -1.0,  0.0), .vec3(0.0,  0.0, -1.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0,  0.0,  1.0), .vec3(0.0, -1.0,  0.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0,  0.0, -1.0), .vec3(0.0, -1.0,  0.0)),
  ];

  rl.RlglD.rlViewport(0, 0, size, size);
  
  rl.RlglD.rlActiveTextureSlot(0);
  rl.RlglD.rlEnableTexture(panorama.id);

  for (int i = 0; i < 6; i++)
  {
    rl.RlglD.rlSetUniformMatrix(shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_VIEW.value], fboViews[i]);
    
    rl.RlglD.rlFramebufferAttach(
      fbo,
      cubemap.id,
      .RL_ATTACHMENT_COLOR_CHANNEL0,
      RlFramebufferAttachTextureType.fromValue(
        RlFramebufferAttachTextureType.RL_ATTACHMENT_CUBEMAP_POSITIVE_X.value + i,
      ),
      0
    );
    rl.RlglD.rlEnableFramebuffer(fbo);

    rl.RlglD.rlClearScreenBuffers();
    rl.RlglD.rlLoadDrawCube();
  }

  // STEP 3: Unload framebuffer and reset state
  //------------------------------------------------------------------------------------------
  rl.RlglD.rlDisableShader();
  rl.RlglD.rlDisableTexture();
  rl.RlglD.rlDisableFramebuffer();
  rl.RlglD.rlUnloadFramebuffer(fbo);

  rl.RlglD.rlViewport(0, 0, rl.RlglD.rlGetFramebufferWidth(), rl.RlglD.rlGetFramebufferHeight());
  rl.RlglD.rlEnableBackfaceCulling();
  //------------------------------------------------------------------------------------------

  cubemap.width = size;
  cubemap.height = size;
  cubemap.mipmaps = 1;
  cubemap.format = format;

  return cubemap;
}
