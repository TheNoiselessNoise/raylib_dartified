// Run it: dart run custom_module_dispose.dart
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_ffi.dart';

const int screenWidth = 800;
const int screenHeight = 450;

class MyModule extends RaylibModule<Raylib> {
  MyModule(super.rl);

  // fields initialized in load(), which is called by registerModule()
  late Pointer<ColorC> background;
  late Pointer<Vector2C> position;

  @override
  void load() {
    background = calloc<ColorC>()..ref = RAYWHITE;
    position = calloc<Vector2C>();
  }

  @override
  void dispose() {
    super.dispose();
    calloc.free(background);
    calloc.free(position);
  }

  void Update() {
    position.ref = GetMousePosition();

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value)) {
      final hue = GetRandomValue(0, 360);
      background.ref = ColorFromHSV(hue.toDouble(), 1, 1);
    }
  }

  void Draw() {
    ClearBackground(background.ref);

    DrawCircleV(position.ref, 25, RED);

    final w = GetScreenWidth(), h = GetScreenHeight();
    final text = "Press SPACE to change background color".toC;
    final fontSize = 32;

    final textW = MeasureText(text, fontSize);
    DrawText(text, w ~/ 2 - (textW ~/ 2) + 2, h ~/ 2 + 2, fontSize, BLACK);
    DrawText(text, w ~/ 2 - (textW ~/ 2), h ~/ 2, fontSize, WHITE);
  }
}

MyModule get myModule => Raylib.instance.module();

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');
  allocateRaylibColors();
  
  rl.registerModule(MyModule(rl));

  InitWindow(screenWidth, screenHeight, "custom_module_dispose".toC);
  SetTargetFPS(60);

  while (!WindowShouldClose())
  {
    myModule.Update();

    BeginDrawing();
      myModule.Draw();
    EndDrawing();
  }

  // you should see in the output:
  // Disposing MyModule
  CloseWindowAndDispose();
}