// Run it: dart run test_persistence.dart
import 'dart:convert';

import '_base.dart';

class MyComp extends Comp<G> {
  MyComp(super.app, {
    super.populateDefaults,
  });

  @override
  MyComp createInstance() => .new(app);

  // persistence

  static const typeId = 'MyComp';
  
  @override String get persistentTypeId => typeId;
}

class MyEntity extends Entity<G> {
  MyEntity(super.app, {
    super.populateDefaults,
  }) {
    add(CTransform(app, position: sceneBounds.position.divideBy(2)));
    add(CVelocity(app, velocity: .vec2(1, 0)));
    add(MyComp(app));
  }

  @override
  MyEntity createInstance() => .new(app);

  // persistence

  static const typeId = 'MyEntity';
  
  @override String get persistentTypeId => typeId;
}

class TestPersistenceScene extends Scene<G> {
  late MyEntity myEntity;

  TestPersistenceScene(super.app, {
    super.populateDefaults,
  }) {
    addEntity(myEntity = MyEntity(app));
  }

  @override
  TestPersistenceScene createInstance() => .new(app);

  // persistence

  static const typeId = 'TestPersistenceScene';
  
  @override String get persistentTypeId => typeId;
}

typedef G = TestPersistenceApp;

class TestPersistenceApp extends ExampleRaylibApp<G> {
  late TestPersistenceScene mainScene;

  TestPersistenceApp(super.backend) {
    factories.comp.register(MyComp.typeId, MyComp.new);
    factories.entity.register(MyEntity.typeId, MyEntity.new);
    factories.scene.register(TestPersistenceScene.typeId, TestPersistenceScene.new);
  }

  @override
  void onInit() => addScene(mainScene = .new(app));

  @override
  TestPersistenceApp createInstance() => .new(backend);
}

void doStuff(TestPersistenceApp app) {
  print('state before: ');
  print(JsonEncoder.withIndent('  ').convert(app.getPersistableData()));

  // print('before entity position: ${app.mainScene.myEntity.transform!.position}');
  for (int i = 0; i < 10; i++) app.frame();
  // print('after entity position: ${app.mainScene.myEntity.transform!.position}');

  print('state after: ');
  print(JsonEncoder.withIndent('  ').convert(app.getPersistableData()));
}

void main() {
  final app = TestPersistenceApp(HeadlessBackend())..init();
  doStuff(app);
  app.exit();
}
