// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_point_rendering.c
// Run it: dart run models_point_rendering.dart
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_POINTS = 10_000_000;
const int MIN_POINTS = 1_000;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_point_rendering");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(3, 3, 3),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final Vector3D position = .zero();
  bool useDrawModelPoints = true;
  bool numPointsChanged = false;
  int numPoints = 1000;
  
  MeshD mesh = GenMeshPoints(rl, numPoints);
  var model = rl.CoreD.LoadModelFromMesh(mesh);

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    if (rl.CoreD.IsKeyPressed(.KEY_SPACE))
      useDrawModelPoints = !useDrawModelPoints;
    
    var newPoints = numPoints;
    if (rl.CoreD.IsKeyPressed(.KEY_UP))
      newPoints = (numPoints*10 > MAX_POINTS) ? MAX_POINTS : numPoints*10;
    if (rl.CoreD.IsKeyPressed(.KEY_DOWN))
      newPoints = (numPoints/10 < MIN_POINTS) ? MIN_POINTS : numPoints~/10;
    numPointsChanged = newPoints != numPoints;
    numPoints = newPoints;

    if (numPointsChanged) {
      rl.CoreD.UnloadModel(model);
      mesh = GenMeshPoints(rl, numPoints);
      model = rl.CoreD.LoadModelFromMesh(mesh);
      numPointsChanged = false;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.BLACK);

      rl.CoreD.BeginMode3D(camera);

        if (useDrawModelPoints)
        {
          rl.CoreD.DrawModelPoints(model, position, 1.0, .WHITE);
        }
        else
        {
          for (int i = 0; i < numPoints; i++)
          {
            rl.CoreD.DrawPoint3D(
              .vec3(
                mesh.vertices[i*3 + 0],
                mesh.vertices[i*3 + 1],
                mesh.vertices[i*3 + 2],
              ),
              .color(
                mesh.colors[i*4 + 0],
                mesh.colors[i*4 + 1],
                mesh.colors[i*4 + 2],
                mesh.colors[i*4 + 3],
              )
            );
          }
        }

        rl.CoreD.DrawSphereWires(position, 1.0, 10, 10, .YELLOW);
          
      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Point Count: $numPoints",
        20, screenHeight - 50, 40, .WHITE
      );
      rl.CoreD.DrawText(
        "Up - increase points",
        20, 70, 20, .WHITE
      );
      rl.CoreD.DrawText(
        "Down - decrease points",
        20, 100, 20, .WHITE
      );
      rl.CoreD.DrawText(
        "Space - drawing function",
        20, 130, 20, .WHITE
      );
      
      if (useDrawModelPoints) {
        rl.CoreD.DrawText(
          "Using: DrawModelPoints()",
          20, 160, 20, .GREEN
        );
      } else {
        rl.CoreD.DrawText(
          "Using: DrawPoint3D()",
          20, 160, 20, .RED
        );
      }
      
      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadModel(model);
  
  rl.CloseWindowAndDispose();
}

MeshD GenMeshPoints(Raylib rl, int numPoints)
{
  final MeshD sourceMesh = .new();
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
    
    final color = rl.CoreD.ColorFromHSV(r*360.0, 1.0, 1.0);
    colors.addAll(color.toArray());
  }

  sourceMesh.triangleCount = 1;
  sourceMesh.vertexCount = numPoints;
  sourceMesh.vertices = vertices;
  sourceMesh.colors = colors;

  rl.CoreD.UploadMesh(sourceMesh, false);

  return sourceMesh;
}
