// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_tiling.c
// Run it: dart run shaders_texture_tiling.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_texture_tiling");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = Camera3DD(
    position: .vec3(4, 4, 4),
    target: .vec3(0.0, 0.5, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final cube = rl.CoreD.GenMeshCube(1.0, 1.0, 1.0);
  final model = rl.CoreD.LoadModelFromMesh(cube);
  
  final texture = rl.CoreD.LoadTexture("../resources/cubicmap_atlas.png");
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final tiling = [ 3.0, 3.0 ];
  final shader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/tiling.fs",
  );
  rl.CoreD.SetShaderValue(shader,
    rl.CoreD.GetShaderLocation(shader, "tiling"),
    tiling,
    .SHADER_UNIFORM_VEC2,
  );
  model.materials[0].shader = shader;

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_FREE);

    if (rl.Core.IsKeyPressed('Z'.ch)) camera.target.set(0.0, 0.5, 0.0);

    rl.CoreD.BeginDrawing();
    
      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);
      
        rl.CoreD.BeginShaderMode(shader);
          rl.CoreD.DrawModel(model, .zero(), 2.0, .WHITE);
        rl.CoreD.EndShaderMode();

        rl.CoreD.DrawGrid(10, 1.0);
          
      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Use mouse to rotate the camera",
        10, 10, 20, .DARKGRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadModel(model);
  rl.CoreD.UnloadShader(shader);
  rl.CoreD.UnloadTexture(texture);  
  
  rl.CloseWindowAndDispose();
}