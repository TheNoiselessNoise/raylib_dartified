import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:test/test.dart';
import 'dart:math' show Random;

typedef G = TestApp;

final Random random = Random();

mixin HasRandomValues {
  int intValue = 0;
  double doubleValue = 0;

  List<num> get collectRandomValues => [intValue, doubleValue];

  void setValues(int newIntValue, double newDoubleValue) {
    intValue = newIntValue;
    doubleValue = newDoubleValue;
  }

  void setRandomValues() {
    intValue = random.nextInt(255);
    doubleValue = random.nextDouble();
  }
}

final class TestScene extends FWidgetScene<G> with HasRandomValues {
  late TestSceneSystem testSceneSystem;
  late TestEntity1 entity1;
  late TestEntity2 entity2;

  TestScene(super.app) {
    addSystem(testSceneSystem = .new(app));
    addEntity(entity1 = .new(app));
    addEntity(entity2 = .new(app));
  }

  @override
  List<num> get collectRandomValues => [
    ...super.collectRandomValues,
    ...testSceneSystem.collectRandomValues,
    ...entity1.collectRandomValues,
    ...entity2.collectRandomValues,
  ];

  @override
  void setRandomValues() {
    super.setRandomValues();
    entity1.setRandomValues();
    entity2.setRandomValues();
  }

  @override
  TestSceneSnapshot createSnapshot() {
    TestSceneSnapshot snapshot = .new(namedId);
    snapshot.setValues(intValue, doubleValue);
    return snapshot;
  }

  @override
  void restoreSnapshot(TestSceneSnapshot snapshot) {
    super.restoreSnapshot(snapshot);
    setValues(snapshot.intValue, snapshot.doubleValue);
  }
}

final class TestSceneSnapshot extends SceneSnapshot<G, TestScene> with HasRandomValues {
  TestSceneSnapshot(super.namedId);

  @override
  TestScene createInstance(G app) => .new(app);
}

final class TestSceneSystem extends SceneSystem<G> with HasRandomValues {
  TestSceneSystem(super.app);
  
  @override
  TestSceneSystemSnapshot createSnapshot() {
    TestSceneSystemSnapshot snapshot = .new(namedId);
    snapshot.setValues(intValue, doubleValue);
    return snapshot;
  }

  @override
  void restoreSnapshot(TestSceneSystemSnapshot snapshot) {
    super.restoreSnapshot(snapshot);
    setValues(snapshot.intValue, snapshot.doubleValue);
  }
}

final class TestSceneSystemSnapshot extends SceneSystemSnapshot<G, TestSceneSystem> with HasRandomValues {
  TestSceneSystemSnapshot(super.namedId);

  @override
  TestSceneSystem createInstance(G app) => .new(app);
}

final class TestComponent1 extends Comp<G> with HasRandomValues {
  TestComponent1(super.app);

  @override
  TestComponent1Snapshot createSnapshot() {
    TestComponent1Snapshot snapshot = .new(namedId);
    snapshot.setValues(intValue, doubleValue);
    return snapshot;
  }

  @override
  void restoreSnapshot(TestComponent1Snapshot snapshot) {
    super.restoreSnapshot(snapshot);
    setValues(snapshot.intValue, snapshot.doubleValue);
  }
}

final class TestComponent1Snapshot extends CompSnapshot<G, TestComponent1> with HasRandomValues {
  TestComponent1Snapshot(super.namedId);

  @override
  TestComponent1 createInstance(G app) => .new(app);
}

final class TestEntity1 extends Entity<G> with HasRandomValues {
  late TestComponent1 comp1;

  TestEntity1(super.app) {
    add(comp1 = .new(app));
  }

  @override
  List<num> get collectRandomValues => [
    ...super.collectRandomValues,
    ...comp1.collectRandomValues,
  ];

  @override
  void setRandomValues() {
    super.setRandomValues();
    comp1.setRandomValues();
  }
  
  @override
  TestEntity1Snapshot createSnapshot() {
    TestEntity1Snapshot snapshot = .new(namedId);
    snapshot.setValues(intValue, doubleValue);
    return snapshot;
  }

  @override
  void restoreSnapshot(TestEntity1Snapshot snapshot) {
    super.restoreSnapshot(snapshot);
    setValues(snapshot.intValue, snapshot.doubleValue);
  }
}

final class TestEntity1Snapshot extends EntitySnapshot<G, TestEntity1> with HasRandomValues {
  TestEntity1Snapshot(super.namedId);

  @override
  TestEntity1 createInstance(G app) => .new(app);
}

final class TestComponent2 extends Comp<G> with HasRandomValues {
  late TestComponent3 comp3;

  TestComponent2(super.app);

  @override
  List<num> get collectRandomValues => [
    ...super.collectRandomValues,
    ...comp3.collectRandomValues,
  ];

  @override
  void setRandomValues() {
    super.setRandomValues();
    comp3.setRandomValues();
  }

  @override
  TestComponent2Snapshot createSnapshot() {
    TestComponent2Snapshot snapshot = .new(namedId);
    snapshot.setValues(intValue, doubleValue);
    return snapshot;
  }

