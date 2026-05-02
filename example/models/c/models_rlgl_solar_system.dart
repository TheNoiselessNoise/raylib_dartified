// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_rlgl_solar_system.c
// Run it: dart run models_rlgl_solar_system.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_rlgl_solar_system".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(16, 16, 16);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  const double sunRadius = 4.0;
  const double earthRadius = 0.6;
  const double earthOrbitRadius = 8.0;
  const double moonRadius = 0.16;
  const double moonOrbitRadius = 1.5;

  double rotationSpeed = 0.2;
  double earthRotation = 0.0;
  double earthOrbitRotation = 0.0;
  double moonRotation = 0.0;
  double moonOrbitRotation = 0.0;

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    earthRotation += (5.0*rotationSpeed);
    earthOrbitRotation += (365/360.0*(5.0*rotationSpeed)*rotationSpeed);
    moonRotation += (2.0*rotationSpeed);
    moonOrbitRotation += (8.0*rotationSpeed);

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        rl.Rlgl.rlPushMatrix();
          rl.Rlgl.rlScalef(sunRadius, sunRadius, sunRadius);
          DrawSphereBasic(rl, rl.C.GOLD);
        rl.Rlgl.rlPopMatrix();

        rl.Rlgl.rlPushMatrix();
          rl.Rlgl.rlRotatef(earthOrbitRotation, 0.0, 1.0, 0.0);
          rl.Rlgl.rlTranslatef(earthOrbitRadius, 0.0, 0.0);

          rl.Rlgl.rlPushMatrix();
            rl.Rlgl.rlRotatef(earthRotation, 0.25, 1.0, 0.0);
            rl.Rlgl.rlScalef(earthRadius, earthRadius, earthRadius);

            DrawSphereBasic(rl, rl.C.BLUE);
          rl.Rlgl.rlPopMatrix();

          rl.Rlgl.rlRotatef(moonOrbitRotation, 0.0, 1.0, 0.0);
          rl.Rlgl.rlTranslatef(moonOrbitRadius, 0.0, 0.0);
          rl.Rlgl.rlRotatef(moonRotation, 0.0, 1.0, 0.0);
          rl.Rlgl.rlScalef(moonRadius, moonRadius, moonRadius);

          DrawSphereBasic(rl, rl.C.LIGHTGRAY);
        rl.Rlgl.rlPopMatrix();

        rl.Core.DrawCircle3D(
          rl.Temp.vec3Zero,
          earthOrbitRadius,
          rl.Temp.vec31(1, 0, 0),
          90.0,
          rl.Core.Fade(rl.C.RED, 0.5)
        );
        rl.Core.DrawGrid(20, 1.0);

      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "EARTH ORBITING AROUND THE SUN!".toC,
        400, 10, 20, rl.C.MAROON
      );
      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}

void DrawSphereBasic(Raylib rl, ColorC color) {
  int rings = 16;
  int slices = 16;

  rl.Rlgl.rlCheckRenderBatchLimit((rings + 2)*slices*6);

  rl.Rlgl.rlBegin(RlDrawMode.RL_TRIANGLES.value);
    rl.Rlgl.rlColor4ub(color.r, color.g, color.b, color.a);

    for (int i = 0; i < (rings + 2); i++)
    {
      for (int j = 0; j < slices; j++)
      {
        rl.Rlgl.rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*i))*math.sin(rl.DEG2RAD*(j*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*i)),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*i))*math.cos(rl.DEG2RAD*(j*360/slices)));
        rl.Rlgl.rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.sin(rl.DEG2RAD*((j+1)*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1))),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.cos(rl.DEG2RAD*((j+1)*360/slices)));
        rl.Rlgl.rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.sin(rl.DEG2RAD*(j*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1))),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.cos(rl.DEG2RAD*(j*360/slices)));

        rl.Rlgl.rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*i))*math.sin(rl.DEG2RAD*(j*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*i)),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*i))*math.cos(rl.DEG2RAD*(j*360/slices)));
        rl.Rlgl.rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i)))*math.sin(rl.DEG2RAD*((j+1)*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*(i))),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i)))*math.cos(rl.DEG2RAD*((j+1)*360/slices)));
        rl.Rlgl.rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.sin(rl.DEG2RAD*((j+1)*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1))),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.cos(rl.DEG2RAD*((j+1)*360/slices)));
      }
    }
  rl.Rlgl.rlEnd();
}
