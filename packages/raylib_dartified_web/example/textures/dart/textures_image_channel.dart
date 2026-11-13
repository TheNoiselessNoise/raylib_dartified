// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_channel.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "textures_image_channel");
  SetTargetFPS(60);

  final fudesumiImage = LoadImage("../resources/fudesumi.png");

  final imageAlpha = ImageFromChannel(fudesumiImage, 3);
  ImageAlphaMask(imageAlpha, imageAlpha);

  final imageRed = ImageFromChannel(fudesumiImage, 0);
  ImageAlphaMask(imageRed, imageAlpha);

  final imageGreen = ImageFromChannel(fudesumiImage, 1);
  ImageAlphaMask(imageGreen, imageAlpha);

  final imageBlue = ImageFromChannel(fudesumiImage, 2);
  ImageAlphaMask(imageBlue, imageAlpha);

  final backgroundImage = GenImageChecked(
    screenWidth, screenHeight,
    screenWidth/20, screenHeight/20,
    .ORANGE, .YELLOW
  );

  final fudesumiTexture = LoadTextureFromImage(fudesumiImage);
  final textureAlpha = LoadTextureFromImage(imageAlpha);
  final textureRed = LoadTextureFromImage(imageRed);
  final textureGreen = LoadTextureFromImage(imageGreen);
  final textureBlue = LoadTextureFromImage(imageBlue);
  final backgroundTexture = LoadTextureFromImage(backgroundImage);

  UnloadImage(fudesumiImage);
  UnloadImage(imageAlpha);
  UnloadImage(imageRed);
  UnloadImage(imageGreen);
  UnloadImage(imageBlue);
  UnloadImage(backgroundImage);

  final Rectangle fudesumiRec = .rect(0, 0, fudesumiImage.width, fudesumiImage.height);
  final Rectangle fudesumiPos = .rect(50, 10, fudesumiImage.width*0.8, fudesumiImage.height*0.8);
  final Rectangle redPos = .rect(410, 10, fudesumiPos.width / 2, fudesumiPos.height / 2 );
  final Rectangle greenPos = .rect(600, 10, fudesumiPos.width / 2, fudesumiPos.height / 2 );
  final Rectangle bluePos = .rect(410, 230, fudesumiPos.width / 2, fudesumiPos.height / 2 );
  final Rectangle alphaPos = .rect(600, 230, fudesumiPos.width / 2, fudesumiPos.height / 2 );

  rl.setMainLoop(() {
    BeginDrawing();

      final Vector2 origin = .zero();

      DrawTexture(backgroundTexture, 0, 0, .WHITE);
      DrawTexturePro(fudesumiTexture, fudesumiRec, fudesumiPos, origin, 0, .WHITE);

      DrawTexturePro(textureRed, fudesumiRec, redPos, origin, 0, .RED);
      DrawTexturePro(textureGreen, fudesumiRec, greenPos, origin, 0, .GREEN);
      DrawTexturePro(textureBlue, fudesumiRec, bluePos, origin, 0, .BLUE);
      DrawTexturePro(textureAlpha, fudesumiRec, alphaPos, origin, 0, .WHITE);

    EndDrawing();
  });
});