import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:test/test.dart';
import '../mocks.dart';

typedef _E<T extends App<T>> = TestingEvent<T>;

final Set<TestingEmitterType> testCollector = {};
final Map<TestingEmitterType, int> testCounts = {};

void addTestResult<T extends App<T>>(Event<T> event, TestingEmitterType emitter) {
  if (event is! _E<T>) return;
  testCollector.add(emitter);
  testCounts[emitter] = testCounts.putIfAbsent(emitter, () => 0) + 1;
}

class TestEventPropagationResult {
  ExpectedValues expected = .new({}, 0, 0);
  Set<(TestingEmitterType, int)> got = {};

  Set<TestingEmitterType> missing = {};
  Set<TestingEmitterType> extra = {};
  Set<(TestingEmitterType, int)> tooMany = {};

  bool get isValid => missing.isEmpty && extra.isEmpty && tooMany.isEmpty;

  String get reason => [
    '\nEXPECTED: ',
    expected.allEvents.map((x) => '${x.name}(1)').join(', '),

    '\nGOT:      ',
    got.map((x) => '${x.$1.name}(${x.$2})').join(', '),

    '\n--- REASON ---',

    if (missing.isNotEmpty) [
      '\nMISSING:  ',
      missing.map((x) => x.name).join(', '),
    ].join(''),

    if (extra.isNotEmpty) [
      '\nEXTRA:    ',
      extra.map((x) => x.name).join(', '),
    ].join(''),

    if (tooMany.isNotEmpty) [
      '\nTOO MANY: ',
      tooMany.map((x) => '${x.$1.name}(${x.$2})').join(', '),
    ].join(''),

  ].join('');
}

void fireEvent<T extends TestingApp<T>>(T app, TestingEmitterType emitter, EventMethod method, EventScope scope, {
  bool reset = false,
}) {
  if (reset) {
    testCollector.clear();
    testCounts.clear();
  }

  final IsAnyEventEmittable<T> emittable = switch (emitter) {
    .app         => app,
    .appSystem   => app.appSystem,
    .scene       => app.testScene,
    .sceneSystem => app.testScene.sceneSystem,
    .entity1     => app.testScene.entity1,
    .comp1       => app.testScene.entity1.comp1,
    .entity2     => app.testScene.entity2,
    .comp2       => app.testScene.entity2.comp2,
    .comp3       => app.testScene.entity2.comp2.comp3,
  };

  switch (method) {
    case .emit:     emittable.emit(_E(app), scope: scope);
    case .dispatch: emittable.dispatch(_E(app), scope: scope);
  }

  if (method == .emit) {
    app.processQueuedEventsForTest();
  }
}

TestEventPropagationResult testEventPropagation<T extends TestingApp<T>>(T app, {
  required TestingEmitterType emitter,
  required EventMethod method,
  required EventScope scope,
}) {
  final result = TestEventPropagationResult();

  final key = (emitter, scope);
  result.expected = expectedReceivers[key]!;

  fireEvent(app, emitter, method, scope, reset: true);
  result.missing = result.expected.allEvents.difference(testCollector);
  result.extra   = testCollector.difference(result.expected.allEvents);

  for (final ex in testCounts.entries) {
    result.got.add((ex.key, ex.value));

    if (!result.expected.allEvents.contains(ex.key)) continue;
    if (ex.value > 1) result.tooMany.add((ex.key, ex.value));
  }

  return result;
}

enum EventMethod {
  emit,
  dispatch,
}

class ExpectedValues {
  final int appEventCount;
  final int holderEventCount;
  final Set<TestingEmitterType> allEvents;

  const ExpectedValues(this.allEvents, [this.appEventCount = 1, this.holderEventCount = 1]);
}

