// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_rlgl_solar_system.c
// Run it: dart run models_rlgl_solar_system.dart
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_rlgl_solar_system".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
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

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    earthRotation += (5.0*rotationSpeed);
    earthOrbitRotation += (365/360.0*(5.0*rotationSpeed)*rotationSpeed);
    moonRotation += (2.0*rotationSpeed);
    moonOrbitRotation += (8.0*rotationSpeed);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        rlPushMatrix();
          rlScalef(sunRadius, sunRadius, sunRadius);
          DrawSphereBasic(GOLD);
        rlPopMatrix();

        rlPushMatrix();
          rlRotatef(earthOrbitRotation, 0.0, 1.0, 0.0);
          rlTranslatef(earthOrbitRadius, 0.0, 0.0);

          rlPushMatrix();
            rlRotatef(earthRotation, 0.25, 1.0, 0.0);
            rlScalef(earthRadius, earthRadius, earthRadius);

            DrawSphereBasic(BLUE);
          rlPopMatrix();

          rlRotatef(moonOrbitRotation, 0.0, 1.0, 0.0);
          rlTranslatef(moonOrbitRadius, 0.0, 0.0);
          rlRotatef(moonRotation, 0.0, 1.0, 0.0);
          rlScalef(moonRadius, moonRadius, moonRadius);

          DrawSphereBasic(LIGHTGRAY);
        rlPopMatrix();

        DrawCircle3D(
          Vector3$.val.$zero,
          earthOrbitRadius,
          Vector3$.val.$1.set(1, 0, 0),
          90.0,
          Fade(RED, 0.5)
        );
        DrawGrid(20, 1.0);

      EndMode3D();

      DrawText(
        "EARTH ORBITING AROUND THE SUN!".toC,
        400, 10, 20, MAROON
      );
      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void DrawSphereBasic(ColorC color) {
  int rings = 16;
  int slices = 16;

  rlCheckRenderBatchLimit((rings + 2)*slices*6);

  rlBegin(RlDrawMode.RL_TRIANGLES.value);
    rlColor4ub(color.r, color.g, color.b, color.a);

    for (int i = 0; i < (rings + 2); i++)
    {
      for (int j = 0; j < slices; j++)
      {
        rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*i))*math.sin(rl.DEG2RAD*(j*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*i)),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*i))*math.cos(rl.DEG2RAD*(j*360/slices)));
        rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.sin(rl.DEG2RAD*((j+1)*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1))),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.cos(rl.DEG2RAD*((j+1)*360/slices)));
        rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.sin(rl.DEG2RAD*(j*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1))),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.cos(rl.DEG2RAD*(j*360/slices)));

        rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*i))*math.sin(rl.DEG2RAD*(j*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*i)),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*i))*math.cos(rl.DEG2RAD*(j*360/slices)));
        rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i)))*math.sin(rl.DEG2RAD*((j+1)*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*(i))),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i)))*math.cos(rl.DEG2RAD*((j+1)*360/slices)));
        rlVertex3f(
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.sin(rl.DEG2RAD*((j+1)*360/slices)),
          math.sin(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1))),
          math.cos(rl.DEG2RAD*(270+(180/(rings + 1))*(i+1)))*math.cos(rl.DEG2RAD*((j+1)*360/slices)));
      }
    }
  rlEnd();
}
