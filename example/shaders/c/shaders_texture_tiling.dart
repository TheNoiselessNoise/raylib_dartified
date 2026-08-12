// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_tiling.c
// Run it: dart run shaders_texture_tiling.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_texture_tiling".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(4, 4, 4);
  camera.ref.target.set(0.0, 0.5, 0.0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cube = GenMeshCube(1.0, 1.0, 1.0);
  final model = LoadModelFromMesh(cube);
  
  final texture = LoadTexture("../resources/cubicmap_atlas.png".toC);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final tiling = [ 3.0, 3.0 ];
  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/tiling.fs".toC,
  );
  SetShaderValue(shader,
    GetShaderLocation(shader, "tiling".toC),
    Float32$.val.Array(tiling).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
  );
  model.materials[0].shader = shader;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_FREE.value);

    if (IsKeyPressed('Z'.ch)) camera.ref.target.set(0.0, 0.5, 0.0);

    BeginDrawing();
    
      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);
      
        BeginShaderMode(shader);
          DrawModel(model, Vector3$.val.$zero, 2.0, WHITE);
        EndShaderMode();

        DrawGrid(10, 1.0);
          
      EndMode3D();

      DrawText(
        "Use mouse to rotate the camera".toC,
        10, 10, 20, DARKGRAY
      );

    EndDrawing();
  }

  UnloadModel(model);
  UnloadShader(shader);
  UnloadTexture(texture);  
  
  CloseWindowAndDispose();
}