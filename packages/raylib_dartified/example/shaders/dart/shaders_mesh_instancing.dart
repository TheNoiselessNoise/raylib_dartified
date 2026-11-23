// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_mesh_instancing.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_INSTANCES = 10000;

late Camera3D camera;
late Mesh cube;
late List<Matrix> transforms;
late Shader shader;
late Material matInstances;
late Material matDefault;

void main() => runExample(
  init: (_) {
    SetConfigFlags([.FLAG_MSAA_4X_HINT]);
    InitWindow(screenWidth, screenHeight, "shaders_mesh_instancing");
    SetTargetFPS(60);

    camera = .new(
      position: .vec3(-125, 125, -125),
      target: .vec3(0, 0, 0),
      up: .vec3(0, 1, 0),
      fovy: 45,
      projection: .CAMERA_PERSPECTIVE,
    );

    cube = GenMeshCube(1.0, 1.0, 1.0);
    transforms = .generate(MAX_INSTANCES, (i) {
      final Matrix translation = .translate(
        GetRandomValue(-50, 50),
        GetRandomValue(-50, 50),
        GetRandomValue(-50, 50)
      );

      final Vector3 axis = .normalized(
        GetRandomValue(0, 360),
        GetRandomValue(0, 360),
        GetRandomValue(0, 360)
      );

      double angle = GetRandomValue(0, 10)*DEG2RAD;
      final Matrix rotation = .rotateAngle(axis, angle);
      
      return rotation.mul(translation);
    });

    shader = LoadShader(
      "../resources/shaders/glsl${Raylib.glslVersion}/lighting_instancing.vs",
      "../resources/shaders/glsl${Raylib.glslVersion}/lighting.fs",
    );

    shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MVP.value]
      = GetShaderLocation(shader, "mvp");
    shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value]
      = GetShaderLocation(shader, "viewPos");
    shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL.value]
      = GetShaderLocationAttrib(shader, "instanceTransform");

    int ambientLoc = GetShaderLocation(shader, "ambient");
    SetShaderValue(shader, ambientLoc, [0.2, 0.2, 0.2, 1.0], .SHADER_UNIFORM_VEC4);

    CreateLight(.LIGHT_DIRECTIONAL, .vec3(50, 50, 0), .zero(), .WHITE, shader);

    matInstances = LoadMaterialDefault();
    matInstances.shader = shader;
    matInstances.maps[MATERIAL_MAP_DIFFUSE.value].color = .RED;

    matDefault = LoadMaterialDefault();
    matDefault.maps[MATERIAL_MAP_DIFFUSE.value].color = .BLUE;
  },
  loop: (_) async {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    SetShaderValue(shader, shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value], camera.position.toArray(), .SHADER_UNIFORM_VEC3);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawMesh(cube, matDefault, .translate(-10.0, 0.0, 0.0));

        DrawMeshInstanced(cube, matInstances, transforms);

        DrawMesh(cube, matDefault, .translate(10.0, 0.0, 0.0));

      EndMode3D();

      DrawFPS(10, 10);

    EndDrawing();
  },
  close: (_) {
    UnloadShader(shader);
    UnloadMaterial(matDefault);
    CloseWindow();
  },
);