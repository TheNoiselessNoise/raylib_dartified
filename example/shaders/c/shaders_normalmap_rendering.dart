// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_normalmap_rendering.c
// Run it: dart run shaders_normalmap_rendering.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shaders_normalmap_rendering".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.AtUnique();
  camera.ref.position.set(0.0, 2.0, -4.0);
  camera.ref.target.set(0.0, 0.0, 0.0);
  camera.ref.up.set(0.0, 1.0, 0.0);
  camera.ref.fovy = 45.0;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/normalmap.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/normalmap.fs".toC
  );

  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_NORMAL.value] = GetShaderLocation(shader, "normalMap".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] = GetShaderLocation(shader, "viewPos".toC);

  // NOTE: "matModel" location name is automatically assigned on shader loading,
  // no need to get the location again if using that uniform name
  // shader.locs[ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL.value] = GetShaderLocation(shader, "matModel".toC);

  final lightPosition = Vector3$.val.AtUnique().set(0.0, 1.0, 0.0);
  int lightPosLoc = GetShaderLocation(shader, "lightPos".toC);

  final plane = LoadModel("../resources/models/plane.glb".toC);

  plane.materials[0].shader = shader;

  final diffuseTex = Texture$.val.AtUnique();
  diffuseTex.ref = LoadTexture("../resources/tiles_diffuse.png".toC);
  plane.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = diffuseTex.ref;
  GenTextureMipmaps(diffuseTex);

  final normalTex = Texture$.val.AtUnique();
  normalTex.ref = LoadTexture("../resources/tiles_normal.png".toC);
  plane.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_NORMAL.value].texture = normalTex.ref;
  GenTextureMipmaps(normalTex);

  SetTextureFilter(diffuseTex.ref, TextureFilter.TEXTURE_FILTER_TRILINEAR.value);
  SetTextureFilter(normalTex.ref, TextureFilter.TEXTURE_FILTER_TRILINEAR.value);

  final specularExponent = Float32$.val.ValueUnique(8.0);
  int specularExponentLoc = GetShaderLocation(shader, "specularExponent".toC);

  final useNormalMap = Bool$.ValueUnique(true);
  int useNormalMapLoc = GetShaderLocation(shader, "useNormalMap".toC);

  final direction = Vector3$.val.AtUnique();

  while (!WindowShouldClose())
  {
    direction.set(0, 0, 0);

    if (IsKeyDown(KeyboardKey.KEY_W.value))
      direction.setD(direction.toD().add(.vec3(0.0, 0.0, 1.0)));
    if (IsKeyDown(KeyboardKey.KEY_S.value))
      direction.setD(direction.toD().add(.vec3(0.0, 0.0, -1.0)));
    if (IsKeyDown(KeyboardKey.KEY_D.value))
      direction.setD(direction.toD().add(.vec3(-1.0, 0.0, 0.0)));
    if (IsKeyDown(KeyboardKey.KEY_A.value))
      direction.setD(direction.toD().add(.vec3(1.0, 0.0, 0.0)));

    direction.setD(direction.toD().normalize());
    lightPosition.setD(lightPosition.toD().add(direction.toD().scale(GetFrameTime() * 3.0)));

    if (IsKeyDown(KeyboardKey.KEY_UP.value))
      specularExponent.value = Clamp(specularExponent.value + 40.0 * GetFrameTime(), 2.0, 128.0);
    if (IsKeyDown(KeyboardKey.KEY_DOWN.value))
      specularExponent.value = Clamp(specularExponent.value - 40.0 * GetFrameTime(), 2.0, 128.0);

    if (IsKeyPressed(KeyboardKey.KEY_N.value))
      useNormalMap.value = !useNormalMap.value;

    plane.transform.setD(.rotateY(GetTime() * 0.5));

    SetShaderValue(
      shader, lightPosLoc,
      Float32$.val.Array([
        lightPosition.ref.x,
        lightPosition.ref.y,
        lightPosition.ref.z,
      ]).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value
    );

    SetShaderValue(
      shader, shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      Float32$.val.Array([
        camera.ref.position.x,
        camera.ref.position.y,
        camera.ref.position.z,
      ]).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value
    );

    SetShaderValue(
      shader, specularExponentLoc, specularExponent.cast(),
      ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value
    );

    SetShaderValue(
      shader, useNormalMapLoc, useNormalMap.cast(),
      ShaderUniformDataType.SHADER_UNIFORM_INT.value
    );

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        BeginShaderMode(shader);

          DrawModel(plane, Vector3$.val.$zero, 2.0, WHITE);

        EndShaderMode();

        DrawSphereWires(lightPosition.ref, 0.2, 8, 8, ORANGE);

      EndMode3D();

      final textColor = useNormalMap.value ? DARKGREEN : RED;
      final toggleStr = useNormalMap.value ? "On" : "Off";
      DrawText("Use key [N] to toggle normal map: $toggleStr".toC, 10, 10, 10, textColor);

      int yOffset = 24;
      DrawText("Use keys [W][A][S][D] to move the light".toC, 10, 10 + yOffset * 1, 10, BLACK);
      DrawText("Use keys [Up][Down] to change specular exponent".toC, 10, 10 + yOffset * 2, 10, BLACK);
      DrawText("Specular Exponent: ${specularExponent.value.f2}".toC, 10, 10 + yOffset * 3, 10, BLUE);

      DrawFPS(screenWidth - 90, 10);

    EndDrawing();
  }

  UnloadTexture(diffuseTex.ref);
  UnloadTexture(normalTex.ref);
  UnloadShader(shader);
  UnloadModel(plane);
  
  CloseWindowAndDispose();
}