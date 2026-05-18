// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_basic_pbr.c
// Run it: dart run shaders_basic_pbr.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base.dart';

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
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_basic_pbr".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(2, 2, 6);
  camera.ref.target.set(0, 0.5, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final shader = rl.Core.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/pbr.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/pbr.fs".toC,
  );

  final albedoMapLoc = rl.Core.GetShaderLocation(shader, "albedoMap".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_ALBEDO.value] = albedoMapLoc;
  final mraMapLoc = rl.Core.GetShaderLocation(shader, "mraMap".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_METALNESS.value] = mraMapLoc;
  final normalMapLoc = rl.Core.GetShaderLocation(shader, "normalMap".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_NORMAL.value] = normalMapLoc;
  final emissiveMapLoc = rl.Core.GetShaderLocation(shader, "emissiveMap".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_EMISSION.value] = emissiveMapLoc;
  final albedoColorLoc = rl.Core.GetShaderLocation(shader, "albedoColor".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_COLOR_DIFFUSE.value] = albedoColorLoc;
  final viewPosLoc = rl.Core.GetShaderLocation(shader, "viewPos".toC);
  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] = viewPosLoc;

  rl.Core.SetShaderValue(shader,
    rl.Core.GetShaderLocation(shader, "numOfLights".toC),
    rl.Temp.Int$.Value(MAX_LIGHTS).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value,
  );

  final ambientColor = rl.Temp.color1(26, 32, 135, 255);

  rl.Core.SetShaderValue(shader,
    rl.Core.GetShaderLocation(shader, "ambientColor".toC),
    rl.Temp.Float32$.Array([
      ambientColor.r/255.0,
      ambientColor.g/255.0,
      ambientColor.b/255.0,
    ]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
  );

  rl.Core.SetShaderValue(shader,
    rl.Core.GetShaderLocation(shader, "ambient".toC),
    rl.Temp.Float32$.Value(0.02).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value
  );

  int emissiveIntensityLoc = rl.Core.GetShaderLocation(shader, "emissivePower".toC);
  int emissiveColorLoc = rl.Core.GetShaderLocation(shader, "emissiveColor".toC);
  int textureTilingLoc = rl.Core.GetShaderLocation(shader, "tiling".toC);

  final car = rl.Core.LoadModel("../resources/models/old_car_new.glb".toC);

  car.materials[0].shader = shader;

  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].color = rl.Color.WHITE;
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].value = 0.0;
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ROUGHNESS.value].value = 0.0;
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_OCCLUSION.value].value = 1.0;
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].color.set(255, 162, 0, 255);

  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].texture =
    rl.Core.LoadTexture("../resources/old_car_d.png".toC);
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].texture =
    rl.Core.LoadTexture("../resources/old_car_mra.png".toC);
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_NORMAL.value].texture =
    rl.Core.LoadTexture("../resources/old_car_n.png".toC);
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].texture =
    rl.Core.LoadTexture("../resources/old_car_e.png".toC);
    
  final floor = rl.Core.LoadModel("../resources/models/plane.glb".toC);

  floor.materials[0].shader = shader;
  
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].color = rl.Color.WHITE;
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].value = 0.0;
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ROUGHNESS.value].value = 0.0;
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_OCCLUSION.value].value = 1.0;
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].color = rl.Color.BLACK;

  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].texture =
    rl.Core.LoadTexture("../resources/road_a.png".toC);
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].texture =
    rl.Core.LoadTexture("../resources/road_mra.png".toC);
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_NORMAL.value].texture =
    rl.Core.LoadTexture("../resources/road_n.png".toC);

  final carTextureTiling = rl.Temp.Vector2$.At('carTextureTiling').set(0.5, 0.5);
  final floorTextureTiling = rl.Temp.Vector2$.At('floorTextureTiling').set(0.5, 0.5);

  final usage = rl.Temp.Int$.Value(1, 'usage');
  
  rl.Core.SetShaderValue(shader,
    rl.Core.GetShaderLocation(shader, "useTexAlbedo".toC),
    usage.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value
  );
  rl.Core.SetShaderValue(shader,
    rl.Core.GetShaderLocation(shader, "useTexNormal".toC),
    usage.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value
  );
  rl.Core.SetShaderValue(shader,
    rl.Core.GetShaderLocation(shader, "useTexMRA".toC),
    usage.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value
  );
  rl.Core.SetShaderValue(shader,
    rl.Core.GetShaderLocation(shader, "useTexEmissive".toC),
    usage.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value
  );

  lights.add(CreateLight(rl,
    .LIGHT_POINT, rl.Temp.vec31(-1, 1, -2), rl.Temp.vec3Zero, rl.Color.YELLOW, 4.0, shader
  ));

  lights.add(CreateLight(rl,
    .LIGHT_POINT, rl.Temp.vec31(2, 1, 1), rl.Temp.vec3Zero, rl.Color.RED, 3.3, shader
  ));

  lights.add(CreateLight(rl,
    .LIGHT_POINT, rl.Temp.vec31(-2, 1, 1), rl.Temp.vec3Zero, rl.Color.GREEN, 8.3, shader
  ));

  lights.add(CreateLight(rl,
    .LIGHT_POINT, rl.Temp.vec31(1, 1, -2), rl.Temp.vec3Zero, rl.Color.BLUE, 2.0, shader
  ));

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    rl.Core.SetShaderValue(shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      rl.Temp.vec31Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_ONE.value)) lights[2].ref.enabled = !lights[2].ref.enabled;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_TWO.value)) lights[1].ref.enabled = !lights[1].ref.enabled;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_THREE.value)) lights[3].ref.enabled = !lights[3].ref.enabled;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_FOUR.value)) lights[0].ref.enabled = !lights[0].ref.enabled;

    for (int i = 0; i < lights.length; i++) {
      UpdateLight(rl, shader, lights[i].ref);
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.BLACK);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.SetShaderValue(shader, textureTilingLoc,
          floorTextureTiling.cast(),
          ShaderUniformDataType.SHADER_UNIFORM_VEC2.value
        );

        final floorEmissiveColor = rl.Temp.Vector4$.At('floorEmissiveColor').setD(
          .colorNormalize(floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].color.toD())
        );

        rl.Core.SetShaderValue(shader, emissiveColorLoc,
          floorEmissiveColor.cast(),
          ShaderUniformDataType.SHADER_UNIFORM_VEC4.value,
        );
        
        rl.Core.DrawModel(
          floor,
          rl.Temp.vec3Zero,
          5.0,
          rl.Color.WHITE
        );

        rl.Core.SetShaderValue(shader, textureTilingLoc,
          carTextureTiling.cast(),
          ShaderUniformDataType.SHADER_UNIFORM_VEC2.value
        );
        
        final carEmissiveColor = rl.Temp.Vector4$.At('carEmissiveColor').setD(
          .colorNormalize(car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].color.toD())
        );
        rl.Core.SetShaderValue(shader, emissiveColorLoc,
          carEmissiveColor.cast(),
          ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
        );
        
        rl.Core.SetShaderValue(shader, emissiveIntensityLoc,
          rl.Temp.Float32$.Value(0.01).cast(),
          ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value
        );
        
        rl.Core.DrawModel(car, rl.Temp.vec3Zero, 0.25, rl.Color.WHITE);

        for (int i = 0; i < MAX_LIGHTS; i++)
        {
          final lightColor = rl.Temp.color1(
            lights[i].ref.color[0]*255,
            lights[i].ref.color[1]*255,
            lights[i].ref.color[2]*255,
            lights[i].ref.color[3]*255
          );
          
          if (lights[i].ref.enabled) rl.Core.DrawSphereEx(
            lights[i].ref.position, 0.2, 8, 8, lightColor
          );
          else rl.Core.DrawSphereWires(
            lights[i].ref.position, 0.2, 8, 8, rl.Core.ColorAlpha(lightColor, 0.3)
          );
        }

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Toggle lights: [1][2][3][4]".toC,
        10, 40, 20, rl.Color.LIGHTGRAY
      );

      rl.Core.DrawText(
        "(c) Old Rusty Car model by Renafox (https://skfb.ly/LxRy)".toC,
        screenWidth - 320, screenHeight - 20, 10, rl.Color.LIGHTGRAY
      );
      
      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadModel(car);
  rl.Core.UnloadModel(floor);
  rl.Core.UnloadShader(shader);

  lights.forEach(calloc.free);

  rl.CloseWindowAndDispose();
}

