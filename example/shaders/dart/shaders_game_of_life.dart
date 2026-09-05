// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_game_of_life.c
// Run it: dart run shaders_game_of_life.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

const int MODE_RUN = 0;
const int MODE_PAUSE = 1;
const int MODE_DRAW = 2;

class PresetPattern {
  String name;
  Vector2D position;

  PresetPattern(this.name, double x, double y) : position = .vec2(x, y);
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_game_of_life");
  SetTargetFPS(60);

  const int menuWidth = 100;
  const int windowWidth = screenWidth - menuWidth;
  const int windowHeight = screenHeight;

  const int worldWidth = 2048;
  const int worldHeight = 2048;

  const int randomTiles = 8;

  final RectangleD worldRectSource = .rect(0, 0, worldWidth, -worldHeight);
  final RectangleD worldRectDest = .rect(0, 0, worldWidth, worldHeight);
  final RectangleD textureOnScreen = .rect(0, 0, windowWidth, windowHeight);

  final presetPatterns = <PresetPattern>[
    .new("Glider", 0.5, 0.5), .new("R-pentomino", 0.5, 0.5),
    .new("Acorn", 0.5, 0.5), .new("Spaceships", 0.1, 0.5),
    .new("Still lifes", 0.5, 0.5), .new("Oscillators", 0.5, 0.5),
    .new("Puffer train", 0.1, 0.5), .new("Glider Gun", 0.2, 0.2),
    .new("Breeder", 0.1, 0.5), .new("Random", 0.5, 0.5)
  ];

  int zoom = 1;
  double offsetX = (worldWidth - windowWidth)/2.0;
  double offsetY = (worldHeight - windowHeight)/2.0;
  int framesPerStep = 1;
  int frame = 0;

  int preset = -1;
  int mode = MODE_RUN;
  bool buttonZoomIn = false;
  bool buttonZomOut = false;
  bool buttonFaster = false;
  bool buttonSlower = false;

  final shdrGameOfLife = LoadShader(
    null,
    "../resources/shaders/glsl$GLSL_VERSION/game_of_life.fs",
  );

  int resolutionLoc = GetShaderLocation(shdrGameOfLife, "resolution");
  final Vector2D resolution = .vec2(worldWidth, worldHeight);
  SetShaderValue(
    shdrGameOfLife, resolutionLoc, resolution.toArray(),
    .SHADER_UNIFORM_VEC2,
  );

  final world1 = LoadRenderTexture(worldWidth, worldHeight);
  final world2 = LoadRenderTexture(worldWidth, worldHeight);

  BeginTextureMode(world2);
    ClearBackground(.RAYWHITE);
  EndTextureMode();

  var startPattern = LoadImage("../resources/game_of_life/r_pentomino.png");
  UpdateTextureRec(
    world2.texture,
    .rect(
      worldWidth/2.0, worldHeight/2.0,
      startPattern.width, startPattern.height
    ),
    .fromList(startPattern.dataView),
  );
  UnloadImage(startPattern);

  var currentWorld = world2;
  var previousWorld = world1;

  ImageD? imageToDraw;
  late ImageD pattern;

  int firstColor = -1;
  Vector2D prevMousePos = .zero();

  void FreeImageToDraw() {
    if (imageToDraw != null) {
      UnloadImage(imageToDraw!);
      imageToDraw = null;
    }
  }

