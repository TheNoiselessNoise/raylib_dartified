// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_decals.c
// Run it: dart run models_decals.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;
const double FLT_MAX = 340282346638528859811704183484516925440.0;
const int MAX_DECALS = 256;

final class MeshBuilder extends Struct {
  @Int() external int vertexCount;
  @Int() external int vertexCapacity;
  external Pointer<Vector3C> vertices;
  external Pointer<Vector2C> uvs;
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_decals".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(5.0, 5.0, 5.0);
  camera.ref.target.set(0.0, 1.0, 0.0);
  camera.ref.up.set(0.0, 1.6, 0.0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = LoadModel("../resources/models/obj/character.obj".toC);

  final modelTexture = LoadTexture("../resources/models/obj/character_diffuse.png".toC);
  SetTextureFilter(modelTexture, TextureFilter.TEXTURE_FILTER_BILINEAR.value);
  model.materials[0].maps[MATERIAL_MAP_DIFFUSE.value].texture = modelTexture;

  final modelBBox = GetMeshBoundingBox(model.meshes[0]);

  camera.ref.target.setD(modelBBox.min.toD().lerp(modelBBox.max.toD(), 0.5));
  camera.ref.position.setD(modelBBox.max.toD().scale(1.0));
  camera.ref.position.x *= 0.1;

  final modelSize = math.min(
    math.min((modelBBox.max.x - modelBBox.min.x).abs(), (modelBBox.max.y - modelBBox.min.y).abs()),
    (modelBBox.max.z - modelBBox.min.z).abs()
  );

  camera.ref.position.set(0.0, modelBBox.max.y*1.2, modelSize*3.0);

  final decalSize = modelSize*0.25;
  final decalOffset = 0.01;

  final placementCube = LoadModelFromMesh(GenMeshCube(decalSize, decalSize, decalSize));
  placementCube.materials[0].maps[0].color = LIME;

  final decalMaterial = LoadMaterialDefault();
  decalMaterial.maps[0].color = YELLOW;

  final decalImage = Image$.RawValueUnique(LoadImage("../resources/raylib_logo.png".toC));
  ImageResizeNN(decalImage, decalImage.ref.width~/4, decalImage.ref.height~/4);
  final decalTexture = LoadTextureFromImage(decalImage.ref);
  UnloadImage(decalImage.ref);

  SetTextureFilter(decalTexture, TextureFilter.TEXTURE_FILTER_BILINEAR.value);
  decalMaterial.maps[MATERIAL_MAP_DIFFUSE.value].texture = decalTexture;
  decalMaterial.maps[MATERIAL_MAP_DIFFUSE.value].color = RAYWHITE;

  bool showModel = true;
  final decalModels = Model$.AtUnique(count: MAX_DECALS);
  int decalCount = 0;

  while (!WindowShouldClose())
  {
    if (IsMouseButtonDown(MouseButton.MOUSE_BUTTON_RIGHT.value)) {
      UpdateCamera(camera, CameraMode.CAMERA_THIRD_PERSON.value);
    }

    final collision = RayCollision$.$1Ptr;
    collision.ref.distance = FLT_MAX;
    collision.ref.hit = false;

    final ray = GetScreenToWorldRay(GetMousePosition(), camera.ref);

    final boxHitInfo = GetRayCollisionBox(ray, modelBBox);

    if ((boxHitInfo.hit) && (decalCount < MAX_DECALS))
    {
      final meshHitInfo = RayCollision$.$2Ptr;
      for (int m = 0; m < model.meshCount; m++)
      {
        meshHitInfo.ref = GetRayCollisionMesh(ray, model.meshes[m], model.transform);
        if (meshHitInfo.ref.hit)
        {
          if (!collision.ref.hit || (collision.ref.distance > meshHitInfo.ref.distance)) collision.ref = meshHitInfo.ref;
        }
      }

      if (meshHitInfo.ref.hit) collision.ref = meshHitInfo.ref;
    }

    if (collision.ref.hit && IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value) && (decalCount < MAX_DECALS))
    {
      final origin = collision.ref.point.toD().add(collision.ref.normal.toD().scale(1.0));
      MatrixD splat = .lookAt(collision.ref.point.toD(), origin, .vec3(0.0, 1.0, 0.0));

      splat = splat.mul(.rotateZ(DEG2RAD*GetRandomValue(-180, 180)));

      final decalMesh = GenMeshDecal(model, splat, decalSize, decalOffset);

      if (decalMesh.vertexCount > 0)
      {
        int decalIndex = decalCount++;
        decalModels[decalIndex] = LoadModelFromMesh(decalMesh);
        decalModels[decalIndex].materials[0].maps[0] = decalMaterial.maps[0];
      }
    }

    BeginDrawing();
      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);
        if (showModel) DrawModel(model, Vector3$.$zero, 1.0, WHITE);

