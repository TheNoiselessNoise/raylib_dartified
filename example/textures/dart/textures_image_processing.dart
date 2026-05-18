// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_processing.c
// Run it: dart run textures_image_processing.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

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
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_image_processing");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final imOrigin = rl.CoreD.LoadImage("../resources/parrots.png");
  rl.CoreD.ImageFormat(imOrigin, .PIXELFORMAT_UNCOMPRESSED_R8G8B8A8);
  final texture = rl.CoreD.LoadTextureFromImage(imOrigin);

  var imCopy = rl.CoreD.ImageCopy(imOrigin);

  ImageProcess currentProcess = .NONE;
  bool textureReload = false;
  int mouseHoverRec = -1;

  final List<RectangleD> toggleRecs = .generate(ImageProcess.values.length,
    (i) => .rect(40.0, 50 + 32*i, 150.0, 30.0),
  );

  while (!rl.CoreD.WindowShouldClose())
  {
    for (final (i, process) in ImageProcess.values.indexed)
    {
      if (rl.CoreD.CheckCollisionPointRec(rl.CoreD.GetMousePosition(), toggleRecs[i]))
      {
        mouseHoverRec = i;

        if (rl.CoreD.IsMouseButtonReleased(.MOUSE_BUTTON_LEFT))
        {
          currentProcess = process;
          textureReload = true;
        }
        break;
      }
      else mouseHoverRec = -1;
    }

    if (rl.CoreD.IsKeyPressed(.KEY_DOWN))
    {
      currentProcess = currentProcess.next;
      textureReload = true;
    }
    else if (rl.CoreD.IsKeyPressed(.KEY_UP))
    {
      currentProcess = currentProcess.prev;
      textureReload = true;
    }

    if (textureReload)
    {
      rl.CoreD.UnloadImage(imCopy);
      imCopy = rl.CoreD.ImageCopy(imOrigin);

      switch (currentProcess)
      {
        case .COLOR_GRAYSCALE: rl.CoreD.ImageColorGrayscale(imCopy); break;
        case .COLOR_TINT: rl.CoreD.ImageColorTint(imCopy, .GREEN); break;
        case .COLOR_INVERT: rl.CoreD.ImageColorInvert(imCopy); break;
        case .COLOR_CONTRAST: rl.CoreD.ImageColorContrast(imCopy, -40); break;
        case .COLOR_BRIGHTNESS: rl.CoreD.ImageColorBrightness(imCopy, -80); break;
        case .GAUSSIAN_BLUR: rl.CoreD.ImageBlurGaussian(imCopy, 10); break;
        case .FLIP_VERTICAL: rl.CoreD.ImageFlipVertical(imCopy); break;
        case .FLIP_HORIZONTAL: rl.CoreD.ImageFlipHorizontal(imCopy); break;
        default: break;
      }

      final colors = rl.CoreD.LoadImageColors(imCopy);
      // NOTE: Color -> r,g,b,a
      final pixels = colors.expand((c) => c.toArray()).toList();
      rl.CoreD.UpdateTexture(texture, .fromList(pixels));

      textureReload = false;
    }

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawText(
        "IMAGE PROCESSING:",
        40, 30, 10, .DARKGRAY
      );

      for (final (i, process) in ImageProcess.values.indexed)
      {
        rl.CoreD.DrawRectangleRec(
          toggleRecs[i],
          ((process == currentProcess) || (i == mouseHoverRec)) ? .SKYBLUE : .LIGHTGRAY
        );
        
        rl.CoreD.DrawRectangleLines(
          toggleRecs[i].x,
          toggleRecs[i].y,
          toggleRecs[i].width,
          toggleRecs[i].height,
          ((process == currentProcess) || (i == mouseHoverRec)) ? .BLUE : .GRAY
        );

        final processText = ImageProcess.values[i].name;
        rl.CoreD.DrawText(
          processText,
          toggleRecs[i].x + toggleRecs[i].width/2 - rl.CoreD.MeasureText(processText, 10)/2,
          toggleRecs[i].y + 11,
          10,
          ((process == currentProcess) || (i == mouseHoverRec)) ? .DARKBLUE : .DARKGRAY
        );
      }

      rl.CoreD.DrawTexture(
        texture,
        screenWidth - texture.width - 60,
        screenHeight/2 - texture.height/2,
        .WHITE
      );
      
      rl.CoreD.DrawRectangleLines(
        screenWidth - texture.width - 60,
        screenHeight/2 - texture.height/2,
        texture.width,
        texture.height,
        .BLACK
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadImage(imOrigin);
  rl.CoreD.UnloadImage(imCopy);

  rl.CloseWindowAndDispose();
}