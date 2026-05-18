// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_srcrec_dstrec.c
// Run it: dart run textures_srcrec_dstrec.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Core.InitWindow(screenWidth, screenHeight, "textures_srcrec_dstrec".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final scarfy = rl.Core.LoadTexture("../resources/scarfy.png".toC);

  int frameWidth = (scarfy.width/6).toInt();
  int frameHeight = scarfy.height;

  final sourceRec = rl.Temp.Rectangle$.At('sourceRec').set(
    0.0, 0.0,
    frameWidth, frameHeight
  );

  final destRec = rl.Temp.Rectangle$.At('destRec').set(
    screenWidth/2.0, screenHeight/2.0,
    frameWidth*2.0, frameHeight*2.0
  );

  final origin = rl.Temp.Vector2$.At('origin').set(frameWidth, frameHeight);

  int rotation = 0;

  while (!rl.Core.WindowShouldClose())
  {
    rotation++;

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.DrawTexturePro(
        scarfy,
        sourceRec.ref, destRec.ref, origin.ref,
        rotation.toDouble(),
        rl.Color.WHITE
      );

      rl.Core.DrawLine(
        destRec.ref.x.toInt(), 0,
        destRec.ref.x.toInt(), screenHeight,
        rl.Color.GRAY
      );
      
      rl.Core.DrawLine(
        0, destRec.ref.y.toInt(),
        screenWidth, destRec.ref.y.toInt(),
        rl.Color.GRAY
      );

      rl.Core.DrawText(
        "(c) Scarfy sprite by Eiden Marsal".toC,
        screenWidth - 200, screenHeight - 20, 10, rl.Color.GRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadTexture(scarfy);

  rl.CloseWindowAndDispose();
}