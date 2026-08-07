// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_basic_pbr.c
// Run it: dart run shaders_basic_pbr.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_LIGHTS = 4;

final class LightCEx extends Struct {
  @Int()
  external int type;

  @Bool()
  external bool enabled;

  external Vector3C position;

  external Vector3C target;

  @Array.multi([4])
  external Array<Float> color;

  @Float()
  external double intensity;

  @Int()
  external int typeLoc;

  @Int()
  external int enabledLoc;

  @Int()
  external int positionLoc;

  @Int()
  external int targetLoc;

  @Int()
  external int colorLoc;

  @Int()
  external int intensityLoc;
}

List<Pointer<LightCEx>> lights = [];

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shaders_basic_pbr".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(2, 2, 6);
  camera.ref.target.set(0, 0.5, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/pbr.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/pbr.fs".toC,
  );

  final albedoMapLoc = GetShaderLocation(shader, "albedoMap".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_ALBEDO.value] = albedoMapLoc;
  final mraMapLoc = GetShaderLocation(shader, "mraMap".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_METALNESS.value] = mraMapLoc;
  final normalMapLoc = GetShaderLocation(shader, "normalMap".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_NORMAL.value] = normalMapLoc;
  final emissiveMapLoc = GetShaderLocation(shader, "emissiveMap".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_EMISSION.value] = emissiveMapLoc;
  final albedoColorLoc = GetShaderLocation(shader, "albedoColor".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_COLOR_DIFFUSE.value] = albedoColorLoc;
  final viewPosLoc = GetShaderLocation(shader, "viewPos".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] = viewPosLoc;

  SetShaderValue(shader,
    GetShaderLocation(shader, "numOfLights".toC),
    Int$.Value(MAX_LIGHTS).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value,
  );

  final ambientColor = Color$.$1.set(26, 32, 135, 255);

  SetShaderValue(shader,
    GetShaderLocation(shader, "ambientColor".toC),
    Float32$.Array([
      ambientColor.r/255.0,
      ambientColor.g/255.0,
      ambientColor.b/255.0,
    ]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
  );

  SetShaderValue(shader,
    GetShaderLocation(shader, "ambient".toC),
    Float32$.Value(0.02).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value
  );

  int emissiveIntensityLoc = GetShaderLocation(shader, "emissivePower".toC);
  int emissiveColorLoc = GetShaderLocation(shader, "emissiveColor".toC);
  int textureTilingLoc = GetShaderLocation(shader, "tiling".toC);

  final car = LoadModel("../resources/models/old_car_new.glb".toC);

  car.materials[0].shader = shader;

  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].color = WHITE;
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].value = 0.0;
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ROUGHNESS.value].value = 0.0;
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_OCCLUSION.value].value = 1.0;
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].color.set(255, 162, 0, 255);

  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].texture =
    LoadTexture("../resources/old_car_d.png".toC);
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].texture =
    LoadTexture("../resources/old_car_mra.png".toC);
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_NORMAL.value].texture =
    LoadTexture("../resources/old_car_n.png".toC);
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].texture =
    LoadTexture("../resources/old_car_e.png".toC);
    
  final floor = LoadModel("../resources/models/plane.glb".toC);

  floor.materials[0].shader = shader;
  
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].color = WHITE;
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].value = 0.0;
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ROUGHNESS.value].value = 0.0;
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_OCCLUSION.value].value = 1.0;
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].color = BLACK;

  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].texture =
    LoadTexture("../resources/road_a.png".toC);
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].texture =
    LoadTexture("../resources/road_mra.png".toC);
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_NORMAL.value].texture =
    LoadTexture("../resources/road_n.png".toC);

  final carTextureTiling = Vector2$.At('carTextureTiling').set(0.5, 0.5);
  final floorTextureTiling = Vector2$.At('floorTextureTiling').set(0.5, 0.5);

  final usage = Int$.Value(1, 'usage');
  
  SetShaderValue(shader,
    GetShaderLocation(shader, "useTexAlbedo".toC),
    usage.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value
  );
  SetShaderValue(shader,
    GetShaderLocation(shader, "useTexNormal".toC),
    usage.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value
  );
  SetShaderValue(shader,
    GetShaderLocation(shader, "useTexMRA".toC),
    usage.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value
  );
  SetShaderValue(shader,
    GetShaderLocation(shader, "useTexEmissive".toC),
    usage.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value
  );

  lights.add(CreateLight(
    .LIGHT_POINT, Vector3$.$1.set(-1, 1, -2), Vector3$.$zero, YELLOW, 4.0, shader
  ));

  lights.add(CreateLight(
    .LIGHT_POINT, Vector3$.$1.set(2, 1, 1), Vector3$.$zero, RED, 3.3, shader
  ));

  lights.add(CreateLight(
    .LIGHT_POINT, Vector3$.$1.set(-2, 1, 1), Vector3$.$zero, GREEN, 8.3, shader
  ));

  lights.add(CreateLight(
    .LIGHT_POINT, Vector3$.$1.set(1, 1, -2), Vector3$.$zero, BLUE, 2.0, shader
  ));

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    SetShaderValue(shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      Vector3$.$1Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    if (IsKeyPressed(KeyboardKey.KEY_ONE.value)) lights[2].ref.enabled = !lights[2].ref.enabled;
    if (IsKeyPressed(KeyboardKey.KEY_TWO.value)) lights[1].ref.enabled = !lights[1].ref.enabled;
    if (IsKeyPressed(KeyboardKey.KEY_THREE.value)) lights[3].ref.enabled = !lights[3].ref.enabled;
    if (IsKeyPressed(KeyboardKey.KEY_FOUR.value)) lights[0].ref.enabled = !lights[0].ref.enabled;

    for (int i = 0; i < lights.length; i++) {
      UpdateLight(shader, lights[i].ref);
    }

    BeginDrawing();

      ClearBackground(BLACK);

      BeginMode3D(camera.ref);

        SetShaderValue(shader, textureTilingLoc,
          floorTextureTiling.cast(),
          ShaderUniformDataType.SHADER_UNIFORM_VEC2.value
        );

        final floorEmissiveColor = Vector4$.At('floorEmissiveColor').setD(
          .colorNormalize(floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].color.toD())
        );

        SetShaderValue(shader, emissiveColorLoc,
          floorEmissiveColor.cast(),
          ShaderUniformDataType.SHADER_UNIFORM_VEC4.value,
        );
        
        DrawModel(
          floor,
          Vector3$.$zero,
          5.0,
          WHITE
        );

        SetShaderValue(shader, textureTilingLoc,
          carTextureTiling.cast(),
          ShaderUniformDataType.SHADER_UNIFORM_VEC2.value
        );
        
        final carEmissiveColor = Vector4$.At('carEmissiveColor').setD(
          .colorNormalize(car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].color.toD())
        );
        SetShaderValue(shader, emissiveColorLoc,
          carEmissiveColor.cast(),
          ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
        );
        
        SetShaderValue(shader, emissiveIntensityLoc,
          Float32$.Value(0.01).cast(),
          ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value
        );
        
        DrawModel(car, Vector3$.$zero, 0.25, WHITE);

        for (int i = 0; i < MAX_LIGHTS; i++)
        {
          final lightColor = Color$.$1.set(
            lights[i].ref.color[0]*255,
            lights[i].ref.color[1]*255,
            lights[i].ref.color[2]*255,
            lights[i].ref.color[3]*255
          );
          
          if (lights[i].ref.enabled) DrawSphereEx(
            lights[i].ref.position, 0.2, 8, 8, lightColor
          );
          else DrawSphereWires(
            lights[i].ref.position, 0.2, 8, 8, ColorAlpha(lightColor, 0.3)
          );
        }

      EndMode3D();

      DrawText(
        "Toggle lights: [1][2][3][4]".toC,
        10, 40, 20, LIGHTGRAY
      );

      DrawText(
        "(c) Old Rusty Car model by Renafox (https://skfb.ly/LxRy)".toC,
        screenWidth - 320, screenHeight - 20, 10, LIGHTGRAY
      );
      
      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadModel(car);
  UnloadModel(floor);
  UnloadShader(shader);

  lights.forEach(calloc.free);

  CloseWindowAndDispose();
}

