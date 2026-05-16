// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_channel.c
// Run it: dart run textures_image_channel.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_image_channel".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final fudesumiImage = rl.Core.LoadImage("../resources/fudesumi.png".toC);

  final imageAlpha = rl.Temp.Image$.At('imageAlpha');
  imageAlpha.ref = rl.Core.ImageFromChannel(fudesumiImage, 3);
  rl.Core.ImageAlphaMask(imageAlpha, imageAlpha.ref);

  final imageRed = rl.Temp.Image$.At('imageRed');
  imageRed.ref = rl.Core.ImageFromChannel(fudesumiImage, 0);
  rl.Core.ImageAlphaMask(imageRed, imageAlpha.ref);

  final imageGreen = rl.Temp.Image$.At('imageGreen');
  imageGreen.ref = rl.Core.ImageFromChannel(fudesumiImage, 1);
  rl.Core.ImageAlphaMask(imageGreen, imageAlpha.ref);

  final imageBlue = rl.Temp.Image$.At('imageBlue');
  imageBlue.ref = rl.Core.ImageFromChannel(fudesumiImage, 2);
  rl.Core.ImageAlphaMask(imageBlue, imageAlpha.ref);

  final backgroundImage = rl.Core.GenImageChecked(
    screenWidth, screenHeight,
    (screenWidth/20).toInt(), (screenHeight/20).toInt(),
    rl.Color.ORANGE, rl.Color.YELLOW
  );

  final fudesumiTexture = rl.Core.LoadTextureFromImage(fudesumiImage);
  final textureAlpha = rl.Core.LoadTextureFromImage(imageAlpha.ref);
  final textureRed = rl.Core.LoadTextureFromImage(imageRed.ref);
  final textureGreen = rl.Core.LoadTextureFromImage(imageGreen.ref);
  final textureBlue = rl.Core.LoadTextureFromImage(imageBlue.ref);
  final backgroundTexture = rl.Core.LoadTextureFromImage(backgroundImage);

  rl.Core.UnloadImage(fudesumiImage);
  rl.Core.UnloadImage(imageAlpha.ref);
  rl.Core.UnloadImage(imageRed.ref);
  rl.Core.UnloadImage(imageGreen.ref);
  rl.Core.UnloadImage(imageBlue.ref);
  rl.Core.UnloadImage(backgroundImage);

  final fudesumiRec = rl.Temp.Rectangle$.At('fudesumiRec')
    .set(0, 0, fudesumiImage.width, fudesumiImage.height);

  final fudesumiPos = rl.Temp.Rectangle$.At('fudesumiPos')
    .set(50, 10, fudesumiImage.width*0.8, fudesumiImage.height*0.8);
  
  final redPos = rl.Temp.Rectangle$.At('redPos')
    .set(410, 10, fudesumiPos.ref.width / 2, fudesumiPos.ref.height / 2 );
  
  final greenPos = rl.Temp.Rectangle$.At('greenPos')
    .set(600, 10, fudesumiPos.ref.width / 2, fudesumiPos.ref.height / 2 );
  
  final bluePos = rl.Temp.Rectangle$.At('bluePos')
    .set(410, 230, fudesumiPos.ref.width / 2, fudesumiPos.ref.height / 2 );
  
  final alphaPos = rl.Temp.Rectangle$.At('alphaPos')
    .set(600, 230, fudesumiPos.ref.width / 2, fudesumiPos.ref.height / 2 );

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.BeginDrawing();

      rl.Core.DrawTexture(backgroundTexture, 0, 0, rl.Color.WHITE);
      rl.Core.DrawTexturePro(fudesumiTexture, fudesumiRec.ref, fudesumiPos.ref, rl.Temp.vec2Zero, 0, rl.Color.WHITE);

      rl.Core.DrawTexturePro(textureRed, fudesumiRec.ref, redPos.ref, rl.Temp.vec2Zero, 0, rl.Color.RED);
      rl.Core.DrawTexturePro(textureGreen, fudesumiRec.ref, greenPos.ref, rl.Temp.vec2Zero, 0, rl.Color.GREEN);
      rl.Core.DrawTexturePro(textureBlue, fudesumiRec.ref, bluePos.ref, rl.Temp.vec2Zero, 0, rl.Color.BLUE);
      rl.Core.DrawTexturePro(textureAlpha, fudesumiRec.ref, alphaPos.ref, rl.Temp.vec2Zero, 0, rl.Color.WHITE);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(backgroundTexture);
  rl.Core.UnloadTexture(fudesumiTexture);
  rl.Core.UnloadTexture(textureRed);
  rl.Core.UnloadTexture(textureGreen);
  rl.Core.UnloadTexture(textureBlue);
  rl.Core.UnloadTexture(textureAlpha);

  rl.CloseWindowAndDispose();
}