import 'dart:io';
import 'package:path/path.dart' as p;

final packageRoot = File(Platform.script.toFilePath()).parent.parent;
final sourceDir = Directory(p.join(packageRoot.path, 'source'));

/// Everything cmake/build-related lives under here so raylibSrc/rayguiSrc
/// stay pristine clones that setup can safely delete and re-clone (e.g. when
/// switching --raylib-version) without ever touching raylib's own tree.
final sourceBuildDir = Directory(p.join(sourceDir.path, 'build'));

final raylibSrc = Directory(p.join(sourceDir.path, 'raylib'));
final rayguiSrc = Directory(p.join(sourceDir.path, 'raygui'));

/// Out-of-source cmake build dir for raylib (cmake -S raylibSrc -B this).
final raylibBuildDir = Directory(p.join(sourceBuildDir.path, 'raylib'));

/// rlights.h / msf_gif.h staged here instead of copied into raylibSrc/src.
final extraHeadersDir = Directory(p.join(sourceBuildDir.path, 'extra-headers'));

/// Where cmake actually drops the built raylib static/shared lib, mirroring
/// raylib's own src/CMakeLists.txt "raylib" subfolder target layout.
Directory get raylibLibDir => Directory(p.join(raylibBuildDir.path, 'raylib'));