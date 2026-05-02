import 'package:raylib_dartified/raylib.dart';
import 'package:raylib_dartified/abbr.dart';

void main() {
  findRaylib('path/to/raylib');

  CoreD.InitWindow(800, 600, 'Title');
  // you know the drill

  disposeRaylib();
}