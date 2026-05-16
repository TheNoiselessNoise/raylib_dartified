// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_draw_cube_texture.c
// Run it: dart run models_draw_cube_texture.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_draw_cube_texture".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(0, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final texture = rl.Core.LoadTexture("../resources/cubicmap_atlas.png".toC);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

        DrawCubeTexture(rl, texture, .vec3(-2.0, 2.0, 0.0), 2.0, 4.0, 2.0, rl.Color.WHITE);

        DrawCubeTextureRec(rl, texture, .rect(0.0, texture.height/2.0, texture.width/2.0, texture.height/2.0), 
          .vec3(2.0, 1.0, 0.0), 2.0, 2.0, 2.0, rl.Color.WHITE);

        rl.Core.DrawGrid(10, 1.0);

      rl.Core.EndMode3D();

      rl.Core.DrawFPS(10, 10);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texture);
  
  rl.CloseWindowAndDispose();
}

void DrawCubeTexture(
  Raylib rl,
  TextureC texture,
  Vector3D position,
  double width,
  double height,
  double length,
  ColorC color
) {
  final x = position.x;
  final y = position.y;
  final z = position.z;

  rl.Rlgl.rlSetTexture(texture.id);

  rl.Rlgl.rlBegin(RlDrawMode.RL_QUADS.value);
    rl.Rlgl.rlColor4ub(color.r, color.g, color.b, color.a);
    // Front Face
    rl.Rlgl.rlNormal3f(0.0, 0.0, 1.0);
    rl.Rlgl.rlTexCoord2f(0.0, 0.0); rl.Rlgl.rlVertex3f(x - width/2, y - height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f(1.0, 0.0); rl.Rlgl.rlVertex3f(x + width/2, y - height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f(1.0, 1.0); rl.Rlgl.rlVertex3f(x + width/2, y + height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f(0.0, 1.0); rl.Rlgl.rlVertex3f(x - width/2, y + height/2, z + length/2);
    // Back Face
    rl.Rlgl.rlNormal3f(0.0, 0.0, - 1.0);
    rl.Rlgl.rlTexCoord2f(1.0, 0.0); rl.Rlgl.rlVertex3f(x - width/2, y - height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(1.0, 1.0); rl.Rlgl.rlVertex3f(x - width/2, y + height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(0.0, 1.0); rl.Rlgl.rlVertex3f(x + width/2, y + height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(0.0, 0.0); rl.Rlgl.rlVertex3f(x + width/2, y - height/2, z - length/2);
    // Top Face
    rl.Rlgl.rlNormal3f(0.0, 1.0, 0.0);
    rl.Rlgl.rlTexCoord2f(0.0, 1.0); rl.Rlgl.rlVertex3f(x - width/2, y + height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(0.0, 0.0); rl.Rlgl.rlVertex3f(x - width/2, y + height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f(1.0, 0.0); rl.Rlgl.rlVertex3f(x + width/2, y + height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f(1.0, 1.0); rl.Rlgl.rlVertex3f(x + width/2, y + height/2, z - length/2);
    // Bottom Face
    rl.Rlgl.rlNormal3f(0.0, - 1.0, 0.0);
    rl.Rlgl.rlTexCoord2f(1.0, 1.0); rl.Rlgl.rlVertex3f(x - width/2, y - height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(0.0, 1.0); rl.Rlgl.rlVertex3f(x + width/2, y - height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(0.0, 0.0); rl.Rlgl.rlVertex3f(x + width/2, y - height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f(1.0, 0.0); rl.Rlgl.rlVertex3f(x - width/2, y - height/2, z + length/2);
    // Right face
    rl.Rlgl.rlNormal3f(1.0, 0.0, 0.0);
    rl.Rlgl.rlTexCoord2f(1.0, 0.0); rl.Rlgl.rlVertex3f(x + width/2, y - height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(1.0, 1.0); rl.Rlgl.rlVertex3f(x + width/2, y + height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(0.0, 1.0); rl.Rlgl.rlVertex3f(x + width/2, y + height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f(0.0, 0.0); rl.Rlgl.rlVertex3f(x + width/2, y - height/2, z + length/2);
    // Left Face
    rl.Rlgl.rlNormal3f( - 1.0, 0.0, 0.0);
    rl.Rlgl.rlTexCoord2f(0.0, 0.0); rl.Rlgl.rlVertex3f(x - width/2, y - height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(1.0, 0.0); rl.Rlgl.rlVertex3f(x - width/2, y - height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f(1.0, 1.0); rl.Rlgl.rlVertex3f(x - width/2, y + height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f(0.0, 1.0); rl.Rlgl.rlVertex3f(x - width/2, y + height/2, z - length/2);
  rl.Rlgl.rlEnd();

  rl.Rlgl.rlSetTexture(0);
}

void DrawCubeTextureRec(
  Raylib rl,
  TextureC texture,
  RectangleD source,
  Vector3D position,
  double width,
  double height,
  double length,
  ColorC color
) {
  final x = position.x;
  final y = position.y;
  final z = position.z;
  final texWidth = texture.width.toDouble();
  final texHeight = texture.height.toDouble();

  rl.Rlgl.rlSetTexture(texture.id);

  rl.Rlgl.rlBegin(RlDrawMode.RL_QUADS.value);
    rl.Rlgl.rlColor4ub(color.r, color.g, color.b, color.a);

    // Front face
    rl.Rlgl.rlNormal3f(0.0, 0.0, 1.0);
    rl.Rlgl.rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rl.Rlgl.rlVertex3f(x - width/2, y - height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rl.Rlgl.rlVertex3f(x + width/2, y - height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rl.Rlgl.rlVertex3f(x + width/2, y + height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rl.Rlgl.rlVertex3f(x - width/2, y + height/2, z + length/2);

    // Back face
    rl.Rlgl.rlNormal3f(0.0, 0.0, - 1.0);
    rl.Rlgl.rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rl.Rlgl.rlVertex3f(x - width/2, y - height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rl.Rlgl.rlVertex3f(x - width/2, y + height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rl.Rlgl.rlVertex3f(x + width/2, y + height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rl.Rlgl.rlVertex3f(x + width/2, y - height/2, z - length/2);

    // Top face
    rl.Rlgl.rlNormal3f(0.0, 1.0, 0.0);
    rl.Rlgl.rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rl.Rlgl.rlVertex3f(x - width/2, y + height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rl.Rlgl.rlVertex3f(x - width/2, y + height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rl.Rlgl.rlVertex3f(x + width/2, y + height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rl.Rlgl.rlVertex3f(x + width/2, y + height/2, z - length/2);

    // Bottom face
    rl.Rlgl.rlNormal3f(0.0, - 1.0, 0.0);
    rl.Rlgl.rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rl.Rlgl.rlVertex3f(x - width/2, y - height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rl.Rlgl.rlVertex3f(x + width/2, y - height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rl.Rlgl.rlVertex3f(x + width/2, y - height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rl.Rlgl.rlVertex3f(x - width/2, y - height/2, z + length/2);

    // Right face
    rl.Rlgl.rlNormal3f(1.0, 0.0, 0.0);
    rl.Rlgl.rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rl.Rlgl.rlVertex3f(x + width/2, y - height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rl.Rlgl.rlVertex3f(x + width/2, y + height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rl.Rlgl.rlVertex3f(x + width/2, y + height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rl.Rlgl.rlVertex3f(x + width/2, y - height/2, z + length/2);

    // Left face
    rl.Rlgl.rlNormal3f( - 1.0, 0.0, 0.0);
    rl.Rlgl.rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rl.Rlgl.rlVertex3f(x - width/2, y - height/2, z - length/2);
    rl.Rlgl.rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rl.Rlgl.rlVertex3f(x - width/2, y - height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rl.Rlgl.rlVertex3f(x - width/2, y + height/2, z + length/2);
    rl.Rlgl.rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rl.Rlgl.rlVertex3f(x - width/2, y + height/2, z - length/2);

  rl.Rlgl.rlEnd();

  rl.Rlgl.rlSetTexture(0);
}