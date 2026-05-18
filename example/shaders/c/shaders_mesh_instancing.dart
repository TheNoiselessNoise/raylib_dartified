// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_mesh_instancing.c
// Run it: dart run shaders_mesh_instancing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_INSTANCES = 10000;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_mesh_instancing".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(-125, 125, -125);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final cube = rl.Core.GenMeshCube(1.0, 1.0, 1.0);
  final transforms = rl.Temp.Matrix$.At('transforms', MAX_INSTANCES);

  for (int i = 0; i < MAX_INSTANCES; i++)
  {
    final MatrixD translation = .translate(
      rl.Core.GetRandomValue(-50, 50),
      rl.Core.GetRandomValue(-50, 50),
      rl.Core.GetRandomValue(-50, 50)
    );

    final Vector3D axis = .vec3Normalized(
      rl.Core.GetRandomValue(0, 360),
      rl.Core.GetRandomValue(0, 360),
      rl.Core.GetRandomValue(0, 360)
    );

    double angle = rl.Core.GetRandomValue(0, 10)*rl.DEG2RAD;
    final MatrixD rotation = .rotateAngle(axis, angle);
    
    transforms[i].setD(rotation.mul(translation));
  }

  final shader = rl.Core.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lighting_instancing.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/lighting.fs".toC,
  );

  shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MVP.value] =
    rl.Core.GetShaderLocation(shader, "mvp".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    rl.Core.GetShaderLocation(shader, "viewPos".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL.value] =
    rl.Core.GetShaderLocationAttrib(shader, "instanceTransform".toC);

  int ambientLoc = rl.Core.GetShaderLocation(shader, "ambient".toC);
  rl.Core.SetShaderValue(shader, ambientLoc,
    rl.Temp.Float32$.Array([0.2, 0.2, 0.2, 1.0]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
  );

  rl.Light.CreateLight(
    LightType.LIGHT_DIRECTIONAL.value,
    rl.Temp.vec31(50, 50, 0), rl.Temp.vec3Zero, rl.Color.WHITE, shader
  );

  final matInstances = rl.Core.LoadMaterialDefault();
  matInstances.shader = shader;
  matInstances.maps[rl.MATERIAL_MAP_DIFFUSE.value].color = rl.Color.RED;

  final matDefault = rl.Core.LoadMaterialDefault();
  matDefault.maps[rl.MATERIAL_MAP_DIFFUSE.value].color = rl.Color.BLUE;
  
  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    rl.Core.SetShaderValue(shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      rl.Temp.vec31Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        final matrixTranslate = rl.Temp.Matrix$.At('matrixTranslate');
        
        matrixTranslate.setD(.translate(-10.0, 0.0, 0.0));
        rl.Core.DrawMesh(cube, matDefault, matrixTranslate.ref);

        rl.Core.DrawMeshInstanced(cube, matInstances, transforms, MAX_INSTANCES);

        matrixTranslate.setD(.translate(10.0, 0.0, 0.0));
        rl.Core.DrawMesh(cube, matDefault, matrixTranslate.ref);

      rl.Core.EndMode3D();

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shader);
  rl.Core.UnloadMaterial(matDefault);
  
  rl.CloseWindowAndDispose();
}