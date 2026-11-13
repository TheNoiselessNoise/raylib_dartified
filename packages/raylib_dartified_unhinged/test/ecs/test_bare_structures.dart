import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:test/test.dart';

typedef G = TestApp;

class TestApp extends App<G> {
  TestApp(super.backend);
}

void main() {
  group('Bare Structures', () {
    late TestApp app;
    final VarKey<String> idVar = .new('id');

    setUp(() => app = .new(HeadlessBackend()));

    test('initilization of all', () {
      final scene = Scene<G>(app);
      idVar.set(scene, 'myScene');
      app.addScene(scene);
      expect(
        idVar.get(app.scene),
        equals('myScene')
      );

      final entity = Entity<G>(app);
      idVar.set(entity, 'myEntity');
      scene.addEntity(entity);
      expect(
        idVar.get(app.scene.QueryEntity.First),
        equals('myEntity')
      );

      final comp1 = Comp<G>(app);
      idVar.set(comp1, 'myComp');
      entity.add(comp1);
      expect(
        idVar.get(app.scene.QueryEntity.First.QueryComp.First),
        equals('myComp')
      );
    });

    test('scene hook', () {
      final scene = Scene<G>(app);

      bool added = false;
      scene.listenOnAdd((_, _) => added = true);
      app.addScene(scene);

      expect(added, equals(true));
    });

    test('entity hook', () {
      final scene = Scene<G>(app);
      final entity = Entity<G>(app);

      bool added = false;
      entity.listenOnAdd((_, _) => added = true);
      scene.addEntity(entity);

      expect(added, equals(true));
    });

    test('comp hook', () {
      final entity = Entity<G>(app);
      final comp = Comp<G>(app);

      bool added = false;
      comp.listenOnAdd((_, _) => added = true);
      entity.add(comp);

      expect(added, equals(true));
    });
  });
}