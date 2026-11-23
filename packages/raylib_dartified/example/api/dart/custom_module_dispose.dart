import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

final class MyModule extends XPackageModule<Raylib> {
  MyModule(super.pkg);

  Color background = .RAYWHITE;
  Vector2 position = .zero();

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

late MyModule myModule;
bool doClose = false;

void main() => runExample(
  init: (rl) {
    myModule = registerModule(MyModule(rl));

    XTemp.instance.debugFree(true);
    // NOTE: with `debugFree` enabled you should see output at the exit:
    // Freeing user-defined 2 Vector2 slots
    // [FREE] @extract:1           explanation: GetMousePosition
    // [FREE] @ref:1               explanation: position
    // Freeing user-defined 2 Color slots
    // [FREE] @ref:1               explanation: BLACK and WHITE
    // [FREE] @extract:1           explanation: ColorFromHSV

    InitWindow(screenWidth, screenHeight, "custom_module_dispose");
    SetTargetFPS(60);
  },
  loop: (_) async {
    myModule.Update();

    BeginDrawing();
      myModule.Draw();
    EndDrawing();
  },
  close: (_) {
    CloseWindow();
  },
);