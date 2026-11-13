// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_kernel.c
// Run it: dart run textures_image_kernel.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_image_kernel");
  SetTargetFPS(60);

  final image = LoadImage("../resources/cat.png");

  final gaussiankernel = [
    1.0, 2.0, 1.0,
    2.0, 4.0, 2.0,
    1.0, 2.0, 1.0
  ];

  final sobelkernel = [
    1.0, 0.0, -1.0,
    2.0, 0.0, -2.0,
    1.0, 0.0, -1.0
  ];

  final sharpenkernel = [
    0.0, -1.0, 0.0,
    -1.0, 5.0, -1.0,
    0.0, -1.0, 0.0
  ];

  NormalizeKernel(gaussiankernel);
  NormalizeKernel(sharpenkernel);
  NormalizeKernel(sobelkernel);

  final catSharpend = ImageCopy(image);
  ImageKernelConvolution(catSharpend, sharpenkernel);

  final catSobel = ImageCopy(image);
  ImageKernelConvolution(catSobel, sobelkernel);

  final catGaussian = ImageCopy(image);
  
  for (int i = 0; i < 6; i++) {
    ImageKernelConvolution(catGaussian, gaussiankernel);
  }

  ImageCrop(image, .rect(0, 0, 200, 450));
  ImageCrop(catGaussian, .rect(0, 0, 200, 450));
  ImageCrop(catSobel, .rect(0, 0, 200, 450));
  ImageCrop(catSharpend, .rect(0, 0, 200, 450));
  
  final texture = LoadTextureFromImage(image);
  final catSharpendTexture = LoadTextureFromImage(catSharpend);
  final catSobelTexture = LoadTextureFromImage(catSobel);
  final catGaussianTexture = LoadTextureFromImage(catGaussian);
  
  UnloadImage(image);
  UnloadImage(catGaussian);
  UnloadImage(catSobel);
  UnloadImage(catSharpend);

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawTexture(catSharpendTexture, 0, 0, .WHITE);
      DrawTexture(catSobelTexture, 200, 0, .WHITE);
      DrawTexture(catGaussianTexture, 400, 0, .WHITE);
      DrawTexture(texture, 600, 0, .WHITE);

    EndDrawing();
  }

  UnloadTexture(texture);
  UnloadTexture(catGaussianTexture);
  UnloadTexture(catSobelTexture);
  UnloadTexture(catSharpendTexture);

  CloseWindowAndDispose();
}

void NormalizeKernel(List<double> kernel)
{
  double sum = kernel.fold(0, (a, b) => a + b);
  if (sum != 0.0) kernel.indexed.forEach((i) => kernel[i.$1] = i.$2 / sum);
}