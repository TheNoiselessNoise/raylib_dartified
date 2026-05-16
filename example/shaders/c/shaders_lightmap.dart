// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/shaders/shaders_lightmap.c
// Run it: dart run shaders_lightmap.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const int MAP_SIZE = 10;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.SetConfigFlags(ConfigFlags.FLAG_MSAA_4X_HINT.value);
  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_lightmap".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(4, 6, 8);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final mesh = rl.Core.GenMeshPlane(MAP_SIZE.toDouble(), MAP_SIZE.toDouble(), 1, 1);

  mesh.texcoords2 = rl.Temp.Float$.Raw(mesh.vertexCount*2);

  mesh.texcoords2[0] = 0.0; mesh.texcoords2[1] = 0.0;
  mesh.texcoords2[2] = 1.0; mesh.texcoords2[3] = 0.0;
  mesh.texcoords2[4] = 0.0; mesh.texcoords2[5] = 1.0;
  mesh.texcoords2[6] = 1.0; mesh.texcoords2[7] = 1.0;

  mesh.vboId[ShaderLocationIndex.SHADER_LOC_VERTEX_TEXCOORD02.value] =
    rl.Rlgl.rlLoadVertexBuffer(mesh.texcoords2.cast(), mesh.vertexCount*2*sizeOf<Float>(), false);
  rl.Rlgl.rlEnableVertexArray(mesh.vaoId);
  
  rl.Rlgl.rlSetVertexAttribute(5, 2, rl.Rlgl.RL_FLOAT, false, 0, 0);
  rl.Rlgl.rlEnableVertexAttribute(5);
  rl.Rlgl.rlDisableVertexArray();

  final shader = rl.Core.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/lightmap.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/lightmap.fs".toC,
  );

  final texture = rl.Temp.Texture$.At('texture');
  texture.ref = rl.Core.LoadTexture("../resources/cubicmap_atlas.png".toC);
  final light = rl.Core.LoadTexture("../resources/spark_flame.png".toC);

  rl.Core.GenTextureMipmaps(texture);
  rl.Core.SetTextureFilter(texture.ref, TextureFilter.TEXTURE_FILTER_TRILINEAR.value);

  final lightmap = rl.Core.LoadRenderTexture(MAP_SIZE, MAP_SIZE);

  rl.Core.SetTextureFilter(lightmap.texture, TextureFilter.TEXTURE_FILTER_TRILINEAR.value);

  final material = rl.Core.LoadMaterialDefault();
  material.shader = shader;
  material.maps[MaterialMapIndex.MATERIAL_MAP_ALBEDO.value].texture = texture.ref;
  material.maps[MaterialMapIndex.MATERIAL_MAP_METALNESS.value].texture = lightmap.texture;

  rl.Core.BeginTextureMode(lightmap);
    rl.Core.ClearBackground(rl.Color.BLACK);

    rl.Core.BeginBlendMode(BlendMode.BLEND_ADDITIVE.value);
      rl.Core.DrawTexturePro(
        light,
        rl.Temp.rect1(0, 0, light.width, light.height),
        rl.Temp.rect2(0, 0, 20, 20),
        rl.Temp.vec21(10.0, 10.0),
        0.0,
        rl.Color.RED
      );
      rl.Core.DrawTexturePro(
        light,
        rl.Temp.rect1(0, 0, light.width, light.height),
        rl.Temp.rect2(8, 4, 20, 20),
        rl.Temp.vec21(10.0, 10.0),
        0.0,
        rl.Color.BLUE
      );
      rl.Core.DrawTexturePro(
        light,
        rl.Temp.rect1(0, 0, light.width, light.height),
        rl.Temp.rect2(8, 8, 10, 10),
        rl.Temp.vec21(5.0, 5.0),
        0.0,
        rl.Color.GREEN
      );
    rl.Core.BeginBlendMode(BlendMode.BLEND_ALPHA.value);
  rl.Core.EndTextureMode();

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    rl.Core.BeginDrawing();
      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);
        rl.Core.DrawMesh(mesh, material, rl.Temp.matIdentity);
      rl.Core.EndMode3D();

      rl.Core.DrawFPS(10, 10);

      rl.Core.DrawTexturePro(
        lightmap.texture,
        rl.Temp.rect1(0, 0, -MAP_SIZE, -MAP_SIZE),
        rl.Temp.rect2(rl.Core.GetRenderWidth() - MAP_SIZE*8 - 10, 10, MAP_SIZE*8, MAP_SIZE*8),
        rl.Temp.vec21(0.0, 0.0),
        0.0,
        rl.Color.WHITE
      );
          
      rl.Core.DrawText(
        "lightmap".toC,
        rl.Core.GetRenderWidth() - 66, 16 + MAP_SIZE*8, 10, rl.Color.GRAY
      );
      rl.Core.DrawText(
        "10x10 pixels".toC,
        rl.Core.GetRenderWidth() - 76, 30 + MAP_SIZE*8, 10, rl.Color.GRAY
      );
            
    rl.Core.EndDrawing();
  }

  rl.Core.UnloadMesh(mesh);
  rl.Core.UnloadShader(shader);
  rl.Core.UnloadTexture(texture.ref);
  rl.Core.UnloadTexture(light);
  
  rl.CloseWindowAndDispose();
}