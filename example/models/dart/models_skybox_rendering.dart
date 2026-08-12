// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_skybox_rendering.c
// Run it: dart run models_skybox_rendering.dart
// WARNING: expects resources from the raylib source
// ignore_for_file: dead_code
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_skybox_rendering");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3DD(
    position: .vec3(1, 1, 1),
    target: .vec3(4, 1, 4),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final cube = GenMeshCube(1.0, 1.0, 1.0);
  final skybox = LoadModelFromMesh(cube);

  bool useHDR = false;

  final skyboxShader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/skybox.vs",
    "../resources/shaders/glsl$GLSL_VERSION/skybox.fs"
  );
  skybox.materials[0].shader = skyboxShader;

  SetShaderValue(
    skybox.materials[0].shader,
    GetShaderLocation(skybox.materials[0].shader, "environmentMap"),
    [MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value],
    .SHADER_UNIFORM_INT,
  );

  void updateSkyboxHDRShader() {
    SetShaderValue(
      skybox.materials[0].shader,
      GetShaderLocation(skybox.materials[0].shader, "doGamma"),
      [useHDR ? 1 : 0],
      .SHADER_UNIFORM_INT,
    );

    SetShaderValue(
      skybox.materials[0].shader,
      GetShaderLocation(skybox.materials[0].shader, "vflipped"),
      [useHDR ? 1 : 0],
      .SHADER_UNIFORM_INT,
    );
  } updateSkyboxHDRShader();

  final shdrCubemap = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/cubemap.vs",
    "../resources/shaders/glsl$GLSL_VERSION/cubemap.fs"
  );

  SetShaderValue(
    shdrCubemap,
    GetShaderLocation(shdrCubemap, "equirectangularMap"),
    [0],
    .SHADER_UNIFORM_INT,
  );

  String skyboxFileName = '';

  void loadSkybox([String? file]) {
    if (useHDR) {
      skyboxFileName = file ?? "../resources/dresden_square_2k.hdr";
      final panorama = LoadTexture(skyboxFileName);
      final texture = GenTextureCubemap(shdrCubemap, panorama, 1024, .PIXELFORMAT_UNCOMPRESSED_R8G8B8A8);
      skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture = texture;
      UnloadTexture(panorama);
    } else {
      skyboxFileName = file ?? "../resources/skybox.png";
      final img = LoadImage(skyboxFileName);
      final texture = LoadTextureCubemap(img, .CUBEMAP_LAYOUT_AUTO_DETECT);
      skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture = texture;
      UnloadImage(img);
    }
  }

  loadSkybox();

  while (!WindowShouldClose())
  {
    // NOTE: not part of original example 
    if (IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT)) {
      useHDR = !useHDR;
      loadSkybox();
      updateSkyboxHDRShader();
    }
    // --- 
    
    UpdateCamera(camera, .CAMERA_FIRST_PERSON);

    if (IsFileDropped())
    {
      final droppedFiles = LoadDroppedFiles();

      if (droppedFiles.count == 1)
      {
        if (IsFileExtension(droppedFiles.paths[0], ".png;.jpg;.hdr;.bmp;.tga"))
        {
          UnloadTexture(skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture);

          loadSkybox(droppedFiles.paths[0]);
        }
      }
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        rlDisableBackfaceCulling();
        rlDisableDepthMask();
          DrawModel(skybox, .zero(), 1.0, .WHITE);
        rlEnableBackfaceCulling();
        rlEnableDepthMask();

        DrawGrid(10, 1.0);

      EndMode3D();

      final fileName = GetFileName(skyboxFileName);
      if (useHDR) {
        DrawText(
          "Panorama image from hdrihaven.com: $fileName",
          10, GetScreenHeight() - 20, 10, .BLACK
        );
      } else {
        DrawText(
          ": $fileName",
          10, GetScreenHeight() - 20, 10, .BLACK
        );
      }

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadTexture(skybox.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_CUBEMAP.value].texture);

  UnloadShader(skybox.materials[0].shader);
  UnloadModel(skybox);
  
  CloseWindowAndDispose();
}

TextureD GenTextureCubemap(ShaderD shader, TextureD panorama, int size, PixelFormat format)
{
  final cubemap = TextureD();

  rlDisableBackfaceCulling();

  // STEP 1: Setup framebuffer
  //------------------------------------------------------------------------------------------
  int rbo = rlLoadTextureDepth(size, size, true);

  cubemap.id = rlLoadTextureCubemap(null, size, format, 1);

  int fbo = rlLoadFramebuffer();
  rlFramebufferAttach(
    fbo,
    rbo,
    .RL_ATTACHMENT_DEPTH,
    .RL_ATTACHMENT_RENDERBUFFER,
    0
  );
  rlFramebufferAttach(
    fbo,
    cubemap.id,
    .RL_ATTACHMENT_COLOR_CHANNEL0,
    .RL_ATTACHMENT_CUBEMAP_POSITIVE_X,
    0
  );

  if (rlFramebufferComplete(fbo))
    TraceLog(.LOG_INFO, "FBO: [ID $fbo] Framebuffer object created successfully");

  // STEP 2: Draw to framebuffer
  //------------------------------------------------------------------------------------------
  rlEnableShader(shader.id);

  final matFboProjection = rl.Matrix.MatrixPerspective(
    90.0*rl.DEG2RAD,
    1.0,
    rlGetCullDistanceNear(),
    rlGetCullDistanceFar()
  );

  rlSetUniformMatrix(shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_PROJECTION.value], matFboProjection);

  final fboViews = <MatrixD>[
    .lookAt(.vec3(0, 0, 0), .vec3( 1.0,  0.0,  0.0), .vec3(0.0, -1.0,  0.0)),
    .lookAt(.vec3(0, 0, 0), .vec3(-1.0,  0.0,  0.0), .vec3(0.0, -1.0,  0.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0,  1.0,  0.0), .vec3(0.0,  0.0,  1.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0, -1.0,  0.0), .vec3(0.0,  0.0, -1.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0,  0.0,  1.0), .vec3(0.0, -1.0,  0.0)),
    .lookAt(.vec3(0, 0, 0), .vec3( 0.0,  0.0, -1.0), .vec3(0.0, -1.0,  0.0)),
  ];

  rlViewport(0, 0, size, size);
  
  rlActiveTextureSlot(0);
  rlEnableTexture(panorama.id);

  for (int i = 0; i < 6; i++)
  {
    rlSetUniformMatrix(shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_VIEW.value], fboViews[i]);
    
    rlFramebufferAttach(
      fbo,
      cubemap.id,
      .RL_ATTACHMENT_COLOR_CHANNEL0,
      .fromValue(
        RlFramebufferAttachTextureType.RL_ATTACHMENT_CUBEMAP_POSITIVE_X.value + i,
      ),
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
  //------------------------------------------------------------------------------------------

  cubemap.width = size;
  cubemap.height = size;
  cubemap.mipmaps = 1;
  cubemap.format = format;

  return cubemap;
}