Pointer<LightCEx> CreateLight(
  Raylib rl,
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
  
  light.ref.enabledLoc = rl.Core.GetShaderLocation(
    shader, "lights[${lights.length}].enabled".toC);
  light.ref.typeLoc = rl.Core.GetShaderLocation(
    shader, "lights[${lights.length}].type".toC);
  light.ref.positionLoc = rl.Core.GetShaderLocation(
    shader, "lights[${lights.length}].position".toC);
  light.ref.targetLoc = rl.Core.GetShaderLocation(
    shader, "lights[${lights.length}].target".toC);
  light.ref.colorLoc = rl.Core.GetShaderLocation(
    shader, "lights[${lights.length}].color".toC);
  light.ref.intensityLoc = rl.Core.GetShaderLocation(
    shader, "lights[${lights.length}].intensity".toC);
  
  UpdateLight(rl, shader, light.ref);

  return light;
}

void UpdateLight(Raylib rl, ShaderC shader, LightCEx light)
{
  rl.Core.SetShaderValue(shader, light.enabledLoc,
    rl.Temp.Bool$.Value(light.enabled).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value
  );

  rl.Core.SetShaderValue(shader, light.typeLoc,
    rl.Temp.Int$.Value(light.type).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_INT.value
  );
  
  rl.Core.SetShaderValue(shader, light.positionLoc,
    rl.Temp.vec31Ptr.setC(light.position).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC3.value
  );

  rl.Core.SetShaderValue(shader, light.targetLoc,
    rl.Temp.vec31Ptr.setC(light.target).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC3.value
  );

  rl.Core.SetShaderValue(shader, light.colorLoc,
    rl.Temp.vec41Ptr.set(light.color[0], light.color[1], light.color[2], light.color[3]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
  );
  
  rl.Core.SetShaderValue(shader, light.intensityLoc,
    rl.Temp.Float32$.Value(light.intensity).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value
  );
}
