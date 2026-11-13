// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_srcrec_dstrec.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "textures_srcrec_dstrec");
  SetTargetFPS(60);

  final scarfy = LoadTexture("../resources/scarfy.png");

  int frameWidth = scarfy.width~/6;
  int frameHeight = scarfy.height;

  final Rectangle sourceRec = .rect(
    0.0, 0.0,
    frameWidth, frameHeight
  );

  final Rectangle destRec = .rect(
    screenWidth/2.0, screenHeight/2.0,
    frameWidth*2.0, frameHeight*2.0
  );

  final Vector2 origin = .vec2(frameWidth, frameHeight);

  int rotation = 0;

  rl.setMainLoop(() {
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
  });
});