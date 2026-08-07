// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_basic_pbr.c
// Run it: dart run shaders_basic_pbr.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_LIGHTS = 4;

class LightDEx {
  LightType type;
  bool enabled;
  Vector3D position;
  Vector3D target;
  List<double> color;
  double intensity;
  int typeLoc;
  int enabledLoc;
  int positionLoc;
  int targetLoc;
  int colorLoc;
  int intensityLoc;

  LightDEx({
    this.type = .LIGHT_POINT,
    this.enabled = true,
    Vector3D? position,
    Vector3D? target,
    List<double>? color,
    this.intensity = 0,
    this.typeLoc = -1,
    this.enabledLoc = -1,
    this.positionLoc = -1,
    this.targetLoc = -1,
    this.colorLoc = -1,
    this.intensityLoc = -1,
  }) :
    position = position ?? .zero(),
    target = target ?? .zero(),
    color = color ?? [0, 0, 0, 0];
}

List<LightDEx> lights = [];

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  InitWindow(screenWidth, screenHeight, "shaders_basic_pbr");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(2, 2, 6),
    target: .vec3(0, 0.5, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/pbr.vs",
    "../resources/shaders/glsl$GLSL_VERSION/pbr.fs",
  );

  final albedoMapLoc = GetShaderLocation(shader, "albedoMap");
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_ALBEDO.value] = albedoMapLoc;
  final mraMapLoc = GetShaderLocation(shader, "mraMap");
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_METALNESS.value] = mraMapLoc;
  final normalMapLoc = GetShaderLocation(shader, "normalMap");
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_NORMAL.value] = normalMapLoc;
  final emissiveMapLoc = GetShaderLocation(shader, "emissiveMap");
  shader.locs[ShaderLocationIndex.SHADER_LOC_MAP_EMISSION.value] = emissiveMapLoc;
  final albedoColorLoc = GetShaderLocation(shader, "albedoColor");
  shader.locs[ShaderLocationIndex.SHADER_LOC_COLOR_DIFFUSE.value] = albedoColorLoc;
  final viewPosLoc = GetShaderLocation(shader, "viewPos");
  shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] = viewPosLoc;

  SetShaderValue(
    shader,
    GetShaderLocation(shader, "numOfLights"),
    [MAX_LIGHTS],
    .SHADER_UNIFORM_INT,
  );

  final ambientIntensity = 0.02;
  final ColorD ambientColor = .color(26, 32, 135, 255);
  final Vector3D ambientColorNormalized = .vec3(
    ambientColor.r/255.0,
    ambientColor.g/255.0,
    ambientColor.b/255.0,
  );
  SetShaderValue(
    shader,
    GetShaderLocation(shader, "ambientColor"),
    ambientColorNormalized.toArray(),
    .SHADER_UNIFORM_VEC3,
  );

  SetShaderValue(
    shader,
    GetShaderLocation(shader, "ambient"),
    [ambientIntensity],
    .SHADER_UNIFORM_FLOAT,
  );

  int emissiveIntensityLoc = GetShaderLocation(shader, "emissivePower");
  int emissiveColorLoc = GetShaderLocation(shader, "emissiveColor");
  int textureTilingLoc = GetShaderLocation(shader, "tiling");

  final car = LoadModel("../resources/models/old_car_new.glb");

  car.materials[0].shader = shader.clone();

  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].color = .WHITE;
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].value = 0.0;
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ROUGHNESS.value].value = 0.0;
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_OCCLUSION.value].value = 1.0;
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].color.set(255, 162, 0, 255);

  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].texture =
    LoadTexture("../resources/old_car_d.png");
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].texture =
    LoadTexture("../resources/old_car_mra.png");
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_NORMAL.value].texture =
    LoadTexture("../resources/old_car_n.png");
  car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].texture =
    LoadTexture("../resources/old_car_e.png");
    
  final floor = LoadModel("../resources/models/plane.glb");

  floor.materials[0].shader = shader.clone();
  
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].color = .WHITE;
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].value = 0.0;
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ROUGHNESS.value].value = 0.0;
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_OCCLUSION.value].value = 1.0;
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].color = .BLACK;

  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].texture =
    LoadTexture("../resources/road_a.png");
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].texture =
    LoadTexture("../resources/road_mra.png");
  floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_NORMAL.value].texture =
    LoadTexture("../resources/road_n.png");

  final Vector2D carTextureTiling = .vec2(0.5, 0.5);
  final Vector2D floorTextureTiling = .vec2(0.5, 0.5);

  final usage = 1;
  SetShaderValue(
    shader,
    GetShaderLocation(shader, "useTexAlbedo"),
    [usage],
    .SHADER_UNIFORM_INT,
  );
  SetShaderValue(
    shader,
    GetShaderLocation(shader, "useTexNormal"),
    [usage],
    .SHADER_UNIFORM_INT,
  );
  SetShaderValue(
    shader,
    GetShaderLocation(shader, "useTexMRA"),
    [usage],
    .SHADER_UNIFORM_INT,
  );
  SetShaderValue(
    shader,
    GetShaderLocation(shader, "useTexEmissive"),
    [usage],
    .SHADER_UNIFORM_INT,
  );

  lights.add(CreateLight(
    .LIGHT_POINT, .vec3(-1, 1, -2), .zero(), .YELLOW, 4.0, shader
  ));

  lights.add(CreateLight(
    .LIGHT_POINT, .vec3(2, 1, 1), .zero(), .RED, 3.3, shader
  ));

  lights.add(CreateLight(
    .LIGHT_POINT, .vec3(-2, 1, 1), .zero(), .GREEN, 8.3, shader
  ));

  lights.add(CreateLight(
    .LIGHT_POINT, .vec3(1, 1, -2), .zero(), .BLUE, 2.0, shader
  ));

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    SetShaderValue(
      shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

    if (IsKeyPressed(.KEY_ONE)) lights[2].enabled = !lights[2].enabled;
    if (IsKeyPressed(.KEY_TWO)) lights[1].enabled = !lights[1].enabled;
    if (IsKeyPressed(.KEY_THREE)) lights[3].enabled = !lights[3].enabled;
    if (IsKeyPressed(.KEY_FOUR)) lights[0].enabled = !lights[0].enabled;

    for (int i = 0; i < lights.length; i++) {
      UpdateLight(shader, lights[i]);
    }

    BeginDrawing();

      ClearBackground(.BLACK);

      BeginMode3D(camera);

        SetShaderValue(
          shader,
          textureTilingLoc,
          floorTextureTiling.toArray(),
          .SHADER_UNIFORM_VEC2,
        );

        final Vector4D floorEmissiveColor = .colorNormalize(
          floor.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].color
        );

        SetShaderValue(
          shader,
          emissiveColorLoc,
          floorEmissiveColor.toArray(),
          .SHADER_UNIFORM_VEC4,
        );
        
        DrawModel(floor, .zero(), 5.0, .WHITE);

        SetShaderValue(
          shader,
          textureTilingLoc,
          carTextureTiling.toArray(),
          .SHADER_UNIFORM_VEC2,
        );
        
        final Vector4D carEmissiveColor = .colorNormalize(
          car.materials[0].maps[MaterialMapIndex.MATERIAL_MAP_EMISSION.value].color
        );

        SetShaderValue(
          shader,
          emissiveColorLoc,
          carEmissiveColor.toArray(),
          .SHADER_UNIFORM_VEC4,
        );
        
        final emissiveIntensity = 0.01;
        SetShaderValue(
          shader,
          emissiveIntensityLoc,
          [emissiveIntensity],
          .SHADER_UNIFORM_FLOAT,
        );
        
        DrawModel(car, .zero(), 0.25, .WHITE);

        for (int i = 0; i < MAX_LIGHTS; i++)
        {
          final ColorD lightColor = .color(
            lights[i].color[0]*255,
            lights[i].color[1]*255,
            lights[i].color[2]*255,
            lights[i].color[3]*255
          );
          
          if (lights[i].enabled) DrawSphereEx(
            lights[i].position, 0.2, 8, 8, lightColor
          );
          else DrawSphereWires(
            lights[i].position, 0.2, 8, 8, ColorAlpha(lightColor, 0.3)
          );
        }

      EndMode3D();

      DrawText(
        "Toggle lights: [1][2][3][4]",
        10, 40, 20, .LIGHTGRAY
      );

      DrawText(
        "(c) Old Rusty Car model by Renafox (https://skfb.ly/LxRy)",
        screenWidth - 320, screenHeight - 20, 10, .LIGHTGRAY
      );
      
      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadModel(car);
  UnloadModel(floor);
  UnloadShader(shader);

  CloseWindowAndDispose();
}

