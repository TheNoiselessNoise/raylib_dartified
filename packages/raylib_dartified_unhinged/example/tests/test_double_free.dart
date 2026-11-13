import 'package:raylib_dartified_unhinged/backends/raylib/backend.dart';
import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:raylib_dartified_unhinged/backends/raylib/abbr.dart';

typedef G = TestDoubleFreeApp;

class TestDoubleFreeApp extends App<G> {
  TestDoubleFreeApp(super.backend);

  @override
  void onInit() => InitWindow(screenWidth, screenHeight, 'Game');

  @override
  void onExit() => CloseWindow();
}

class Bridge extends UnhingedRaylibApp<G> {
  @override
  G create(RaylibBackend backend) => .new(backend);
}

void main() => runRaylib(
  Bridge(),
  nativeLibPath: 'raylib-6.0_linux_amd64/lib',
  silent: true,
);