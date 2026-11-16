// Run it: dart run test_new_events.dart
import '_base.dart';

final class TestComp1 extends Comp<G> {
  TestComp1(super.app);

  @override
  void onEvent(Event<G> event) => print('$namedId: got event ${event.runtimeType}');
}

final class TestEntity extends Entity<G> {
  TestEntity(super.app) {
    // listen<EventEntityAdded<G>>(onEvent);
    add(TestComp1(app));
  }

  @override
  void onEvent(Event<G> event) => print('$namedId: got event ${event.runtimeType}');
}

final class TestScene extends DrawScene<G> {
  TestScene(super.app) {
    listen<EventEntityAdded<G>>(onEvent);
    listen<EventSceneAdded<G>>(onEvent);
    addEntity(TestEntity(app));
  }

  @override
  void onEvent(Event<G> event) => print('$namedId: got event ${event.runtimeType}');
}

final class TestScene2 extends DrawScene<G> {
  TestScene2(super.app) {
    listen<EventEntityAdded<G>>(onEvent);
    listen<EventSceneAdded<G>>(onEvent);
    addEntity(TestEntity(app));
  }

  @override
  void onEvent(Event<G> event) => print('$namedId: got event ${event.runtimeType}');
}

typedef G = TestNewEventsApp;

final class TestNewEventsApp extends ExampleRaylibApp<G> {
  TestNewEventsApp(super.backend) {
    // listenAny(onEvent);
    listen<EventEntityAdded<G>>(onEvent);
  }

  @override
  get eventSystemMode => .subscription;

  @override
  void onInit() => fastInit('test_new_events', [
    TestScene(app),
    TestScene2(app),
  ]);

  @override
  void onEvent(Event<G> event) => print('$namedId: got event ${event.runtimeType}');
}

void main() => runExample(G.new);
