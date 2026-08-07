// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_mesh_instancing.c
// Run it: dart run shaders_mesh_instancing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_INSTANCES = 10000;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shaders_mesh_instancing".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(-125, 125, -125);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cube = GenMeshCube(1.0, 1.0, 1.0);
  final transforms = Matrix$.At('transforms', MAX_INSTANCES);

  for (int i = 0; i < MAX_INSTANCES; i++)
  {
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
    
    transforms[i].setD(rotation.mul(translation));
  }

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lighting_instancing.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/lighting.fs".toC,
  );

  shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MVP.value] =
    GetShaderLocation(shader, "mvp".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    GetShaderLocation(shader, "viewPos".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL.value] =
    GetShaderLocationAttrib(shader, "instanceTransform".toC);

  int ambientLoc = GetShaderLocation(shader, "ambient".toC);
  SetShaderValue(shader, ambientLoc,
    Float32$.Array([0.2, 0.2, 0.2, 1.0]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
  );

  CreateLight(
    LightType.LIGHT_DIRECTIONAL.value,
    Vector3$.$1.set(50, 50, 0), Vector3$.$zero, WHITE, shader
  );

  final matInstances = LoadMaterialDefault();
  matInstances.shader = shader;
  matInstances.maps[rl.MATERIAL_MAP_DIFFUSE.value].color = RED;

  final matDefault = LoadMaterialDefault();
  matDefault.maps[rl.MATERIAL_MAP_DIFFUSE.value].color = BLUE;
  
  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    SetShaderValue(shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      Vector3$.$1Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        final matrixTranslate = Matrix$.At('matrixTranslate');
        
        matrixTranslate.setD(.translate(-10.0, 0.0, 0.0));
        DrawMesh(cube, matDefault, matrixTranslate.ref);

        DrawMeshInstanced(cube, matInstances, transforms, MAX_INSTANCES);

        matrixTranslate.setD(.translate(10.0, 0.0, 0.0));
        DrawMesh(cube, matDefault, matrixTranslate.ref);

      EndMode3D();

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadShader(shader);
  UnloadMaterial(matDefault);
  
  CloseWindowAndDispose();
}