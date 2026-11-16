// Run it: dart run test_begin_end_callback.dart
import '_base.dart';

final class TestBeginEndCallbackScene extends DrawScene<G> {
  TestBeginEndCallbackScene(super.app);

  @override
  void onInput() {
    final currentFrame = app.time.frameCount;

    if (IsKeyPressed(.KEY_LEFT)) callback(() {
      final frame = app.time.frameCount;
      print('$currentFrame -> $frame: "begin"');
    }, .begin);

    if (IsKeyPressed(.KEY_RIGHT)) callback(() {
      final frame = app.time.frameCount;
      print('$currentFrame -> $frame: "end"');
    }, .end);
  }
}

typedef G = TestBeginEndCallbackApp;

final class TestBeginEndCallbackApp extends ExampleRaylibApp<G> {
  TestBeginEndCallbackApp(super.backend);

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, "test_begin_end_callback");
    SetWindowMonitor(0);
    SetTargetFPS(60);

    addScene(TestBeginEndCallbackScene(app));
  }
}

void main() => runExample(G.new);
