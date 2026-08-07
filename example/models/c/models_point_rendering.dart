// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_point_rendering.c
// Run it: dart run models_point_rendering.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_POINTS = 10_000_000;
const int MIN_POINTS = 1_000;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_point_rendering".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(3, 3, 3);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final position = Vector3$.At('position');
  bool useDrawModelPoints = true;
  bool numPointsChanged = false;
  int numPoints = 1000;
    
  var mesh = GenMeshPoints(numPoints);
  var model = LoadModelFromMesh(mesh);

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value))
      useDrawModelPoints = !useDrawModelPoints;
    
    var newPoints = numPoints;
    if (IsKeyPressed(KeyboardKey.KEY_UP.value))
      newPoints = (numPoints*10 > MAX_POINTS) ? MAX_POINTS : numPoints*10;
    if (IsKeyPressed(KeyboardKey.KEY_DOWN.value))
      newPoints = (numPoints/10 < MIN_POINTS) ? MIN_POINTS : numPoints~/10;
    numPointsChanged = newPoints != numPoints;
    numPoints = newPoints;

    if (numPointsChanged) {
      UnloadModel(model);
      mesh = GenMeshPoints(numPoints);
      model = LoadModelFromMesh(mesh);
      numPointsChanged = false;
    }

    BeginDrawing();

      ClearBackground(BLACK);

      BeginMode3D(camera.ref);

        if (useDrawModelPoints)
        {
          DrawModelPoints(model, position.ref, 1.0, WHITE);
        }
        else
        {
          for (int i = 0; i < numPoints; i++)
          {
            DrawPoint3D(
              Vector3$.$1.set(
                mesh.vertices[i*3 + 0],
                mesh.vertices[i*3 + 1],
                mesh.vertices[i*3 + 2],
              ),
              Color$.$1.set(
                mesh.colors[i*4 + 0],
                mesh.colors[i*4 + 1],
                mesh.colors[i*4 + 2],
                mesh.colors[i*4 + 3],
              )
            );
          }
        }

        DrawSphereWires(position.ref, 1.0, 10, 10, YELLOW);
          
      EndMode3D();

      DrawText(
        "Point Count: $numPoints".toC,
        20, screenHeight - 50, 40, WHITE
      );
      DrawText(
        "Up - increase points".toC,
        20, 70, 20, WHITE
      );
      DrawText(
        "Down - decrease points".toC,
        20, 100, 20, WHITE
      );
      DrawText(
        "Space - drawing function".toC,
        20, 130, 20, WHITE
      );
      
      if (useDrawModelPoints) {
        DrawText(
          "Using: DrawModelPoints()".toC,
          20, 160, 20, GREEN
        );
      } else {
        DrawText(
          "Using: DrawPoint3D()".toC,
          20, 160, 20, RED
        );
      }
      
      DrawFPS(10, 10);

    EndDrawing();
  }

  UnloadModel(model);
  
  CloseWindowAndDispose();
}

MeshC GenMeshPoints(int numPoints)
{
  final vertices = <double>[];
  final colors = <int>[];

  // https://en.wikipedia.org/wiki/Spherical_coordinate_system
  for (int i = 0; i < numPoints; i++)
  {
    final theta = PI*rl.rand();
    final phi = 2.0*PI*rl.rand();
    final r = 10.0*rl.rand();
    
    vertices.addAll([
      r*math.sin(theta)*math.cos(phi),
      r*math.sin(theta)*math.sin(phi),
      r*math.cos(theta),
    ]);
    
    final color = ColorFromHSV(r*360.0, 1.0, 1.0);
    colors.addAll([color.r, color.g, color.b, color.a]);
  }

  // Free the Mesh* so next Mesh$.At allocates a fresh zeroed struct.
  // Reusing the same pointer would leave stale vboId from UploadMesh
  // causing a double free on the next UnloadModel.
  if (Mesh$.Has('mesh')) Mesh$.Free('mesh');

  final mesh = Mesh$.At('mesh'); 
  mesh.ref.triangleCount = 1;
  mesh.ref.vertexCount = numPoints;
  mesh.ref.vertices = Float32$.RawArray(vertices);
  mesh.ref.colors = UnsignedChar$.RawArray(colors);

  UploadMesh(mesh, false);

  return mesh.ref;
}

void DrawModelPoints(ModelC model, Vector3C position, double scale, ColorC tint)
{
  rlEnablePointMode();
  rlDisableBackfaceCulling();

  DrawModel(model, position, scale, tint);

  rlEnableBackfaceCulling();
  rlDisablePointMode();
}