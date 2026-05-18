// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_postprocessing.c
// Run it: dart run shaders_postprocessing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
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
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_postprocessing".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(2.0, 3.0, 2.0);
  camera.ref.target.set(0.0, 1.0, 0.0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = rl.Core.LoadModel("../resources/models/church.obj".toC);
  final texture = rl.Core.LoadTexture("../resources/models/church_diffuse.png".toC);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final shaders = <PostproShader, ShaderC>{
    .GRAYSCALE: rl.Core.LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/grayscale.fs".toC),
    .POSTERIZATION: rl.Core.LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/posterization.fs".toC),
    .DREAM_VISION: rl.Core.LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/dream_vision.fs".toC),
    .PIXELIZER: rl.Core.LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/pixelizer.fs".toC),
    .CROSS_HATCHING: rl.Core.LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/cross_hatching.fs".toC),
    .CROSS_STITCHING: rl.Core.LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/cross_stitching.fs".toC),
    .PREDATOR_VIEW: rl.Core.LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/predator.fs".toC),
    .SCANLINES: rl.Core.LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/scanlines.fs".toC),
    .FISHEYE: rl.Core.LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/fisheye.fs".toC),
    .SOBEL: rl.Core.LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/sobel.fs".toC),
    .BLOOM: rl.Core.LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/bloom.fs".toC),
    .BLUR: rl.Core.LoadShader(nullptr, "../resources/shaders/glsl$GLSL_VERSION/blur.fs".toC),
  };

  PostproShader currentShader = .GRAYSCALE;

  final target = rl.Core.LoadRenderTexture(screenWidth, screenHeight);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) currentShader = currentShader.next;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_LEFT.value)) currentShader = currentShader.prev;

    if (currentShader.index >= shaders.length) currentShader = .values[0];
    else if (currentShader.index < 0) currentShader = .values[shaders.length - 1];

    rl.Core.BeginTextureMode(target);
      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);
        rl.Core.DrawModel(model, rl.Temp.vec3Zero, 0.1, rl.Color.WHITE);
        rl.Core.DrawGrid(10, 1.0);
      rl.Core.EndMode3D();
    rl.Core.EndTextureMode();
    
    rl.Core.BeginDrawing();
      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginShaderMode(shaders[currentShader]!);
        rl.Core.DrawTextureRec(
          target.texture,
          rl.Temp.rect1(0, 0, target.texture.width, -target.texture.height),
          rl.Temp.vec21(0, 0),
          rl.Color.WHITE
        );
      rl.Core.EndShaderMode();

      rl.Core.DrawRectangle(0, 9, 580, 30, rl.Core.Fade(rl.Color.LIGHTGRAY, 0.7));

      rl.Core.DrawText(
        "(c) Church 3D model by Alberto Cano".toC,
        screenWidth - 200, screenHeight - 20, 10, rl.Color.GRAY
      );
      rl.Core.DrawText(
        "CURRENT POSTPRO SHADER:".toC,
        10, 15, 20, rl.Color.BLACK
      );
      rl.Core.DrawText(
        currentShader.name.toC,
        330, 15, 20, rl.Color.RED
      );
      rl.Core.DrawText(
        "< >".toC,
        540, 10, 30, rl.Color.DARKBLUE
      );
      
      rl.Core.DrawFPS(700, 15);
    rl.Core.EndDrawing();
  }

  shaders.values.forEach(rl.Core.UnloadShader);

  rl.Core.UnloadTexture(texture);
  rl.Core.UnloadModel(model);
  rl.Core.UnloadRenderTexture(target);

  rl.CloseWindowAndDispose();
}