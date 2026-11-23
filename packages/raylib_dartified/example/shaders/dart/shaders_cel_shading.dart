// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_cel_shading.c
// WARNING: expects resources from the raylib source
import 'dart:math' as math;
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Camera3D camera;
late Model model;
late Shader celShader;
late Shader defaultShader;
double numBands = 10.0;
late int numBandsLoc;
late Shader outlineShader;
late int outlineThicknessLoc;
final List<Light> lights = [];
bool celEnabled = true;
bool outlineEnabled = true;

void main() => runExample(
  init: (_) {
    SetConfigFlags([.FLAG_MSAA_4X_HINT]);
    InitWindow(screenWidth, screenHeight, "shaders_cel_shading");
    SetTargetFPS(60);

    camera = .new(
      position: .vec3(9.0, 6.0, 9.0),
      target: .vec3(0.0, 1.0, 0.0),
      up: .vec3(0.0, 1.0, 0.0),
      fovy: 45,
      projection: .CAMERA_PERSPECTIVE,
    );

    model = LoadModel("../resources/models/old_car_new.glb");

    celShader = LoadShader(
      "../resources/shaders/glsl${Raylib.glslVersion}/cel.vs",
      "../resources/shaders/glsl${Raylib.glslVersion}/cel.fs"
    );
    celShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] = GetShaderLocation(celShader, "viewPos");

    defaultShader = model.materials[0].shader;
    model.materials[0].shader = celShader;

    numBandsLoc = GetShaderLocation(celShader, "numBands");
    SetShaderValue(celShader, numBandsLoc, [numBands], .SHADER_UNIFORM_FLOAT);

    outlineShader = LoadShader(
      "../resources/shaders/glsl${Raylib.glslVersion}/outline_hull.vs",
      "../resources/shaders/glsl${Raylib.glslVersion}/outline_hull.fs"
    );
    outlineThicknessLoc = GetShaderLocation(outlineShader, "outlineThickness");

    lights.add(CreateLight(.LIGHT_DIRECTIONAL, .vec3(50.0, 50.0, 50.0), .zero(), .WHITE, celShader));
  },
  loop: (_) async {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    SetShaderValue(celShader, celShader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value], camera.position.toArray(), .SHADER_UNIFORM_VEC3);

    if (IsKeyPressed(.KEY_Z))
    {
      celEnabled = !celEnabled;
      if (celEnabled) model.materials[0].shader = celShader;
      else model.materials[0].shader = defaultShader;
    }

    if (IsKeyPressed(.KEY_C)) outlineEnabled = !outlineEnabled;

    if (IsKeyPressed(.KEY_E) || IsKeyPressedRepeat(.KEY_E))
      numBands = Clamp(numBands + 1.0, 2.0, 20.0);
    if (IsKeyPressed(.KEY_Q) || IsKeyPressedRepeat(.KEY_Q))
      numBands = Clamp(numBands - 1.0, 2.0, 20.0);
    
    SetShaderValue(
      celShader, numBandsLoc,
      [numBands],
      .SHADER_UNIFORM_FLOAT
    );

    double t = GetTime();
    lights[0].position.set(math.sin(-t*0.3)*5.0, 5.0, math.cos(-t*0.3)*5.0);

    for (int i = 0; i < lights.length; i++) {
      UpdateLightValues(celShader, lights[i]);
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        if (outlineEnabled)
        {
          double thickness = 0.005;
          SetShaderValue(
            outlineShader, outlineThicknessLoc,
            [thickness],
            .SHADER_UNIFORM_FLOAT
          );

          rlSetCullFace(.RL_CULL_FACE_FRONT);

          model.materials[0].shader = outlineShader;

          DrawModel(model, .zero(), 0.75, .WHITE);

          if (celEnabled) model.materials[0].shader = celShader;
          else model.materials[0].shader = defaultShader;

          rlSetCullFace(.RL_CULL_FACE_BACK);
        }

        DrawModel(model, .zero(), 0.75, .WHITE);
        DrawSphereEx(lights[0].position, 0.2, 50, 50, .YELLOW);
        DrawGrid(10, 10.0);

      EndMode3D();

      DrawFPS(10, 10);
      DrawText("Cel: ${celEnabled? "ON" : "OFF"} [Z]", 10, 65, 20, celEnabled? .DARKGREEN : .DARKGRAY);
      DrawText("Outline: ${outlineEnabled? "ON" : "OFF"} [C]", 10, 90, 20, outlineEnabled? .DARKGREEN : .DARKGRAY);
      DrawText("Bands: ${numBands.f0} [Q/E]", 10, 115, 20, .DARKGRAY);

    EndDrawing();
  },
  close: (_) {
    UnloadModel(model);
    UnloadShader(celShader);
    UnloadShader(outlineShader);
    CloseWindow();
  },
);