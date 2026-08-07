// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_mesh_instancing.c
// Run it: dart run shaders_mesh_instancing.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_INSTANCES = 10000;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shaders_mesh_instancing");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(-125, 125, -125),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final cube = GenMeshCube(1.0, 1.0, 1.0);
  final transforms = List.generate(MAX_INSTANCES, (i) {
    final MatrixD translation = .translate(
      GetRandomValue(-50, 50),
      GetRandomValue(-50, 50),
      GetRandomValue(-50, 50)
    );

    final Vector3D axis = .vec3Normalized(
      GetRandomValue(0, 360),
      GetRandomValue(0, 360),
      GetRandomValue(0, 360)
    );

    double angle = GetRandomValue(0, 10)*rl.DEG2RAD;
    final MatrixD rotation = .rotateAngle(axis, angle);
    
    return rotation.mul(translation);
  });

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lighting_instancing.vs",
    "../resources/shaders/glsl$GLSL_VERSION/lighting.fs",
  );

  shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MVP.value] =
    GetShaderLocation(shader, "mvp");
  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    GetShaderLocation(shader, "viewPos");
  shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL.value] =
    GetShaderLocationAttrib(shader, "instanceTransform");

  int ambientLoc = GetShaderLocation(shader, "ambient");
  SetShaderValue(shader, ambientLoc, [0.2, 0.2, 0.2, 1.0], .SHADER_UNIFORM_VEC4);

  CreateLight(
    .LIGHT_DIRECTIONAL, .vec3(50, 50, 0), .zero(), .WHITE, shader
  );

  final matInstances = LoadMaterialDefault();
  matInstances.shader = shader;
  matInstances.maps[rl.MATERIAL_MAP_DIFFUSE.value].color = .RED;

  final matDefault = LoadMaterialDefault();
  matDefault.maps[rl.MATERIAL_MAP_DIFFUSE.value].color = .BLUE;
  
  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    SetShaderValue(
      shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawMesh(cube, matDefault, .translate(-10.0, 0.0, 0.0));

        DrawMeshInstanced(cube, matInstances, transforms);

        DrawMesh(cube, matDefault, .translate(10.0, 0.0, 0.0));

      EndMode3D();

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadShader(shader);
  UnloadMaterial(matDefault);
  
  CloseWindowAndDispose();
}