// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_game_of_life.c
// Run it: dart run shaders_game_of_life.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

const int MODE_RUN = 0;
const int MODE_PAUSE = 1;
const int MODE_DRAW = 2;

class PresetPattern {
  String name;
  Vector2D position;

  PresetPattern(this.name, double x, double y)
    : position = .vec2(x, y);
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_game_of_life".toC);
  SetTargetFPS(60);

  const int menuWidth = 100;
  const int windowWidth = screenWidth - menuWidth;
  const int windowHeight = screenHeight;

  const int worldWidth = 2048;
  const int worldHeight = 2048;

  const int randomTiles = 8;

  final worldRectSource = Rectangle$.val.At('worldRectSource').set(0, 0, worldWidth, -worldHeight);
  final worldRectDest = Rectangle$.val.At('worldRectDest').set(0, 0, worldWidth, worldHeight);
  final textureOnScreen = Rectangle$.val.At('textureOnScreen').set(0, 0, windowWidth, windowHeight);

  final presetPatterns = [
    PresetPattern("Glider", 0.5, 0.5), PresetPattern("R-pentomino", 0.5, 0.5),
    PresetPattern("Acorn", 0.5, 0.5), PresetPattern("Spaceships", 0.1, 0.5),
    PresetPattern("Still lifes", 0.5, 0.5), PresetPattern("Oscillators", 0.5, 0.5),
    PresetPattern("Puffer train", 0.1, 0.5), PresetPattern("Glider Gun", 0.2, 0.2),
    PresetPattern("Breeder", 0.1, 0.5), PresetPattern("Random", 0.5, 0.5)
  ];

  int zoom = 1;
  double offsetX = (worldWidth - windowWidth)/2.0;
  double offsetY = (worldHeight - windowHeight)/2.0;
  int framesPerStep = 1;
  int frame = 0;

  int preset = -1;
  final mode = Int$.val.Value(MODE_RUN, 'mode');
  bool buttonZoomIn = false;
  bool buttonZomOut = false;
  bool buttonFaster = false;
  bool buttonSlower = false;

