// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_game_of_life.c
// Run it: dart run shaders_game_of_life.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

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
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "shaders_game_of_life".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  const int menuWidth = 100;
  const int windowWidth = screenWidth - menuWidth;
  const int windowHeight = screenHeight;

  const int worldWidth = 2048;
  const int worldHeight = 2048;

  const int randomTiles = 8;

  final worldRectSource = rl.Temp.Rectangle$.At('worldRectSource').set(0, 0, worldWidth.toDouble(), -worldHeight.toDouble());
  final worldRectDest = rl.Temp.Rectangle$.At('worldRectDest').set(0, 0, worldWidth.toDouble(), worldHeight.toDouble());
  final textureOnScreen = rl.Temp.Rectangle$.At('textureOnScreen').set(0, 0, windowWidth.toDouble(), windowHeight.toDouble());

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
  final mode = rl.Temp.Int$.Value(MODE_RUN, 'mode');
  bool buttonZoomIn = false;
  bool buttonZomOut = false;
  bool buttonFaster = false;
  bool buttonSlower = false;

  ShaderC shdrGameOfLife = rl.Core.LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/game_of_life.fs".toC,
  );

  int resolutionLoc = rl.Core.GetShaderLocation(shdrGameOfLife, "resolution".toC);
  rl.Core.SetShaderValue(shdrGameOfLife, resolutionLoc,
    rl.Temp.vec21Ptr.set(worldWidth, worldHeight).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC2.value
  );

  final world1 = rl.Core.LoadRenderTexture(worldWidth, worldHeight);
  final world2 = rl.Core.LoadRenderTexture(worldWidth, worldHeight);

  rl.Core.BeginTextureMode(world2);
    rl.Core.ClearBackground(rl.Color.RAYWHITE);
  rl.Core.EndTextureMode();

  final rect1 = rl.Temp.Rectangle$.At('1');
  final rect2 = rl.Temp.Rectangle$.At('2');
  final v21 = rl.Temp.Vector2$.At('1');
  final col1 = rl.Temp.Color$.At('1');

  final startPattern = rl.Core.LoadImage("../resources/game_of_life/r_pentomino.png".toC);
  rl.Core.UpdateTextureRec(
    world2.texture,
    rect1.set(worldWidth/2.0, worldHeight/2.0, startPattern.width.toDouble(), startPattern.height.toDouble()).ref,
    startPattern.data
  );
  rl.Core.UnloadImage(startPattern);

  var currentWorld = world2;
  var previousWorld = world1;

  final imageToDraw = rl.Temp.Image$.At('imageToDraw');
  final pattern = rl.Temp.Image$.At('pattern');

  int firstColor = -1;
  final prevMousePos = rl.Temp.Vector2$.At('prevMousePos');

  while (!rl.Core.WindowShouldClose())
  {
    frame++;

    final mouseWheelMove = rl.Core.GetMouseWheelMove();
    if (buttonZoomIn || (buttonZomOut && (zoom > 1)) || (mouseWheelMove != 0.0))
    {
      FreeImageToDraw(rl, imageToDraw);

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
      FreeImageToDraw(rl, imageToDraw);

      final mousePosition = rl.Core.GetMousePosition();
      if (rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value) && (mousePosition.x < windowWidth))
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
        final worldOnScreen = rl.Core.LoadRenderTexture(sizeInWorldX, sizeInWorldY);
        rl.Core.BeginTextureMode(worldOnScreen);
          rl.Core.DrawTexturePro(
            currentWorld.texture,
            rect1.set(
              offsetX.floorToDouble(), offsetY.floorToDouble(),
              sizeInWorldX.toDouble(), -sizeInWorldY.toDouble()
            ).ref,
            rect2.set(
              0, 0,
              sizeInWorldX.toDouble(), sizeInWorldY.toDouble()
            ).ref,
            v21.set(0, 0).ref,
            0.0,
            rl.Color.WHITE
          );
        rl.Core.EndTextureMode();

        imageToDraw.ref = rl.Core.LoadImageFromTexture(worldOnScreen.texture);
      
        rl.Core.UnloadRenderTexture(worldOnScreen);
      }

      final mousePosition = rl.Core.GetMousePosition();
      if (rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value) && (mousePosition.x < windowWidth))
      {
        int mouseX = (mousePosition.x + offsetDecimalX*zoom)~/zoom;
        int mouseY = (mousePosition.y + offsetDecimalY*zoom)~/zoom;
        if (mouseX >= sizeInWorldX) mouseX = sizeInWorldX - 1;
        if (mouseY >= sizeInWorldY) mouseY = sizeInWorldY - 1;
        if (firstColor == -1) {
          firstColor = (rl.Core.GetImageColor(imageToDraw.ref, mouseX, mouseY).r < 5)? 0 : 1;
        }
        final prevColor = (rl.Core.GetImageColor(imageToDraw.ref, mouseX, mouseY).r < 5)? 0 : 1;
        
        rl.Core.ImageDrawPixel(imageToDraw, mouseX, mouseY, (firstColor != 0) ? rl.Color.BLACK : rl.Color.RAYWHITE);
        
        if (prevColor != firstColor) rl.Core.UpdateTextureRec(
          currentWorld.texture,
          rect1.set(
            offsetX.floorToDouble(), offsetY.floorToDouble(),
            sizeInWorldX.toDouble(), sizeInWorldY.toDouble()
          ).ref,
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
          case 0: pattern.ref = rl.Core.LoadImage("../resources/game_of_life/glider.png".toC); break;
          case 1: pattern.ref = rl.Core.LoadImage("../resources/game_of_life/r_pentomino.png".toC); break;
          case 2: pattern.ref = rl.Core.LoadImage("../resources/game_of_life/acorn.png".toC); break;
          case 3: pattern.ref = rl.Core.LoadImage("../resources/game_of_life/spaceships.png".toC); break;
          case 4: pattern.ref = rl.Core.LoadImage("../resources/game_of_life/still_lifes.png".toC); break;
          case 5: pattern.ref = rl.Core.LoadImage("../resources/game_of_life/oscillators.png".toC); break;
          case 6: pattern.ref = rl.Core.LoadImage("../resources/game_of_life/puffer_train.png".toC); break;
          case 7: pattern.ref = rl.Core.LoadImage("../resources/game_of_life/glider_gun.png".toC); break;
          case 8: pattern.ref = rl.Core.LoadImage("../resources/game_of_life/breeder.png".toC); break;
          default: throw UnimplementedError();
        }
        rl.Core.BeginTextureMode(currentWorld);
          rl.Core.ClearBackground(rl.Color.RAYWHITE);
        rl.Core.EndTextureMode();
        
        rl.Core.UpdateTextureRec(
          currentWorld.texture,
          rect1.set(
            worldWidth*presetPatterns[preset].position.x - pattern.ref.width/2.0,
            worldHeight*presetPatterns[preset].position.y - pattern.ref.height/2.0,
            pattern.ref.width.toDouble(),
            pattern.ref.height.toDouble()
          ).ref,
          pattern.ref.data
        );
      } else {
        pattern.ref = rl.Core.GenImageColor(worldWidth~/randomTiles, worldHeight~/randomTiles, rl.Color.RAYWHITE);

        for (int i = 0; i < randomTiles; i++)
        {
          for (int j = 0; j < randomTiles; j++)
          {
            rl.Core.ImageClearBackground(pattern, rl.Color.RAYWHITE);
            for (int x = 0; x < pattern.ref.width; x++)
            {
              for (int y = 0; y < pattern.ref.height; y++)
              {
                if (rl.Core.GetRandomValue(0, 100) < 15) rl.Core.ImageDrawPixel(pattern, x, y, rl.Color.BLACK);
              }
            }
            rl.Core.UpdateTextureRec(
              currentWorld.texture,
              rect1.set(
                (pattern.ref.width*i).toDouble(), (pattern.ref.height*j).toDouble(),
                (pattern.ref.width).toDouble(), (pattern.ref.height).toDouble(),
              ).ref,
              pattern.ref.data
            );
          }
        }
      }

      rl.Core.UnloadImage(pattern.ref);
      
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

      rl.Core.BeginTextureMode(currentWorld);
        rl.Core.BeginShaderMode(shdrGameOfLife);
          rl.Core.DrawTexturePro(
            previousWorld.texture,
            worldRectSource.ref,
            worldRectDest.ref,
            v21.set(0, 0).ref,
            0.0,
            rl.Color.RAYWHITE
          );
        rl.Core.EndShaderMode();
      rl.Core.EndTextureMode();
    }

    rl.Core.BeginDrawing();
        
      rl.Core.DrawTexturePro(
        currentWorld.texture,
        rect1.set(offsetX, offsetY, windowWidth/zoom, windowHeight/zoom).ref,
        textureOnScreen.ref,
        v21.set(0, 0).ref,
        0.0,
        rl.Color.WHITE
      );

      rl.Core.DrawLine(windowWidth, 0, windowWidth, screenHeight, col1.set(218, 218, 218, 255).ref);
      rl.Core.DrawRectangle(windowWidth, 0, screenWidth - windowWidth, screenHeight, col1.set(232, 232, 232, 255).ref);

      rl.Core.DrawText("Conway's".toC, 704, 4, 20, rl.Color.DARKBLUE);
      rl.Core.DrawText(" game of".toC, 704, 19, 20, rl.Color.DARKBLUE);
      rl.Core.DrawText("  life".toC, 708, 34, 20, rl.Color.DARKBLUE);
      rl.Core.DrawText("in raylib".toC, 757, 42, 6, rl.Color.BLACK);

      rl.Core.DrawText("Presets".toC, 710, 58, 8, rl.Color.GRAY);
      preset = -1;
      for (int i = 0; i < presetPatterns.length; i++)
        if (rl.Gui.GuiButton(rect1.set(710.0, 70.0 + 18*i, 80.0, 16.0).ref, presetPatterns[i].name.toC).toBool())
          preset = i;

      rl.Gui.GuiToggleGroup(rect1.set(710, 258, 80, 16).ref, "Run\nPause\nDraw".toC, mode);

      rl.Core.DrawText(
        "Zoom: $zoom".toC,
        710, 316, 8, rl.Color.GRAY
      );
      buttonZoomIn = rl.Gui.GuiButton(rect1.set(710, 328, 80, 16).ref, "Zoom in".toC).toBool();
      buttonZomOut = rl.Gui.GuiButton(rect1.set(710, 346, 80, 16).ref, "Zoom out".toC).toBool();

      rl.Core.DrawText(
        "Speed: $framesPerStep frame${(framesPerStep > 1)? "s" : ""}".toC,
        710, 370, 8, rl.Color.GRAY
      );
      buttonFaster = rl.Gui.GuiButton(rect1.set(710, 382, 80, 16).ref, "Faster".toC).toBool();
      buttonSlower = rl.Gui.GuiButton(rect1.set(710, 400, 80, 16).ref, "Slower".toC).toBool();

      rl.Core.DrawFPS(712, 426);

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadShader(shdrGameOfLife);
  rl.Core.UnloadRenderTexture(world1);
  rl.Core.UnloadRenderTexture(world2);

  FreeImageToDraw(rl, imageToDraw);

  rl.CloseWindowAndDispose();
}

void FreeImageToDraw(Raylib rl, Pointer<ImageC> imageToDraw)
{
  if (imageToDraw.ref.data != nullptr)
  {
    rl.Core.UnloadImage(imageToDraw.ref);
    imageToDraw.ref.data = nullptr;
  }
}