// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_processing.c
// Run it: dart run textures_image_processing.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

enum ImageProcess {
  NONE,
  COLOR_GRAYSCALE,
  COLOR_TINT,
  COLOR_INVERT,
  COLOR_CONTRAST,
  COLOR_BRIGHTNESS,
  GAUSSIAN_BLUR,
  FLIP_VERTICAL,
  FLIP_HORIZONTAL
  ;

  ImageProcess get next => .fromIndex(index + 1);
  ImageProcess get prev => .fromIndex(index - 1);
  static ImageProcess fromIndex(int index) => values[index % values.length];
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_image_processing");
  SetTargetFPS(60);

  final imOrigin = LoadImage("../resources/parrots.png");
  ImageFormat(imOrigin, .PIXELFORMAT_UNCOMPRESSED_R8G8B8A8);
  final texture = LoadTextureFromImage(imOrigin);

  var imCopy = ImageCopy(imOrigin);

  ImageProcess currentProcess = .NONE;
  bool textureReload = false;
  int mouseHoverRec = -1;

  final List<RectangleD> toggleRecs = .generate(ImageProcess.values.length,
    (i) => .rect(40.0, 50 + 32*i, 150.0, 30.0),
  );

  while (!WindowShouldClose())
  {
    for (final (i, process) in ImageProcess.values.indexed)
    {
      if (CheckCollisionPointRec(GetMousePosition(), toggleRecs[i]))
      {
        mouseHoverRec = i;

        if (IsMouseButtonReleased(.MOUSE_BUTTON_LEFT))
        {
          currentProcess = process;
          textureReload = true;
        }
        break;
      }
      else mouseHoverRec = -1;
    }

    if (IsKeyPressed(.KEY_DOWN))
    {
      currentProcess = currentProcess.next;
      textureReload = true;
    }
    else if (IsKeyPressed(.KEY_UP))
    {
      currentProcess = currentProcess.prev;
      textureReload = true;
    }

    if (textureReload)
    {
      UnloadImage(imCopy);
      imCopy = ImageCopy(imOrigin);

      switch (currentProcess)
      {
        case .COLOR_GRAYSCALE: ImageColorGrayscale(imCopy); break;
        case .COLOR_TINT: ImageColorTint(imCopy, .GREEN); break;
        case .COLOR_INVERT: ImageColorInvert(imCopy); break;
        case .COLOR_CONTRAST: ImageColorContrast(imCopy, -40); break;
        case .COLOR_BRIGHTNESS: ImageColorBrightness(imCopy, -80); break;
        case .GAUSSIAN_BLUR: ImageBlurGaussian(imCopy, 10); break;
        case .FLIP_VERTICAL: ImageFlipVertical(imCopy); break;
        case .FLIP_HORIZONTAL: ImageFlipHorizontal(imCopy); break;
        default: break;
      }

      final colors = LoadImageColors(imCopy);
      // NOTE: Color -> r,g,b,a
      final pixels = colors.expand((c) => c.toArray()).toList();
      UpdateTexture(texture, .fromList(pixels));

      textureReload = false;
    }

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawText(
        "IMAGE PROCESSING:",
        40, 30, 10, .DARKGRAY
      );

      for (final (i, process) in ImageProcess.values.indexed)
      {
        DrawRectangleRec(
          toggleRecs[i],
          ((process == currentProcess) || (i == mouseHoverRec)) ? .SKYBLUE : .LIGHTGRAY
        );
        
        DrawRectangleLines(
          toggleRecs[i].x,
          toggleRecs[i].y,
          toggleRecs[i].width,
          toggleRecs[i].height,
          ((process == currentProcess) || (i == mouseHoverRec)) ? .BLUE : .GRAY
        );

        final processText = ImageProcess.values[i].name;
        DrawText(
          processText,
          toggleRecs[i].x + toggleRecs[i].width/2 - MeasureText(processText, 10)/2,
          toggleRecs[i].y + 11,
          10,
          ((process == currentProcess) || (i == mouseHoverRec)) ? .DARKBLUE : .DARKGRAY
        );
      }

      DrawTexture(
        texture,
        screenWidth - texture.width - 60,
        screenHeight/2 - texture.height/2,
        .WHITE
      );
      
      DrawRectangleLines(
        screenWidth - texture.width - 60,
        screenHeight/2 - texture.height/2,
        texture.width,
        texture.height,
        .BLACK
      );

    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadImage(imOrigin);
  UnloadImage(imCopy);

  CloseWindowAndDispose();
}