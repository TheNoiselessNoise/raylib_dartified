// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_lightmap_rendering.c
// Run it: dart run shaders_lightmap_rendering.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int MAP_SIZE = 10;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  InitWindow(screenWidth, screenHeight, "shaders_lightmap_rendering".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(4, 6, 8);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final mesh = GenMeshPlane(MAP_SIZE.toDouble(), MAP_SIZE.toDouble(), 1, 1);

  mesh.texcoords2 = Float32$.val.Raw(mesh.vertexCount*2);

  mesh.texcoords2[0] = 0.0; mesh.texcoords2[1] = 0.0;
  mesh.texcoords2[2] = 1.0; mesh.texcoords2[3] = 0.0;
  mesh.texcoords2[4] = 0.0; mesh.texcoords2[5] = 1.0;
  mesh.texcoords2[6] = 1.0; mesh.texcoords2[7] = 1.0;

  mesh.vboId[ShaderLocationIndex.SHADER_LOC_VERTEX_TEXCOORD02.value] =
    rlLoadVertexBuffer(mesh.texcoords2.cast(), mesh.vertexCount*2*sizeOf<Float>(), false);
  rlEnableVertexArray(mesh.vaoId);
  
  rlSetVertexAttribute(5, 2, RL_FLOAT, false, 0, 0);
  rlEnableVertexAttribute(5);
  rlDisableVertexArray();

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lightmap.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/lightmap.fs".toC,
  );

  final texture = Texture$.val.At('texture');
  texture.ref = LoadTexture("../resources/cubicmap_atlas.png".toC);
  final light = LoadTexture("../resources/spark_flame.png".toC);

  GenTextureMipmaps(texture);
  SetTextureFilter(texture.ref, TextureFilter.TEXTURE_FILTER_TRILINEAR.value);

  final lightmap = LoadRenderTexture(MAP_SIZE, MAP_SIZE);

  SetTextureFilter(lightmap.texture, TextureFilter.TEXTURE_FILTER_TRILINEAR.value);

  final material = LoadMaterialDefault();
  material.shader = shader;
  material.maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].texture = texture.ref;
  material.maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].texture = lightmap.texture;

  BeginTextureMode(lightmap);
    ClearBackground(BLACK);

    BeginBlendMode(BlendMode.BLEND_ADDITIVE.value);
      DrawTexturePro(
        light,
        Rectangle$.val.$1.set(0, 0, light.width, light.height),
        Rectangle$.val.$2.set(0, 0, 20, 20),
        Vector2$.val.$1.set(10.0, 10.0),
        0.0,
        RED
      );
      DrawTexturePro(
        light,
        Rectangle$.val.$1.set(0, 0, light.width, light.height),
        Rectangle$.val.$2.set(8, 4, 20, 20),
        Vector2$.val.$1.set(10.0, 10.0),
        0.0,
        BLUE
      );
      DrawTexturePro(
        light,
        Rectangle$.val.$1.set(0, 0, light.width, light.height),
        Rectangle$.val.$2.set(8, 8, 10, 10),
        Vector2$.val.$1.set(5.0, 5.0),
        0.0,
        GREEN
      );
    BeginBlendMode(BlendMode.BLEND_ALPHA.value);
  EndTextureMode();

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    BeginDrawing();
      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);
        DrawMesh(mesh, material, Matrix$.val.$1.setD(.identity()));
      EndMode3D();

      DrawFPS(10, 10);

      DrawTexturePro(
        lightmap.texture,
        Rectangle$.val.$1.set(0, 0, -MAP_SIZE, -MAP_SIZE),
        Rectangle$.val.$2.set(GetRenderWidth() - MAP_SIZE*8 - 10, 10, MAP_SIZE*8, MAP_SIZE*8),
        Vector2$.val.$1.set(0.0, 0.0),
        0.0,
        WHITE
      );
          
      DrawText(
        "lightmap".toC,
        GetRenderWidth() - 66, 16 + MAP_SIZE*8, 10, GRAY
      );
      DrawText(
        "10x10 pixels".toC,
        GetRenderWidth() - 76, 30 + MAP_SIZE*8, 10, GRAY
      );
            
    EndDrawing();
  }

  UnloadMesh(mesh);
  UnloadShader(shader);
  UnloadTexture(texture.ref);
  UnloadTexture(light);
  
  CloseWindowAndDispose();
}