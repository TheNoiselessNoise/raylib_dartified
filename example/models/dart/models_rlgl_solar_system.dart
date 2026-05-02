// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_rlgl_solar_system.c
// Run it: dart run models_rlgl_solar_system.dart
// WARNING: expects resources from the raylib source
import 'dart:math' as math;
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_rlgl_solar_system");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = CameraD(
    position: .vec3(16, 16, 16),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

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

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_ORBITAL);

    earthRotation += (5.0*rotationSpeed);
    earthOrbitRotation += (365/360.0*(5.0*rotationSpeed)*rotationSpeed);
    moonRotation += (2.0*rotationSpeed);
    moonOrbitRotation += (8.0*rotationSpeed);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        rl.RlglD.rlPushMatrix();
          rl.RlglD.rlScalef(sunRadius, sunRadius, sunRadius);
          DrawSphereBasic(rl, rl.C.GOLD);
        rl.RlglD.rlPopMatrix();

        rl.RlglD.rlPushMatrix();
          rl.RlglD.rlRotatef(earthOrbitRotation, 0.0, 1.0, 0.0);
          rl.RlglD.rlTranslatef(earthOrbitRadius, 0.0, 0.0);

          rl.RlglD.rlPushMatrix();
            rl.RlglD.rlRotatef(earthRotation, 0.25, 1.0, 0.0);
            rl.RlglD.rlScalef(earthRadius, earthRadius, earthRadius);

            DrawSphereBasic(rl, rl.C.BLUE);
          rl.RlglD.rlPopMatrix();

          rl.RlglD.rlRotatef(moonOrbitRotation, 0.0, 1.0, 0.0);
          rl.RlglD.rlTranslatef(moonOrbitRadius, 0.0, 0.0);
          rl.RlglD.rlRotatef(moonRotation, 0.0, 1.0, 0.0);
          rl.RlglD.rlScalef(moonRadius, moonRadius, moonRadius);

          DrawSphereBasic(rl, rl.C.LIGHTGRAY);
        rl.RlglD.rlPopMatrix();

        rl.CoreD.DrawCircle3D(
          .zero(),
          earthOrbitRadius,
          .vec3(1, 0, 0),
          90.0,
          rl.CoreD.Fade(.RED, 0.5)
        );
        rl.CoreD.DrawGrid(20, 1.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "EARTH ORBITING AROUND THE SUN!",
        400, 10, 20, .MAROON
      );
      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}

void DrawSphereBasic(Raylib rl, ColorC color) {
  int rings = 16;
  int slices = 16;

  rl.RlglD.rlCheckRenderBatchLimit((rings + 2)*slices*6);

  rl.RlglD.rlBegin(.RL_TRIANGLES);
    rl.RlglD.rlColor4ub(color.r, color.g, color.b, color.a);

    for (int i = 0; i < (rings + 2); i++)
    {
      for (int j = 0; j < slices; j++)
      {
        rl.RlglD.rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*i))*math.sin(rl.DEG2RAD*(j*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*i)),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*i))*math.cos(rl.DEG2RAD*(j*360/slices)));
        rl.RlglD.rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.sin(rl.DEG2RAD*((j+1)*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1))),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.cos(rl.DEG2RAD*((j+1)*360/slices)));
        rl.RlglD.rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.sin(rl.DEG2RAD*(j*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1))),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.cos(rl.DEG2RAD*(j*360/slices)));

        rl.RlglD.rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*i))*math.sin(rl.DEG2RAD*(j*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*i)),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*i))*math.cos(rl.DEG2RAD*(j*360/slices)));
        rl.RlglD.rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i)))*math.sin(rl.DEG2RAD*((j+1)*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*(i))),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i)))*math.cos(rl.DEG2RAD*((j+1)*360/slices)));
        rl.RlglD.rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.sin(rl.DEG2RAD*((j+1)*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1))),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.cos(rl.DEG2RAD*((j+1)*360/slices)));
      }
    }
  rl.RlglD.rlEnd();
}
