// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_kernel.c
// Run it: dart run textures_image_kernel.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_image_kernel".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final image = rl.Temp.Image$.At('image');
  image.ref = rl.Core.LoadImage("../resources/cat.png".toC);

  final gaussiankernel = rl.Temp.Float32$.Array(key: 'gaussiankernel', [
    1.0, 2.0, 1.0,
    2.0, 4.0, 2.0,
    1.0, 2.0, 1.0
  ]);

  final sobelkernel = rl.Temp.Float32$.Array(key: 'sobelkernel', [
    1.0, 0.0, -1.0,
    2.0, 0.0, -2.0,
    1.0, 0.0, -1.0
  ]);

  final sharpenkernel = rl.Temp.Float32$.Array(key: 'sharpenkernel', [
    0.0, -1.0, 0.0,
    -1.0, 5.0, -1.0,
    0.0, -1.0, 0.0
  ]);

  NormalizeKernel(gaussiankernel, 9);
  NormalizeKernel(sharpenkernel, 9);
  NormalizeKernel(sobelkernel, 9);

  final catSharpend = rl.Temp.Image$.At('catSharpend');
  catSharpend.ref = rl.Core.ImageCopy(image.ref);
  rl.Core.ImageKernelConvolution(catSharpend, sharpenkernel, 9);

  final catSobel = rl.Temp.Image$.At('catSobel');
  catSobel.ref = rl.Core.ImageCopy(image.ref);
  rl.Core.ImageKernelConvolution(catSobel, sobelkernel, 9);

  final catGaussian = rl.Temp.Image$.At('catGaussian');
  catGaussian.ref = rl.Core.ImageCopy(image.ref);
  
  for (int i = 0; i < 6; i++) {
    rl.Core.ImageKernelConvolution(catGaussian, gaussiankernel, 9);
  }

  rl.Core.ImageCrop(image, rl.Temp.rect1(0, 0, 200, 450));
  rl.Core.ImageCrop(catGaussian, rl.Temp.rect1(0, 0, 200, 450));
  rl.Core.ImageCrop(catSobel, rl.Temp.rect1(0, 0, 200, 450));
  rl.Core.ImageCrop(catSharpend, rl.Temp.rect1(0, 0, 200, 450));
  
  final texture = rl.Core.LoadTextureFromImage(image.ref);
  final catSharpendTexture = rl.Core.LoadTextureFromImage(catSharpend.ref);
  final catSobelTexture = rl.Core.LoadTextureFromImage(catSobel.ref);
  final catGaussianTexture = rl.Core.LoadTextureFromImage(catGaussian.ref);
  
  rl.Core.UnloadImage(image.ref);
  rl.Core.UnloadImage(catGaussian.ref);
  rl.Core.UnloadImage(catSobel.ref);
  rl.Core.UnloadImage(catSharpend.ref);

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawTexture(catSharpendTexture, 0, 0, rl.Color.WHITE);
      rl.Core.DrawTexture(catSobelTexture, 200, 0, rl.Color.WHITE);
      rl.Core.DrawTexture(catGaussianTexture, 400, 0, rl.Color.WHITE);
      rl.Core.DrawTexture(texture, 600, 0, rl.Color.WHITE);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(texture);
  rl.Core.UnloadTexture(catGaussianTexture);
  rl.Core.UnloadTexture(catSobelTexture);
  rl.Core.UnloadTexture(catSharpendTexture);

  rl.CloseWindowAndDispose();
}

void NormalizeKernel(Pointer<Float> kernel, int size)
{
  double sum = 0.0;
  for (int i = 0; i < size; i++) sum += kernel[i]; 

  if (sum != 0.0)
  {
    for (int i = 0; i < size; i++) kernel[i] /= sum; 
  }
}