  @override
  void restoreSnapshot(TestComponent2Snapshot snapshot) {
    super.restoreSnapshot(snapshot);
    setValues(snapshot.intValue, snapshot.doubleValue);
  }
}

final class TestComponent2Snapshot extends CompSnapshot<G, TestComponent2> with HasRandomValues {
  TestComponent2Snapshot(super.namedId);

  @override
  TestComponent2 createInstance(G app) => .new(app);
}

final class TestEntity2 extends Entity<G> with HasRandomValues {
  late TestComponent2 comp2;

  TestEntity2(super.app) {
    add(comp2 = .new(app));
    comp2.add(comp2.comp3 = .new(app));
  }

  @override
  List<num> get collectRandomValues => [
    ...super.collectRandomValues,
    ...comp2.collectRandomValues,
  ];

  @override
  void setRandomValues() {
    super.setRandomValues();
    comp2.setRandomValues();
  }
  
  @override
  TestEntity2Snapshot createSnapshot() {
    TestEntity2Snapshot snapshot = .new(namedId);
    snapshot.setValues(intValue, doubleValue);
    return snapshot;
  }

  @override
  void restoreSnapshot(TestEntity2Snapshot snapshot) {
    super.restoreSnapshot(snapshot);
    setValues(snapshot.intValue, snapshot.doubleValue);
  }
}

final class TestEntity2Snapshot extends EntitySnapshot<G, TestEntity2> with HasRandomValues {
  TestEntity2Snapshot(super.namedId);

  @override
  TestEntity2 createInstance(G app) => .new(app);
}

final class TestComponent3 extends Comp<G> with HasRandomValues {
  TestComponent3(super.app);
  
  @override
  TestComponent3Snapshot createSnapshot() {
    TestComponent3Snapshot snapshot = .new(namedId);
    snapshot.setValues(intValue, doubleValue);
    return snapshot;
  }

  @override
  void restoreSnapshot(TestComponent3Snapshot snapshot) {
    super.restoreSnapshot(snapshot);
    setValues(snapshot.intValue, snapshot.doubleValue);
  }
}

final class TestComponent3Snapshot extends CompSnapshot<G, TestComponent3> with HasRandomValues {
  TestComponent3Snapshot(super.namedId);

  @override
  TestComponent3 createInstance(G app) => .new(app);
}

final class TestAppSystem extends AppSystem<G> with HasRandomValues {
  TestAppSystem(super.app);
  
  @override
  TestAppSystemSnapshot createSnapshot() {
    TestAppSystemSnapshot snapshot = .new(namedId);
    snapshot.setValues(intValue, doubleValue);
    return snapshot;
  }

  @override
  void restoreSnapshot(TestAppSystemSnapshot snapshot) {
    super.restoreSnapshot(snapshot);
    setValues(snapshot.intValue, snapshot.doubleValue);
  }
}

final class TestAppSystemSnapshot extends AppSystemSnapshot<G, TestAppSystem> with HasRandomValues {
  TestAppSystemSnapshot(super.namedId);

  @override
  TestAppSystem createInstance(G app) => .new(app);
}

final class TestApp extends App<G> with HasRandomValues {
  late TestAppSystem testAppSystem;
  late TestScene testScene;

  TestApp(super.backend) {
    addSystem(testAppSystem = .new(app));
    addScene(testScene = .new(app));
  }

  List<IsAnyStateHolder<G>> get allStateHolders => [
    app,
    app.testAppSystem,
    app.testScene,
    app.testScene.testSceneSystem,
    app.testScene.entity1,
    app.testScene.entity1.comp1,
    app.testScene.entity2,
    app.testScene.entity2.comp2,
    app.testScene.entity2.comp2.comp3,
  ];

  @override
  List<num> get collectRandomValues => [
    ...super.collectRandomValues,
    ...testAppSystem.collectRandomValues,
    ...testScene.collectRandomValues,
  ];

  @override
  void setRandomValues() {
    super.setRandomValues();
    testScene.setRandomValues();
  }

  @override
  TestAppSnapshot createSnapshot() {
    TestAppSnapshot snapshot = .new(namedId);
    snapshot.setValues(intValue, doubleValue);
    return snapshot;
  }
  
  @override
  void restoreSnapshot(TestAppSnapshot snapshot) {
    super.restoreSnapshot(snapshot);
    setValues(snapshot.intValue, snapshot.doubleValue);
  }
}

final class TestAppSnapshot extends AppSnapshot<G> with HasRandomValues {
  TestAppSnapshot(super.namedId);

  @override
  TestApp createInstance(G app) => .new(app.backend);
}

