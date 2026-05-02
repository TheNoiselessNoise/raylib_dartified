// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_postprocessing.c
// Run it: dart run shaders_postprocessing.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

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
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_postprocessing");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = CameraD(
    position: .vec3(2.0, 3.0, 2.0),
    target: .vec3(0.0, 1.0, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = rl.CoreD.LoadModel("../resources/models/church.obj");
  final texture = rl.CoreD.LoadTexture("../resources/models/church_diffuse.png");
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final shaders = <PostproShader, ShaderD>{
    .GRAYSCALE: rl.CoreD.LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/grayscale.fs"),
    .POSTERIZATION: rl.CoreD.LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/posterization.fs"),
    .DREAM_VISION: rl.CoreD.LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/dream_vision.fs"),
    .PIXELIZER: rl.CoreD.LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/pixelizer.fs"),
    .CROSS_HATCHING: rl.CoreD.LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/cross_hatching.fs"),
    .CROSS_STITCHING: rl.CoreD.LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/cross_stitching.fs"),
    .PREDATOR_VIEW: rl.CoreD.LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/predator.fs"),
    .SCANLINES: rl.CoreD.LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/scanlines.fs"),
    .FISHEYE: rl.CoreD.LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/fisheye.fs"),
    .SOBEL: rl.CoreD.LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/sobel.fs"),
    .BLOOM: rl.CoreD.LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/bloom.fs"),
    .BLUR: rl.CoreD.LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/blur.fs"),
  };

  PostproShader currentShader = .GRAYSCALE;

  final target = rl.CoreD.LoadRenderTexture(screenWidth, screenHeight);

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    if (rl.CoreD.IsKeyPressed(.KEY_RIGHT)) currentShader = currentShader.next;
    else if (rl.CoreD.IsKeyPressed(.KEY_LEFT)) currentShader = currentShader.prev;

    if (currentShader.index >= shaders.length) currentShader = .values[0];
    else if (currentShader.index < 0) currentShader = .values[shaders.length - 1];

    rl.CoreD.BeginTextureMode(target);
      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);
        rl.CoreD.DrawModel(model, .zero(), 0.1, .WHITE);
        rl.CoreD.DrawGrid(10, 1.0);
      rl.CoreD.EndMode3D();
    rl.CoreD.EndTextureMode();
    
    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginShaderMode(shaders[currentShader]!);
        rl.CoreD.DrawTextureRec(
          target.texture,
          .rect(0, 0, target.texture.width, -target.texture.height),
          .vec2(0, 0),
          .WHITE
        );
      rl.CoreD.EndShaderMode();

      rl.CoreD.DrawRectangle(0, 9, 580, 30, rl.CoreD.Fade(.LIGHTGRAY, 0.7));

      rl.CoreD.DrawText(
        "(c) Church 3D model by Alberto Cano",
        screenWidth - 200, screenHeight - 20, 10, .GRAY
      );
      rl.CoreD.DrawText(
        "CURRENT POSTPRO SHADER:",
        10, 15, 20, .BLACK
      );
      rl.CoreD.DrawText(
        currentShader.name,
        330, 15, 20, .RED
      );
      rl.CoreD.DrawText(
        "< >",
        540, 10, 30, .DARKBLUE
      );
      
      rl.CoreD.DrawFPS(700, 15);
    rl.CoreD.EndDrawing();
  }

  shaders.values.forEach(rl.CoreD.UnloadShader);

  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadModel(model);
  rl.CoreD.UnloadRenderTexture(target);

  rl.CloseWindowAndDispose();
}