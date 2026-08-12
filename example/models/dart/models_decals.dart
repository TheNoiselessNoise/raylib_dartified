// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_decals.c
// Run it: dart run models_decals.dart
// WARNING: expects resources from the raylib source
import 'dart:math' as math;
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const double FLT_MAX = 340282346638528859811704183484516925440.0;
const int MAX_DECALS = 256;

class MeshBuilder {
  int vertexCount = 0;
  int vertexCapacity = 0;
  List<Vector3D> vertices = [];
  List<Vector2D> uvs = [];
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_decals");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(5.0, 5.0, 5.0),
    target: .vec3(0.0, 1.0, 0.0),
    up: .vec3(0.0, 1.6, 0.0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = LoadModel("../resources/models/obj/character.obj");

  final modelTexture = LoadTexture("../resources/models/obj/character_diffuse.png");
  SetTextureFilter(modelTexture, .TEXTURE_FILTER_BILINEAR);
  model.materials[0].maps[MATERIAL_MAP_DIFFUSE.value].texture = modelTexture;

  final modelBBox = GetMeshBoundingBox(model.meshes[0]);

  camera.target = modelBBox.min.lerp(modelBBox.max, 0.5);
  camera.position = modelBBox.max.scale(1.0);
  camera.position.x *= 0.1;

  final modelSize = math.min(
    math.min((modelBBox.max.x - modelBBox.min.x).abs(), (modelBBox.max.y - modelBBox.min.y).abs()),
    (modelBBox.max.z - modelBBox.min.z).abs()
  );

  camera.position = .vec3(0.0, modelBBox.max.y*1.2, modelSize*3.0);

  final decalSize = modelSize*0.25;
  final decalOffset = 0.01;

  final placementCube = LoadModelFromMesh(GenMeshCube(decalSize, decalSize, decalSize));
  placementCube.materials[0].maps[0].color = LIME;

  final decalMaterial = LoadMaterialDefault();
  decalMaterial.maps[0].color = YELLOW;

  final decalImage = LoadImage("../resources/raylib_logo.png");
  ImageResizeNN(decalImage, decalImage.width~/4, decalImage.height~/4);
  final decalTexture = LoadTextureFromImage(decalImage);
  UnloadImage(decalImage);

  SetTextureFilter(decalTexture, .TEXTURE_FILTER_BILINEAR);
  decalMaterial.maps[MATERIAL_MAP_DIFFUSE.value].texture = decalTexture;
  decalMaterial.maps[MATERIAL_MAP_DIFFUSE.value].color = RAYWHITE;

  bool showModel = true;
  final List<ModelD> decalModels = [];

  while (!WindowShouldClose())
  {
    if (IsMouseButtonDown(.MOUSE_BUTTON_RIGHT)) {
      UpdateCamera(camera, .CAMERA_THIRD_PERSON);
    }

    var collision = RayCollisionD();
    collision.distance = FLT_MAX;
    collision.hit = false;

    final ray = GetScreenToWorldRay(GetMousePosition(), camera);

    final boxHitInfo = GetRayCollisionBox(ray, modelBBox);

    if ((boxHitInfo.hit) && (decalModels.length < MAX_DECALS))
    {
      var meshHitInfo = RayCollisionD();
      for (int m = 0; m < model.meshCount; m++)
      {
        meshHitInfo = GetRayCollisionMesh(ray, model.meshes[m], model.transform);
        if (meshHitInfo.hit)
        {
          if (!collision.hit || (collision.distance > meshHitInfo.distance)) collision = meshHitInfo;
        }
      }

      if (meshHitInfo.hit) collision = meshHitInfo;
    }

    if (collision.hit && IsMouseButtonPressed(.MOUSE_BUTTON_LEFT) && (decalModels.length < MAX_DECALS))
    {
      final origin = collision.point.add(collision.normal.scale(1.0));
      MatrixD splat = .lookAt(collision.point, origin, .vec3(0.0, 1.0, 0.0));

      splat = splat.mul(.rotateZ(DEG2RAD*GetRandomValue(-180, 180)));

      final decalMesh = GenMeshDecal(model, splat, decalSize, decalOffset);

      if (decalMesh.vertexCount > 0)
      {
        decalModels.add(LoadModelFromMesh(decalMesh));
        decalModels[decalModels.length - 1].materials[0].maps[0] = decalMaterial.maps[0];
      }
    }

    BeginDrawing();
      ClearBackground(RAYWHITE);

      BeginMode3D(camera);
        if (showModel) DrawModel(model, .zero(), 1.0, WHITE);

        for (int i = 0; i < decalModels.length; i++) DrawModel(decalModels[i], .zero(), 1.0, WHITE);

        if (collision.hit)
        {
          final origin = collision.point.add(collision.normal.scale(1.0));
          MatrixD splat = .lookAt(collision.point, origin, .vec3(0.0, 1.0, 0.0));
          placementCube.transform = splat.invert();
          DrawModel(placementCube, .zero(), 1.0, Fade(WHITE, 0.5));
        }

        DrawGrid(10, 10.0);
      EndMode3D();

      double yPos = 10;
      double x0 = GetScreenWidth() - 300.0;
      double x1 = x0 + 100;
      double x2 = x1 + 100;

      DrawText("Vertices", x1, yPos, 10, LIME);
      DrawText("Triangles", x2, yPos, 10, LIME);
      yPos += 15;

      int vertexCount = 0;
      int triangleCount = 0;

      for (int i = 0; i < model.meshCount; i++)
      {
        vertexCount += model.meshes[i].vertexCount;
        triangleCount += model.meshes[i].triangleCount;
      }

      DrawText("Main model", x0, yPos, 10, LIME);
      DrawText("$vertexCount", x1, yPos, 10, LIME);
      DrawText("$triangleCount", x2, yPos, 10, LIME);
      yPos += 15;

      for (int i = 0; i < decalModels.length; i++)
      {
        if (i == 20)
        {
          DrawText("...", x0, yPos, 10, LIME);
          yPos += 15;
        }

        if (i < 20)
        {
          DrawText("Decal #${i+1}", x0, yPos, 10, LIME);
          DrawText("${decalModels[i].meshes[0].vertexCount}", x1, yPos, 10, LIME);
          DrawText("${decalModels[i].meshes[0].triangleCount}", x2, yPos, 10, LIME);
          yPos += 15;
        }

        vertexCount += decalModels[i].meshes[0].vertexCount;
        triangleCount += decalModels[i].meshes[0].triangleCount;
      }

      DrawText("TOTAL", x0, yPos, 10, LIME);
      DrawText("$vertexCount", x1, yPos, 10, LIME);
      DrawText("$triangleCount", x2, yPos, 10, LIME);
      yPos += 15;

      DrawText("Hold RMB to move camera", 10, 430, 10, GRAY);
      DrawText("(c) Character model and texture from kenney.nl", screenWidth - 260, screenHeight - 20, 10, GRAY);

      if (GuiButton(
        .rect(10, screenHeight - 100, 100, 60),
        (showModel ? "Hide Model" : "Show Model")
      )) showModel = !showModel;

      if (GuiButton(
        .rect(10 + 110, screenHeight - 100, 100, 60),
        "Clear Decals"
      )) {
        for (int i = 0; i < decalModels.length; i++) UnloadModel(decalModels[i]);
        decalModels.clear();
      }

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadModel(model);
  UnloadTexture(modelTexture);

  for (int i = 0; i < decalModels.length; i++) UnloadModel(decalModels[i]);

  UnloadTexture(decalTexture);

  CloseWindowAndDispose();
}

void AddTriangleToMeshBuilder(MeshBuilder mb, List<Vector3D> vertices)
{
  if (mb.vertexCapacity <= (mb.vertexCount + 3))
  {
    int newVertexCapacity = (1 + (mb.vertexCapacity~/256))*256;
    final List<Vector3D> newVertices = .generate(newVertexCapacity, (_) => .zero());

    if (mb.vertexCapacity > 0)
    {
      for (final (i, v) in mb.vertices.indexed) {
        newVertices[i] = v.copy();
      }
    }

    mb.vertices = .from(newVertices);
    mb.vertexCapacity = newVertexCapacity;
  }

  int index = mb.vertexCount;
  mb.vertexCount += 3;

  for (int i = 0; i < 3; i++) mb.vertices[index+i] = vertices[i].copy();
}

MeshD BuildMesh(MeshBuilder mb)
{
  final outMesh = MeshD();

  outMesh.vertexCount = mb.vertexCount;
  outMesh.triangleCount = mb.vertexCount~/3;
  outMesh.vertices = .filled(outMesh.vertexCount*3, 0);
  if (mb.uvs.isNotEmpty) outMesh.texcoords = .filled(outMesh.vertexCount*2, 0);

  for (int i = 0; i < mb.vertexCount; i++)
  {
    outMesh.vertices[3*i+0] = mb.vertices[i].x;
    outMesh.vertices[3*i+1] = mb.vertices[i].y;
    outMesh.vertices[3*i+2] = mb.vertices[i].z;

    if (mb.uvs.isNotEmpty)
    {
      outMesh.texcoords[2*i+0] = mb.uvs[i].x;
      outMesh.texcoords[2*i+1] = mb.uvs[i].y;
    }
  }

  UploadMesh(outMesh, false);

  return outMesh;
}

Vector3D ClipSegment(Vector3D v0, Vector3D v1, Vector3D p, double s)
{
  final d0 = v0.dotProduct(p) - s;
  final d1 = v1.dotProduct(p) - s;
  final s0 = d0/(d0 - d1);
  return v0.lerp(v1, s0);
}

List<MeshBuilder> meshBuilders = [.new(), .new()];

MeshD GenMeshDecal(ModelD target, MatrixD projection, double decalSize, double decalOffset)
{
  final invProj = projection.invert();

  meshBuilders[0].vertexCount = 0;
  meshBuilders[1].vertexCount = 0;

  int mbIndex = 0;

  for (int meshIndex = 0; meshIndex < target.meshCount; meshIndex++)
  {
    final mesh = target.meshes[meshIndex];
    
    for (int tri = 0; tri < mesh.triangleCount; tri++)
    {
      final List<Vector3D> vertices = [.zero(), .zero(), .zero()];

      if (mesh.indices.isEmpty)
      {
        for (int v = 0; v < 3; v++)
        {
          vertices[v].set(
            mesh.vertices[3*3*tri + 3*v + 0],
            mesh.vertices[3*3*tri + 3*v + 1],
            mesh.vertices[3*3*tri + 3*v + 2]
          );
        }
      }
      else
      {
        for (int v = 0; v < 3; v++)
        {
          vertices[v].set(
            mesh.vertices[3*mesh.indices[3*tri+0] + v],
            mesh.vertices[3*mesh.indices[3*tri+1] + v],
            mesh.vertices[3*mesh.indices[3*tri+2] + v]
          );
        }
      }

      int insideCount = 0;
      for (int i = 0; i < 3; i++)
      {
        final v = vertices[i].transform(projection);

        if (((v.x).abs() < decalSize) || ((v.y).abs() <= decalSize) || ((v.z).abs() <= decalSize)) insideCount++;

        vertices[i] = v.copy();
      }

      if (insideCount > 0) AddTriangleToMeshBuilder(meshBuilders[mbIndex], vertices);
    }
  }

  final List<Vector3D> planes = [
    .vec3( 1,  0,  0),
    .vec3(-1,  0,  0),
    .vec3( 0,  1,  0),
    .vec3( 0, -1,  0),
    .vec3( 0,  0,  1),
    .vec3( 0,  0, -1),
  ];

  for (int face = 0; face < 6; face++)
  {
    mbIndex = 1 - mbIndex;

    final inMesh = meshBuilders[1 - mbIndex];
    final outMesh = meshBuilders[mbIndex];

    outMesh.vertexCount = 0;

    final s = 0.5*decalSize;

    for (int i = 0; i < inMesh.vertexCount; i += 3)
    {
      late Vector3D nV1, nV2, nV3, nV4;

      final d1 = inMesh.vertices[ i + 0 ].dotProduct(planes[face]) - s;
      final d2 = inMesh.vertices[ i + 1 ].dotProduct(planes[face]) - s;
      final d3 = inMesh.vertices[ i + 2 ].dotProduct(planes[face]) - s;

      bool v1Out = d1 > 0;
      bool v2Out = d2 > 0;
      bool v3Out = d3 > 0;

      int total = v1Out.toInt() + v2Out.toInt() + v3Out.toInt();

      switch (total)
      {
        case 0:
        {
          AddTriangleToMeshBuilder(outMesh, [
            inMesh.vertices[i],
            inMesh.vertices[i+1],
            inMesh.vertices[i+2],
          ]);
        }
        case 1:
        {
          if (v1Out)
          {
            nV1 = inMesh.vertices[i + 1];
            nV2 = inMesh.vertices[i + 2];
            nV3 = ClipSegment(inMesh.vertices[i], nV1, planes[face], s);
            nV4 = ClipSegment(inMesh.vertices[i], nV2, planes[face], s);
          }

          if (v2Out)
          {
            nV1 = inMesh.vertices[i];
            nV2 = inMesh.vertices[i + 2];
            nV3 = ClipSegment(inMesh.vertices[i + 1], nV1, planes[face], s);
            nV4 = ClipSegment(inMesh.vertices[i + 1], nV2, planes[face], s);

            AddTriangleToMeshBuilder(outMesh, [nV3, nV2, nV1]);
            AddTriangleToMeshBuilder(outMesh, [nV2, nV3, nV4]);
            break;
          }

          if (v3Out)
          {
            nV1 = inMesh.vertices[i];
            nV2 = inMesh.vertices[i + 1];
            nV3 = ClipSegment(inMesh.vertices[i + 2], nV1, planes[face], s);
            nV4 = ClipSegment(inMesh.vertices[i + 2], nV2, planes[face], s);
          }

          AddTriangleToMeshBuilder(outMesh, [nV1, nV2, nV3]);
          AddTriangleToMeshBuilder(outMesh, [nV4, nV3, nV2]);
        }
        case 2:
        {
          if (!v1Out)
          {
            nV1 = inMesh.vertices[i];
            nV2 = ClipSegment(nV1, inMesh.vertices[i + 1], planes[face], s);
            nV3 = ClipSegment(nV1, inMesh.vertices[i + 2], planes[face], s);
            AddTriangleToMeshBuilder(outMesh, [nV1, nV2, nV3]);
          }

          if (!v2Out)
          {
            nV1 = inMesh.vertices[i + 1];
            nV2 = ClipSegment(nV1, inMesh.vertices[i + 2], planes[face], s);
            nV3 = ClipSegment(nV1, inMesh.vertices[i], planes[face], s);
            AddTriangleToMeshBuilder(outMesh, [nV1, nV2, nV3]);
          }

          if (!v3Out)
          {
            nV1 = inMesh.vertices[i + 2];
            nV2 = ClipSegment(nV1, inMesh.vertices[i], planes[face], s);
            nV3 = ClipSegment(nV1, inMesh.vertices[i + 1], planes[face], s);
            AddTriangleToMeshBuilder(outMesh, [nV1, nV2, nV3]);
          }
        }
        case 3:
        default: break;
      }
    }
  }

  final theMesh = meshBuilders[mbIndex];

  if (theMesh.vertexCount > 0)
  {
    theMesh.uvs = .generate(theMesh.vertexCount, (_) => .zero());

    for (int i = 0; i < theMesh.vertexCount; i++)
    {
      theMesh.uvs[i].x = (theMesh.vertices[i].x/decalSize + 0.5);
      theMesh.uvs[i].y = (theMesh.vertices[i].y/decalSize + 0.5);

      theMesh.vertices[i].z -= decalOffset;

      theMesh.vertices[i] = theMesh.vertices[i].transform(invProj);
    }

    return BuildMesh(theMesh);
  }
  else
  {
    return .zero();
  }
}

bool GuiButton(RectangleD rec, String label)
{
  var bgColor = GRAY;
  bool pressed = false;

  if (CheckCollisionPointRec(GetMousePosition(), rec))
  {
    bgColor = LIGHTGRAY;
    if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) pressed = true;
  }

  DrawRectangleRec(rec, bgColor);
  DrawRectangleLinesEx(rec, 2.0, DARKGRAY);

  int fontSize = 10;
  int textWidth = MeasureText(label, fontSize);

  DrawText(label, rec.x + rec.width*0.5 - textWidth*0.5, rec.y + rec.height*0.5 - fontSize*0.5, fontSize, DARKGRAY);

  return pressed;
}
