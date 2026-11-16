// Run it: dart run test_new_events_dispose.dart
import '_base.dart';

typedef G = TestDisposeApp;

final class EventPing extends Event<G> {
  EventPing(super.app);
}

int heardByA = 0;
int heardByB = 0;
int heardByC = 0;
bool armed = false; // only count events fired after setup

void check(bool cond, String msg) {
  if (!cond) throw StateError('FAIL: $msg');
  print('ok: $msg');
}

void checkEq(Object? actual, Object? expected, String msg) {
  if (actual != expected) throw StateError('FAIL: $msg (got $actual, expected $expected)');
  print('ok: $msg');
}

final class CompC extends Comp<G> {
  CompC(super.app) {
    listen<EventPing>((_) { if (armed) heardByC++; });
  }
}

final class CompA extends Comp<G> {
  late final CompB b;
  CompA(super.app) {
    listen<EventPing>((_) {
      if (!armed) return;
      heardByA++;
      b.dispose();
    });
  }
}

final class CompB extends Comp<G> {
  CompB(super.app) {
    listen<EventPing>((_) { if (armed) heardByB++; });
  }
}

final class TestScene extends DrawScene<G> {
  TestScene(super.app);
}

final class TestDisposeApp extends ExampleRaylibApp<G> {
  TestDisposeApp(super.backend);

  @override
  get eventSystemMode => .subscription;

  @override
  void onInit() {
    final scene = TestScene(app);
    fastInit('test_new_events_dispose', [scene]);

    // --- Test 1: disposed comp stops hearing ---
    final c = CompC(app);
    // scene.addEntity(Entity<G>(app)..addComp(c));
    scene.dispatch(EventPing(app), scope: .scene);
    armed = true;

    // scene.addEntity(Entity<G>(app));
    scene.dispatch(EventPing(app), scope: .scene);
    checkEq(heardByC, 1, 'CONTROL: live comp hears entity added in its scene');

    c.dispose();
    // scene.addEntity(Entity<G>(app));
    scene.dispatch(EventPing(app), scope: .scene);
    checkEq(heardByC, 1, 'disposed comp hears nothing more');

    // --- Test 2: dispose a later subscriber from inside an earlier handler ---
    final a = CompA(app);
    final b = CompB(app);
    a.b = b;
    scene.addEntity(Entity<G>(app)..add(a)..add(b)); // setup only, queued is fine
    heardByA = 0;
    heardByB = 0;
    armed = true;

    scene.dispatch(EventPing(app), scope: .scene);
    checkEq(heardByA, 1, 'A heard the ping');
    checkEq(heardByB, 0, 'B disposed mid-dispatch, skipped');

    // Test 3
    scene.dispatch(EventPing(app), scope: .scene);
    checkEq(heardByA, 2, 'A still works after compaction');
    checkEq(heardByB, 0, 'B still silent');

    print('ALL PASSED');
  }
}

void main() => runExample(G.new);