  while (!WindowShouldClose())
  {
    frame++;

    final mouseWheelMove = GetMouseWheelMove();
    if (buttonZoomIn || (buttonZomOut && (zoom > 1)) || (mouseWheelMove != 0.0))
    {
      FreeImageToDraw();

      final centerX = offsetX + (windowWidth/2.0)/zoom;
      final centerY = offsetY + (windowHeight/2.0)/zoom;
      if (buttonZoomIn || (mouseWheelMove > 0.0)) zoom *= 2;
      if ((buttonZomOut || (mouseWheelMove < 0.0)) && (zoom > 1)) zoom ~/= 2;
      offsetX = centerX - (windowWidth/2.0)/zoom;
      offsetY = centerY - (windowHeight/2.0)/zoom;
    }

    if (buttonFaster && framesPerStep > 1) framesPerStep--;
    if (buttonSlower)                      framesPerStep++;

    if ((mode == MODE_RUN) || (mode == MODE_PAUSE))
    {
      FreeImageToDraw();

      final mousePosition = GetMousePosition();
      if (IsMouseButtonDown(.MOUSE_BUTTON_LEFT) && (mousePosition.x < windowWidth))
      {
        offsetX -= (mousePosition.x - prevMousePos.x)/zoom;
        offsetY -= (mousePosition.y - prevMousePos.y)/zoom;
      }
      prevMousePos = mousePosition;
    } else { // MODE_DRAW
      final offsetDecimalX = offsetX - offsetX.floorToDouble();
      final offsetDecimalY = offsetY - offsetY.floorToDouble();
      int sizeInWorldX = ((windowWidth + offsetDecimalX*zoom)/zoom).ceil();
      int sizeInWorldY = ((windowHeight + offsetDecimalY*zoom)/zoom).ceil();
      if (offsetX + sizeInWorldX >= worldWidth) sizeInWorldX = worldWidth - offsetX.floor();
      if (offsetY + sizeInWorldY >= worldHeight) sizeInWorldY = worldHeight - offsetY.floor();

      if (imageToDraw == null)
      {
        final worldOnScreen = LoadRenderTexture(sizeInWorldX, sizeInWorldY);
        BeginTextureMode(worldOnScreen);
          DrawTexturePro(
            currentWorld.texture,
            .rect(
              offsetX.floorToDouble(), offsetY.floorToDouble(),
              sizeInWorldX, -sizeInWorldY,
            ),
            .rect(
              0, 0,
              sizeInWorldX, sizeInWorldY,
            ),
            .zero(),
            0.0,
            .WHITE
          );
        EndTextureMode();

        imageToDraw = LoadImageFromTexture(worldOnScreen.texture);
      
        UnloadRenderTexture(worldOnScreen);
      }

      final mousePosition = GetMousePosition();
      if (IsMouseButtonDown(.MOUSE_BUTTON_LEFT) && (mousePosition.x < windowWidth) && imageToDraw != null)
      {
        int mouseX = (mousePosition.x + offsetDecimalX*zoom)~/zoom;
        int mouseY = (mousePosition.y + offsetDecimalY*zoom)~/zoom;
        if (mouseX >= sizeInWorldX) mouseX = sizeInWorldX - 1;
        if (mouseY >= sizeInWorldY) mouseY = sizeInWorldY - 1;
        if (firstColor == -1) {
          firstColor = (GetImageColor(imageToDraw!, mouseX, mouseY).r < 5)? 0 : 1;
        }
        final prevColor = (GetImageColor(imageToDraw!, mouseX, mouseY).r < 5)? 0 : 1;
        
        ImageDrawPixel(imageToDraw!, mouseX, mouseY, (firstColor != 0) ? .BLACK : .RAYWHITE);

        if (prevColor != firstColor) UpdateTextureRec(
          currentWorld.texture,
          .rect(
            offsetX.floorToDouble(), offsetY.floorToDouble(),
            sizeInWorldX, sizeInWorldY,
          ),
          .fromList(imageToDraw!.dataView),
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
          case 0: pattern = LoadImage("../resources/game_of_life/glider.png"); break;
          case 1: pattern = LoadImage("../resources/game_of_life/r_pentomino.png"); break;
          case 2: pattern = LoadImage("../resources/game_of_life/acorn.png"); break;
          case 3: pattern = LoadImage("../resources/game_of_life/spaceships.png"); break;
          case 4: pattern = LoadImage("../resources/game_of_life/still_lifes.png"); break;
          case 5: pattern = LoadImage("../resources/game_of_life/oscillators.png"); break;
          case 6: pattern = LoadImage("../resources/game_of_life/puffer_train.png"); break;
          case 7: pattern = LoadImage("../resources/game_of_life/glider_gun.png"); break;
          case 8: pattern = LoadImage("../resources/game_of_life/breeder.png"); break;
          default: throw UnimplementedError();
        }
        BeginTextureMode(currentWorld);
          ClearBackground(.RAYWHITE);
        EndTextureMode();
        
        UpdateTextureRec(
          currentWorld.texture,
          .rect(
            worldWidth*presetPatterns[preset].position.x - pattern.width/2.0,
            worldHeight*presetPatterns[preset].position.y - pattern.height/2.0,
            pattern.width,
            pattern.height,
          ),
          .fromList(pattern.dataView),
        );
      } else {
        pattern = GenImageColor(worldWidth~/randomTiles, worldHeight~/randomTiles, .RAYWHITE);

        for (int i = 0; i < randomTiles; i++)
        {
          for (int j = 0; j < randomTiles; j++)
          {
            ImageClearBackground(pattern, .RAYWHITE);
            for (int x = 0; x < pattern.width; x++)
            {
              for (int y = 0; y < pattern.height; y++)
              {
                if (GetRandomValue(0, 100) < 15) ImageDrawPixel(pattern, x, y, .BLACK);
              }
            }
            UpdateTextureRec(
              currentWorld.texture,
              .rect(
                pattern.width*i, pattern.height*j,
                pattern.width, pattern.height,
              ),
              .fromList(pattern.dataView),
            );
          }
        }
      }

      UnloadImage(pattern);
      
      mode = MODE_PAUSE;
      offsetX = worldWidth*presetPatterns[preset].position.x - windowWidth/zoom/2.0;
      offsetY = worldHeight*presetPatterns[preset].position.y - windowHeight/zoom/2.0;
    }

    if (offsetX < 0) offsetX = 0;
    if (offsetY < 0) offsetY = 0;
    if (offsetX > worldWidth - (windowWidth)/zoom) offsetX = worldWidth - (windowWidth)/zoom;
    if (offsetY > worldHeight - (windowHeight)/zoom) offsetY = worldHeight - (windowHeight)/zoom;

    if ((mode == MODE_RUN) && ((frame%framesPerStep) == 0))
    {
      final tempWorld = currentWorld;
      currentWorld = previousWorld;
      previousWorld = tempWorld;

      BeginTextureMode(currentWorld);
        BeginShaderMode(shdrGameOfLife);
          DrawTexturePro(
            previousWorld.texture,
            worldRectSource,
            worldRectDest,
            .zero(),
            0.0,
            .RAYWHITE
          );
        EndShaderMode();
      EndTextureMode();
    }

    BeginDrawing();
        
      DrawTexturePro(
        currentWorld.texture,
        .rect(
          offsetX, offsetY,
          windowWidth/zoom, windowHeight/zoom
        ),
        textureOnScreen,
        .zero(),
        0.0,
        .WHITE
      );

      DrawLine(windowWidth, 0, windowWidth, screenHeight, .color(218, 218, 218, 255));
      DrawRectangle(windowWidth, 0, screenWidth - windowWidth, screenHeight, .color(232, 232, 232, 255));

      DrawText("Conway's", 704, 4, 20, .DARKBLUE);
      DrawText(" game of", 704, 19, 20, .DARKBLUE);
      DrawText("  life", 708, 34, 20, .DARKBLUE);
      DrawText("in raylib", 757, 42, 6, .BLACK);

      DrawText("Presets", 710, 58, 8, .GRAY);
      preset = -1;
      for (int i = 0; i < presetPatterns.length; i++)
        if (GuiButton(.rect(710.0, 70.0 + 18*i, 80.0, 16.0), presetPatterns[i].name) != 0)
          preset = i;

      (_, mode) = GuiToggleGroup(
        .rect(710, 258, 80, 16),
        "Run\nPause\nDraw",
        mode,
      );

      DrawText(
        "Zoom: $zoom",
        710, 316, 8, .GRAY
      );
      buttonZoomIn = GuiButton(.rect(710, 328, 80, 16), "Zoom in") != 0;
      buttonZomOut = GuiButton(.rect(710, 346, 80, 16), "Zoom out") != 0;

      DrawText(
        "Speed: $framesPerStep frame${(framesPerStep > 1)? "s" : ""}",
        710, 370, 8, .GRAY
      );
      buttonFaster = GuiButton(.rect(710, 382, 80, 16), "Faster") != 0;
      buttonSlower = GuiButton(.rect(710, 400, 80, 16), "Slower") != 0;

      DrawFPS(712, 426);

    EndDrawing();
  }

  UnloadShader(shdrGameOfLife);
  UnloadRenderTexture(world1);
  UnloadRenderTexture(world2);

  FreeImageToDraw();

  CloseWindowAndDispose();
}