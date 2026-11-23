import '../../_example/flat.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late TraceLogCallback traceLogCallback;

void main() => runExampleNoLoop(
  init: (_) {
    InitWindow(screenWidth, screenHeight, 'custom_tracelog_callback'.toC);

    traceLogCallback = .function((logLevel, text, args) {
      final levelName = TraceLogLevel.fromValue(logLevel).name;
      final formatted = XVaList.format(text, args);
      print('$levelName: $formatted');
    });

    SetTraceLogCallback(traceLogCallback.nativeFunction);

    TraceLog(TraceLogLevel.LOG_INFO.value, "Hello".toC);
    TraceLog(TraceLogLevel.LOG_INFO.value, "World".toC);
  },
  close: (_) {
    CloseWindow();
    traceLogCallback.dispose();
  },
);