// Run it: dart run custom_tracelog_callback.dart
import '../../base_flat.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, 'custom_tracelog_callback'.toC);

  final TraceLogCallbackD traceLogCallback = .function((logLevel, text, args) {
      // args intentionally unused - see LIMITATIONS.md
      print('${TraceLogLevel.fromValue(logLevel).name}: ${text.toDartString()}');
    }
  );
  SetTraceLogCallback(traceLogCallback.nativeFunction);

  TraceLog(TraceLogLevel.LOG_INFO.value, "Hello".toC);
  TraceLog(TraceLogLevel.LOG_INFO.value, "World".toC);
  
  CloseWindowAndDispose();

  traceLogCallback.dispose();
}