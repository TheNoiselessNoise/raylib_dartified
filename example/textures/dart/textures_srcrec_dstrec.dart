// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/textures/textures_srcrec_dstrec.c
// Run it: dart run textures_srcrec_dstrec.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "textures_srcrec_dstrec");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final scarfy = rl.CoreD.LoadTexture("../resources/scarfy.png");

  int frameWidth = scarfy.width~/6;
  int frameHeight = scarfy.height;

  final RectangleD sourceRec = .rect(
    0.0, 0.0,
    frameWidth, frameHeight
  );

  final RectangleD destRec = .rect(
    screenWidth/2.0, screenHeight/2.0,
    frameWidth*2.0, frameHeight*2.0
  );

  final Vector2D origin = .vec2(frameWidth, frameHeight);

  int rotation = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    rotation++;

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.DrawTexturePro(
        scarfy,
        sourceRec, destRec, origin,
        rotation,
        .WHITE
      );

      rl.CoreD.DrawLine(
        destRec.x, 0,
        destRec.x, screenHeight,
        .GRAY
      );
      
      rl.CoreD.DrawLine(
        0, destRec.y,
        screenWidth, destRec.y,
        .GRAY
      );

      rl.CoreD.DrawText(
        "(c) Scarfy sprite by Eiden Marsal",
        screenWidth - 200, screenHeight - 20, 10, .GRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(scarfy);

  rl.CloseWindowAndDispose();
}