        for (int i = 0; i < decalCount; i++) DrawModel(decalModels[i], Vector3$.$zero, 1.0, WHITE);

        if (collision.ref.hit)
        {
          final origin = collision.ref.point.toD().add(collision.ref.normal.toD().scale(1.0));
          MatrixD splat = .lookAt(collision.ref.point.toD(), origin, .vec3(0.0, 1.0, 0.0));
          placementCube.transform.setD(splat.invert());
          DrawModel(placementCube, Vector3$.$zero, 1.0, Fade(WHITE, 0.5));
        }

        DrawGrid(10, 10.0);
      EndMode3D();

      double yPos = 10;
      double x0 = GetScreenWidth() - 300.0;
      double x1 = x0 + 100;
      double x2 = x1 + 100;

      DrawText("Vertices".toC, x1.toInt(), yPos.toInt(), 10, LIME);
      DrawText("Triangles".toC, x2.toInt(), yPos.toInt(), 10, LIME);
      yPos += 15;

      int vertexCount = 0;
      int triangleCount = 0;

      for (int i = 0; i < model.meshCount; i++)
      {
        vertexCount += model.meshes[i].vertexCount;
        triangleCount += model.meshes[i].triangleCount;
      }

      DrawText("Main model".toC, x0.toInt(), yPos.toInt(), 10, LIME);
      DrawText("$vertexCount".toC, x1.toInt(), yPos.toInt(), 10, LIME);
      DrawText("$triangleCount".toC, x2.toInt(), yPos.toInt(), 10, LIME);
      yPos += 15;

      for (int i = 0; i < decalCount; i++)
      {
        if (i == 20)
        {
          DrawText("...".toC, x0.toInt(), yPos.toInt(), 10, LIME);
          yPos += 15;
        }

        if (i < 20)
        {
          DrawText("Decal #${i+1}".toC, x0.toInt(), yPos.toInt(), 10, LIME);
          DrawText("${decalModels[i].meshes[0].vertexCount}".toC, x1.toInt(), yPos.toInt(), 10, LIME);
          DrawText("${decalModels[i].meshes[0].triangleCount}".toC, x2.toInt(), yPos.toInt(), 10, LIME);
          yPos += 15;
        }

        vertexCount += decalModels[i].meshes[0].vertexCount;
        triangleCount += decalModels[i].meshes[0].triangleCount;
      }

      DrawText("TOTAL".toC, x0.toInt(), yPos.toInt(), 10, LIME);
      DrawText("$vertexCount".toC, x1.toInt(), yPos.toInt(), 10, LIME);
      DrawText("$triangleCount".toC, x2.toInt(), yPos.toInt(), 10, LIME);
      yPos += 15;

      DrawText("Hold RMB to move camera".toC, 10, 430, 10, GRAY);
      DrawText("(c) Character model and texture from kenney.nl".toC, screenWidth - 260, screenHeight - 20, 10, GRAY);

      if (GuiButton(
        Rectangle$.$1.set(10, screenHeight - 100, 100, 60),
        (showModel ? "Hide Model" : "Show Model").toC
      )) showModel = !showModel;

      if (GuiButton(
        Rectangle$.$1.set(10 + 110, screenHeight - 100, 100, 60),
        "Clear Decals".toC
      )) {
        for (int i = 0; i < decalCount; i++) UnloadModel(decalModels[i]);
        decalCount = 0;
      }

      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadModel(model);
  UnloadTexture(modelTexture);

  for (int i = 0; i < decalCount; i++) UnloadModel(decalModels[i]);

  UnloadTexture(decalTexture);

  FreeDecalMeshData();

  CloseWindowAndDispose();
}

void FreeDecalMeshData() {
  final model = Model$.$new;
  model.meshCount = -1;
  GenMeshDecal(model, .zero(), 0.0, 0.0);
}

void AddTriangleToMeshBuilder(Pointer<MeshBuilder> mb, Pointer<Vector3C> vertices)
{
  if (mb.ref.vertexCapacity <= (mb.ref.vertexCount + 3))
  {
    int newVertexCapacity = (1 + (mb.ref.vertexCapacity~/256))*256;
    final newVertices = calloc<Vector3C>(newVertexCapacity);

    if (mb.ref.vertexCapacity > 0)
    {
      memcpy(newVertices.cast(), mb.ref.vertices.cast(), mb.ref.vertexCount*sizeOf<Vector3C>());
      calloc.free(mb.ref.vertices);
    }

    mb.ref.vertices = newVertices;
    mb.ref.vertexCapacity = newVertexCapacity;
  }

  int index = mb.ref.vertexCount;
  mb.ref.vertexCount += 3;

  for (int i = 0; i < 3; i++) mb.ref.vertices[index+i] = vertices[i];
}

