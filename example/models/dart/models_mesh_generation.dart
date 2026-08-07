// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_mesh_generation.c
// Run it: dart run models_mesh_generation.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_mesh_generation");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3DD(
    position: .vec3(5, 5, 5),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final checked = GenImageChecked(2, 2, 1, 1, .RED, .GREEN);
  final texture = LoadTextureFromImage(checked);
  UnloadImage(checked);

  final models = <String, ModelD>{
    "PLANE": LoadModelFromMesh(GenMeshPlane(2, 2, 4, 3)),
    "CUBE": LoadModelFromMesh(GenMeshCube(2.0, 1.0, 2.0)),
    "SPHERE": LoadModelFromMesh(GenMeshSphere(2, 32, 32)),
    "HEMISPHERE": LoadModelFromMesh(GenMeshHemiSphere(2, 16, 16)),
    "CYLINDER": LoadModelFromMesh(GenMeshCylinder(1, 2, 16)),
    "TORUS": LoadModelFromMesh(GenMeshTorus(0.25, 4.0, 16, 32)),
    "KNOT": LoadModelFromMesh(GenMeshKnot(1.0, 2.0, 16, 128)),
    "POLY": LoadModelFromMesh(GenMeshPoly(5, 2.0)),
    "Custom (triangle)": LoadModelFromMesh(GenMeshCustom()),
  };
  
  // Generated meshes could be exported as .obj files
  // ExportMesh(models[0].meshes[0], "plane.obj");
  // ExportMesh(models[1].meshes[0], "cube.obj");
  // ExportMesh(models[2].meshes[0], "sphere.obj");
  // ExportMesh(models[3].meshes[0], "hemisphere.obj");
  // ExportMesh(models[4].meshes[0], "cylinder.obj");
  // ExportMesh(models[5].meshes[0], "torus.obj");
  // ExportMesh(models[6].meshes[0], "knot.obj");
  // ExportMesh(models[7].meshes[0], "poly.obj");
  // ExportMesh(models[8].meshes[0], "custom.obj");

  // Set checked texture as default diffuse component for all models material
  for (final model in models.values) {
    model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
  }

  final Vector3D position = .zero();

  int currentModel = models.length - 1;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) {
      currentModel = (currentModel + 1)%models.length;
    }

    if (IsKeyPressed(.KEY_RIGHT)) {
      currentModel++;
      if (currentModel >= models.length) currentModel = 0;
    
    } else if (IsKeyPressed(.KEY_LEFT)) {
      currentModel--;
      if (currentModel < 0) currentModel = models.length - 1;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        final model = models.values.elementAt(currentModel);
        DrawModel(model, position, 1.0, .WHITE);
        DrawGrid(10, 1.0);

      EndMode3D();

      DrawRectangle(30, 400, 310, 30, Fade(.SKYBLUE, 0.5));
      DrawRectangleLines(30, 400, 310, 30, Fade(.DARKBLUE, 0.5));
      DrawText(
        "MOUSE LEFT BUTTON to CYCLE PROCEDURAL MODELS",
        40, 410, 10, .BLUE
      );

      final modelName = models.keys.elementAt(currentModel);
      DrawText(modelName, 20, 10, 20, .DARKBLUE);

    EndDrawing();
  }

  UnloadTexture(texture);
  models.values.forEach(UnloadModel);

  CloseWindowAndDispose();
}

MeshD GenMeshCustom() {
  final mesh = MeshD();

  mesh.triangleCount = 1;
  mesh.vertexCount = mesh.triangleCount*3;

  mesh.vertices = .filled(mesh.vertexCount*3, 0);
  mesh.texcoords = .filled(mesh.vertexCount*2, 0);
  mesh.normals = .filled(mesh.vertexCount*3, 0);

  // Vertex at (0, 0, 0)
  mesh.vertices[0] = 0;
  mesh.vertices[1] = 0;
  mesh.vertices[2] = 0;
  mesh.normals[0] = 0;
  mesh.normals[1] = 1;
  mesh.normals[2] = 0;
  mesh.texcoords[0] = 0;
  mesh.texcoords[1] = 0;

  // Vertex at (1, 0, 2)
  mesh.vertices[3] = 1;
  mesh.vertices[4] = 0;
  mesh.vertices[5] = 2;
  mesh.normals[3] = 0;
  mesh.normals[4] = 1;
  mesh.normals[5] = 0;
  mesh.texcoords[2] = 0.5;
  mesh.texcoords[3] = 1.0;

  // Vertex at (2, 0, 0)
  mesh.vertices[6] = 2;
  mesh.vertices[7] = 0;
  mesh.vertices[8] = 0;
  mesh.normals[6] = 0;
  mesh.normals[7] = 1;
  mesh.normals[8] = 0;
  mesh.texcoords[4] = 1;
  mesh.texcoords[5] = 0;

  UploadMesh(mesh, false);

  return mesh;
}
