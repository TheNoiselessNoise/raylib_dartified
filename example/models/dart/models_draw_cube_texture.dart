// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/c1ab645ca298a2801097931d1079b10ff7eb9df8/examples/models/models_draw_cube_texture.c
// Run it: dart run models_draw_cube_texture.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_draw_cube_texture");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(0, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final texture = rl.CoreD.LoadTexture("../resources/cubicmap_atlas.png");

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

        DrawCubeTexture(rl, texture, .vec3(-2.0, 2.0, 0.0), 2.0, 4.0, 2.0, .WHITE);

        DrawCubeTextureRec(rl, texture, .rect(0.0, texture.height/2.0, texture.width/2.0, texture.height/2.0), 
          .vec3(2.0, 1.0, 0.0), 2.0, 2.0, 2.0, .WHITE);

        rl.CoreD.DrawGrid(10, 1.0);

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawFPS(10, 10);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texture);
  
  rl.CloseWindowAndDispose();
}

void DrawCubeTexture(
  Raylib rl,
  TextureD texture,
  Vector3D position,
  double width,
  double height,
  double length,
  ColorD color
) {
  final x = position.x;
  final y = position.y;
  final z = position.z;

  rl.RlglD.rlSetTexture(texture.id);

  rl.RlglD.rlBegin(.RL_QUADS);
    rl.RlglD.rlColor4ub(color.r, color.g, color.b, color.a);
    // Front Face
    rl.RlglD.rlNormal3f(0.0, 0.0, 1.0);
    rl.RlglD.rlTexCoord2f(0.0, 0.0); rl.RlglD.rlVertex3f(x - width/2, y - height/2, z + length/2);
    rl.RlglD.rlTexCoord2f(1.0, 0.0); rl.RlglD.rlVertex3f(x + width/2, y - height/2, z + length/2);
    rl.RlglD.rlTexCoord2f(1.0, 1.0); rl.RlglD.rlVertex3f(x + width/2, y + height/2, z + length/2);
    rl.RlglD.rlTexCoord2f(0.0, 1.0); rl.RlglD.rlVertex3f(x - width/2, y + height/2, z + length/2);
    // Back Face
    rl.RlglD.rlNormal3f(0.0, 0.0, - 1.0);
    rl.RlglD.rlTexCoord2f(1.0, 0.0); rl.RlglD.rlVertex3f(x - width/2, y - height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(1.0, 1.0); rl.RlglD.rlVertex3f(x - width/2, y + height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(0.0, 1.0); rl.RlglD.rlVertex3f(x + width/2, y + height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(0.0, 0.0); rl.RlglD.rlVertex3f(x + width/2, y - height/2, z - length/2);
    // Top Face
    rl.RlglD.rlNormal3f(0.0, 1.0, 0.0);
    rl.RlglD.rlTexCoord2f(0.0, 1.0); rl.RlglD.rlVertex3f(x - width/2, y + height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(0.0, 0.0); rl.RlglD.rlVertex3f(x - width/2, y + height/2, z + length/2);
    rl.RlglD.rlTexCoord2f(1.0, 0.0); rl.RlglD.rlVertex3f(x + width/2, y + height/2, z + length/2);
    rl.RlglD.rlTexCoord2f(1.0, 1.0); rl.RlglD.rlVertex3f(x + width/2, y + height/2, z - length/2);
    // Bottom Face
    rl.RlglD.rlNormal3f(0.0, - 1.0, 0.0);
    rl.RlglD.rlTexCoord2f(1.0, 1.0); rl.RlglD.rlVertex3f(x - width/2, y - height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(0.0, 1.0); rl.RlglD.rlVertex3f(x + width/2, y - height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(0.0, 0.0); rl.RlglD.rlVertex3f(x + width/2, y - height/2, z + length/2);
    rl.RlglD.rlTexCoord2f(1.0, 0.0); rl.RlglD.rlVertex3f(x - width/2, y - height/2, z + length/2);
    // Right face
    rl.RlglD.rlNormal3f(1.0, 0.0, 0.0);
    rl.RlglD.rlTexCoord2f(1.0, 0.0); rl.RlglD.rlVertex3f(x + width/2, y - height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(1.0, 1.0); rl.RlglD.rlVertex3f(x + width/2, y + height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(0.0, 1.0); rl.RlglD.rlVertex3f(x + width/2, y + height/2, z + length/2);
    rl.RlglD.rlTexCoord2f(0.0, 0.0); rl.RlglD.rlVertex3f(x + width/2, y - height/2, z + length/2);
    // Left Face
    rl.RlglD.rlNormal3f( - 1.0, 0.0, 0.0);
    rl.RlglD.rlTexCoord2f(0.0, 0.0); rl.RlglD.rlVertex3f(x - width/2, y - height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(1.0, 0.0); rl.RlglD.rlVertex3f(x - width/2, y - height/2, z + length/2);
    rl.RlglD.rlTexCoord2f(1.0, 1.0); rl.RlglD.rlVertex3f(x - width/2, y + height/2, z + length/2);
    rl.RlglD.rlTexCoord2f(0.0, 1.0); rl.RlglD.rlVertex3f(x - width/2, y + height/2, z - length/2);
  rl.RlglD.rlEnd();

  rl.RlglD.rlSetTexture(0);
}

void DrawCubeTextureRec(
  Raylib rl,
  TextureD texture,
  RectangleD source,
  Vector3D position,
  double width,
  double height,
  double length,
  ColorD color
) {
  final x = position.x;
  final y = position.y;
  final z = position.z;
  final texWidth = texture.width.toDouble();
  final texHeight = texture.height.toDouble();

  rl.RlglD.rlSetTexture(texture.id);

  rl.RlglD.rlBegin(.RL_QUADS);
    rl.RlglD.rlColor4ub(color.r, color.g, color.b, color.a);

    // Front face
    rl.RlglD.rlNormal3f(0.0, 0.0, 1.0);
    rl.RlglD.rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rl.RlglD.rlVertex3f(x - width/2, y - height/2, z + length/2);
    rl.RlglD.rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rl.RlglD.rlVertex3f(x + width/2, y - height/2, z + length/2);
    rl.RlglD.rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rl.RlglD.rlVertex3f(x + width/2, y + height/2, z + length/2);
    rl.RlglD.rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rl.RlglD.rlVertex3f(x - width/2, y + height/2, z + length/2);

    // Back face
    rl.RlglD.rlNormal3f(0.0, 0.0, - 1.0);
    rl.RlglD.rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rl.RlglD.rlVertex3f(x - width/2, y - height/2, z - length/2);
    rl.RlglD.rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rl.RlglD.rlVertex3f(x - width/2, y + height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rl.RlglD.rlVertex3f(x + width/2, y + height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rl.RlglD.rlVertex3f(x + width/2, y - height/2, z - length/2);

    // Top face
    rl.RlglD.rlNormal3f(0.0, 1.0, 0.0);
    rl.RlglD.rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rl.RlglD.rlVertex3f(x - width/2, y + height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rl.RlglD.rlVertex3f(x - width/2, y + height/2, z + length/2);
    rl.RlglD.rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rl.RlglD.rlVertex3f(x + width/2, y + height/2, z + length/2);
    rl.RlglD.rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rl.RlglD.rlVertex3f(x + width/2, y + height/2, z - length/2);

    // Bottom face
    rl.RlglD.rlNormal3f(0.0, - 1.0, 0.0);
    rl.RlglD.rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rl.RlglD.rlVertex3f(x - width/2, y - height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rl.RlglD.rlVertex3f(x + width/2, y - height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rl.RlglD.rlVertex3f(x + width/2, y - height/2, z + length/2);
    rl.RlglD.rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rl.RlglD.rlVertex3f(x - width/2, y - height/2, z + length/2);

    // Right face
    rl.RlglD.rlNormal3f(1.0, 0.0, 0.0);
    rl.RlglD.rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rl.RlglD.rlVertex3f(x + width/2, y - height/2, z - length/2);
    rl.RlglD.rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rl.RlglD.rlVertex3f(x + width/2, y + height/2, z - length/2);
    rl.RlglD.rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rl.RlglD.rlVertex3f(x + width/2, y + height/2, z + length/2);
    rl.RlglD.rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rl.RlglD.rlVertex3f(x + width/2, y - height/2, z + length/2);

    // Left face
    rl.RlglD.rlNormal3f( - 1.0, 0.0, 0.0);
    rl.RlglD.rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rl.RlglD.rlVertex3f(x - width/2, y - height/2, z - length/2);
    rl.RlglD.rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rl.RlglD.rlVertex3f(x - width/2, y - height/2, z + length/2);
    rl.RlglD.rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rl.RlglD.rlVertex3f(x - width/2, y + height/2, z + length/2);
    rl.RlglD.rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rl.RlglD.rlVertex3f(x - width/2, y + height/2, z - length/2);

  rl.RlglD.rlEnd();

  rl.RlglD.rlSetTexture(0);
}