void FreeMeshBuilder(Pointer<MeshBuilder> mb)
{
  calloc.free(mb.ref.vertices);
  if (mb.ref.uvs != nullptr) calloc.free(mb.ref.uvs);
  memset(mb.cast(), 0, sizeOf<MeshBuilder>());
}

MeshC BuildMesh(Pointer<MeshBuilder> mb)
{
  final outMesh = Mesh$.$newPtr;

  outMesh.ref.vertexCount = mb.ref.vertexCount;
  outMesh.ref.triangleCount = mb.ref.vertexCount~/3;
  outMesh.ref.vertices = calloc(outMesh.ref.vertexCount*3);
  if (mb.ref.uvs != nullptr) outMesh.ref.texcoords = calloc(outMesh.ref.vertexCount*2);

  for (int i = 0; i < mb.ref.vertexCount; i++)
  {
    outMesh.ref.vertices[3*i+0] = mb.ref.vertices[i].x;
    outMesh.ref.vertices[3*i+1] = mb.ref.vertices[i].y;
    outMesh.ref.vertices[3*i+2] = mb.ref.vertices[i].z;

    if (mb.ref.uvs != nullptr)
    {
      outMesh.ref.texcoords[2*i+0] = mb.ref.uvs[i].x;
      outMesh.ref.texcoords[2*i+1] = mb.ref.uvs[i].y;
    }
  }

  UploadMesh(outMesh, false);

  return outMesh.ref;
}

Vector3D ClipSegment(Vector3D v0, Vector3D v1, Vector3D p, double s)
{
  final d0 = v0.dotProduct(p) - s;
  final d1 = v1.dotProduct(p) - s;
  final s0 = d0/(d0 - d1);
  return v0.lerp(v1, s0);
}

Pointer<Vector3C> Vector3Array3(Vector3D v1, Vector3D v2, Vector3D v3) {
  final vertices = Vector3$.At('__Vector3Array__', 3);
  vertices[0].setD(v1);
  vertices[1].setD(v2);
  vertices[2].setD(v3);
  return vertices;
}

Pointer<MeshBuilder> meshBuilders = calloc(2);

