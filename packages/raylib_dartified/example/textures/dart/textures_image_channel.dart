// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_image_channel.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Texture fudesumiTexture;
late Texture textureAlpha;
late Texture textureRed;
late Texture textureGreen;
late Texture textureBlue;
late Texture backgroundTexture;
late Rectangle fudesumiRec;
late Rectangle fudesumiPos;
late Rectangle redPos;
late Rectangle greenPos;
late Rectangle bluePos;
late Rectangle alphaPos;

void main() => runExample(
  init: (_) {
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

    fudesumiTexture = LoadTextureFromImage(fudesumiImage);
    textureAlpha = LoadTextureFromImage(imageAlpha);
    textureRed = LoadTextureFromImage(imageRed);
    textureGreen = LoadTextureFromImage(imageGreen);
    textureBlue = LoadTextureFromImage(imageBlue);
    backgroundTexture = LoadTextureFromImage(backgroundImage);

    UnloadImage(fudesumiImage);
    UnloadImage(imageAlpha);
    UnloadImage(imageRed);
    UnloadImage(imageGreen);
    UnloadImage(imageBlue);
    UnloadImage(backgroundImage);

    fudesumiRec = .rect(0, 0, fudesumiImage.width, fudesumiImage.height);
    fudesumiPos = .rect(50, 10, fudesumiImage.width*0.8, fudesumiImage.height*0.8);
    redPos = .rect(410, 10, fudesumiPos.width / 2, fudesumiPos.height / 2 );
    greenPos = .rect(600, 10, fudesumiPos.width / 2, fudesumiPos.height / 2 );
    bluePos = .rect(410, 230, fudesumiPos.width / 2, fudesumiPos.height / 2 );
    alphaPos = .rect(600, 230, fudesumiPos.width / 2, fudesumiPos.height / 2 );
  },
  loop: (_) async {
    BeginDrawing();

      final Vector2 origin = .zero();

      DrawTexture(backgroundTexture, 0, 0, .WHITE);
      DrawTexturePro(fudesumiTexture, fudesumiRec, fudesumiPos, origin, 0, .WHITE);

      DrawTexturePro(textureRed, fudesumiRec, redPos, origin, 0, .RED);
      DrawTexturePro(textureGreen, fudesumiRec, greenPos, origin, 0, .GREEN);
      DrawTexturePro(textureBlue, fudesumiRec, bluePos, origin, 0, .BLUE);
      DrawTexturePro(textureAlpha, fudesumiRec, alphaPos, origin, 0, .WHITE);

    EndDrawing();
  },
  close: (_) {
    UnloadTexture(backgroundTexture);
    UnloadTexture(fudesumiTexture);
    UnloadTexture(textureRed);
    UnloadTexture(textureGreen);
    UnloadTexture(textureBlue);
    UnloadTexture(textureAlpha);
    CloseWindow();
  },
);