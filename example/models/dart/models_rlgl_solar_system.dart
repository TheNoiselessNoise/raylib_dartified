// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_rlgl_solar_system.c
// Run it: dart run models_rlgl_solar_system.dart
import 'dart:math' as math;
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_rlgl_solar_system");
  SetTargetFPS(60);

  final camera = Camera3DD(
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

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    earthRotation += (5.0*rotationSpeed);
    earthOrbitRotation += (365/360.0*(5.0*rotationSpeed)*rotationSpeed);
    moonRotation += (2.0*rotationSpeed);
    moonOrbitRotation += (8.0*rotationSpeed);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        rlPushMatrix();
          rlScalef(sunRadius, sunRadius, sunRadius);
          DrawSphereBasic(.GOLD);
        rlPopMatrix();

        rlPushMatrix();
          rlRotatef(earthOrbitRotation, 0.0, 1.0, 0.0);
          rlTranslatef(earthOrbitRadius, 0.0, 0.0);

          rlPushMatrix();
            rlRotatef(earthRotation, 0.25, 1.0, 0.0);
            rlScalef(earthRadius, earthRadius, earthRadius);

            DrawSphereBasic(.BLUE);
          rlPopMatrix();

          rlRotatef(moonOrbitRotation, 0.0, 1.0, 0.0);
          rlTranslatef(moonOrbitRadius, 0.0, 0.0);
          rlRotatef(moonRotation, 0.0, 1.0, 0.0);
          rlScalef(moonRadius, moonRadius, moonRadius);

          DrawSphereBasic(.LIGHTGRAY);
        rlPopMatrix();

        DrawCircle3D(
          .zero(),
          earthOrbitRadius,
          .vec3(1, 0, 0),
          90.0,
          Fade(.RED, 0.5)
        );
        DrawGrid(20, 1.0);

      EndMode3D();

      DrawText(
        "EARTH ORBITING AROUND THE SUN!",
        400, 10, 20, .MAROON
      );
      DrawFPS(10, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void DrawSphereBasic(ColorD color) {
  int rings = 16;
  int slices = 16;

  rlCheckRenderBatchLimit((rings + 2)*slices*6);

  rlBegin(.RL_TRIANGLES);
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
