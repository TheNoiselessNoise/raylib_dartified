// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_normalmap_rendering.c
// Run it: dart run shaders_normalmap_rendering.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shaders_normalmap_rendering");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(0.0, 2.0, -4.0),
    target: .vec3(0.0, 0.0, 0.0),
    up: .vec3(0.0, 1.0, 0.0),
    fovy: 45.0,
    projection: .CAMERA_PERSPECTIVE,
  );

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/normalmap.vs",
    "../resources/shaders/glsl$GLSL_VERSION/normalmap.fs"
  );

  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_NORMAL.value] = GetShaderLocation(shader, "normalMap");
  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] = GetShaderLocation(shader, "viewPos");

  // NOTE: "matModel" location name is automatically assigned on shader loading,
  // no need to get the location again if using that uniform name
  // shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL.value] = GetShaderLocation(shader, "matModel");

  Vector3D lightPosition = .vec3(0.0, 1.0, 0.0);
  int lightPosLoc = GetShaderLocation(shader, "lightPos");

  final plane = LoadModel("../resources/models/plane.glb");

  plane.materials[0].shader = shader;

  final diffuseTex = LoadTexture("../resources/tiles_diffuse.png");
  plane.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = diffuseTex;
  GenTextureMipmaps(diffuseTex);

  final normalTex = LoadTexture("../resources/tiles_normal.png");
  plane.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_NORMAL.value].texture = normalTex;
  GenTextureMipmaps(normalTex);

  SetTextureFilter(diffuseTex, .TEXTURE_FILTER_TRILINEAR);
  SetTextureFilter(normalTex, .TEXTURE_FILTER_TRILINEAR);

  double specularExponent = 8.0;
  int specularExponentLoc = GetShaderLocation(shader, "specularExponent");

  bool useNormalMap = true;
  int useNormalMapLoc = GetShaderLocation(shader, "useNormalMap");

  while (!WindowShouldClose())
  {
    Vector3D direction = .zero();

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

      final ColorD textColor = useNormalMap ? .DARKGREEN : .RED;
      final toggleStr = useNormalMap ? "On" : "Off";
      DrawText("Use key [N] to toggle normal map: $toggleStr", 10, 10, 10, textColor);

      int yOffset = 24;
      DrawText("Use keys [W][A][S][D] to move the light", 10, 10 + yOffset * 1, 10, .BLACK);
      DrawText("Use keys [Up][Down] to change specular exponent", 10, 10 + yOffset * 2, 10, .BLACK);
      DrawText("Specular Exponent: ${specularExponent.f2}", 10, 10 + yOffset * 3, 10, .BLUE);

      DrawFPS(screenWidth - 90, 10);

    EndDrawing();
  }

  UnloadTexture(diffuseTex);
  UnloadTexture(normalTex);
  UnloadShader(shader);
  UnloadModel(plane);
  
  CloseWindowAndDispose();
}