  ShaderC shdrGameOfLife = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/game_of_life.fs".toC,
  );

  int resolutionLoc = GetShaderLocation(shdrGameOfLife, "resolution".toC);
  SetShaderValue(shdrGameOfLife, resolutionLoc,
    Vector2$.val.$1Ptr.set(worldWidth, worldHeight).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC2.value
  );

  final world1 = LoadRenderTexture(worldWidth, worldHeight);
  final world2 = LoadRenderTexture(worldWidth, worldHeight);

  BeginTextureMode(world2);
    ClearBackground(RAYWHITE);
  EndTextureMode();

  final startPattern = LoadImage("../resources/game_of_life/r_pentomino.png".toC);
  UpdateTextureRec(
    world2.texture,
    Rectangle$.val.$1.set(worldWidth/2.0, worldHeight/2.0, startPattern.width, startPattern.height),
    startPattern.data
  );
  UnloadImage(startPattern);

  var currentWorld = world2;
  var previousWorld = world1;

  final imageToDraw = Image$.val.At('imageToDraw');
  final pattern = Image$.val.At('pattern');

  int firstColor = -1;
  final prevMousePos = Vector2$.val.At('prevMousePos');

  while (!WindowShouldClose())
  {
    frame++;

    final mouseWheelMove = GetMouseWheelMove();
    if (buttonZoomIn || (buttonZomOut && (zoom > 1)) || (mouseWheelMove != 0.0))
    {
      FreeImageToDraw(imageToDraw);

      final centerX = offsetX + (windowWidth/2.0)/zoom;
      final centerY = offsetY + (windowHeight/2.0)/zoom;
      if (buttonZoomIn || (mouseWheelMove > 0.0)) zoom *= 2;
      if ((buttonZomOut || (mouseWheelMove < 0.0)) && (zoom > 1)) zoom ~/= 2;
      offsetX = centerX - (windowWidth/2.0)/zoom;
      offsetY = centerY - (windowHeight/2.0)/zoom;
    }

    if (buttonFaster && framesPerStep > 1) framesPerStep--;
    if (buttonSlower)                      framesPerStep++;

    if ((mode.value == MODE_RUN) || (mode.value == MODE_PAUSE))
    {
      FreeImageToDraw(imageToDraw);

      final mousePosition = GetMousePosition();
      if (IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value) && (mousePosition.x < windowWidth))
      {
        offsetX -= (mousePosition.x - prevMousePos.ref.x)/zoom;
        offsetY -= (mousePosition.y - prevMousePos.ref.y)/zoom;
      }
      prevMousePos.setC(mousePosition);
    } else { // MODE_DRAW
      final offsetDecimalX = offsetX - offsetX.floorToDouble();
      final offsetDecimalY = offsetY - offsetY.floorToDouble();
      int sizeInWorldX = ((windowWidth + offsetDecimalX*zoom)/zoom).ceil();
      int sizeInWorldY = ((windowHeight + offsetDecimalY*zoom)/zoom).ceil();
      if (offsetX + sizeInWorldX >= worldWidth) sizeInWorldX = worldWidth - offsetX.floor();
      if (offsetY + sizeInWorldY >= worldHeight) sizeInWorldY = worldHeight - offsetY.floor();

      if (imageToDraw.ref.data == nullptr)
      {
        final worldOnScreen = LoadRenderTexture(sizeInWorldX, sizeInWorldY);
        BeginTextureMode(worldOnScreen);
          DrawTexturePro(
            currentWorld.texture,
            Rectangle$.val.$1.set(
              offsetX.floorToDouble(), offsetY.floorToDouble(),
              sizeInWorldX, -sizeInWorldY
            ),
            Rectangle$.val.$2.set(
              0, 0,
              sizeInWorldX, sizeInWorldY
            ),
            Vector2$.val.$zero,
            0.0,
            WHITE
          );
        EndTextureMode();

        imageToDraw.ref = LoadImageFromTexture(worldOnScreen.texture);
      
        UnloadRenderTexture(worldOnScreen);
      }

      final mousePosition = GetMousePosition();
      if (IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value) && (mousePosition.x < windowWidth))
      {
        int mouseX = (mousePosition.x + offsetDecimalX*zoom)~/zoom;
        int mouseY = (mousePosition.y + offsetDecimalY*zoom)~/zoom;
        if (mouseX >= sizeInWorldX) mouseX = sizeInWorldX - 1;
        if (mouseY >= sizeInWorldY) mouseY = sizeInWorldY - 1;
        if (firstColor == -1) {
          firstColor = (GetImageColor(imageToDraw.ref, mouseX, mouseY).r < 5)? 0 : 1;
        }
        final prevColor = (GetImageColor(imageToDraw.ref, mouseX, mouseY).r < 5)? 0 : 1;
        
        ImageDrawPixel(imageToDraw, mouseX, mouseY, (firstColor != 0) ? BLACK : RAYWHITE);
        
        if (prevColor != firstColor) UpdateTextureRec(
          currentWorld.texture,
          Rectangle$.val.$1.set(
            offsetX.floorToDouble(), offsetY.floorToDouble(),
            sizeInWorldX, sizeInWorldY
          ),
          imageToDraw.ref.data
        );
      }
      else firstColor = -1;
    }

    if (preset >= 0)
    {
      if (preset < presetPatterns.length - 1)
      {
        switch (preset)
        {
          case 0: pattern.ref = LoadImage("../resources/game_of_life/glider.png".toC); break;
          case 1: pattern.ref = LoadImage("../resources/game_of_life/r_pentomino.png".toC); break;
          case 2: pattern.ref = LoadImage("../resources/game_of_life/acorn.png".toC); break;
          case 3: pattern.ref = LoadImage("../resources/game_of_life/spaceships.png".toC); break;
          case 4: pattern.ref = LoadImage("../resources/game_of_life/still_lifes.png".toC); break;
          case 5: pattern.ref = LoadImage("../resources/game_of_life/oscillators.png".toC); break;
          case 6: pattern.ref = LoadImage("../resources/game_of_life/puffer_train.png".toC); break;
          case 7: pattern.ref = LoadImage("../resources/game_of_life/glider_gun.png".toC); break;
          case 8: pattern.ref = LoadImage("../resources/game_of_life/breeder.png".toC); break;
          default: throw UnimplementedError();
        }
        BeginTextureMode(currentWorld);
          ClearBackground(RAYWHITE);
        EndTextureMode();
        
        UpdateTextureRec(
          currentWorld.texture,
          Rectangle$.val.$1.set(
            worldWidth*presetPatterns[preset].position.x - pattern.ref.width/2.0,
            worldHeight*presetPatterns[preset].position.y - pattern.ref.height/2.0,
            pattern.ref.width,
            pattern.ref.height
          ),
          pattern.ref.data
        );
      } else {
        pattern.ref = GenImageColor(worldWidth~/randomTiles, worldHeight~/randomTiles, RAYWHITE);

        for (int i = 0; i < randomTiles; i++)
        {
          for (int j = 0; j < randomTiles; j++)
          {
            ImageClearBackground(pattern, RAYWHITE);
            for (int x = 0; x < pattern.ref.width; x++)
            {
              for (int y = 0; y < pattern.ref.height; y++)
              {
                if (GetRandomValue(0, 100) < 15) ImageDrawPixel(pattern, x, y, BLACK);
              }
            }
            UpdateTextureRec(
              currentWorld.texture,
              Rectangle$.val.$1.set(
                pattern.ref.width*i, pattern.ref.height*j,
                pattern.ref.width, pattern.ref.height,
              ),
              pattern.ref.data
            );
          }
        }
      }

      UnloadImage(pattern.ref);
      
      mode.value = MODE_PAUSE;
      offsetX = worldWidth*presetPatterns[preset].position.x - windowWidth/zoom/2.0;
      offsetY = worldHeight*presetPatterns[preset].position.y - windowHeight/zoom/2.0;
    }

    if (offsetX < 0) offsetX = 0;
    if (offsetY < 0) offsetY = 0;
    if (offsetX > worldWidth - (windowWidth)/zoom) offsetX = worldWidth - (windowWidth)/zoom;
    if (offsetY > worldHeight - (windowHeight)/zoom) offsetY = worldHeight - (windowHeight)/zoom;

    if ((mode.value == MODE_RUN) && ((frame%framesPerStep) == 0))
    {
      final tempWorld = currentWorld;
      currentWorld = previousWorld;
      previousWorld = tempWorld;

      BeginTextureMode(currentWorld);
        BeginShaderMode(shdrGameOfLife);
          DrawTexturePro(
            previousWorld.texture,
            worldRectSource.ref,
            worldRectDest.ref,
            Vector2$.val.$zero,
            0.0,
            RAYWHITE
          );
        EndShaderMode();
      EndTextureMode();
    }

    BeginDrawing();
        
      DrawTexturePro(
        currentWorld.texture,
        Rectangle$.val.$1.set(offsetX, offsetY, windowWidth/zoom, windowHeight/zoom),
        textureOnScreen.ref,
        Vector2$.val.$zero,
        0.0,
        WHITE
      );

      DrawLine(windowWidth, 0, windowWidth, screenHeight, Color$.val.$1.set(218, 218, 218, 255));
      DrawRectangle(windowWidth, 0, screenWidth - windowWidth, screenHeight, Color$.val.$1.set(232, 232, 232, 255));

      DrawText("Conway's".toC, 704, 4, 20, DARKBLUE);
      DrawText(" game of".toC, 704, 19, 20, DARKBLUE);
      DrawText("  life".toC, 708, 34, 20, DARKBLUE);
      DrawText("in raylib".toC, 757, 42, 6, BLACK);

      DrawText("Presets".toC, 710, 58, 8, GRAY);
      preset = -1;
      for (int i = 0; i < presetPatterns.length; i++)
        if (GuiButton(Rectangle$.val.$1.set(710.0, 70.0 + 18*i, 80.0, 16.0), presetPatterns[i].name.toC).toBool())
          preset = i;

      GuiToggleGroup(Rectangle$.val.$1.set(710, 258, 80, 16), "Run\nPause\nDraw".toC, mode);

      DrawText(
        "Zoom: $zoom".toC,
        710, 316, 8, GRAY
      );
      buttonZoomIn = GuiButton(Rectangle$.val.$1.set(710, 328, 80, 16), "Zoom in".toC).toBool();
      buttonZomOut = GuiButton(Rectangle$.val.$1.set(710, 346, 80, 16), "Zoom out".toC).toBool();

      DrawText(
        "Speed: $framesPerStep frame${(framesPerStep > 1)? "s" : ""}".toC,
        710, 370, 8, GRAY
      );
      buttonFaster = GuiButton(Rectangle$.val.$1.set(710, 382, 80, 16), "Faster".toC).toBool();
      buttonSlower = GuiButton(Rectangle$.val.$1.set(710, 400, 80, 16), "Slower".toC).toBool();

      DrawFPS(712, 426);

    EndDrawing();
  }

  UnloadShader(shdrGameOfLife);
  UnloadRenderTexture(world1);
  UnloadRenderTexture(world2);

  FreeImageToDraw(imageToDraw);

  CloseWindowAndDispose();
}

void FreeImageToDraw(Pointer<ImageC> imageToDraw)
{
  if (imageToDraw.ref.data != nullptr)
  {
    UnloadImage(imageToDraw.ref);
    imageToDraw.ref.data = nullptr;
  }
}