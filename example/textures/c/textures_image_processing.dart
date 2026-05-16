// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_processing.c
// Run it: dart run textures_image_processing.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
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
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_image_processing".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final imOrigin = rl.Temp.Image$.At('imOrigin');
  imOrigin.ref = rl.Core.LoadImage("../resources/parrots.png".toC);
  rl.Core.ImageFormat(imOrigin, PixelFormat.PIXELFORMAT_UNCOMPRESSED_R8G8B8A8.value);
  final texture = rl.Core.LoadTextureFromImage(imOrigin.ref);

  final imCopy = rl.Temp.Image$.At('imCopy');
  imCopy.ref = rl.Core.ImageCopy(imOrigin.ref);

  ImageProcess currentProcess = .NONE;
  bool textureReload = false;
  int mouseHoverRec = -1;

  final toggleRecs = rl.Temp.Rectangle$.FillInto(
    ImageProcess.values.length,
    (i, r) => r.set(40.0, 50 + 32*i, 150.0, 30.0),
  );

  while (!rl.Core.WindowShouldClose())
  {
    for (final (i, process) in ImageProcess.values.indexed)
    {
      if (rl.Core.CheckCollisionPointRec(rl.Core.GetMousePosition(), toggleRecs[i]))
      {
        mouseHoverRec = i;

        if (rl.Core.IsMouseButtonReleased(MouseButton.MOUSE_BUTTON_LEFT.value))
        {
          currentProcess = process;
          textureReload = true;
        }
        break;
      }
      else mouseHoverRec = -1;
    }

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_DOWN.value))
    {
      currentProcess = currentProcess.next;
      textureReload = true;
    }
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_UP.value))
    {
      currentProcess = currentProcess.prev;
      textureReload = true;
    }

    if (textureReload)
    {
      rl.Core.UnloadImage(imCopy.ref);
      imCopy.ref = rl.Core.ImageCopy(imOrigin.ref);

      switch (currentProcess)
      {
        case .COLOR_GRAYSCALE: rl.Core.ImageColorGrayscale(imCopy); break;
        case .COLOR_TINT: rl.Core.ImageColorTint(imCopy, rl.Color.GREEN); break;
        case .COLOR_INVERT: rl.Core.ImageColorInvert(imCopy); break;
        case .COLOR_CONTRAST: rl.Core.ImageColorContrast(imCopy, -40); break;
        case .COLOR_BRIGHTNESS: rl.Core.ImageColorBrightness(imCopy, -80); break;
        case .GAUSSIAN_BLUR: rl.Core.ImageBlurGaussian(imCopy, 10); break;
        case .FLIP_VERTICAL: rl.Core.ImageFlipVertical(imCopy); break;
        case .FLIP_HORIZONTAL: rl.Core.ImageFlipHorizontal(imCopy); break;
        default: break;
      }

      final pixels = rl.Core.LoadImageColors(imCopy.ref);
      rl.Core.UpdateTexture(texture, pixels.cast());
      rl.Core.UnloadImageColors(pixels);

      textureReload = false;
    }

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawText(
        "IMAGE PROCESSING:".toC,
        40, 30, 10, rl.Color.DARKGRAY
      );

      for (final (i, process) in ImageProcess.values.indexed)
      {
        rl.Core.DrawRectangleRec(
          toggleRecs[i],
          ((process == currentProcess) || (i == mouseHoverRec)) ? rl.Color.SKYBLUE : rl.Color.LIGHTGRAY
        );
        
        rl.Core.DrawRectangleLines(
          toggleRecs[i].x.toInt(),
          toggleRecs[i].y.toInt(),
          toggleRecs[i].width.toInt(),
          toggleRecs[i].height.toInt(),
          ((process == currentProcess) || (i == mouseHoverRec)) ? rl.Color.BLUE : rl.Color.GRAY
        );

        final processText = ImageProcess.values[i].name.toC;
        rl.Core.DrawText(
          processText,
          (toggleRecs[i].x + toggleRecs[i].width/2 - rl.Core.MeasureText(processText, 10)/2).toInt(),
          (toggleRecs[i].y + 11).toInt(),
          10,
          ((process == currentProcess) || (i == mouseHoverRec)) ? rl.Color.DARKBLUE : rl.Color.DARKGRAY
        );
      }

      rl.Core.DrawTexture(
        texture,
        screenWidth - texture.width - 60,
        (screenHeight/2 - texture.height/2).toInt(),
        rl.Color.WHITE
      );
      
      rl.Core.DrawRectangleLines(
        screenWidth - texture.width - 60,
        (screenHeight/2 - texture.height/2).toInt(),
        texture.width,
        texture.height,
        rl.Color.BLACK
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texture);
  rl.Core.UnloadImage(imOrigin.ref);
  rl.Core.UnloadImage(imCopy.ref);

  rl.CloseWindowAndDispose();
}