// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_lightmap_rendering.c
// WARNING: expects resources from the raylib source
import 'dart:typed_data';
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAP_SIZE = 10;

late Camera3D camera;
late Mesh mesh;
late Shader shader;
late Texture texture;
late Texture light;
late RenderTexture lightmap;
late Material material;

void main() => runExample(
  init: (_) {
    SetConfigFlags([.FLAG_MSAA_4X_HINT]);
    InitWindow(screenWidth, screenHeight, "shaders_lightmap_rendering");
    SetTargetFPS(60);

    camera = .new(
      position: .vec3(4, 6, 8),
      target: .vec3(0, 0, 0),
      up: .vec3(0, 1, 0),
      fovy: 45,
      projection: .CAMERA_PERSPECTIVE,
    );

    mesh = GenMeshPlane(MAP_SIZE, MAP_SIZE, 1, 1);
    mesh.texcoords2 = .generate(mesh.vertexCount*2, (_) => 0.0);
    mesh.texcoords2[0] = 0.0; mesh.texcoords2[1] = 0.0;
    mesh.texcoords2[2] = 1.0; mesh.texcoords2[3] = 0.0;
    mesh.texcoords2[4] = 0.0; mesh.texcoords2[5] = 1.0;
    mesh.texcoords2[6] = 1.0; mesh.texcoords2[7] = 1.0;

    mesh.vboId[ShaderLocationIndex.SHADER_LOC_VERTEX_TEXCOORD02.value]
      = rlLoadVertexBuffer(Float32List.fromList(mesh.texcoords2), false);
    rlEnableVertexArray(mesh.vaoId);
    
    rlSetVertexAttribute(5, 2, RL_FLOAT, false, 0, 0);
    rlEnableVertexAttribute(5);
    rlDisableVertexArray();

    shader = LoadShader(
      "../resources/shaders/glsl${Raylib.glslVersion}/lightmap.vs",
      "../resources/shaders/glsl${Raylib.glslVersion}/lightmap.fs",
    );

    texture = LoadTexture("../resources/cubicmap_atlas.png");
    light = LoadTexture("../resources/spark_flame.png");

    GenTextureMipmaps(texture);
    SetTextureFilter(texture, .TEXTURE_FILTER_TRILINEAR);

    lightmap = LoadRenderTexture(MAP_SIZE, MAP_SIZE);

    SetTextureFilter(lightmap.texture, .TEXTURE_FILTER_TRILINEAR);

    material = LoadMaterialDefault();
    material.shader = shader;
    material.maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].texture = texture;
    material.maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].texture = lightmap.texture;

    BeginTextureMode(lightmap);
      ClearBackground(.BLACK);

      BeginBlendMode(.BLEND_ADDITIVE);
        DrawTexturePro(
          light,
          .rect(0, 0, light.width, light.height),
          .rect(0, 0, 20, 20),
          .vec2(10.0, 10.0),
          0.0,
          .RED
        );
        DrawTexturePro(
          light,
          .rect(0, 0, light.width, light.height),
          .rect(8, 4, 20, 20),
          .vec2(10.0, 10.0),
          0.0,
          .BLUE
        );
        DrawTexturePro(
          light,
          .rect(0, 0, light.width, light.height),
          .rect(8, 8, 10, 10),
          .vec2(5.0, 5.0),
          0.0,
          .GREEN
        );
      BeginBlendMode(.BLEND_ALPHA);
    EndTextureMode();
  },
  loop: (_) async {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    BeginDrawing();
      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);
        DrawMesh(mesh, material, .identity());
      EndMode3D();

      DrawFPS(10, 10);

      DrawTexturePro(
        lightmap.texture,
        .rect(0, 0, -MAP_SIZE, -MAP_SIZE),
        .rect(GetRenderWidth() - MAP_SIZE*8 - 10, 10, MAP_SIZE*8, MAP_SIZE*8),
        .vec2(0.0, 0.0),
        0.0,
        .WHITE
      );
          
      DrawText(
        "lightmap",
        GetRenderWidth() - 66, 16 + MAP_SIZE*8, 10, .GRAY
      );
      DrawText(
        "10x10 pixels",
        GetRenderWidth() - 76, 30 + MAP_SIZE*8, 10, .GRAY
      );
            
    EndDrawing();
  },
  close: (_) {
    UnloadMesh(mesh);
    UnloadShader(shader);
    UnloadTexture(texture);
    UnloadTexture(light);
    CloseWindow();
  },
);