void main() {
  group('Snapshot', () {
    TestApp app = .new(HeadlessBackend());

    for (final stateHolder in app.allStateHolders) {
      test(stateHolder.name, () {
        late List<num> expectedValues;
        late List<num> restoredValues;

        // set initial values
        if (stateHolder case HasRandomValues hasRandomValues) {
          hasRandomValues.setRandomValues();
          expectedValues = hasRandomValues.collectRandomValues;
        }

        // capture snapshot
        final holderSnapshot = stateHolder.captureSnapshot();

        // set different values
        if (stateHolder case HasRandomValues hasRandomValues) {
          hasRandomValues.setRandomValues();
        }

        // restore snapshot
        stateHolder.restoreSnapshot(holderSnapshot);

        // capture restored values
        if (stateHolder case HasRandomValues hasRandomValues) {
          restoredValues = hasRandomValues.collectRandomValues;
        }

        expect(expectedValues, equals(restoredValues));
      });
    }
  });

  group('Snapshot (SnapshotMissingPolicy)', () {
    late TestApp app;

    setUp(() => app = .new(HeadlessBackend()));

    test('App', () {
      final TestAppSnapshot snapshot = app.captureSnapshotAs();
      // Recreate the entry from its snapshot and re-add it to the parent.
      snapshot.onMissing = .recreate;

      app.removeScene(app.testScene);

      expect(app.getScene<TestScene>(), isNull);

      app.restoreSnapshot(snapshot);

      expect(app.getScene<TestScene>(), isNotNull);
    });

    test('Scene', () {
      final scene = app.testScene;

      final TestSceneSnapshot snapshot = scene.captureSnapshotAs();
      // Recreate the entry from its snapshot and re-add it to the parent.
      snapshot.onMissing = .recreate;

      scene.removeEntity(scene.entity2);

      expect(scene.QueryEntity.FirstAsOrNull<TestEntity2>(), isNull);

      scene.restoreSnapshot(snapshot);

      expect(scene.QueryEntity.FirstAsOrNull<TestEntity2>(), isNotNull);
    });

    test('Entity', () {
      final entity = app.testScene.entity1;

      final TestEntity1Snapshot snapshot = entity.captureSnapshotAs();
      // Recreate the entry from its snapshot and re-add it to the parent.
      snapshot.onMissing = .recreate;

      entity.removeExact(entity.comp1);

      expect(entity.get<TestComponent1>(), isNull);

      entity.restoreSnapshot(snapshot);

      expect(entity.get<TestComponent1>(), isNotNull);
    });

    test('Component', () {
      final comp = app.testScene.entity2.comp2;

      final TestComponent2Snapshot snapshot = comp.captureSnapshotAs();
      // Recreate the entry from its snapshot and re-add it to the parent.
      snapshot.onMissing = .recreate;

      comp.removeExact(comp.comp3);

      expect(comp.get<TestComponent3>(), isNull);

      comp.restoreSnapshot(snapshot);

      expect(comp.get<TestComponent3>(), isNotNull);
    });
  });

  group('Snapshot (SnapshotExtraPolicy)', () {
    late TestApp app;

    setUp(() => app = .new(HeadlessBackend()));

    test('App', () {
      final TestAppSnapshot snapshot = app.captureSnapshotAs();
      // Remove live entries that aren't referenced by the snapshot.
      snapshot.onExtra = .remove;

      final testSceneId = app.getScene<TestScene>()!.namedId;

      app.addScene(TestScene(app));

      expect(app.getScenes().whereType<TestScene>().length, 2);

      app.restoreSnapshot(snapshot);

      expect(app.getScenes().whereType<TestScene>().length, 1);
      expect(app.getScene<TestScene>()!.namedId, equals(testSceneId));
    });

    test('Scene', () {
      final scene = app.testScene;

      final TestSceneSnapshot snapshot = scene.captureSnapshotAs();
      // Remove live entries that aren't referenced by the snapshot.
      snapshot.onExtra = .remove;

      final entity2Id = scene.entity2.namedId;

      scene.addEntity(TestEntity2(app));

      expect(scene.QueryEntity.WhereType<TestEntity2>().Count, 2);

      scene.restoreSnapshot(snapshot);

      expect(scene.QueryEntity.WhereType<TestEntity2>().Count, 1);
      expect(scene.QueryEntity.FirstAs<TestEntity2>().namedId, equals(entity2Id));
    });

    test('Entity', () {
      final entity = app.testScene.entity1;

      final TestEntity1Snapshot snapshot = entity.captureSnapshotAs();
      // Remove live entries that aren't referenced by the snapshot.
      snapshot.onExtra = .remove;

      entity.add(TestComponent2(app));

      expect(entity.get<TestComponent2>(), isNotNull);

      entity.restoreSnapshot(snapshot);

      expect(entity.get<TestComponent2>(), isNull);
      expect(entity.get<TestComponent1>(), same(entity.comp1));
    });

    test('Component', () {
      final comp = app.testScene.entity2.comp2;

      final TestComponent2Snapshot snapshot = comp.captureSnapshotAs();
      // Remove live entries that aren't referenced by the snapshot.
      snapshot.onExtra = .remove;

      comp.add(TestComponent2(app));

      expect(comp.get<TestComponent2>(), isNotNull);

      comp.restoreSnapshot(snapshot);

      expect(comp.get<TestComponent2>(), isNull);
      expect(comp.get<TestComponent3>(), same(comp.comp3));
    });
  });
}