// Run it: dart run test_disposable.dart
import '_base.dart';

final List<String> messages = [];

void addMessage(String message) {
  print(message);
  messages.add(message);
}

typedef SceneFactory = TestDisposableScene Function(G);

abstract class TestDisposableScene extends DrawScene<G> {
  TestDisposableScene(super.app);

  SceneFactory get nextScene;

  @override
  Color get backgroundColor => .DODGERBLUE;

  @override
  void onDrawBackground() => DrawText(namedId, 10, 10, 22, .WHITE);

  @override
  void onDrawForeground() => draw.text.size(22).at(10, 20).lines(messages).end();

  @override
  HookResult onBeforeAdd(ECSBase<G> parent) => this is TestScene1 ? .proceed : .cancel;

  @override
  HookResult onBeforeEnter() => .cancel;

  @override
  HookResult onBeforeLeave() => .cancel;

  @override
  void onEnter() => addMessage('Entering $namedId...');

  @override
  void onLeave() => addMessage('Leaving $namedId...');

  @override
  void onDispose() => addMessage('Disposing $namedId...');

  @override
  void onInput() {
    if (IsKeyPressed(.KEY_RIGHT)) {
      addMessage('=> NEXT SCENE');
      callback(() => app..setScene(nextScene(app))..removeScene(this)..addScene(this));
    }
  }
}

final class TestScene1 extends TestDisposableScene {
  TestScene1(super.app);

  @override
  SceneFactory get nextScene => TestScene2.new;
}

final class TestScene2 extends TestDisposableScene {
  TestScene2(super.app);

  @override
  SceneFactory get nextScene => TestScene1.new;
}

typedef G = TestDisposableApp;

final class TestDisposableApp extends ExampleRaylibApp<G> {
  TestDisposableApp(super.backend);

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, "test_disposable");
    SetWindowMonitor(0);
    SetTargetFPS(60);

    addScene(TestScene1(app));
  }
}

void main() => runExample(G.new);
