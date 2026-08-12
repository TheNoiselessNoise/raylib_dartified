// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_channel.c
// Run it: dart run textures_image_channel.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_image_channel".toC);
  SetTargetFPS(60);

  final fudesumiImage = LoadImage("../resources/fudesumi.png".toC);

  final imageAlpha = Image$.val.At('imageAlpha');
  imageAlpha.ref = ImageFromChannel(fudesumiImage, 3);
  ImageAlphaMask(imageAlpha, imageAlpha.ref);

  final imageRed = Image$.val.At('imageRed');
  imageRed.ref = ImageFromChannel(fudesumiImage, 0);
  ImageAlphaMask(imageRed, imageAlpha.ref);

  final imageGreen = Image$.val.At('imageGreen');
  imageGreen.ref = ImageFromChannel(fudesumiImage, 1);
  ImageAlphaMask(imageGreen, imageAlpha.ref);

  final imageBlue = Image$.val.At('imageBlue');
  imageBlue.ref = ImageFromChannel(fudesumiImage, 2);
  ImageAlphaMask(imageBlue, imageAlpha.ref);

  final backgroundImage = GenImageChecked(
    screenWidth, screenHeight,
    (screenWidth/20).toInt(), (screenHeight/20).toInt(),
    ORANGE, YELLOW
  );

  final fudesumiTexture = LoadTextureFromImage(fudesumiImage);
  final textureAlpha = LoadTextureFromImage(imageAlpha.ref);
  final textureRed = LoadTextureFromImage(imageRed.ref);
  final textureGreen = LoadTextureFromImage(imageGreen.ref);
  final textureBlue = LoadTextureFromImage(imageBlue.ref);
  final backgroundTexture = LoadTextureFromImage(backgroundImage);

  UnloadImage(fudesumiImage);
  UnloadImage(imageAlpha.ref);
  UnloadImage(imageRed.ref);
  UnloadImage(imageGreen.ref);
  UnloadImage(imageBlue.ref);
  UnloadImage(backgroundImage);

  final fudesumiRec = Rectangle$.val.At('fudesumiRec')
    .set(0, 0, fudesumiImage.width, fudesumiImage.height);

  final fudesumiPos = Rectangle$.val.At('fudesumiPos')
    .set(50, 10, fudesumiImage.width*0.8, fudesumiImage.height*0.8);
  
  final redPos = Rectangle$.val.At('redPos')
    .set(410, 10, fudesumiPos.ref.width / 2, fudesumiPos.ref.height / 2 );
  
  final greenPos = Rectangle$.val.At('greenPos')
    .set(600, 10, fudesumiPos.ref.width / 2, fudesumiPos.ref.height / 2 );
  
  final bluePos = Rectangle$.val.At('bluePos')
    .set(410, 230, fudesumiPos.ref.width / 2, fudesumiPos.ref.height / 2 );
  
  final alphaPos = Rectangle$.val.At('alphaPos')
    .set(600, 230, fudesumiPos.ref.width / 2, fudesumiPos.ref.height / 2 );

  while (!WindowShouldClose())
  {
    BeginDrawing();

      DrawTexture(backgroundTexture, 0, 0, WHITE);
      DrawTexturePro(fudesumiTexture, fudesumiRec.ref, fudesumiPos.ref, Vector2$.val.$zero, 0, WHITE);

      DrawTexturePro(textureRed, fudesumiRec.ref, redPos.ref, Vector2$.val.$zero, 0, RED);
      DrawTexturePro(textureGreen, fudesumiRec.ref, greenPos.ref, Vector2$.val.$zero, 0, GREEN);
      DrawTexturePro(textureBlue, fudesumiRec.ref, bluePos.ref, Vector2$.val.$zero, 0, BLUE);
      DrawTexturePro(textureAlpha, fudesumiRec.ref, alphaPos.ref, Vector2$.val.$zero, 0, WHITE);

    EndDrawing();
  }

  UnloadTexture(backgroundTexture);
  UnloadTexture(fudesumiTexture);
  UnloadTexture(textureRed);
  UnloadTexture(textureGreen);
  UnloadTexture(textureBlue);
  UnloadTexture(textureAlpha);

  CloseWindowAndDispose();
}