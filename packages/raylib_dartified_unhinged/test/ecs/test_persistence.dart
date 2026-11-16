import 'dart:convert';
import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:test/test.dart';
import 'dart:math' show Random;

typedef G = TestApp;

final Random random = Random();
final int MAX_RANDOM_INT = 255;

mixin HasRandomValues<E extends ECSBase<G>> on IsPersistableBase<G, E> {
  int intValue = 0;
  double doubleValue = 0;

  List<num> get collect => [intValue, doubleValue];

  void setRandomValues() {
    intValue = random.nextInt(MAX_RANDOM_INT);
    doubleValue = random.nextDouble();
  }
  
  @override
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'intValue': intValue,
    'doubleValue': doubleValue,
  };

  @override
  void restorePersistableData(MapTraversable data, {String? id}) {
    super.restorePersistableData(data, id: id);
    intValue = data.getInt('intValue');
    doubleValue = data.getDouble('doubleValue');
  }
}

final class TestComponent extends Comp<G> with HasRandomValues {
  TestComponent(super.app, { super.populateDefaults }) {
    if (populateDefaults) {
      setRandomValues();
    }
  }

  // persistence

  static String get typeId => '$TestComponent';
  
  @override
  String get persistentTypeId => typeId;
}

final class TestEntity extends Entity<G> with HasRandomValues {
  TestEntity(super.app, { super.populateDefaults }) {
    if (populateDefaults) {
      setRandomValues();
      add(CTransform(app, position: screenSize.divideBy(2)));
      add(CPulse(app));
      add(TestComponent(app));
    }
  }

  @override
  List<num> get collect => [
    ...super.collect,
    ...QueryComp.FirstAs<TestComponent>().collect,
  ];
  
  // persistence

  static String get typeId => '$TestEntity';
  
  @override
  String get persistentTypeId => typeId;
}

final class TestScene extends Scene<G> with HasRandomValues {
  TestScene(super.app, { super.populateDefaults }) {    
    if (populateDefaults) {
      setRandomValues();
      addEntity(TestEntity(app));
    }
  }

  @override
  List<num> get collect => [
    ...super.collect,
    ...QueryEntity.FirstAs<TestEntity>().collect,
  ];
  
  // persistence

  static String get typeId => '$TestScene';
  
  @override
  String get persistentTypeId => typeId;
}

final class TestApp extends App<G> with HasRandomValues {
  TestApp(super.backend, { super.populateDefaults }) {
    factories.scene.register(TestScene.typeId, TestScene.new);
    factories.entity.register(TestEntity.typeId, TestEntity.new);
    factories.comp.register(TestComponent.typeId, TestComponent.new);

    if (populateDefaults) {
      setRandomValues();
      addScene(TestScene(app));
    }
  }

  @override
  List<num> get collect => [
    ...super.collect,
    ...getScene<TestScene>()!.collect,
  ];
}

void main() {
  group('Persistence', () {
    late TestApp app;

    setUp(() => app = .new(HeadlessBackend()));

    test('save and restore whole app', () {
      final data = app.getPersistableData();
      final expectedValues = app.collect;
      
      final secondApp = TestApp(HeadlessBackend(), populateDefaults: false);
      secondApp.restorePersistableData(.new(data));
      final restoredValues = secondApp.collect;

      expect(expectedValues, equals(restoredValues));

      final restoredData = secondApp.getPersistableData();
      expect(jsonEncode(data), equals(jsonEncode(restoredData)));
    });
  });
}