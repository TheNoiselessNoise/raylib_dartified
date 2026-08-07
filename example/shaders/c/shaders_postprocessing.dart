// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_postprocessing.c
// Run it: dart run shaders_postprocessing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

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

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shaders_postprocessing".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(2.0, 3.0, 2.0);
  camera.ref.target.set(0.0, 1.0, 0.0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = LoadModel("../resources/models/church.obj".toC);
  final texture = LoadTexture("../resources/models/church_diffuse.png".toC);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final shaders = <PostproShader, ShaderC>{
    .GRAYSCALE: LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/grayscale.fs".toC),
    .POSTERIZATION: LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/posterization.fs".toC),
    .DREAM_VISION: LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/dream_vision.fs".toC),
    .PIXELIZER: LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/pixelizer.fs".toC),
    .CROSS_HATCHING: LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/cross_hatching.fs".toC),
    .CROSS_STITCHING: LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/cross_stitching.fs".toC),
    .PREDATOR_VIEW: LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/predator.fs".toC),
    .SCANLINES: LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/scanlines.fs".toC),
    .FISHEYE: LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/fisheye.fs".toC),
    .SOBEL: LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/sobel.fs".toC),
    .BLOOM: LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/bloom.fs".toC),
    .BLUR: LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/blur.fs".toC),
  };

  PostproShader currentShader = .GRAYSCALE;

  final target = LoadRenderTexture(screenWidth, screenHeight);

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) currentShader = currentShader.next;
    else if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) currentShader = currentShader.prev;

    if (currentShader.index >= shaders.length) currentShader = .values[0];
    else if (currentShader.index < 0) currentShader = .values[shaders.length - 1];

    BeginTextureMode(target);
      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);
        DrawModel(model, Vector3$.$zero, 0.1, WHITE);
        DrawGrid(10, 1.0);
      EndMode3D();
    EndTextureMode();
    
    BeginDrawing();
      ClearBackground(RAYWHITE);

      BeginShaderMode(shaders[currentShader]!);
        DrawTextureRec(
          target.texture,
          Rectangle$.$1.set(0, 0, target.texture.width, -target.texture.height),
          Vector2$.$1.set(0, 0),
          WHITE
        );
      EndShaderMode();

      DrawRectangle(0, 9, 580, 30, Fade(LIGHTGRAY, 0.7));

      DrawText(
        "(c) Church 3D model by Alberto Cano".toC,
        screenWidth - 200, screenHeight - 20, 10, GRAY
      );
      DrawText(
        "CURRENT POSTPRO SHADER:".toC,
        10, 15, 20, BLACK
      );
      DrawText(
        currentShader.name.toC,
        330, 15, 20, RED
      );
      DrawText(
        "< >".toC,
        540, 10, 30, DARKBLUE
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