Pointer<LightCEx> CreateLight(
  LightType type,
  Vector3C position,
  Vector3C target,
  ColorC color,
  double intensity,
  ShaderC shader,
) {
  final light = calloc<LightCEx>();

  light.ref.enabled = true;
  light.ref.type = type.value;
  light.ref.position = position;
  light.ref.target = target;
  light.ref.color[0] = color.r/255.0;
  light.ref.color[1] = color.g/255.0;
  light.ref.color[2] = color.b/255.0;
  light.ref.color[3] = color.a/255.0;
  light.ref.intensity = intensity;
  
  light.ref.enabledLoc = GetShaderLocation(
    shader, "lights[${lights.length}].enabled".toC);
  light.ref.typeLoc = GetShaderLocation(
    shader, "lights[${lights.length}].type".toC);
  light.ref.positionLoc = GetShaderLocation(
    shader, "lights[${lights.length}].position".toC);
  light.ref.targetLoc = GetShaderLocation(
    shader, "lights[${lights.length}].target".toC);
  light.ref.colorLoc = GetShaderLocation(
    shader, "lights[${lights.length}].color".toC);
  light.ref.intensityLoc = GetShaderLocation(
    shader, "lights[${lights.length}].intensity".toC);
  
  UpdateLight(shader, light.ref);

  return light;
}

void UpdateLight(ShaderC shader, LightCEx light)
{
  SetShaderValue(shader, light.enabledLoc,
    Bool$.Value(light.enabled).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value
  );

  SetShaderValue(shader, light.typeLoc,
    Int$.Value(light.type).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value
  );
  
  SetShaderValue(shader, light.positionLoc,
    Vector3$.$1Ptr.setC(light.position).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC3.value
  );

  SetShaderValue(shader, light.targetLoc,
    Vector3$.$1Ptr.setC(light.target).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC3.value
  );

  SetShaderValue(shader, light.colorLoc,
    Vector4$.$1Ptr.set(light.color[0], light.color[1], light.color[2], light.color[3]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
  );
  
  SetShaderValue(shader, light.intensityLoc,
    Float32$.Value(light.intensity).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value
  );
}
