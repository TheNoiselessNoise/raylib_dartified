// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_normalmap_rendering.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Camera3D camera;
late Shader shader;
late Vector3 lightPosition;
late int lightPosLoc;
late Model plane;
late Texture diffuseTex;
late Texture normalTex;
double specularExponent = 8.0;
late int specularExponentLoc;
bool useNormalMap = true;
late int useNormalMapLoc;

void main() => runExample(
  init: (_) {
    SetConfigFlags([.FLAG_MSAA_4X_HINT]);
    InitWindow(screenWidth, screenHeight, "shaders_normalmap_rendering");
    SetTargetFPS(60);

    camera = .new(
      position: .vec3(0.0, 2.0, -4.0),
      target: .vec3(0.0, 0.0, 0.0),
      up: .vec3(0.0, 1.0, 0.0),
      fovy: 45.0,
      projection: .CAMERA_PERSPECTIVE,
    );

    shader = LoadShader(
      "../resources/shaders/glsl${Raylib.glslVersion}/normalmap.vs",
      "../resources/shaders/glsl${Raylib.glslVersion}/normalmap.fs"
    );

    shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_NORMAL.value] = GetShaderLocation(shader, "normalMap");
    shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] = GetShaderLocation(shader, "viewPos");

    // NOTE: "matModel" location name is automatically assigned on shader loading,
    // no need to get the location again if using that uniform name
    // shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL.value] = GetShaderLocation(shader, "matModel");

    lightPosition = .vec3(0.0, 1.0, 0.0);
    lightPosLoc = GetShaderLocation(shader, "lightPos");

    plane = LoadModel("../resources/models/plane.glb");

    plane.materials[0].shader = shader;

    diffuseTex = LoadTexture("../resources/tiles_diffuse.png");
    plane.materials[0].maps[MATERIAL_MAP_DIFFUSE.value].texture = diffuseTex;
    GenTextureMipmaps(diffuseTex);

    normalTex = LoadTexture("../resources/tiles_normal.png");
    plane.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_NORMAL.value].texture = normalTex;
    GenTextureMipmaps(normalTex);

    SetTextureFilter(diffuseTex, .TEXTURE_FILTER_TRILINEAR);
    SetTextureFilter(normalTex, .TEXTURE_FILTER_TRILINEAR);

    specularExponentLoc = GetShaderLocation(shader, "specularExponent");
    useNormalMapLoc = GetShaderLocation(shader, "useNormalMap");
  },
  loop: (_) async {
    Vector3 direction = .zero();

    if (IsKeyDown(.KEY_W))
      direction = direction.add(.vec3(0.0, 0.0, 1.0));
    if (IsKeyDown(.KEY_S))
      direction = direction.add(.vec3(0.0, 0.0, -1.0));
    if (IsKeyDown(.KEY_D))
      direction = direction.add(.vec3(-1.0, 0.0, 0.0));
    if (IsKeyDown(.KEY_A))
      direction = direction.add(.vec3(1.0, 0.0, 0.0));

    direction = direction.normalize();
    lightPosition = lightPosition.add(direction.scale(GetFrameTime() * 3.0));

    if (IsKeyDown(.KEY_UP))
      specularExponent = Clamp(specularExponent + 40.0 * GetFrameTime(), 2.0, 128.0);
    if (IsKeyDown(.KEY_DOWN))
      specularExponent = Clamp(specularExponent - 40.0 * GetFrameTime(), 2.0, 128.0);

    if (IsKeyPressed(.KEY_N))
      useNormalMap = !useNormalMap;

    plane.transform = .rotateY(GetTime() * 0.5);

    SetShaderValue(shader, lightPosLoc, lightPosition.toArray(), .SHADER_UNIFORM_VEC3);
    SetShaderValue(shader, shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value], camera.position.toArray(), .SHADER_UNIFORM_VEC3);
    SetShaderValue(shader, specularExponentLoc, [specularExponent], .SHADER_UNIFORM_FLOAT);
    SetShaderValue(shader, useNormalMapLoc, [useNormalMap.toInt()], .SHADER_UNIFORM_INT);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        BeginShaderMode(shader);

          DrawModel(plane, .zero(), 2.0, .WHITE);

        EndShaderMode();

        DrawSphereWires(lightPosition, 0.2, 8, 8, .ORANGE);

      EndMode3D();

      final Color textColor = useNormalMap ? .DARKGREEN : .RED;
      final toggleStr = useNormalMap ? "On" : "Off";
      DrawText("Use key [N] to toggle normal map: $toggleStr", 10, 10, 10, textColor);

      int yOffset = 24;
      DrawText("Use keys [W][A][S][D] to move the light", 10, 10 + yOffset * 1, 10, .BLACK);
      DrawText("Use keys [Up][Down] to change specular exponent", 10, 10 + yOffset * 2, 10, .BLACK);
      DrawText("Specular Exponent: ${specularExponent.f2}", 10, 10 + yOffset * 3, 10, .BLUE);

      DrawFPS(screenWidth - 90, 10);

    EndDrawing();
  },
  close: (_) {
    UnloadTexture(diffuseTex);
    UnloadTexture(normalTex);
    UnloadShader(shader);
    UnloadModel(plane);
    CloseWindow();
  },
);