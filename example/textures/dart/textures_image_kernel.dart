// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_kernel.c
// Run it: dart run textures_image_kernel.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_image_kernel");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final image = rl.CoreD.LoadImage("../resources/cat.png");

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

  final catSharpend = rl.CoreD.ImageCopy(image);
  rl.CoreD.ImageKernelConvolution(catSharpend, sharpenkernel);

  final catSobel = rl.CoreD.ImageCopy(image);
  rl.CoreD.ImageKernelConvolution(catSobel, sobelkernel);

  final catGaussian = rl.CoreD.ImageCopy(image);
  
  for (int i = 0; i < 6; i++) {
    rl.CoreD.ImageKernelConvolution(catGaussian, gaussiankernel);
  }

  rl.CoreD.ImageCrop(image, .rect(0, 0, 200, 450));
  rl.CoreD.ImageCrop(catGaussian, .rect(0, 0, 200, 450));
  rl.CoreD.ImageCrop(catSobel, .rect(0, 0, 200, 450));
  rl.CoreD.ImageCrop(catSharpend, .rect(0, 0, 200, 450));
  
  final texture = rl.CoreD.LoadTextureFromImage(image);
  final catSharpendTexture = rl.CoreD.LoadTextureFromImage(catSharpend);
  final catSobelTexture = rl.CoreD.LoadTextureFromImage(catSobel);
  final catGaussianTexture = rl.CoreD.LoadTextureFromImage(catGaussian);
  
  rl.CoreD.UnloadImage(image);
  rl.CoreD.UnloadImage(catGaussian);
  rl.CoreD.UnloadImage(catSobel);
  rl.CoreD.UnloadImage(catSharpend);

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawTexture(catSharpendTexture, 0, 0, .WHITE);
      rl.CoreD.DrawTexture(catSobelTexture, 200, 0, .WHITE);
      rl.CoreD.DrawTexture(catGaussianTexture, 400, 0, .WHITE);
      rl.CoreD.DrawTexture(texture, 600, 0, .WHITE);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(texture);
  rl.CoreD.UnloadTexture(catGaussianTexture);
  rl.CoreD.UnloadTexture(catSobelTexture);
  rl.CoreD.UnloadTexture(catSharpendTexture);

  rl.CloseWindowAndDispose();
}

void NormalizeKernel(List<double> kernel)
{
  double sum = kernel.fold(0, (a, b) => a + b);
  if (sum != 0.0) kernel.indexed.forEach((i) => kernel[i.$1] = i.$2 / sum);
}