MeshC GenMeshDecal(ModelC target, MatrixD projection, double decalSize, double decalOffset)
{
  if (target.meshCount == -1)
  {
    FreeMeshBuilder(meshBuilders + 0);
    FreeMeshBuilder(meshBuilders + 1);
    return Mesh$.$new;
  }

  final invProj = projection.invert();

  meshBuilders[0].vertexCount = 0;
  meshBuilders[1].vertexCount = 0;

  int mbIndex = 0;

  for (int meshIndex = 0; meshIndex < target.meshCount; meshIndex++)
  {
    final mesh = target.meshes[meshIndex];
    for (int tri = 0; tri < mesh.triangleCount; tri++)
    {
      final vertices = calloc<Vector3C>(3);

      if (mesh.indices == nullptr)
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
        final v = vertices[i].toD().transform(projection);

        if (((v.x).abs() < decalSize) || ((v.y).abs() <= decalSize) || ((v.z).abs() <= decalSize)) insideCount++;

        vertices[i].setD(v);
      }

      if (insideCount > 0) AddTriangleToMeshBuilder(meshBuilders + mbIndex, vertices);
    }
  }

  final planes = Vector3$.FillInto(key: 'planes', 6, (i, v) => switch(i) {
    0 => v.set( 1,  0,  0),
    1 => v.set(-1,  0,  0),
    2 => v.set( 0,  1,  0),
    3 => v.set( 0, -1,  0),
    4 => v.set( 0,  0,  1),
    5 => v.set( 0,  0, -1),
    _ => null,
  });

  for (int face = 0; face < 6; face++)
  {
    mbIndex = 1 - mbIndex;

    final inMesh = meshBuilders + (1 - mbIndex);
    final outMesh = meshBuilders + mbIndex;

    outMesh.ref.vertexCount = 0;

    final s = 0.5*decalSize;

    for (int i = 0; i < inMesh.ref.vertexCount; i += 3)
    {
      late Vector3D nV1, nV2, nV3, nV4;

      final d1 = inMesh.ref.vertices[ i + 0 ].toD().dotProduct(planes[face].toD()) - s;
      final d2 = inMesh.ref.vertices[ i + 1 ].toD().dotProduct(planes[face].toD()) - s;
      final d3 = inMesh.ref.vertices[ i + 2 ].toD().dotProduct(planes[face].toD()) - s;

      bool v1Out = d1 > 0;
      bool v2Out = d2 > 0;
      bool v3Out = d3 > 0;

      int total = v1Out.toInt() + v2Out.toInt() + v3Out.toInt();

      switch (total)
      {
        case 0:
        {
          AddTriangleToMeshBuilder(outMesh, Vector3Array3(
            inMesh.ref.vertices[i].toD(),
            inMesh.ref.vertices[i+1].toD(),
            inMesh.ref.vertices[i+2].toD(),
          ));
        }
        case 1:
        {
          if (v1Out)
          {
            nV1 = inMesh.ref.vertices[i + 1].toD();
            nV2 = inMesh.ref.vertices[i + 2].toD();
            nV3 = ClipSegment(inMesh.ref.vertices[i].toD(), nV1, planes[face].toD(), s);
            nV4 = ClipSegment(inMesh.ref.vertices[i].toD(), nV2, planes[face].toD(), s);
          }

          if (v2Out)
          {
            nV1 = inMesh.ref.vertices[i].toD();
            nV2 = inMesh.ref.vertices[i + 2].toD();
            nV3 = ClipSegment(inMesh.ref.vertices[i + 1].toD(), nV1, planes[face].toD(), s);
            nV4 = ClipSegment(inMesh.ref.vertices[i + 1].toD(), nV2, planes[face].toD(), s);

            AddTriangleToMeshBuilder(outMesh, Vector3Array3(nV3, nV2, nV1));
            AddTriangleToMeshBuilder(outMesh, Vector3Array3(nV2, nV3, nV4));
            break;
          }

          if (v3Out)
          {
            nV1 = inMesh.ref.vertices[i].toD();
            nV2 = inMesh.ref.vertices[i + 1].toD();
            nV3 = ClipSegment(inMesh.ref.vertices[i + 2].toD(), nV1, planes[face].toD(), s);
            nV4 = ClipSegment(inMesh.ref.vertices[i + 2].toD(), nV2, planes[face].toD(), s);
          }

          AddTriangleToMeshBuilder(outMesh, Vector3Array3(nV1, nV2, nV3));
          AddTriangleToMeshBuilder(outMesh, Vector3Array3(nV4, nV3, nV2));
        }
        case 2:
        {
          if (!v1Out)
          {
            nV1 = inMesh.ref.vertices[i].toD();
            nV2 = ClipSegment(nV1, inMesh.ref.vertices[i + 1].toD(), planes[face].toD(), s);
            nV3 = ClipSegment(nV1, inMesh.ref.vertices[i + 2].toD(), planes[face].toD(), s);
            AddTriangleToMeshBuilder(outMesh, Vector3Array3(nV1, nV2, nV3));
          }

          if (!v2Out)
          {
            nV1 = inMesh.ref.vertices[i + 1].toD();
            nV2 = ClipSegment(nV1, inMesh.ref.vertices[i + 2].toD(), planes[face].toD(), s);
            nV3 = ClipSegment(nV1, inMesh.ref.vertices[i].toD(), planes[face].toD(), s);
            AddTriangleToMeshBuilder(outMesh, Vector3Array3(nV1, nV2, nV3));
          }

          if (!v3Out)
          {
            nV1 = inMesh.ref.vertices[i + 2].toD();
            nV2 = ClipSegment(nV1, inMesh.ref.vertices[i].toD(), planes[face].toD(), s);
            nV3 = ClipSegment(nV1, inMesh.ref.vertices[i + 1].toD(), planes[face].toD(), s);
            AddTriangleToMeshBuilder(outMesh, Vector3Array3(nV1, nV2, nV3));
          }
        }
        case 3:
        default: break;
      }
    }
  }

  final theMesh = meshBuilders + mbIndex;

  if (theMesh.ref.vertexCount > 0)
  {
    theMesh.ref.uvs = calloc(theMesh.ref.vertexCount);

    for (int i = 0; i < theMesh.ref.vertexCount; i++)
    {
      theMesh.ref.uvs[i].x = (theMesh.ref.vertices[i].x/decalSize + 0.5);
      theMesh.ref.uvs[i].y = (theMesh.ref.vertices[i].y/decalSize + 0.5);

      theMesh.ref.vertices[i].z -= decalOffset;

      theMesh.ref.vertices[i].setD(theMesh.ref.vertices[i].toD().transform(invProj));
    }

    return BuildMesh(theMesh);
  }
  else
  {
    return Mesh$.$new;
  }
}

bool GuiButton(RectangleC rec, Pointer<Char> label)
{
  var bgColor = GRAY;
  bool pressed = false;

  if (CheckCollisionPointRec(GetMousePosition(), rec))
  {
    bgColor = LIGHTGRAY;
    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) pressed = true;
  }

  DrawRectangleRec(rec, bgColor);
  DrawRectangleLinesEx(rec, 2.0, DARKGRAY);

  int fontSize = 10;
  int textWidth = MeasureText(label, fontSize);

  DrawText(label, (rec.x + rec.width*0.5 - textWidth*0.5).toInt(), (rec.y + rec.height*0.5 - fontSize*0.5).toInt(), fontSize, DARKGRAY);

  return pressed;
}
