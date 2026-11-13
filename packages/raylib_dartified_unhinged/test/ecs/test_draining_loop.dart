import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:test/test.dart';

typedef G = TestApp;

List<EventDrainSource> eventSources = [];
int callbackFireCount = 0;

enum EventDrainSource {
  testStart,
  app_onEvent_emit,
  app_onEvent_callback,
  app_onEvent_task,
  origin_a,
  origin_b,
  reentrant_callback,
}

class TestApp extends App<G> {
  TestApp(super.backend);

  bool reentrantCallbackMode = false;

  @override
  void onEvent(Event<G> event) {
    if (event is TestEvent) {
      eventSources.add(event.source);
      emit(TestSecondEvent(app, .app_onEvent_emit), scope: .self);
      callback(() => emit(TestSecondEvent(app, .app_onEvent_callback), scope: .self));
      task(DelayTask(app,
        action: (_) => emit(TestSecondEvent(app, .app_onEvent_task), scope: .self),
      ));
    }

    if (event is TestSecondEvent) {
      eventSources.add(event.source);

      if (reentrantCallbackMode) {
        callbackFireCount++;
        callback(() => emit(TestSecondEvent(app, .reentrant_callback), scope: .self));
      }
    }
  }
}

mixin IsSourcedEvent on Event<G> {
  EventDrainSource get source;
}

class TestEvent extends Event<G> with IsSourcedEvent {
  @override final EventDrainSource source;
  TestEvent(super.app, this.source);
}

class TestSecondEvent extends Event<G> with IsSourcedEvent {
  @override final EventDrainSource source;
  TestSecondEvent(super.app, this.source);
}

void drainFully(TestApp app) {
  while (!app.scene.isDrainLoopEmptyForTest) {
    app.frame();
    app.scene.processDrainLoopForTest();
  }

  while (!app.scene.isTaskQueueEmptyForTest) {
    app.frame();
  }
}

void main() {
  group('Drain Loop', () {
    late TestApp app;

    setUp(() {
      app = .new(HeadlessBackend())..init()..clearEventQueue();
      eventSources = [];
      callbackFireCount = 0;
      app.reentrantCallbackMode = false;
    });

    test('single trigger fans out through emit, callback, and task in order', () {
      app.emit(TestEvent(app, .testStart));
      drainFully(app);

      expect(eventSources, equals(<EventDrainSource>[
        .testStart,
        .app_onEvent_emit,
        .app_onEvent_callback,
        .app_onEvent_task,
      ]));
    });

    test('event->event chains drain fully inside a single _processEvents call', () {
      app.emit(TestEvent(app, .testStart));
      app.processQueuedEventsForTest();

      expect(eventSources, equals(<EventDrainSource>[.testStart, .app_onEvent_emit]));
    });

    test('maxIterations caps cross-queue oscillation instead of hanging', () {
      app.reentrantCallbackMode = true;
      app.emit(TestEvent(app, .testStart));

      app.scene.processDrainLoopForTest();
      final firstCallCount = callbackFireCount;

      expect(firstCallCount, greaterThan(0));
      expect(app.scene.isDrainLoopEmptyForTest, isFalse,
        reason: 'infinite reentrant loop should still have pending work '
                'after a single capped drain pass, proving the cap (not '
                'natural exhaustion) is what stopped it');

      app.scene.processDrainLoopForTest();
      final secondCallCount = callbackFireCount;

      expect(secondCallCount, greaterThan(firstCallCount));
      expect(app.scene.isDrainLoopEmptyForTest, isFalse,
        reason: 'this cycle never terminates naturally, so it should '
                'still be capped (not exhausted) on subsequent calls too');

      app.reentrantCallbackMode = false;
      drainFully(app);
      expect(app.scene.isDrainLoopEmptyForTest, isTrue);
    });

    test('two independent origins emitted before drain starts both fire once', () {
      app.emit(TestEvent(app, .origin_a));
      app.emit(TestEvent(app, .origin_b));
      drainFully(app);

      final testEventSources = <EventDrainSource>[.origin_a, .origin_b];
      for (final source in testEventSources) {
        expect(eventSources.where((s) => s == source).length, equals(1),
          reason: '$source should fire exactly once');
      }
      expect(
        eventSources.where((s) => s == .app_onEvent_emit).length,
        equals(2),
        reason: 'each origin triggers its own emit-chain child',
      );
    });

    test('DelayTask fires only after its frame delay elapses, not immediately', () {
      app.emit(TestEvent(app, .testStart));
      app.scene.processDrainLoopForTest();

      expect(eventSources, isNot(contains(EventDrainSource.app_onEvent_task)));

      drainFully(app);
      expect(eventSources, contains(EventDrainSource.app_onEvent_task));
    });
  });
}