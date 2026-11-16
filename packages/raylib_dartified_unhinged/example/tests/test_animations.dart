// Run it: dart run test_animations.dart
import '_base.dart';

final class MyEntity extends Entity<G> {
  double entityField;

  late CAnimation<G> animation;

  MyEntity(super.app, {
    required this.entityField
  }) {
    add(CTransform(app, position: screenSize.divideBy(2)));
    add(CRectCollider(app, size: .vec2(64, 64), debugDraw: true, debugColor: .GREEN));
    add(animation = .new(app)
      ..property(() => entityField, (v) => entityField = v, from: 0, to: 1, duration: 0.5)
      ..onComplete(() {
        addMessage('Animation completed!');
        animation.reset();
      }),
    );
  }

  @override
  void onPostUpdate(double dt) => onTransform((t) {
    t.position.x = Remap(entityField, 0, 1, 0, sceneWidth);
  });
}

extension on HasAppAccess<G> {
  TestStateMachineScene get testScene => app.getScene()!;
  void addMessage(String message, {bool? isValid})
    => testScene.messagesWidget.setState(() => testScene.messagesWidget.addMessage(message, isValid: isValid));
}

final class TestStateMachineScene extends DrawScene<G> {
  late MyEntity myEntity;
  late ExampleMessagesWidget<G> messagesWidget;

  TestStateMachineScene(super.app) {
    addEntity(messagesWidget = .new(app));
    addEntity(myEntity = MyEntity(app, entityField: 69));
  }

  @override
  void onInput() {
    if (IsKeyDown(.KEY_UP)) myEntity.entityField++;
    if (IsKeyDown(.KEY_DOWN)) myEntity.entityField--;
  }

  @override
  void onDraw(double dt) {
    DrawText('entityField: ${myEntity.entityField}', 10, screenHeight - 30, 20, .WHITE);
  }

  @override
  TestStateMachineScene createInstance() => .new(app);
}

typedef G = TestStateMachineApp;

final class TestStateMachineApp extends ExampleRaylibApp<G> {
  TestStateMachineApp(super.backend);

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, "test_animations");
    SetWindowMonitor(0);
    SetTargetFPS(60);
    addScene(TestStateMachineScene(app));
  }

  @override
  TestStateMachineApp createInstance() => .new(backend);
}

void main() => runExample((backend) => G(backend));
