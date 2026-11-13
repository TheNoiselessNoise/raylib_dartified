// Run it: dart run test_dev_debug.dart
import '_base.dart';

class MyEvent extends Event<G> {
  MyEvent(super.app);
}

class RectEntity extends Entity<G> {
  static final double radius = 32;

  RectEntity(super.app, int i) {
    add(CTransform(app, position: .vec2(100 + radius * i, 100 + radius * i)));
    add(CVelocity(app, velocity: .zero()));
    add(CRectCollider(app,
      size: .vec2(radius, radius),
      debugColor: .GREEN,
      debugDraw: true,
      enableRotation: true,
    ));
    add(CBoundsBounce(app));
    add(CPulse(app, speed: 10));
  }
}

class TestDevDebugScene extends DrawScene<G> {
  TestDevDebugScene(super.app) {
    for (int i = 1; i <= 5; i++) {
      addEntity(RectEntity(app, i));
    }
  }

  @override
  void onInput() {
    if (IsKeyPressed(.KEY_SPACE)) {
      emit(MyEvent(app), scope: .global);
    }
  }
}

class SecondScene extends DrawScene<G> {
  SecondScene(super.app);

  @override
  void onInput() {
    if (IsKeyPressed(.KEY_SPACE)) {
      emit(MyEvent(app), scope: .global);
    }
  }
}

typedef G = TestDevDebugApp;

class TestDevDebugApp extends ExampleRaylibApp<G> {
  late DebugAppSystem<G> debugSystem;

  TestDevDebugApp(super.backend);

  @override
  get eventSystemMode => .subscription;

  @override
  void onInput() {
    if (backend.input.isKeyPressed(.KEY_RIGHT)) callback(() => nextScene());
    if (backend.input.isKeyPressed(.KEY_LEFT)) callback(() => previousScene());
  }

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, "test_dev_debug");
    SetWindowMonitor(0);
    SetTargetFPS(60);

    addScene(TestDevDebugScene(app));
    addScene(SecondScene(app));
    addSystem(debugSystem = DebugAppSystem(app));

    debugSystem.devWatch('last rect pos',
      () => scene.QueryEntity
        .LastAs<RectEntity>()
        .get<CTransform<G>>()?.position
    );

    debugSystem.devBreakOn<MyEvent>();
  }
}

void main() => runExample((backend) => G(backend));
