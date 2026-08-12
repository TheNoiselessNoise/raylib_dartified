// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_custom_uniform.c
// Run it: dart run shaders_custom_uniform.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shaders_custom_uniform".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(8, 8, 8);
  camera.ref.target.set(0, 1.5, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = LoadModel("../resources/models/barracks.obj".toC);
  final texture = LoadTexture("../resources/models/barracks_diffuse.png".toC);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final position = Vector3$.val.At('position');

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/swirl.fs".toC,
  );

  int swirlCenterLoc = GetShaderLocation(shader, "center".toC);

  final swirlCenter = [ screenWidth/2, screenHeight/2 ];

  final target = LoadRenderTexture(screenWidth, screenHeight);

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    final mousePosition = GetMousePosition();

    swirlCenter[0] = mousePosition.x;
    swirlCenter[1] = screenHeight - mousePosition.y;

    SetShaderValue(shader, swirlCenterLoc,
      Float32$.val.Array(swirlCenter).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
    );

    BeginTextureMode(target);
      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);
        DrawModel(model, position.ref, 0.5, WHITE);
        DrawGrid(10, 1.0);
      EndMode3D();

      DrawText(
        "TEXT DRAWN IN RENDER TEXTURE".toC,
        200, 10, 30, RED
      );
    EndTextureMode();

    BeginDrawing();
      ClearBackground(RAYWHITE);

      BeginShaderMode(shader);
        DrawTextureRec(
          target.texture,
          Rectangle$.val.$1.set(
            0, 0,
            target.texture.width, -target.texture.height
          ),
          Vector2$.val.$zero,
          WHITE
        );
      EndShaderMode();

      DrawText(
        "(c) Barracks 3D model by Alberto Cano".toC,
        screenWidth - 220, screenHeight - 20, 10, GRAY
      );

      DrawFPS(10, 10);
    EndDrawing();
  }

  UnloadShader(shader);
  UnloadTexture(texture);
  UnloadModel(model);
  UnloadRenderTexture(target);
  
  CloseWindowAndDispose();
}