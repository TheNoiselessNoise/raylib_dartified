// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_mesh_generation.c
// Run it: dart run models_mesh_generation.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_mesh_generation");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = Camera3DD(
    position: .vec3(5, 5, 5),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final checked = rl.CoreD.GenImageChecked(2, 2, 1, 1, .RED, .GREEN);
  final texture = rl.CoreD.LoadTextureFromImage(checked);
  rl.CoreD.UnloadImage(checked);

  final models = <String, ModelD>{
    "PLANE": rl.CoreD.LoadModelFromMesh(rl.CoreD.GenMeshPlane(2, 2, 4, 3)),
    "CUBE": rl.CoreD.LoadModelFromMesh(rl.CoreD.GenMeshCube(2.0, 1.0, 2.0)),
    "SPHERE": rl.CoreD.LoadModelFromMesh(rl.CoreD.GenMeshSphere(2, 32, 32)),
    "HEMISPHERE": rl.CoreD.LoadModelFromMesh(rl.CoreD.GenMeshHemiSphere(2, 16, 16)),
    "CYLINDER": rl.CoreD.LoadModelFromMesh(rl.CoreD.GenMeshCylinder(1, 2, 16)),
    "TORUS": rl.CoreD.LoadModelFromMesh(rl.CoreD.GenMeshTorus(0.25, 4.0, 16, 32)),
    "KNOT": rl.CoreD.LoadModelFromMesh(rl.CoreD.GenMeshKnot(1.0, 2.0, 16, 128)),
    "POLY": rl.CoreD.LoadModelFromMesh(rl.CoreD.GenMeshPoly(5, 2.0)),
    "Custom (triangle)": rl.CoreD.LoadModelFromMesh(GenMeshCustom(rl)),
  };
  
  // Generated meshes could be exported as .obj files
  // rl.CoreD.ExportMesh(models[0].meshes[0], "plane.obj");
  // rl.CoreD.ExportMesh(models[1].meshes[0], "cube.obj");
  // rl.CoreD.ExportMesh(models[2].meshes[0], "sphere.obj");
  // rl.CoreD.ExportMesh(models[3].meshes[0], "hemisphere.obj");
  // rl.CoreD.ExportMesh(models[4].meshes[0], "cylinder.obj");
  // rl.CoreD.ExportMesh(models[5].meshes[0], "torus.obj");
  // rl.CoreD.ExportMesh(models[6].meshes[0], "knot.obj");
  // rl.CoreD.ExportMesh(models[7].meshes[0], "poly.obj");
  // rl.CoreD.ExportMesh(models[8].meshes[0], "custom.obj");

  // Set checked texture as default diffuse component for all models material
  for (final model in models.values) {
    model.materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
  }

  final Vector3D position = .zero();

  int currentModel = models.length - 1;

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) {
      currentModel = (currentModel + 1)%models.length;
    }

    if (rl.CoreD.IsKeyPressed(.KEY_RIGHT)) {
      currentModel++;
      if (currentModel >= models.length) currentModel = 0;
    
    } else if (rl.CoreD.IsKeyPressed(.KEY_LEFT)) {
      currentModel--;
      if (currentModel < 0) currentModel = models.length - 1;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        final model = models.values.elementAt(currentModel);
        rl.CoreD.DrawModel(model, position, 1.0, .WHITE);
        rl.CoreD.DrawGrid(10, 1.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawRectangle(30, 400, 310, 30, rl.CoreD.Fade(.SKYBLUE, 0.5));
      rl.CoreD.DrawRectangleLines(30, 400, 310, 30, rl.CoreD.Fade(.DARKBLUE, 0.5));
      rl.CoreD.DrawText(
        "MOUSE LEFT BUTTON to CYCLE PROCEDURAL MODELS",
        40, 410, 10, .BLUE
      );

      final modelName = models.keys.elementAt(currentModel);
      rl.CoreD.DrawText(modelName, 20, 10, 20, .DARKBLUE);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texture);
  models.values.forEach(rl.CoreD.UnloadModel);

  rl.CloseWindowAndDispose();
}

MeshD GenMeshCustom(Raylib rl) {
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

  rl.CoreD.UploadMesh(mesh, false);

  return mesh;
}
