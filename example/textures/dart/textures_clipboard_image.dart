// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_clipboard_image.c
// Run it: dart run textures_clipboard_image.dart
// WARNING: No support for `GetClipboardImage` on Linux (yet), untested.
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

class TextureCollection {
  final TextureD texture;
  final Vector2D position;

  TextureCollection(this.texture, this.position);
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_clipboard_image");
  SetTargetFPS(60);

  List<TextureCollection> collection = [];
  int currentCollectionIndex = 0;

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(.KEY_R))
    {
      for (int i = 0; i < collection.length; i++) {
        UnloadTexture(collection[i].texture);
      }

      currentCollectionIndex = 0;
    }

    if (
      IsKeyDown(.KEY_LEFT_CONTROL) &&
      IsKeyPressed(.KEY_V)
    ) {
      final image = GetClipboardImage();

      if (IsImageValid(image))
      {
        final texture = LoadTextureFromImage(image);
        final position = GetMousePosition();
        collection.add(.new(texture, position));
        currentCollectionIndex++;
        UnloadImage(image);
      }
      else TraceLog(.LOG_INFO,
        "IMAGE: Could not retrieve image from clipboard"
      );
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      for (int i = 0; i < currentCollectionIndex; i++)
      {
        if (IsTextureValid(collection[i].texture))
        {
          DrawTexturePro(collection[i].texture,
            .rect(0,0,collection[i].texture.width, collection[i].texture.height),
            .rect(collection[i].position.x,collection[i].position.y,collection[i].texture.width, collection[i].texture.height),
            .vec2(collection[i].texture.width*0.5, collection[i].texture.height*0.5),
            0.0,
            .WHITE
          );
        }
      }

      DrawRectangle(0, 0, screenWidth, 40, .BLACK);
      DrawText("Clipboard Image - Ctrl+V to Paste and R to Reset", 120, 10, 20, .LIGHTGRAY);

    EndDrawing();
  }
  
  collection.forEach((e) => UnloadTexture(e.texture));

  CloseWindowAndDispose();
}