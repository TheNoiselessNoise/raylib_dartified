// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_channel.c
// Run it: dart run textures_image_channel.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_image_channel");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final fudesumiImage = rl.CoreD.LoadImage("../resources/fudesumi.png");

  final imageAlpha = rl.CoreD.ImageFromChannel(fudesumiImage, 3);
  rl.CoreD.ImageAlphaMask(imageAlpha, imageAlpha);

  final imageRed = rl.CoreD.ImageFromChannel(fudesumiImage, 0);
  rl.CoreD.ImageAlphaMask(imageRed, imageAlpha);

  final imageGreen = rl.CoreD.ImageFromChannel(fudesumiImage, 1);
  rl.CoreD.ImageAlphaMask(imageGreen, imageAlpha);

  final imageBlue = rl.CoreD.ImageFromChannel(fudesumiImage, 2);
  rl.CoreD.ImageAlphaMask(imageBlue, imageAlpha);

  final backgroundImage = rl.CoreD.GenImageChecked(
    screenWidth, screenHeight,
    screenWidth/20, screenHeight/20,
    .ORANGE, .YELLOW
  );

  final fudesumiTexture = rl.CoreD.LoadTextureFromImage(fudesumiImage);
  final textureAlpha = rl.CoreD.LoadTextureFromImage(imageAlpha);
  final textureRed = rl.CoreD.LoadTextureFromImage(imageRed);
  final textureGreen = rl.CoreD.LoadTextureFromImage(imageGreen);
  final textureBlue = rl.CoreD.LoadTextureFromImage(imageBlue);
  final backgroundTexture = rl.CoreD.LoadTextureFromImage(backgroundImage);

  rl.CoreD.UnloadImage(fudesumiImage);
  rl.CoreD.UnloadImage(imageAlpha);
  rl.CoreD.UnloadImage(imageRed);
  rl.CoreD.UnloadImage(imageGreen);
  rl.CoreD.UnloadImage(imageBlue);
  rl.CoreD.UnloadImage(backgroundImage);

  final RectangleD fudesumiRec = .rect(0, 0, fudesumiImage.width, fudesumiImage.height);
  final RectangleD fudesumiPos = .rect(50, 10, fudesumiImage.width*0.8, fudesumiImage.height*0.8);
  final RectangleD redPos = .rect(410, 10, fudesumiPos.width / 2, fudesumiPos.height / 2 );
  final RectangleD greenPos = .rect(600, 10, fudesumiPos.width / 2, fudesumiPos.height / 2 );
  final RectangleD bluePos = .rect(410, 230, fudesumiPos.width / 2, fudesumiPos.height / 2 );
  final RectangleD alphaPos = .rect(600, 230, fudesumiPos.width / 2, fudesumiPos.height / 2 );

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.BeginDrawing();

      final Vector2D origin = .zero();

      rl.CoreD.DrawTexture(backgroundTexture, 0, 0, .WHITE);
      rl.CoreD.DrawTexturePro(fudesumiTexture, fudesumiRec, fudesumiPos, origin, 0, .WHITE);

      rl.CoreD.DrawTexturePro(textureRed, fudesumiRec, redPos, origin, 0, .RED);
      rl.CoreD.DrawTexturePro(textureGreen, fudesumiRec, greenPos, origin, 0, .GREEN);
      rl.CoreD.DrawTexturePro(textureBlue, fudesumiRec, bluePos, origin, 0, .BLUE);
      rl.CoreD.DrawTexturePro(textureAlpha, fudesumiRec, alphaPos, origin, 0, .WHITE);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(backgroundTexture);
  rl.CoreD.UnloadTexture(fudesumiTexture);
  rl.CoreD.UnloadTexture(textureRed);
  rl.CoreD.UnloadTexture(textureGreen);
  rl.CoreD.UnloadTexture(textureBlue);
  rl.CoreD.UnloadTexture(textureAlpha);

  rl.CloseWindowAndDispose();
}