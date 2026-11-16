// Run it: dart run custom_module_dispose.dart
import '../../base_flat.dart';

const int screenWidth = 800;
const int screenHeight = 450;

final class MyModule extends RaylibModule<Raylib> {
  MyModule(super.rl);

  // fields initialized in load(), which is called by registerModule()
  late XStructPtr<Color> background;
  late XStructPtr<Vector2> position;

  @override
  void load() {
    // automatically disposed
    background = Color$.$newPtr;
    background.ref = RAYWHITE;

    // using raw (untracked) - we own this, must free in onDispose()
    position = Vector2$.Raw();
  }

  @override
  void onDispose() {
    // NOTE: `background` is freed automatically
    position.free();
  }

  void Update() {
    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) {
      final hue = GetRandomValue(0, 360);
      background.ref = ColorFromHSV(hue.toDouble(), 1, 1);
    }
  }

  void Draw() {
    ClearBackground(background.ref);

    final w = GetScreenWidth(), h = GetScreenHeight();
    final text = "Press SPACE to change background color".toC;
    final fontSize = 32;

    final textW = MeasureText(text, fontSize);
    DrawText(text, w ~/ 2 - (textW ~/ 2) + 2, h ~/ 2 + 2, fontSize, BLACK);
    DrawText(text, w ~/ 2 - (textW ~/ 2), h ~/ 2, fontSize, WHITE);
  }
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');
  
  final myModule = registerModule(MyModule(rl));

  XTemp.instance.debugFree(true);
  // NOTE: with `debugFree` enabled you should see output at the exit:
  // Freeing user-defined 1 Color$ slots
  // [FREE] background

  InitWindow(screenWidth, screenHeight, "custom_module_dispose".toC);
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