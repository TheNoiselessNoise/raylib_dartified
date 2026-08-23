// Run it: dart run custom_module_dispose.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

class MyModule extends RaylibModule<Raylib> {
  MyModule(super.rl);

  ColorD background = RAYWHITE;
  Vector2D position = .zero();

  void Update() {
    position = GetMousePosition();

    if (IsKeyPressed(.KEY_SPACE)) {
      final hue = GetRandomValue(0, 360);
      background = ColorFromHSV(hue, 1, 1);
    }
  }

  void Draw() {
    ClearBackground(background);

    DrawCircleV(position, 25, RED);

    final w = GetScreenWidth(), h = GetScreenHeight();
    final text = "Press SPACE to change background color";
    final fontSize = 32;

    final textW = MeasureText(text, fontSize);
    DrawText(text, w ~/ 2 - (textW ~/ 2) + 2, h ~/ 2 + 2, fontSize, BLACK);
    DrawText(text, w ~/ 2 - (textW ~/ 2), h ~/ 2, fontSize, WHITE);
  }
}

MyModule get myModule => module<MyModule>();

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');
  
  rl.registerModule(MyModule(rl));

  rl.Temp.debugFree(true);
  // NOTE: with `debugFree` enabled you should see output at the exit:
  // Freeing user-defined 1 ColorD slots
  // [FREE] ColorD_struct_1
  // Freeing user-defined 1 Vector2D slots
  // [FREE] Vector2D_struct_1


  InitWindow(screenWidth, screenHeight, "custom_module_dispose");
  SetTargetFPS(60);

  while (!WindowShouldClose())
  {
    myModule.Update();

    BeginDrawing();
      myModule.Draw();
    EndDrawing();
  }

  CloseWindowAndDispose();
}