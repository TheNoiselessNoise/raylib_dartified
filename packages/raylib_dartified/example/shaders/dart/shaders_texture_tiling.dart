// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_texture_tiling.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Camera3D camera;
late Model model;
late Texture texture;
late Shader shader;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "shaders_texture_tiling");
    SetTargetFPS(60);
    DisableCursor();

    camera = .new(
      position: .vec3(4, 4, 4),
      target: .vec3(0.0, 0.5, 0.0),
      up: .vec3(0, 1, 0),
      fovy: 45,
      projection: .CAMERA_PERSPECTIVE,
    );

    final cube = GenMeshCube(1.0, 1.0, 1.0);
    model = LoadModelFromMesh(cube);
    
    texture = LoadTexture("../resources/cubicmap_atlas.png");
    model.materials[0].maps[MATERIAL_MAP_DIFFUSE.value].texture = texture;

    final tiling = [ 3.0, 3.0 ];
    shader = LoadShader(
      null,
      "../resources/shaders/glsl${Raylib.glslVersion}/tiling.fs",
    );
    SetShaderValue(shader, GetShaderLocation(shader, "tiling"), tiling, .SHADER_UNIFORM_VEC2);
    model.materials[0].shader = shader;
  },
  loop: (_) async {
    UpdateCamera(camera, .CAMERA_FREE);

    if (getModule<RaylibCoreFlat>().IsKeyPressed('Z'.ch)) camera.target.set(0.0, 0.5, 0.0);

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
  },
  close: (_) {
    UnloadModel(model);
    UnloadShader(shader);
    UnloadTexture(texture);  
    CloseWindow();
  },
);