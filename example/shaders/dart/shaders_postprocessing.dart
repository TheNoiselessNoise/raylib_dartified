// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_postprocessing.c
// Run it: dart run shaders_postprocessing.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

enum PostproShader {
  GRAYSCALE,
  POSTERIZATION,
  DREAM_VISION,
  PIXELIZER,
  CROSS_HATCHING,
  CROSS_STITCHING,
  PREDATOR_VIEW,
  SCANLINES,
  FISHEYE,
  SOBEL,
  BLOOM,
  BLUR,
  //FXAA
  ;

  PostproShader get next => .fromIndex(index + 1);
  PostproShader get prev => .fromIndex(index - 1);
  static PostproShader fromIndex(int index) => values[index % values.length];
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shaders_postprocessing");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(2.0, 3.0, 2.0),
    target: .vec3(0.0, 1.0, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = LoadModel("../resources/models/church.obj");
  final texture = LoadTexture("../resources/models/church_diffuse.png");
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final shaders = <PostproShader, ShaderD>{
    .GRAYSCALE: LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/grayscale.fs"),
    .POSTERIZATION: LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/posterization.fs"),
    .DREAM_VISION: LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/dream_vision.fs"),
    .PIXELIZER: LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/pixelizer.fs"),
    .CROSS_HATCHING: LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/cross_hatching.fs"),
    .CROSS_STITCHING: LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/cross_stitching.fs"),
    .PREDATOR_VIEW: LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/predator.fs"),
    .SCANLINES: LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/scanlines.fs"),
    .FISHEYE: LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/fisheye.fs"),
    .SOBEL: LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/sobel.fs"),
    .BLOOM: LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/bloom.fs"),
    .BLUR: LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/blur.fs"),
  };

  PostproShader currentShader = .GRAYSCALE;

  final target = LoadRenderTexture(screenWidth, screenHeight);

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    if (IsKeyPressed(.KEY_RIGHT)) currentShader = currentShader.next;
    else if (IsKeyPressed(.KEY_LEFT)) currentShader = currentShader.prev;

    if (currentShader.index >= shaders.length) currentShader = .values[0];
    else if (currentShader.index < 0) currentShader = .values[shaders.length - 1];

    BeginTextureMode(target);
      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);
        DrawModel(model, .zero(), 0.1, .WHITE);
        DrawGrid(10, 1.0);
      EndMode3D();
    EndTextureMode();
    
    BeginDrawing();
      ClearBackground(.RAYWHITE);

      BeginShaderMode(shaders[currentShader]!);
        DrawTextureRec(
          target.texture,
          .rect(0, 0, target.texture.width, -target.texture.height),
          .vec2(0, 0),
          .WHITE
        );
      EndShaderMode();

      DrawRectangle(0, 9, 580, 30, Fade(.LIGHTGRAY, 0.7));

      DrawText(
        "(c) Church 3D model by Alberto Cano",
        screenWidth - 200, screenHeight - 20, 10, .GRAY
      );
      DrawText(
        "CURRENT POSTPRO SHADER:",
        10, 15, 20, .BLACK
      );
      DrawText(
        currentShader.name,
        330, 15, 20, .RED
      );
      DrawText(
        "< >",
        540, 10, 30, .DARKBLUE
      );
      
      DrawFPS(700, 15);
    EndDrawing();
  }

  shaders.values.forEach(UnloadShader);

  UnloadTexture(texture);
  UnloadModel(model);
  UnloadRenderTexture(target);

  CloseWindowAndDispose();
}