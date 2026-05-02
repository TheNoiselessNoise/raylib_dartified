// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_point_rendering.c
// Run it: dart run models_point_rendering.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_POINTS = 10_000_000;
const int MIN_POINTS = 1_000;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_point_rendering".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(3, 3, 3);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final position = rl.Temp.Vector3$.At('position');
  bool useDrawModelPoints = true;
  bool numPointsChanged = false;
  int numPoints = 1000;
    
  var mesh = GenMeshPoints(rl, numPoints);
  var model = rl.Core.LoadModelFromMesh(mesh);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_SPACE.value))
      useDrawModelPoints = !useDrawModelPoints;
    
    var newPoints = numPoints;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_UP.value))
      newPoints = (numPoints*10 > MAX_POINTS) ? MAX_POINTS : numPoints*10;
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_DOWN.value))
      newPoints = (numPoints/10 < MIN_POINTS) ? MIN_POINTS : numPoints~/10;
    numPointsChanged = newPoints != numPoints;
    numPoints = newPoints;

    if (numPointsChanged) {
      rl.Core.UnloadModel(model);
      mesh = GenMeshPoints(rl, numPoints);
      model = rl.Core.LoadModelFromMesh(mesh);
      numPointsChanged = false;
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.BLACK);

      rl.Core.BeginMode3D(camera.ref);

        if (useDrawModelPoints)
        {
          rl.Core.DrawModelPoints(model, position.ref, 1.0, rl.C.WHITE);
        }
        else
        {
          for (int i = 0; i < numPoints; i++)
          {
            rl.Core.DrawPoint3D(
              rl.Temp.vec31(
                mesh.vertices[i*3 + 0],
                mesh.vertices[i*3 + 1],
                mesh.vertices[i*3 + 2],
              ),
              rl.Temp.color1(
                mesh.colors[i*4 + 0],
                mesh.colors[i*4 + 1],
                mesh.colors[i*4 + 2],
                mesh.colors[i*4 + 3],
              )
            );
          }
        }

        rl.Core.DrawSphereWires(position.ref, 1.0, 10, 10, rl.C.YELLOW);
          
      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Point Count: $numPoints".toC,
        20, screenHeight - 50, 40, rl.C.WHITE
      );
      rl.Core.DrawText(
        "Up - increase points".toC,
        20, 70, 20, rl.C.WHITE
      );
      rl.Core.DrawText(
        "Down - decrease points".toC,
        20, 100, 20, rl.C.WHITE
      );
      rl.Core.DrawText(
        "Space - drawing function".toC,
        20, 130, 20, rl.C.WHITE
      );
      
      if (useDrawModelPoints) {
        rl.Core.DrawText(
          "Using: DrawModelPoints()".toC,
          20, 160, 20, rl.C.GREEN
        );
      } else {
        rl.Core.DrawText(
          "Using: DrawPoint3D()".toC,
          20, 160, 20, rl.C.RED
        );
      }
      
      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}

bool isFirst = true;
MeshC GenMeshPoints(Raylib rl, int numPoints)
{
  final vertices = <double>[];
  final colors = <int>[];

  // https://en.wikipedia.org/wiki/Spherical_coordinate_system
  for (int i = 0; i < numPoints; i++)
  {
    final theta = rl.PI*rl.rand();
    final phi = 2.0*rl.PI*rl.rand();
    final r = 10.0*rl.rand();
    
    vertices.addAll([
      r*math.sin(theta)*math.cos(phi),
      r*math.sin(theta)*math.sin(phi),
      r*math.cos(theta),
    ]);
    
    final color = rl.Core.ColorFromHSV(r*360.0, 1.0, 1.0);
    colors.addAll([color.r, color.g, color.b, color.a]);
  }

  // Free the Mesh* so next Mesh$.At allocates a fresh zeroed struct.
  // Reusing the same pointer would leave stale vboId from UploadMesh
  // causing a double free on the next UnloadModel.
  if (rl.Temp.Mesh$.Has('mesh')) rl.Temp.Mesh$.Free('mesh');

  final mesh = rl.Temp.Mesh$.At('mesh'); 
  mesh.ref.triangleCount = 1;
  mesh.ref.vertexCount = numPoints;
  mesh.ref.vertices = rl.Temp.Float$.RawArray(vertices);
  mesh.ref.colors = rl.Temp.UChar$.RawArray(colors);

  rl.Core.UploadMesh(mesh, false);

  return mesh.ref;
}
