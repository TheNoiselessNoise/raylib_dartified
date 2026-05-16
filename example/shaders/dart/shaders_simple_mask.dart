// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_simple_mask.c
// Run it: dart run shaders_simple_mask.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_simple_mask");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = Camera3DD(
    position: .vec3(0.0, 1.0, 2.0),
    target: .vec3(0.0, 0.0, 0.0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final torus = rl.CoreD.GenMeshTorus(0.3, 1, 16, 32);
  final model1 = rl.CoreD.LoadModelFromMesh(torus);

  final cube = rl.CoreD.GenMeshCube(0.8, 0.8, 0.8);
  final model2 = rl.CoreD.LoadModelFromMesh(cube);

  final sphere = rl.CoreD.GenMeshSphere(1, 16, 16);
  final model3 = rl.CoreD.LoadModelFromMesh(sphere);

  final shader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/mask.fs",
  );

  final texDiffuse = rl.CoreD.LoadTexture("../resources/plasma.png");
  model1.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texDiffuse;
  model2.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texDiffuse;

  final texMask = rl.CoreD.LoadTexture("../resources/mask.png");
  model1.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].texture = texMask;
  model2.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].texture = texMask;
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_EMISSION.value] =
    rl.CoreD.GetShaderLocation(shader, "mask");

  int shaderFrame = rl.CoreD.GetShaderLocation(shader, "frame");

  model1.materials[0].shader = shader;
  model2.materials[0].shader = shader;

  int framesCounter = 0;
  final Vector3D rotation = .zero();

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_FIRST_PERSON);
        
    framesCounter++;
    rotation.x += 0.01;
    rotation.y += 0.005;
    rotation.z -= 0.0025;

    rl.CoreD.SetShaderValue(shader, shaderFrame,
      [framesCounter],
      .SHADER_UNIFORM_INT,
    );

    model1.transform = .rotateXYZ(rotation);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.DARKBLUE);

      rl.CoreD.BeginMode3D(camera);

        rl.CoreD.DrawModel(model1, .vec3(0.5, 0.0, 0.0), 1, .WHITE);
        rl.CoreD.DrawModelEx(model2,
          .vec3(-0.5, 0.0, 0.0),
          .vec3(1.0, 1.0, 0.0),
          50,
          .vec3(1.0, 1.0, 1.0),
          .WHITE
        );
        rl.CoreD.DrawModel(model3, .vec3(0.0, 0.0, -1.5), 1, .WHITE);
        rl.CoreD.DrawGrid(10, 1.0);

      rl.CoreD.EndMode3D();

      final text = "Frame: $framesCounter";
      rl.CoreD.DrawRectangle(16, 698, rl.CoreD.MeasureText(text, 20) + 8, 42, .BLUE);
      rl.CoreD.DrawText(text, 20, 700, 20, .WHITE);

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadModel(model1);
  rl.CoreD.UnloadModel(model2);
  rl.CoreD.UnloadModel(model3);

  rl.CoreD.UnloadTexture(texDiffuse);
  rl.CoreD.UnloadTexture(texMask);

  rl.CoreD.UnloadShader(shader);
  
  rl.CloseWindowAndDispose();
}