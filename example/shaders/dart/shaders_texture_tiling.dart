// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_tiling.c
// Run it: dart run shaders_texture_tiling.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_texture_tiling");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3DD(
    position: .vec3(4, 4, 4),
    target: .vec3(0.0, 0.5, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final cube = GenMeshCube(1.0, 1.0, 1.0);
  final model = LoadModelFromMesh(cube);
  
  final texture = LoadTexture("../resources/cubicmap_atlas.png");
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final tiling = [ 3.0, 3.0 ];
  final shader = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/tiling.fs",
  );
  SetShaderValue(shader,
    GetShaderLocation(shader, "tiling"),
    tiling,
    .SHADER_UNIFORM_VEC2,
  );
  model.materials[0].shader = shader;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_FREE);

    if (rl.module<RaylibCore>().IsKeyPressed('Z'.ch)) camera.target.set(0.0, 0.5, 0.0);

    BeginDrawing();
    
      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);
      
        BeginShaderMode(shader);
          DrawModel(model, .zero(), 2.0, .WHITE);
        EndShaderMode();

        DrawGrid(10, 1.0);
          
      EndMode3D();

      DrawText(
        "Use mouse to rotate the camera",
        10, 10, 20, .DARKGRAY
      );

    EndDrawing();
  }

  UnloadModel(model);
  UnloadShader(shader);
  UnloadTexture(texture);  
  
  CloseWindowAndDispose();
}