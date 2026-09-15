import '../../base_dart.dart';

/*
  To write an app once and run it on `native` and `web` backends, implement
  `RaylibAppBase` and let each backend's `runRaylib` drive the lifecycle.

  Each backend supplies its own `runRaylib`, which calls `init` once,
  then drives `loop` every frame until `shouldClose` returns `true`,
  then calls `close` and `dispose`. You never write the loop yourself.
*/

class BackendAgnosticRaylibExample extends RaylibAppBase<Raylib> {
  @override
  void init(_) {
    InitWindow(800, 450, 'Backend Agnostic Raylib Example');
  }

  @override
  Future<void> loop(_) async {
    BeginDrawing();
    ClearBackground(.BLACK);
    DrawCircleV(GetMousePosition(), 25, .RED);
    EndDrawing();
  }
}

void main() => runRaylib(
  BackendAgnosticRaylibExample(),
  nativeLibPath: 'raylib-6.0_linux_amd64/lib', // ignored on Web/WASM
);