const Map<(TestingEmitterType, EventScope), ExpectedValues> expectedReceivers = {

  (.app, .root):             .new({.app, .appSystem}),
  (.app, .rootAndLocal):     .new({.app, .appSystem}),
  (.app, .global):           .new({.app, .appSystem, .scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.app, .globalNoEntities): .new({.app, .appSystem, .scene, .sceneSystem}),
  (.app, .scene):            .new({.scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.app, .sceneOnly):        .new({.scene, .sceneSystem}),
  (.app, .local):            .new({.app, .appSystem}),
  (.app, .self):             .new({.app}),
    
  (.appSystem, .root):             .new({.app, .appSystem}),
  (.appSystem, .rootAndLocal):     .new({.app, .appSystem}),
  (.appSystem, .global):           .new({.app, .appSystem, .scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.appSystem, .globalNoEntities): .new({.app, .appSystem, .scene, .sceneSystem}),
  (.appSystem, .scene):            .new({.scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.appSystem, .sceneOnly):        .new({.scene, .sceneSystem}),
  (.appSystem, .local):            .new({.appSystem}),
  (.appSystem, .self):             .new({.appSystem}),
  
  (.scene, .root):             .new({.app, .appSystem}),
  (.scene, .rootAndLocal):     .new({.app, .appSystem, .scene, .sceneSystem}),
  (.scene, .global):           .new({.app, .appSystem, .scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.scene, .globalNoEntities): .new({.app, .appSystem, .scene, .sceneSystem}),
  (.scene, .scene):            .new({.scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.scene, .sceneOnly):        .new({.scene, .sceneSystem}),
  (.scene, .local):            .new({.scene, .sceneSystem}),
  (.scene, .self):             .new({.scene}),

  (.sceneSystem, .root):             .new({.app, .appSystem}),
  (.sceneSystem, .rootAndLocal):     .new({.app, .appSystem, .sceneSystem}),
  (.sceneSystem, .global):           .new({.app, .appSystem, .scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.sceneSystem, .globalNoEntities): .new({.app, .appSystem, .scene, .sceneSystem}),
  (.sceneSystem, .scene):            .new({.scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.sceneSystem, .sceneOnly):        .new({.scene, .sceneSystem}),
  (.sceneSystem, .local):            .new({.sceneSystem}),
  (.sceneSystem, .self):             .new({.sceneSystem}),

  (.entity1, .root):             .new({.app, .appSystem}),
  (.entity1, .rootAndLocal):     .new({.app, .appSystem, .entity1, .comp1}),
  (.entity1, .global):           .new({.app, .appSystem, .scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.entity1, .globalNoEntities): .new({.app, .appSystem, .scene, .sceneSystem}),
  (.entity1, .scene):            .new({.scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.entity1, .sceneOnly):        .new({.scene, .sceneSystem}),
  (.entity1, .local):            .new({.entity1, .comp1}),
  (.entity1, .self):             .new({.entity1}),

  (.comp1, .root):             .new({.app, .appSystem}),
  (.comp1, .rootAndLocal):     .new({.app, .appSystem, .comp1}),
  (.comp1, .global):           .new({.app, .appSystem, .scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.comp1, .globalNoEntities): .new({.app, .appSystem, .scene, .sceneSystem}),
  (.comp1, .scene):            .new({.scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.comp1, .sceneOnly):        .new({.scene, .sceneSystem}),
  (.comp1, .local):            .new({.comp1}),
  (.comp1, .self):             .new({.comp1}),

  (.entity2, .root):             .new({.app, .appSystem}),
  (.entity2, .rootAndLocal):     .new({.app, .appSystem, .entity2, .comp2, .comp3}),
  (.entity2, .global):           .new({.app, .appSystem, .scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.entity2, .globalNoEntities): .new({.app, .appSystem, .scene, .sceneSystem}),
  (.entity2, .scene):            .new({.scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.entity2, .sceneOnly):        .new({.scene, .sceneSystem}),
  (.entity2, .local):            .new({.entity2, .comp2, .comp3}),
  (.entity2, .self):             .new({.entity2}),

  (.comp2, .root):             .new({.app, .appSystem}),
  (.comp2, .rootAndLocal):     .new({.app, .appSystem, .comp2, .comp3}),
  (.comp2, .global):           .new({.app, .appSystem, .scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.comp2, .globalNoEntities): .new({.app, .appSystem, .scene, .sceneSystem}),
  (.comp2, .scene):            .new({.scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.comp2, .sceneOnly):        .new({.scene, .sceneSystem}),
  (.comp2, .local):            .new({.comp2, .comp3}),
  (.comp2, .self):             .new({.comp2}),

  (.comp3, .root):             .new({.app, .appSystem}),
  (.comp3, .rootAndLocal):     .new({.app, .appSystem, .comp3}),
  (.comp3, .global):           .new({.app, .appSystem, .scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.comp3, .globalNoEntities): .new({.app, .appSystem, .scene, .sceneSystem}),
  (.comp3, .scene):            .new({.scene, .sceneSystem, .entity1, .comp1, .entity2, .comp2, .comp3}),
  (.comp3, .sceneOnly):        .new({.scene, .sceneSystem}),
  (.comp3, .local):            .new({.comp3}),
  (.comp3, .self):             .new({.comp3}),
};

typedef G = TestApp;

class TestApp extends TestingApp<G> {
  TestApp(super.backend, {
    super.onEventCallbackPackage,
  });
}

TestApp createTestApp({
  bool clearEventQueue = false,
}) {
  final TestApp app = .new(HeadlessBackend(),
    onEventCallbackPackage: .new(
      appOnEvent: (e) => addTestResult(e, .app),
      appSystemOnEvent: (e) => addTestResult(e, .appSystem),
      sceneOnEvent: (e) => addTestResult(e, .scene),
      sceneSystemOnEvent: (e) => addTestResult(e, .sceneSystem),
      entity1OnEvent: (e) => addTestResult(e, .entity1),
      comp1OnEvent: (e) => addTestResult(e, .comp1),
      entity2OnEvent: (e) => addTestResult(e, .entity2),
      comp2OnEvent: (e) => addTestResult(e, .comp2),
      comp3OnEvent: (e) => addTestResult(e, .comp3),
    ),
  )..init();

  if (clearEventQueue) app.clearEventQueue();
  return app;
}

void main() {
  group('Cancellation', () {
    late TestApp app;

    setUp(() {
      app = createTestApp();
      testCounts.clear();
    });

    test('Simple', () {
      app.dispatch(_E(app), scope: .self);
      expect(testCounts[TestingEmitterType.app], equals(1));
      testCounts.clear();

      app.listenOnBeforeEventDispatch((_, e) => e.cancel());

      app.dispatch(_E(app), scope: .self);
      expect(testCounts[TestingEmitterType.app], isNull);
    });

    test('cancel() inside onEvent hook should NOT work as stopPropagation()', () {
      app.listenOnEvent((_, e) => e.cancel());
      app.dispatch(_E(app), scope: .self);
      expect(testCounts[TestingEmitterType.app], equals(1));

      testCounts.clear();

      app.listenOnEvent((_, e) => e.stopPropagation());
      app.dispatch(_E(app), scope: .self);
      expect(testCounts[TestingEmitterType.app], isNull);
    });
  });

  group('Propagation', () {
    final app = createTestApp();

    for (final method in EventMethod.values) {
      group('method=${method.name}', () {
        for (final scope in EventScope.values) {
          group('scope=${scope.name}', () {
            for (final emitter in TestingEmitterType.values) {
              test('emitter=${emitter.name}', () {
                final result = testEventPropagation(app,
                  method: method,
                  scope: scope,
                  emitter: emitter,
                );

                expect(result.isValid, equals(true), reason: result.reason);
              });
            }
          });
        }
      });
    }
  });

  group('regression: queue ordering', () {
    test('equal-priority events drain in insertion order', () {
      final app = createTestApp();
      
      final holders = app.eventHistoryHolders;

      List<_E<G>> events = List.generate(holders.length, (_) => .new(app));
      List<int> ids = events.map((e) => e.id).toList();

      for (final (i, emittable) in holders.values.indexed) {
        emittable.emit(events[i], scope: .self);
      }

      app.processQueuedEventsForTest();

      final historyEvents = app.eventHistory.whereType<_E>().toList();
      List<int> historyIds = historyEvents.map((e) => e.id).toList();

      expect(historyEvents.length, equals(holders.length));
      expect(historyIds, equals(ids));

      for (final (i, emittable) in holders.values.indexed) {
        if (emittable is TestApp) continue;

        final historyEvents = emittable.eventHistory.whereType<_E>().toList();
        List<int> historyIds = historyEvents.map((e) => e.id).toList();

        expect(historyEvents.length, equals(1));
        expect(historyIds, equals([events[i].id]));
      }
    });
  });

  group('replaying', () {
    late G app;

    setUp(() => app = createTestApp(clearEventQueue: true));

    test('reproduces live self-scope delivery order per holder', () {
      List<String> ids = [];

      for (final holder in app.eventHistoryHolders.values) {
        holder.listenOnEvent((x, event) {
          ids.add('${x.namedId}_${event.namedId}');
        });
      }

      for (final holder in app.eventHistoryHolders.values) {
        ids.clear();

        // some arbitrary number of events
        final List<_E<G>> events = .generate(10, (_) => .new(app));        
        final expected = events.map((e) => '${holder.namedId}_${e.namedId}');

        for (final event in events) {
          holder.emit(event, scope: .self);
        }

        app.processQueuedEventsForTest();

        // current
        expect(ids.toList(), equals(expected));
        ids.clear();

        holder.replayRecordedEvents(filter: (e) => e is _E);
        app.processQueuedEventsForTest();

        // recorded
        expect(ids.toList(), equals(expected));

        app.clearEventHistory();
        holder.clearEventHistory();
      }
    });

    test('multiple', () {
      const n = 10;
      const replays = 10;

      final List<String> ids = [];
      app.listenOnEvent((x, event) => ids.add('${x.namedId}_${event.namedId}'));

      final List<_E<G>> events = .generate(n, (_) => .new(app));
      events.forEach((e) => app.emit(e, scope: .self));
      app.processQueuedEventsForTest();

      final singleBatch = events.map((e) => '${app.namedId}_${e.namedId}').toList();
      final expected = <String>[
        for (var i = 0; i < replays + 1; i++) ...singleBatch,
      ];

      for (var i = 0; i < replays; i++) {
        app.replayRecordedEvents(filter: (e) => e is _E);
        app.processQueuedEventsForTest();
      }

      expect(ids.toList(), equals(expected));
    });
  });

  group('recorded check', () {
    late G app = createTestApp(clearEventQueue: true);

    void reset() {
      for (final entry in app.eventHistoryHolders.values) {
        if (entry is G) entry.clearEventQueue();
        entry.clearEventHistory();
      }
    }

    for (final entry in app.eventHistoryHolders.entries) {
      final emitter = entry.key;
      final holder = entry.value;

      for (final scope in EventScope.values) {
        for (final method in EventMethod.values) {
          test('method=${method.name} scope=${scope.name} emitter=${emitter.name}', () {
            reset();

            fireEvent(app, emitter, method, scope, reset: true);

            final key = (emitter, scope);
            final expected = expectedReceivers[key]!;
            final int eventCount = expected.allEvents.length;
            final appEvents = app.getRecordedEvents(filter: (e) => e is _E);
            final holderEvents = holder.getRecordedEvents(filter: (e) => e is _E);

            expect(testCollector.length, equals(eventCount), reason: '\nCOLLECTOR:\nExpected: ${expected.allEvents.map((e) => e.name)}\n  Actual: ${testCollector.map((e) => e.name)}');
            expect(appEvents.length, equals(expected.appEventCount), reason: 'WHAT: appEvents');
            expect(holderEvents.length, equals(expected.holderEventCount), reason: 'WHAT: holderEvents');
          });
        }
      }
    }
  });

  group('event history replay', () {
    test('replaying app history before comp history compounds the replay count', () {
      late G app = createTestApp(clearEventQueue: true);

      final comp3 = app.testScene.entity2.comp2.comp3;

      // Single dispatch cycle: comp3 is origin, app is root.
      // This records exactly once at origin and once at root.
      // 1 event in each history.
      comp3.dispatch(_E(app), scope: .sceneOnly);

      expect(app.getRecordedEvents().length, equals(1));
      expect(comp3.getRecordedEvents().length, equals(1));

      // Replays everything currently in app's history (1 event: `e1`).
      // Replaying re-dispatches `e1` from its original origin (comp3), which
      // is a fresh dispatch cycle -> records once more at comp3 AND once
      // more at app.
      // 
      // After this call: app = [e1, e2], comp3 = [e1, e2].
      app.replayRecordedEvents();

      // Replays everything currently in comp3's history -- but comp3's
      // history was just mutated by the app.replayRecordedEvents() call
      // above, so this replays 2 events (e1, e2), not the 1 comp3 started
      // with. Each of those 2 replays is its own fresh dispatch cycle from
      // comp3, so it adds 2 more events to BOTH comp3's and app's history.
      // Final: app = [e1, e2, e3, e4], comp3 = [e1, e2, e3, e4].
      //
      // Call order matters here: app.replayRecordedEvents() runs first and
      // grows comp3's history as a side effect (comp3 is origin for every
      // event), so comp3.replayRecordedEvents() then has more to replay
      // than it would if the order were reversed.
      comp3.replayRecordedEvents();

      expect(app.getRecordedEvents().length, equals(4));
      expect(comp3.getRecordedEvents().length, equals(4));
    });
  });
}
