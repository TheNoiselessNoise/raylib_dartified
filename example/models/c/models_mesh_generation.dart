// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_mesh_generation.c
// Run it: dart run models_mesh_generation.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "models_mesh_generation".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(5, 5, 5);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final checked = rl.Core.GenImageChecked(2, 2, 1, 1, rl.Color.RED, rl.Color.GREEN);
  final texture = rl.Core.LoadTextureFromImage(checked);
  rl.Core.UnloadImage(checked);

  final models = [
    rl.Core.LoadModelFromMesh(rl.Core.GenMeshPlane(2, 2, 4, 3)),
    rl.Core.LoadModelFromMesh(rl.Core.GenMeshCube(2.0, 1.0, 2.0)),
    rl.Core.LoadModelFromMesh(rl.Core.GenMeshSphere(2, 32, 32)),
    rl.Core.LoadModelFromMesh(rl.Core.GenMeshHemiSphere(2, 16, 16)),
    rl.Core.LoadModelFromMesh(rl.Core.GenMeshCylinder(1, 2, 16)),
    rl.Core.LoadModelFromMesh(rl.Core.GenMeshTorus(0.25, 4.0, 16, 32)),
    rl.Core.LoadModelFromMesh(rl.Core.GenMeshKnot(1.0, 2.0, 16, 128)),
    rl.Core.LoadModelFromMesh(rl.Core.GenMeshPoly(5, 2.0)),
    rl.Core.LoadModelFromMesh(GenMeshCustom(rl)),
  ];
  
  // Generated meshes could be exported as .obj files
  //rl.Core.ExportMesh(models[0].meshes[0], "plane.obj".c);
  //rl.Core.ExportMesh(models[1].meshes[0], "cube.obj".c);
  //rl.Core.ExportMesh(models[2].meshes[0], "sphere.obj".c);
  //rl.Core.ExportMesh(models[3].meshes[0], "hemisphere.obj".c);
  //rl.Core.ExportMesh(models[4].meshes[0], "cylinder.obj".c);
  //rl.Core.ExportMesh(models[5].meshes[0], "torus.obj".c);
  //rl.Core.ExportMesh(models[6].meshes[0], "knot.obj".c);
  //rl.Core.ExportMesh(models[7].meshes[0], "poly.obj".c);
  //rl.Core.ExportMesh(models[8].meshes[0], "custom.obj".c);

  // Set checked texture as default diffuse component for all models material
  for (int i = 0; i < models.length; i++) {
    models[i].materials[0].maps[rl.MATERIAL_MAP_DIFFUSE.value].texture = texture;
  }

  int currentModel = 0;

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      currentModel = (currentModel + 1)%models.length;
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) {
      currentModel++;
      if (currentModel >= models.length) currentModel = 0;
    
    } else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_LEFT.value)) {
      currentModel--;
      if (currentModel < 0) currentModel = models.length - 1;
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Core.DrawModel(models[currentModel], rl.Temp.vec3Zero, 1.0, rl.Color.WHITE);
        rl.Core.DrawGrid(10, 1.0);

      rl.Core.EndMode3D();

      rl.Core.DrawRectangle(30, 400, 310, 30, rl.Core.Fade(rl.Color.SKYBLUE, 0.5));
      rl.Core.DrawRectangleLines(30, 400, 310, 30, rl.Core.Fade(rl.Color.DARKBLUE, 0.5));
      rl.Core.DrawText(
        "MOUSE LEFT BUTTON to CYCLE PROCEDURAL MODELS".toC,
        40, 410, 10, rl.Color.BLUE
      );

      switch(currentModel)
      {
        case 0: rl.Core.DrawText("PLANE".toC, 680, 10, 20, rl.Color.DARKBLUE); break;
        case 1: rl.Core.DrawText("CUBE".toC, 680, 10, 20, rl.Color.DARKBLUE); break;
        case 2: rl.Core.DrawText("SPHERE".toC, 680, 10, 20, rl.Color.DARKBLUE); break;
        case 3: rl.Core.DrawText("HEMISPHERE".toC, 640, 10, 20, rl.Color.DARKBLUE); break;
        case 4: rl.Core.DrawText("CYLINDER".toC, 680, 10, 20, rl.Color.DARKBLUE); break;
        case 5: rl.Core.DrawText("TORUS".toC, 680, 10, 20, rl.Color.DARKBLUE); break;
        case 6: rl.Core.DrawText("KNOT".toC, 680, 10, 20, rl.Color.DARKBLUE); break;
        case 7: rl.Core.DrawText("POLY".toC, 680, 10, 20, rl.Color.DARKBLUE); break;
        case 8: rl.Core.DrawText("Custom (triangle)".toC, 580, 10, 20, rl.Color.DARKBLUE); break;
        default: break;
      }

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texture);
  models.forEach(rl.Core.UnloadModel);

  rl.CloseWindowAndDispose();
}

MeshC GenMeshCustom(Raylib rl) {
  final mesh = rl.Temp.Mesh$.At('mesh');

  mesh.ref.triangleCount = 1;
  mesh.ref.vertexCount = mesh.ref.triangleCount*3;

  mesh.ref.vertices = rl.Temp.Float32$.Raw(mesh.ref.vertexCount*3);
  mesh.ref.texcoords = rl.Temp.Float32$.Raw(mesh.ref.vertexCount*2);
  mesh.ref.normals = rl.Temp.Float32$.Raw(mesh.ref.vertexCount*3);

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

  rl.Core.UploadMesh(mesh, false);

  return mesh.ref;
}
