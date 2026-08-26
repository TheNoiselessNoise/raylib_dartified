// Run it: dart run custom_tracelog_callback.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, 'custom_tracelog_callback');

  SetTraceLogCallback(TraceLogCallbackD.friendly((logLevel, text) {
    print('${logLevel.name}: $text');
  }));

  TraceLog(.LOG_INFO, "Hello");
  TraceLog(.LOG_INFO, "World");

  print('RaylibPlatform: ${currentRaylibPlatform.name}');
  
  CloseWindowAndDispose();
}