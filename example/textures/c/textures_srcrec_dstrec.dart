// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_srcrec_dstrec.c
// Run it: dart run textures_srcrec_dstrec.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "textures_srcrec_dstrec".toC);
  SetTargetFPS(60);

  final scarfy = LoadTexture("../resources/scarfy.png".toC);

  int frameWidth = (scarfy.width/6).toInt();
  int frameHeight = scarfy.height;

  final sourceRec = Rectangle$.val.At('sourceRec').set(
    0.0, 0.0,
    frameWidth, frameHeight
  );

  final destRec = Rectangle$.val.At('destRec').set(
    screenWidth/2.0, screenHeight/2.0,
    frameWidth*2.0, frameHeight*2.0
  );

  final origin = Vector2$.val.At('origin').set(frameWidth, frameHeight);

  int rotation = 0;

  while (!WindowShouldClose())
  {
    rotation++;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawTexturePro(
        scarfy,
        sourceRec.ref, destRec.ref, origin.ref,
        rotation.toDouble(),
        WHITE
      );

      DrawLine(
        destRec.ref.x.toInt(), 0,
        destRec.ref.x.toInt(), screenHeight,
        GRAY
      );
      
      DrawLine(
        0, destRec.ref.y.toInt(),
        screenWidth, destRec.ref.y.toInt(),
        GRAY
      );

      DrawText(
        "(c) Scarfy sprite by Eiden Marsal".toC,
        screenWidth - 200, screenHeight - 20, 10, GRAY
      );

    EndDrawing();
  }

  UnloadTexture(scarfy);

  CloseWindowAndDispose();
}