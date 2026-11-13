export 'package:raylib_dartified_web/raylib_dartified_web.dart'
  if (dart.library.ffi) 'package:raylib_dartified/raylib_dartified.dart';

import '';

import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart'
  show App, RaylibBackend;

abstract class UnhingedRaylibApp<T extends App<T>> extends RaylibAppBase<Raylib> {
  late T app;

  T create(RaylibBackend backend);

  @override
  void init(Raylib rl) => app = create(.new(rl))..init();

  @override
  bool shouldClose(Raylib rl) => app.shouldAppExit || super.shouldClose(rl);

  @override
  Future<void> loop(Raylib rl) async => app.frame();

  @override
  void close(Raylib rl) => app.exit();
}