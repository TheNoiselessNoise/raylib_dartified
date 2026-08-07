// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_kernel.c
// Run it: dart run textures_image_kernel.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_image_kernel".toC);
  SetTargetFPS(60);

  final image = Image$.At('image');
  image.ref = LoadImage("../resources/cat.png".toC);

  final gaussiankernel = Float32$.Array(key: 'gaussiankernel', [
    1.0, 2.0, 1.0,
    2.0, 4.0, 2.0,
    1.0, 2.0, 1.0
  ]);

  final sobelkernel = Float32$.Array(key: 'sobelkernel', [
    1.0, 0.0, -1.0,
    2.0, 0.0, -2.0,
    1.0, 0.0, -1.0
  ]);

  final sharpenkernel = Float32$.Array(key: 'sharpenkernel', [
    0.0, -1.0, 0.0,
    -1.0, 5.0, -1.0,
    0.0, -1.0, 0.0
  ]);

  NormalizeKernel(gaussiankernel, 9);
  NormalizeKernel(sharpenkernel, 9);
  NormalizeKernel(sobelkernel, 9);

  final catSharpend = Image$.At('catSharpend');
  catSharpend.ref = ImageCopy(image.ref);
  ImageKernelConvolution(catSharpend, sharpenkernel, 9);

  final catSobel = Image$.At('catSobel');
  catSobel.ref = ImageCopy(image.ref);
  ImageKernelConvolution(catSobel, sobelkernel, 9);

  final catGaussian = Image$.At('catGaussian');
  catGaussian.ref = ImageCopy(image.ref);
  
  for (int i = 0; i < 6; i++) {
    ImageKernelConvolution(catGaussian, gaussiankernel, 9);
  }

  ImageCrop(image, Rectangle$.$1.set(0, 0, 200, 450));
  ImageCrop(catGaussian, Rectangle$.$1.set(0, 0, 200, 450));
  ImageCrop(catSobel, Rectangle$.$1.set(0, 0, 200, 450));
  ImageCrop(catSharpend, Rectangle$.$1.set(0, 0, 200, 450));
  
  final texture = LoadTextureFromImage(image.ref);
  final catSharpendTexture = LoadTextureFromImage(catSharpend.ref);
  final catSobelTexture = LoadTextureFromImage(catSobel.ref);
  final catGaussianTexture = LoadTextureFromImage(catGaussian.ref);
  
  UnloadImage(image.ref);
  UnloadImage(catGaussian.ref);
  UnloadImage(catSobel.ref);
  UnloadImage(catSharpend.ref);

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTexture(catSharpendTexture, 0, 0, WHITE);
      DrawTexture(catSobelTexture, 200, 0, WHITE);
      DrawTexture(catGaussianTexture, 400, 0, WHITE);
      DrawTexture(texture, 600, 0, WHITE);

    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadTexture(catGaussianTexture);
  UnloadTexture(catSobelTexture);
  UnloadTexture(catSharpendTexture);

  CloseWindowAndDispose();
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