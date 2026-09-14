import '../../base_dart.dart';

/*
  To write an app once and run it on `native` and `web` backends, implement
  `RaylibAppBase` and let each backend's `runRaylib` drive the lifecycle.

  Each backend supplies its own `runRaylib`, which calls `init` once,
  then drives `loop` every frame until `shouldClose` returns `true`,
  then calls `close` and `dispose`. You never write the loop yourself.

  Note that `shouldClose` still branches on `currentRaylibPlatform`, WASM has
  no exit condition of its own (the browser owns the loop) and `WindowShouldClose`
  should not be called in WASM backend, so this one check is the honest boundary
  of "agnostic" rather than a leak in the abstraction.
*/

class BackendAgnosticRaylibExample<R extends RaylibBase> extends RaylibAppBase<R> {
  @override
  bool shouldClose(_) => switch (currentRaylibPlatform) {
    .native => WindowShouldClose(),
    .web => false,
  };

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