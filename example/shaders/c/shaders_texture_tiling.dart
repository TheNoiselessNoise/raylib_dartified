// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_tiling.c
// Run it: dart run shaders_texture_tiling.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_texture_tiling".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(4, 4, 4);
  camera.ref.target.set(0.0, 0.5, 0.0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cube = rl.Core.GenMeshCube(1.0, 1.0, 1.0);
  final model = rl.Core.LoadModelFromMesh(cube);
  
  final texture = rl.Core.LoadTexture("../resources/cubicmap_atlas.png".toC);
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final tiling = [ 3.0, 3.0 ];
  final shader = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/tiling.fs".toC,
  );
  rl.Core.SetShaderValue(shader,
    rl.Core.GetShaderLocation(shader, "tiling".toC),
    rl.Temp.Float$.Array(tiling).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC2.value,
  );
  model.materials[0].shader = shader;

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_FREE.value);

    if (rl.Core.IsKeyPressed('Z'.ch)) camera.ref.target.set(0.0, 0.5, 0.0);

    rl.Core.BeginDrawing();
    
      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);
      
        rl.Core.BeginShaderMode(shader);
          rl.Core.DrawModel(model, rl.Temp.vec3Zero, 2.0, rl.Color.WHITE);
        rl.Core.EndShaderMode();

        rl.Core.DrawGrid(10, 1.0);
          
      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Use mouse to rotate the camera".toC,
        10, 10, 20, rl.Color.DARKGRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadModel(model);
  rl.Core.UnloadShader(shader);
  rl.Core.UnloadTexture(texture);  
  
  rl.CloseWindowAndDispose();
}