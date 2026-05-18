// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_custom_uniform.c
// Run it: dart run shaders_custom_uniform.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_custom_uniform".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(8, 8, 8);
  camera.ref.target.set(0, 1.5, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = rl.Core.LoadModel("../resources/models/barracks.obj".toC);
  final texture = rl.Core.LoadTexture("../resources/models/barracks_diffuse.png".toC);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final position = rl.Temp.Vector3$.At('position');

  final shader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/swirl.fs".toC,
  );

  int swirlCenterLoc = rl.Core.GetShaderLocation(shader, "center".toC);

  final swirlCenter = [ screenWidth/2, screenHeight/2 ];

  final target = rl.Core.LoadRenderTexture(screenWidth, screenHeight);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    final mousePosition = rl.Core.GetMousePosition();

    swirlCenter[0] = mousePosition.x;
    swirlCenter[1] = screenHeight - mousePosition.y;

    rl.Core.SetShaderValue(shader, swirlCenterLoc,
      rl.Temp.Float32$.Array(swirlCenter).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
    );

    rl.Core.BeginTextureMode(target);
      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);
        rl.Core.DrawModel(model, position.ref, 0.5, rl.Color.WHITE);
        rl.Core.DrawGrid(10, 1.0);
      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "TEXT DRAWN IN RENDER TEXTURE".toC,
        200, 10, 30, rl.Color.RED
      );
    rl.Core.EndTextureMode();

    rl.Core.BeginDrawing();
      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginShaderMode(shader);
        rl.Core.DrawTextureRec(
          target.texture,
          rl.Temp.rect1(
            0, 0,
            target.texture.width, -target.texture.height
          ),
          rl.Temp.vec2Zero,
          rl.Color.WHITE
        );
      rl.Core.EndShaderMode();

      rl.Core.DrawText(
        "(c) Barracks 3D model by Alberto Cano".toC,
        screenWidth - 220, screenHeight - 20, 10, rl.Color.GRAY
      );

      rl.Core.DrawFPS(10, 10);
    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shader);
  rl.Core.UnloadTexture(texture);
  rl.Core.UnloadModel(model);
  rl.Core.UnloadRenderTexture(target);
  
  rl.CloseWindowAndDispose();
}