LightDEx CreateLight(
  LightType type,
  Vector3D position,
  Vector3D target,
  ColorD color,
  double intensity,
  ShaderD shader,
) {
  final LightDEx light = .new();

  light.enabled = true;
  light.type = type;
  light.position = position;
  light.target = target;
  light.color[0] = color.r/255.0;
  light.color[1] = color.g/255.0;
  light.color[2] = color.b/255.0;
  light.color[3] = color.a/255.0;
  light.intensity = intensity;
  
  light.enabledLoc = GetShaderLocation(
    shader, "lights[${lights.length}].enabled");
  light.typeLoc = GetShaderLocation(
    shader, "lights[${lights.length}].type");
  light.positionLoc = GetShaderLocation(
    shader, "lights[${lights.length}].position");
  light.targetLoc = GetShaderLocation(
    shader, "lights[${lights.length}].target");
  light.colorLoc = GetShaderLocation(
    shader, "lights[${lights.length}].color");
  light.intensityLoc = GetShaderLocation(
    shader, "lights[${lights.length}].intensity");
  
  UpdateLight(shader, light);

  return light;
}

void UpdateLight(ShaderD shader, LightDEx light)
{
  SetShaderValue(shader, light.enabledLoc, [light.enabled.toInt()], .SHADER_UNIFORM_INT);
  SetShaderValue(shader, light.typeLoc, [light.type.value], .SHADER_UNIFORM_INT);
  SetShaderValue(shader, light.positionLoc, light.position.toArray(), .SHADER_UNIFORM_VEC3);
  SetShaderValue(shader, light.targetLoc, light.target.toArray(), .SHADER_UNIFORM_VEC3);
  SetShaderValue(shader, light.colorLoc, light.color, .SHADER_UNIFORM_VEC4);
  SetShaderValue(shader, light.intensityLoc, [light.intensity], .SHADER_UNIFORM_FLOAT);
}
