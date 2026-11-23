import '../../_example/ffi.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late NativeCallable<TraceLogCallbackFunctionC> traceLogCallback;

void main() => runRaylib(
  nativeLibPath: 'raylib-6.0_linux_amd64/lib',
  silent: true,
  shouldClose: (_) => true,
  loop: (_) async {},
  init: (_) {
    InitWindow(screenWidth, screenHeight, 'custom_tracelog_callback'.toC);

    traceLogCallback = .isolateLocal(
      (int logLevel, Pointer<Char> text, Pointer<Void> args) {
        // args intentionally unused - see LIMITATIONS.md
        print('${TraceLogLevel.fromValue(logLevel).name}: ${text.toDart}');
      }
    );

    SetTraceLogCallback(traceLogCallback.nativeFunction);

    TraceLog(TraceLogLevel.LOG_INFO.value, "Hello".toC);
    TraceLog(TraceLogLevel.LOG_INFO.value, "World".toC);
  },
  close: (_) {
    CloseWindow();
    traceLogCallback.close();
  }
);