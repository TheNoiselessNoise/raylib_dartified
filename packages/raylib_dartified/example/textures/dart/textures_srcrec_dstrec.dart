// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_srcrec_dstrec.c
// WARNING: expects resources from the raylib source
import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Texture scarfy;
late int frameWidth;
late int frameHeight;
late Rectangle sourceRec;
late Rectangle destRec;
late Vector2 origin;
int rotation = 0;

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "textures_srcrec_dstrec");
    SetTargetFPS(60);

    scarfy = LoadTexture("../resources/scarfy.png");
    frameWidth = scarfy.width~/6;
    frameHeight = scarfy.height;
    sourceRec = .rect(0.0, 0.0, frameWidth, frameHeight);
    destRec = .rect(screenWidth/2.0, screenHeight/2.0, frameWidth*2.0, frameHeight*2.0);
    origin = .vec2(frameWidth, frameHeight);
  },
  loop: (_) async {
    rotation++;

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      DrawTexturePro(
        scarfy,
        sourceRec, destRec, origin,
        rotation,
        .WHITE
      );

      DrawLine(
        destRec.x, 0,
        destRec.x, screenHeight,
        .GRAY
      );
      
      DrawLine(
        0, destRec.y,
        screenWidth, destRec.y,
        .GRAY
      );

      DrawText(
        "(c) Scarfy sprite by Eiden Marsal",
        screenWidth - 200, screenHeight - 20, 10, .GRAY
      );

    EndDrawing();
  },
  close: (_) {
    UnloadTexture(scarfy);
    CloseWindow();
  },
);