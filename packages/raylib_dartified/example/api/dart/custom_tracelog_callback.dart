import '../../_example/dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main() => runExampleNoLoop(
  init: (_) {
    InitWindow(screenWidth, screenHeight, 'custom_tracelog_callback');

    SetTraceLogCallback(TraceLogCallback.friendly((logLevel, text) {
      print('${logLevel.name}: $text');
    }));

    TraceLog(.LOG_INFO, "Hello");
    TraceLog(.LOG_INFO, "World");
  },
  close: (_) {
    CloseWindow();
  },
);