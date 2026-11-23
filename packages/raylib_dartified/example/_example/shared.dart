export 'package:raylib_dartified/raylib_dartified.dart';
import 'package:raylib_dartified/raylib_dartified.dart';

void runExample({
  required void Function(Raylib rl) init,
  bool Function(Raylib rl)? shouldClose,
  required Future<void> Function(Raylib rl) loop,
  void Function(Raylib rl)? close,
}) => runRaylib(
  silent: true,
  nativeLibPath: 'raylib-6.0_linux_amd64/lib', // ignored on Web/WASM
  init: init,
  shouldClose: shouldClose,
  loop: loop,
  close: close,
);

void runExampleNoLoop({
  required void Function(Raylib rl) init,
  void Function(Raylib rl)? close,
}) => runExample(
  init: init,
  shouldClose: (_) => true,
  loop: (_) async {},
  close: close ?? (_) {},
);