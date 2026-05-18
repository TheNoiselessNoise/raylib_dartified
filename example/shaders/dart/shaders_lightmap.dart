// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_lightmap.c
// Run it: dart run shaders_lightmap.dart
// WARNING: expects resources from the raylib source
import 'dart:typed_data';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int MAP_SIZE = 10;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.SetConfigFlags([.FLAG_MSAA_4X_HINT]);
  rl.CoreD.InitWindow(screenWidth, screenHeight, "shaders_lightmap");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(4, 6, 8),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final mesh = rl.CoreD.GenMeshPlane(MAP_SIZE, MAP_SIZE, 1, 1);

  mesh.texcoords2 = .generate(mesh.vertexCount*2, (_) => 0.0);

  mesh.texcoords2[0] = 0.0; mesh.texcoords2[1] = 0.0;
  mesh.texcoords2[2] = 1.0; mesh.texcoords2[3] = 0.0;
  mesh.texcoords2[4] = 0.0; mesh.texcoords2[5] = 1.0;
  mesh.texcoords2[6] = 1.0; mesh.texcoords2[7] = 1.0;

  mesh.vboId[ShaderLocationIndex.SHADER_LOC_VERTEX_TEXCOORD02.value] =
    rl.RlglD.rlLoadVertexBuffer(Float32List.fromList(mesh.texcoords2), false);
  rl.RlglD.rlEnableVertexArray(mesh.vaoId);
  
  rl.RlglD.rlSetVertexAttribute(5, 2, rl.Rlgl.RL_FLOAT, false, 0, 0);
  rl.RlglD.rlEnableVertexAttribute(5);
  rl.RlglD.rlDisableVertexArray();

  final shader = rl.CoreD.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lightmap.vs",
    "../resources/shaders/glsl$GLSL_VERSION/lightmap.fs",
  );

  final texture = rl.CoreD.LoadTexture("../resources/cubicmap_atlas.png");
  final light = rl.CoreD.LoadTexture("../resources/spark_flame.png");

  rl.CoreD.GenTextureMipmaps(texture);
  rl.CoreD.SetTextureFilter(texture, .TEXTURE_FILTER_TRILINEAR);

  final lightmap = rl.CoreD.LoadRenderTexture(MAP_SIZE, MAP_SIZE);

  rl.CoreD.SetTextureFilter(lightmap.texture, .TEXTURE_FILTER_TRILINEAR);

  final material = rl.CoreD.LoadMaterialDefault();
  material.shader = shader;
  material.maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].texture = texture;
  material.maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].texture = lightmap.texture;

  rl.CoreD.BeginTextureMode(lightmap);
    rl.CoreD.ClearBackground(.BLACK);

    rl.CoreD.BeginBlendMode(.BLEND_ADDITIVE);
      rl.CoreD.DrawTexturePro(
        light,
        .rect(0, 0, light.width, light.height),
        .rect(0, 0, 20, 20),
        .vec2(10.0, 10.0),
        0.0,
        .RED
      );
      rl.CoreD.DrawTexturePro(
        light,
        .rect(0, 0, light.width, light.height),
        .rect(8, 4, 20, 20),
        .vec2(10.0, 10.0),
        0.0,
        .BLUE
      );
      rl.CoreD.DrawTexturePro(
        light,
        .rect(0, 0, light.width, light.height),
        .rect(8, 8, 10, 10),
        .vec2(5.0, 5.0),
        0.0,
        .GREEN
      );
    rl.CoreD.BeginBlendMode(.BLEND_ALPHA);
  rl.CoreD.EndTextureMode();

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    rl.CoreD.BeginDrawing();
      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);
        rl.CoreD.DrawMesh(mesh, material, .identity());
      rl.CoreD.EndMode3D();

      rl.CoreD.DrawFPS(10, 10);

      rl.CoreD.DrawTexturePro(
        lightmap.texture,
        .rect(0, 0, -MAP_SIZE, -MAP_SIZE),
        .rect(rl.CoreD.GetRenderWidth() - MAP_SIZE*8 - 10, 10, MAP_SIZE*8, MAP_SIZE*8),
        .vec2(0.0, 0.0),
        0.0,
        .WHITE
      );
          
      rl.CoreD.DrawText(
        "lightmap",
        rl.CoreD.GetRenderWidth() - 66, 16 + MAP_SIZE*8, 10, .GRAY
      );
      rl.CoreD.DrawText(
        "10x10 pixels",
        rl.CoreD.GetRenderWidth() - 76, 30 + MAP_SIZE*8, 10, .GRAY
      );
            
    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadMesh(mesh);
  rl.CoreD.UnloadShader(shader);
  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadTexture(light);
  
  rl.CloseWindowAndDispose();
}