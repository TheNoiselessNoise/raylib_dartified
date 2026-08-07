// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_mesh_generation.c
// Run it: dart run models_mesh_generation.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_mesh_generation".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(5, 5, 5);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final checked = GenImageChecked(2, 2, 1, 1, RED, GREEN);
  final texture = LoadTextureFromImage(checked);
  UnloadImage(checked);

  final models = [
    LoadModelFromMesh(GenMeshPlane(2, 2, 4, 3)),
    LoadModelFromMesh(GenMeshCube(2.0, 1.0, 2.0)),
    LoadModelFromMesh(GenMeshSphere(2, 32, 32)),
    LoadModelFromMesh(GenMeshHemiSphere(2, 16, 16)),
    LoadModelFromMesh(GenMeshCylinder(1, 2, 16)),
    LoadModelFromMesh(GenMeshTorus(0.25, 4.0, 16, 32)),
    LoadModelFromMesh(GenMeshKnot(1.0, 2.0, 16, 128)),
    LoadModelFromMesh(GenMeshPoly(5, 2.0)),
    LoadModelFromMesh(GenMeshCustom()),
  ];
  
  // Generated meshes could be exported as .obj files
  //ExportMesh(models[0].meshes[0], "plane.obj".c);
  //ExportMesh(models[1].meshes[0], "cube.obj".c);
  //ExportMesh(models[2].meshes[0], "sphere.obj".c);
  //ExportMesh(models[3].meshes[0], "hemisphere.obj".c);
  //ExportMesh(models[4].meshes[0], "cylinder.obj".c);
  //ExportMesh(models[5].meshes[0], "torus.obj".c);
  //ExportMesh(models[6].meshes[0], "knot.obj".c);
  //ExportMesh(models[7].meshes[0], "poly.obj".c);
  //ExportMesh(models[8].meshes[0], "custom.obj".c);

  // Set checked texture as default diffuse component for all models material
  for (int i = 0; i < models.length; i++) {
    models[i].materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
  }

  int currentModel = 0;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      currentModel = (currentModel + 1)%models.length;
    }

    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) {
      currentModel++;
      if (currentModel >= models.length) currentModel = 0;
    
    } else if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) {
      currentModel--;
      if (currentModel < 0) currentModel = models.length - 1;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawModel(models[currentModel], Vector3$.$zero, 1.0, WHITE);
        DrawGrid(10, 1.0);

      EndMode3D();

      DrawRectangle(30, 400, 310, 30, Fade(SKYBLUE, 0.5));
      DrawRectangleLines(30, 400, 310, 30, Fade(DARKBLUE, 0.5));
      DrawText(
        "MOUSE LEFT BUTTON to CYCLE PROCEDURAL MODELS".toC,
        40, 410, 10, BLUE
      );

      switch(currentModel)
      {
        case 0: DrawText("PLANE".toC, 680, 10, 20, DARKBLUE); break;
        case 1: DrawText("CUBE".toC, 680, 10, 20, DARKBLUE); break;
        case 2: DrawText("SPHERE".toC, 680, 10, 20, DARKBLUE); break;
        case 3: DrawText("HEMISPHERE".toC, 640, 10, 20, DARKBLUE); break;
        case 4: DrawText("CYLINDER".toC, 680, 10, 20, DARKBLUE); break;
        case 5: DrawText("TORUS".toC, 680, 10, 20, DARKBLUE); break;
        case 6: DrawText("KNOT".toC, 680, 10, 20, DARKBLUE); break;
        case 7: DrawText("POLY".toC, 680, 10, 20, DARKBLUE); break;
        case 8: DrawText("Custom (triangle)".toC, 580, 10, 20, DARKBLUE); break;
        default: break;
      }

    EndDrawing();
  }

  UnloadTexture(texture);
  models.forEach(UnloadModel);

  CloseWindowAndDispose();
}

MeshC GenMeshCustom() {
  final mesh = Mesh$.At('mesh');

  mesh.ref.triangleCount = 1;
  mesh.ref.vertexCount = mesh.ref.triangleCount*3;

  mesh.ref.vertices = Float32$.Raw(mesh.ref.vertexCount*3);
  mesh.ref.texcoords = Float32$.Raw(mesh.ref.vertexCount*2);
  mesh.ref.normals = Float32$.Raw(mesh.ref.vertexCount*3);

  // Vertex at (0, 0, 0)
  mesh.ref.vertices[0] = 0;
  mesh.ref.vertices[1] = 0;
  mesh.ref.vertices[2] = 0;
  mesh.ref.normals[0] = 0;
  mesh.ref.normals[1] = 1;
  mesh.ref.normals[2] = 0;
  mesh.ref.texcoords[0] = 0;
  mesh.ref.texcoords[1] = 0;

  // Vertex at (1, 0, 2)
  mesh.ref.vertices[3] = 1;
  mesh.ref.vertices[4] = 0;
  mesh.ref.vertices[5] = 2;
  mesh.ref.normals[3] = 0;
  mesh.ref.normals[4] = 1;
  mesh.ref.normals[5] = 0;
  mesh.ref.texcoords[2] = 0.5;
  mesh.ref.texcoords[3] = 1.0;

  // Vertex at (2, 0, 0)
  mesh.ref.vertices[6] = 2;
  mesh.ref.vertices[7] = 0;
  mesh.ref.vertices[8] = 0;
  mesh.ref.normals[6] = 0;
  mesh.ref.normals[7] = 1;
  mesh.ref.normals[8] = 0;
  mesh.ref.texcoords[4] = 1;
  mesh.ref.texcoords[5] = 0;

  UploadMesh(mesh, false);

  return mesh.ref;
}
