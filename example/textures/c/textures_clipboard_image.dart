// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_clipboard_image.c
// Run it: dart run textures_clipboard_image.dart
// WARNING: No support for `GetClipboardImage` on Linux (yet), untested.
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

class TextureCollection {
  final Pointer<TextureC> texture;
  final Pointer<Vector2C> position;

  TextureCollection(this.texture, this.position);
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_clipboard_image".toC);
  SetTargetFPS(60);

  List<TextureCollection> collection = [];
  int currentCollectionIndex = 0;

  while (!WindowShouldClose())
  {
    if (IsKeyPressed(KeyboardKey.KEY_R.value))
    {
      for (int i = 0; i < collection.length; i++) {
        UnloadTexture(collection[i].texture.ref);
      }

      currentCollectionIndex = 0;
    }

    if (
      IsKeyDown(KeyboardKey.KEY_LEFT_CONTROL.value) &&
      IsKeyPressed(KeyboardKey.KEY_V.value)
    ) {
      final image = GetClipboardImage();

      if (IsImageValid(image))
      {
        final texture = Texture$.AtUnique();
        texture.ref = LoadTextureFromImage(image);
        final position = Vector2$.AtUnique();
        position.setC(GetMousePosition());
        collection.add(.new(texture, position));
        currentCollectionIndex++;
        UnloadImage(image);
      }
      else TraceLog(
        TraceLogLevel.LOG_INFO.value,
        "IMAGE: Could not retrieve image from clipboard".toC
      );
    }

    BeginDrawing();

      ClearBackground(RAYWHITE);

      for (int i = 0; i < currentCollectionIndex; i++)
      {
        if (IsTextureValid(collection[i].texture.ref))
        {
          DrawTexturePro(collection[i].texture.ref,
            Rectangle$.$1.set(0,0,collection[i].texture.ref.width, collection[i].texture.ref.height),
            Rectangle$.$2.set(collection[i].position.ref.x,collection[i].position.ref.y,collection[i].texture.ref.width, collection[i].texture.ref.height),
            Vector2$.$1.set(collection[i].texture.ref.width*0.5, collection[i].texture.ref.height*0.5),
            0.0,
            WHITE
          );
        }
      }

      DrawRectangle(0, 0, screenWidth, 40, BLACK);
      DrawText("Clipboard Image - Ctrl+V to Paste and R to Reset".toC, 120, 10, 20, LIGHTGRAY);

    EndDrawing();
  }
  
  collection.forEach((e) => UnloadTexture(e.texture.ref));

  CloseWindowAndDispose();
}