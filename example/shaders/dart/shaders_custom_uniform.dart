// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_custom_uniform.c
// Run it: dart run shaders_custom_uniform.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_custom_uniform");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = CameraD(
    position: .vec3(8, 8, 8),
    target: .vec3(0, 1.5, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = rl.CoreD.LoadModel("../resources/models/barracks.obj");
  final texture = rl.CoreD.LoadTexture("../resources/models/barracks_diffuse.png");
  model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;

  final shader = rl.CoreD.LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/swirl.fs",
  );

  int swirlCenterLoc = rl.CoreD.GetShaderLocation(shader, "center");

  final swirlCenter = <double>[
    screenWidth/2, screenHeight/2,
  ];

  final target = rl.CoreD.LoadRenderTexture(screenWidth, screenHeight);

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    final mousePosition = rl.CoreD.GetMousePosition();

    swirlCenter[0] = mousePosition.x;
    swirlCenter[1] = screenHeight - mousePosition.y;

    rl.CoreD.SetShaderValue(
      shader,
      swirlCenterLoc,
      swirlCenter,
      .SHADER_UNIFORM_VEC2,
    );

    rl.CoreD.BeginTextureMode(target);
      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);
        rl.CoreD.DrawModel(model, .zero(), 0.5, .WHITE);
        rl.CoreD.DrawGrid(10, 1.0);
      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "TEXT DRAWN IN RENDER TEXTURE",
        200, 10, 30, .RED
      );
    rl.CoreD.EndTextureMode();

    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginShaderMode(shader);
        rl.CoreD.DrawTextureRec(
          target.texture,
          .rect(
            0, 0,
            target.texture.width, -target.texture.height
          ),
          .zero(),
          .WHITE
        );
      rl.CoreD.EndShaderMode();

      rl.CoreD.DrawText(
        "(c) Barracks 3D model by Alberto Cano",
        screenWidth - 220, screenHeight - 20, 10, .GRAY
      );

      rl.CoreD.DrawFPS(10, 10);
    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);
  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadModel(model);
  rl.CoreD.UnloadRenderTexture(target);
  
  rl.CloseWindowAndDispose();
}