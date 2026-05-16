// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_mesh_instancing.c
// Run it: dart run shaders_mesh_instancing.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_INSTANCES = 10000;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_mesh_instancing");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(-125, 125, -125),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final cube = rl.CoreD.GenMeshCube(1.0, 1.0, 1.0);
  final transforms = List.generate(MAX_INSTANCES, (i) {
    final MatrixD translation = .translate(
      rl.CoreD.GetRandomValue(-50, 50),
      rl.CoreD.GetRandomValue(-50, 50),
      rl.CoreD.GetRandomValue(-50, 50)
    );

    final Vector3D axis = .vec3Normalized(
      rl.CoreD.GetRandomValue(0, 360),
      rl.CoreD.GetRandomValue(0, 360),
      rl.CoreD.GetRandomValue(0, 360)
    );

    double angle = rl.CoreD.GetRandomValue(0, 10)*rl.DEG2RAD;
    final MatrixD rotation = .rotateAngle(axis, angle);
    
    return rotation.mul(translation);
  });

  final shader = rl.CoreD.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lighting_instancing.vs",
    "../resources/shaders/glsl$GLSL_VERSION/lighting.fs",
  );

  shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MVP.value] =
    rl.CoreD.GetShaderLocation(shader, "mvp");
  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    rl.CoreD.GetShaderLocation(shader, "viewPos");
  shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL.value] =
    rl.CoreD.GetShaderLocationAttrib(shader, "instanceTransform");

  int ambientLoc = rl.CoreD.GetShaderLocation(shader, "ambient");
  rl.CoreD.SetShaderValue(shader, ambientLoc, [0.2, 0.2, 0.2, 1.0], .SHADER_UNIFORM_VEC4);

  rl.LightD.CreateLight(
    .LIGHT_DIRECTIONAL, .vec3(50, 50, 0), .zero(), .WHITE, shader
  );

  final matInstances = rl.CoreD.LoadMaterialDefault();
  matInstances.shader = shader;
  matInstances.maps[rl.MATERIAL_MAP_DIFFUSE.value].color = .RED;

  final matDefault = rl.CoreD.LoadMaterialDefault();
  matDefault.maps[rl.MATERIAL_MAP_DIFFUSE.value].color = .BLUE;
  
  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    rl.CoreD.SetShaderValue(
      shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawMesh(cube, matDefault, .translate(-10.0, 0.0, 0.0));

        rl.CoreD.DrawMeshInstanced(cube, matInstances, transforms);

        rl.CoreD.DrawMesh(cube, matDefault, .translate(10.0, 0.0, 0.0));

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);
  rl.CoreD.UnloadMaterial(matDefault);
  
  rl.CloseWindowAndDispose();
}