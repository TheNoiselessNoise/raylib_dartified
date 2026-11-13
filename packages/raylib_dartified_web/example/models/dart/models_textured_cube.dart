// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_textured_cube.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "models_textured_cube");
  SetTargetFPS(60);

  final camera = Camera3D(
    position: .vec3(0, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final texture = LoadTexture("../resources/cubicmap_atlas.png");

  rl.setMainLoop(() {
    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

        DrawCubeTexture(texture, .vec3(-2.0, 2.0, 0.0), 2.0, 4.0, 2.0, .WHITE);

        DrawCubeTextureRec(texture, .rect(0.0, texture.height/2.0, texture.width/2.0, texture.height/2.0), 
          .vec3(2.0, 1.0, 0.0), 2.0, 2.0, 2.0, .WHITE);

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawFPS(10, 10);

    EndDrawing();
  });
});

void DrawCubeTexture(
  Texture texture,
  Vector3 position,
  double width,
  double height,
  double length,
  Color color
) {
  final x = position.x;
  final y = position.y;
  final z = position.z;

  rlSetTexture(texture.id);

  rlBegin(.RL_QUADS);
    rlColor4ub(color.r, color.g, color.b, color.a);
    // Front Face
    rlNormal3f(0.0, 0.0, 1.0);
    rlTexCoord2f(0.0, 0.0); rlVertex3f(x - width/2, y - height/2, z + length/2);
    rlTexCoord2f(1.0, 0.0); rlVertex3f(x + width/2, y - height/2, z + length/2);
    rlTexCoord2f(1.0, 1.0); rlVertex3f(x + width/2, y + height/2, z + length/2);
    rlTexCoord2f(0.0, 1.0); rlVertex3f(x - width/2, y + height/2, z + length/2);
    // Back Face
    rlNormal3f(0.0, 0.0, - 1.0);
    rlTexCoord2f(1.0, 0.0); rlVertex3f(x - width/2, y - height/2, z - length/2);
    rlTexCoord2f(1.0, 1.0); rlVertex3f(x - width/2, y + height/2, z - length/2);
    rlTexCoord2f(0.0, 1.0); rlVertex3f(x + width/2, y + height/2, z - length/2);
    rlTexCoord2f(0.0, 0.0); rlVertex3f(x + width/2, y - height/2, z - length/2);
    // Top Face
    rlNormal3f(0.0, 1.0, 0.0);
    rlTexCoord2f(0.0, 1.0); rlVertex3f(x - width/2, y + height/2, z - length/2);
    rlTexCoord2f(0.0, 0.0); rlVertex3f(x - width/2, y + height/2, z + length/2);
    rlTexCoord2f(1.0, 0.0); rlVertex3f(x + width/2, y + height/2, z + length/2);
    rlTexCoord2f(1.0, 1.0); rlVertex3f(x + width/2, y + height/2, z - length/2);
    // Bottom Face
    rlNormal3f(0.0, - 1.0, 0.0);
    rlTexCoord2f(1.0, 1.0); rlVertex3f(x - width/2, y - height/2, z - length/2);
    rlTexCoord2f(0.0, 1.0); rlVertex3f(x + width/2, y - height/2, z - length/2);
    rlTexCoord2f(0.0, 0.0); rlVertex3f(x + width/2, y - height/2, z + length/2);
    rlTexCoord2f(1.0, 0.0); rlVertex3f(x - width/2, y - height/2, z + length/2);
    // Right face
    rlNormal3f(1.0, 0.0, 0.0);
    rlTexCoord2f(1.0, 0.0); rlVertex3f(x + width/2, y - height/2, z - length/2);
    rlTexCoord2f(1.0, 1.0); rlVertex3f(x + width/2, y + height/2, z - length/2);
    rlTexCoord2f(0.0, 1.0); rlVertex3f(x + width/2, y + height/2, z + length/2);
    rlTexCoord2f(0.0, 0.0); rlVertex3f(x + width/2, y - height/2, z + length/2);
    // Left Face
    rlNormal3f( - 1.0, 0.0, 0.0);
    rlTexCoord2f(0.0, 0.0); rlVertex3f(x - width/2, y - height/2, z - length/2);
    rlTexCoord2f(1.0, 0.0); rlVertex3f(x - width/2, y - height/2, z + length/2);
    rlTexCoord2f(1.0, 1.0); rlVertex3f(x - width/2, y + height/2, z + length/2);
    rlTexCoord2f(0.0, 1.0); rlVertex3f(x - width/2, y + height/2, z - length/2);
  rlEnd();

  rlSetTexture(0);
}

void DrawCubeTextureRec(
  Texture texture,
  Rectangle source,
  Vector3 position,
  double width,
  double height,
  double length,
  Color color
) {
  final x = position.x;
  final y = position.y;
  final z = position.z;
  final texWidth = texture.width.toDouble();
  final texHeight = texture.height.toDouble();

  rlSetTexture(texture.id);

  rlBegin(.RL_QUADS);
    rlColor4ub(color.r, color.g, color.b, color.a);

    // Front face
    rlNormal3f(0.0, 0.0, 1.0);
    rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rlVertex3f(x - width/2, y - height/2, z + length/2);
    rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rlVertex3f(x + width/2, y - height/2, z + length/2);
    rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rlVertex3f(x + width/2, y + height/2, z + length/2);
    rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rlVertex3f(x - width/2, y + height/2, z + length/2);

    // Back face
    rlNormal3f(0.0, 0.0, - 1.0);
    rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rlVertex3f(x - width/2, y - height/2, z - length/2);
    rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rlVertex3f(x - width/2, y + height/2, z - length/2);
    rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rlVertex3f(x + width/2, y + height/2, z - length/2);
    rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rlVertex3f(x + width/2, y - height/2, z - length/2);

    // Top face
    rlNormal3f(0.0, 1.0, 0.0);
    rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rlVertex3f(x - width/2, y + height/2, z - length/2);
    rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rlVertex3f(x - width/2, y + height/2, z + length/2);
    rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rlVertex3f(x + width/2, y + height/2, z + length/2);
    rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rlVertex3f(x + width/2, y + height/2, z - length/2);

    // Bottom face
    rlNormal3f(0.0, - 1.0, 0.0);
    rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rlVertex3f(x - width/2, y - height/2, z - length/2);
    rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rlVertex3f(x + width/2, y - height/2, z - length/2);
    rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rlVertex3f(x + width/2, y - height/2, z + length/2);
    rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rlVertex3f(x - width/2, y - height/2, z + length/2);

    // Right face
    rlNormal3f(1.0, 0.0, 0.0);
    rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rlVertex3f(x + width/2, y - height/2, z - length/2);
    rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rlVertex3f(x + width/2, y + height/2, z - length/2);
    rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rlVertex3f(x + width/2, y + height/2, z + length/2);
    rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rlVertex3f(x + width/2, y - height/2, z + length/2);

    // Left face
    rlNormal3f( - 1.0, 0.0, 0.0);
    rlTexCoord2f(source.x/texWidth, (source.y + source.height)/texHeight);
    rlVertex3f(x - width/2, y - height/2, z - length/2);
    rlTexCoord2f((source.x + source.width)/texWidth, (source.y + source.height)/texHeight);
    rlVertex3f(x - width/2, y - height/2, z + length/2);
    rlTexCoord2f((source.x + source.width)/texWidth, source.y/texHeight);
    rlVertex3f(x - width/2, y + height/2, z + length/2);
    rlTexCoord2f(source.x/texWidth, source.y/texHeight);
    rlVertex3f(x - width/2, y + height/2, z - length/2);

  rlEnd();

  rlSetTexture(0);
}