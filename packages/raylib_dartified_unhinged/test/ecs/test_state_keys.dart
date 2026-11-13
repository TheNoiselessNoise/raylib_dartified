import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:test/test.dart';
import '../mocks.dart';

typedef G = TestApp;

class TestApp extends TestingApp<G> {
  TestApp(super.backend, {
    super.populateDefaults,
  });

  @override
  G createInstance() => .new(backend, populateDefaults: false);
}

TestApp createTestApp() => .new(HeadlessBackend())..init();

class MyEntity extends Entity<G> {
  final int value;

  MyEntity(super.app, this.value);
}

class MyClonePolicy extends ClonePolicy<G> {
  @override
  bool allow(CloneKind kind, {ECSBase<G>? owner, Object? payload})
    => true; // allow everything, even identity
}

void main() {
  group('State Keys', () {
    late TestApp app;

    setUp(() => app = createTestApp());

    test('identity', () {
      // NOTE: i don't know why would you want to do this, but here we go
      final entity = app.testScene.entity1;
      // using our policy
      final clonedEntity = entity.clone(MyClonePolicy());
      expect(clonedEntity.id, equals(entity.id));
      expect(clonedEntity.namedId, equals(entity.namedId));
      expect(clonedEntity.name, equals(entity.name));
    });

    test('identity does NOT survive with default policy', () {
      final entity = app.testScene.entity1;
      final clonedEntity = entity.clone();
      expect(clonedEntity.id, isNot(equals(entity.id)));
      expect(clonedEntity.namedId, isNot(equals(entity.namedId)));
      expect(clonedEntity.name, isNot(equals(entity.name)));
    });

    test('Query.groups', () {
      // NOTE: why did i exactly implemented `clone` feature for Queries??? idk
      final query = app.scene.QueryEntity
        .With<TestingComponent3<G>>(); // entity2 > comp2 > comp3 (nested componented)
      final clonedQuery = query.clone();
      expect(clonedQuery.First, isA<TestingEntity2<G>>());
    });

    test('Query.sourceList', () {
      // NOTE: why did i exactly implemented `clone` feature for Queries??? idk
      final query = app.scene.QueryEntity
        .From(<MyEntity>[.new(app, 10), .new(app, 100), .new(app, 1000)])
        .Where((e) => e is MyEntity && e.value >= 100);
      final clonedQuery = query.clone();
      expect(clonedQuery.Count, equals(2));
    });

    test('HasVars.vars', () {
      final varId = VarKey<int>('id');
      varId.set(app, 100);
      final clonedApp = app.clone();
      expect(varId.get(clonedApp), equals(100));
    });

    test('IsCallbackProcessable.callbackQueue', () {
      bool? itWorked;
      app.callback(() => itWorked = true);
      final clonedApp = app.clone();
      clonedApp.scene.processCallbackQueueForTest();
      expect(itWorked, isTrue);
    });

    // NOTE: IsCancelable is used on structures which does not require cloning capability
    //       (Task, Event)
    // test('IsCancelable.isCanceled', () { });

    test('IsEnableable.isEnabled', () {
      app.testScene.entity1.setEnabled(false);
      final clonedEntity = app.testScene.entity1.clone();
      expect(clonedEntity.isEnabled, isFalse);
    });

    test('IsEventHistoryHolder.eventHistory', () {
      app.dispatch(TestingEvent(app), scope: .self);
      final clonedApp = app.clone();
      expect(clonedApp.eventHistory.length, equals(1));
      expect(clonedApp.eventHistory.first, isA<TestingEvent<G>>());
    });

    test('IsEventQueueHolder.eventQueue', () {
      app.emit(TestingEvent(app), scope: .self);
      final clonedApp = app.clone();
      final testingEvents = clonedApp.eventQueueForTesting.whereType<TestingEvent<G>>();
      expect(testingEvents.length, equals(1));
    });

    test('IsTaskProcessable.pendingTaskQueue', () {
      app.task(DelayTask(app, action: (_) {}, seconds: 1));
      final clonedApp = app.clone();
      expect(clonedApp.scene.pendingTaskQueueForTesting.length, equals(1));
    });

    test('IsTaskProcessable.taskQueue', () {
      app.task(DelayTask(app, action: (_) {}, seconds: 1));
      final clonedApp = app.clone();
      clonedApp.scene.processTaskQueueForTest(0.1);
      expect(clonedApp.scene.taskQueueForTesting.length, equals(1));
    });
  });
}