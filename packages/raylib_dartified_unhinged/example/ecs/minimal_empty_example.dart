// Run it: dart run minimal_empty_example.dart
import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';

typedef G = MinimalEmptyExampleApp;

class MinimalEmptyExampleApp extends App<G> {
  MinimalEmptyExampleApp(super.backend);
}

void main() => print(G(HeadlessBackend()));