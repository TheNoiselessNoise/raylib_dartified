// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_tesseract_view.c
// Run it: dart run models_tesseract_view.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_tesseract_view");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(4.0, 4.0, 4.0),
    target: .vec3(0.0, 0.0, 0.0),
    up: .vec3(0.0, 0.0, 1.0),
    fovy: 50,
    projection: .CAMERA_PERSPECTIVE,
  );

  List<Vector4D> tesseract = [
    .vec4(  1,  1,  1, 1 ), .vec4(  1,  1,  1, -1 ),
    .vec4(  1,  1, -1, 1 ), .vec4(  1,  1, -1, -1 ),
    .vec4(  1, -1,  1, 1 ), .vec4(  1, -1,  1, -1 ),
    .vec4(  1, -1, -1, 1 ), .vec4(  1, -1, -1, -1 ),
    .vec4( -1,  1,  1, 1 ), .vec4( -1,  1,  1, -1 ),
    .vec4( -1,  1, -1, 1 ), .vec4( -1,  1, -1, -1 ),
    .vec4( -1, -1,  1, 1 ), .vec4( -1, -1,  1, -1 ),
    .vec4( -1, -1, -1, 1 ), .vec4( -1, -1, -1, -1 ),
  ];

  double rotation = 0.0;
  List<Vector3D> transformed = .generate(16, (_) => .zero());
  List<double> wValues = .filled(16, 0);

  while (!WindowShouldClose())
  {
    rotation = DEG2RAD*45.0*GetTime();

    for (int i = 0; i < 16; i++)
    {
      final p = tesseract[i].copy();

      final rotXW = Vector2D.vec2(p.x, p.w).rotate(rotation);
      p.x = rotXW.x;
      p.w = rotXW.y;

      final c = 3.0/(3.0 - p.w);
      p.x = c*p.x;
      p.y = c*p.y;
      p.z = c*p.z;

      transformed[i] = .vec3(p.x, p.y, p.z);
      wValues[i] = p.w;
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera);
        for (int i = 0; i < 16; i++)
        {
          DrawSphere(
            transformed[i],
            (wValues[i]*0.1).abs(),
            RED
          );

          for (int j = 0; j < 16; j++)
          {
            final v1 = tesseract[i];
            final v2 = tesseract[j];
            int diff = (v1.x == v2.x).toInt() + (v1.y == v2.y).toInt() + (v1.z == v2.z).toInt() + (v1.w == v2.w).toInt();

            if (diff == 3 && i < j) DrawLine3D(
              transformed[i],
              transformed[j],
              MAROON
            );
          }
        }
      EndMode3D();

    EndDrawing();
  }

  CloseWindowAndDispose();
}