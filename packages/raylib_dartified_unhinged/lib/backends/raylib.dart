import 'package:raylib_dartified/raylib_dartified.dart';
import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
export 'package:raylib_dartified/api/dart.dart';

abstract class UnhingedRaylibApp<T extends App<T>> extends RaylibApp {
  late T app;

  T create(RaylibBackend backend);

  @override
  void init(Raylib rl) => app = create(.new(rl))..init();

  @override
  bool shouldClose(Raylib rl) => app.shouldAppExit;

  @override
  Future<void> loop(Raylib rl) async => app.frame();

  @override
  void close(Raylib rl) => app.exit();
}