// Run it: dart run custom_tracelog_callback.dart
import 'dart:ffi';
import '../../base_ffi.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, 'custom_tracelog_callback'.toC);

  final traceLogCallback = NativeCallable<TraceLogCallbackFunctionC>.isolateLocal(
    (int logLevel, Pointer<Char> text, Pointer<Void> args) {
      // args intentionally unused - see LIMITATIONS.md
      print('${TraceLogLevel.fromValue(logLevel).name}: ${text.toD}');
    }
  );
  SetTraceLogCallback(traceLogCallback.nativeFunction);

  TraceLog(TraceLogLevel.LOG_INFO.value, "Hello".toC);
  TraceLog(TraceLogLevel.LOG_INFO.value, "World".toC);
  
  CloseWindowAndDispose();

  traceLogCallback.close();
}