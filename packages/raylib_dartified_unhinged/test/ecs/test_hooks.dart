import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:test/test.dart';

typedef G = TestApp;

final Map<String, int> states = {};
void testResetStates() => states.clear();
void testAddState(String name) => states[name] = testState(name) + 1;
int testState(String name) => states.putIfAbsent(name, () => 0);
const ID_PRE_ENTITY_UPDATE = 'onPreEntityUpdate';
const ID_POST_ENTITY_UPDATE = 'onPostEntityUpdate';
const ID_PRE_ENTITY_DRAW = 'onPreEntityDraw';
const ID_POST_ENTITY_DRAW = 'onPostEntityDraw';
const ID_PRE_COMP_UPDATE = 'onPreCompUpdate';
const ID_POST_COMP_UPDATE = 'onPostCompUpdate';
const ID_PRE_COMP_DRAW = 'onPreCompDraw';
const ID_POST_COMP_DRAW = 'onPostCompDraw';

final class TestComponent extends Comp<G> {
  TestComponent(super.app);
}

final class TestEntity extends Entity<G> {
  TestEntity(super.app) {
    add(TestComponent(app));
  }

  @override
  HookResult onPreCompUpdate(Comp<G> component) {
    if (component is TestComponent) testAddState(ID_PRE_COMP_UPDATE);
    return super.onPreCompUpdate(component);
  }

  @override
  void onPostCompUpdate(Comp<G> component) {
    if (component is TestComponent) testAddState(ID_POST_COMP_UPDATE);
  }

  @override
  HookResult onPreCompDraw(Comp<G> component) {
    if (component is TestComponent) testAddState(ID_PRE_COMP_DRAW);
    return super.onPreCompDraw(component);
  }

  @override
  void onPostCompDraw(Comp<G> component) {
    if (component is TestComponent) testAddState(ID_POST_COMP_DRAW);
  }
}

final class TestScene extends Scene<G> {
  TestScene(super.app) {    
    addEntity(TestEntity(app));
  }

  @override
  HookResult onPreEntityUpdate(Entity<G> entity) {
    if (entity is TestEntity) testAddState(ID_PRE_ENTITY_UPDATE);
    return super.onPreEntityUpdate(entity);
  }

  @override
  void onPostEntityUpdate(Entity<G> entity) {
    if (entity is TestEntity) testAddState(ID_POST_ENTITY_UPDATE);
  }

  @override
  HookResult onPreEntityDraw(Entity<G> entity) {
    if (entity is TestEntity) testAddState(ID_PRE_ENTITY_DRAW);
    return super.onPreEntityDraw(entity);
  }

  @override
  void onPostEntityDraw(Entity<G> entity) {
    if (entity is TestEntity) testAddState(ID_POST_ENTITY_DRAW);
  }
}

final class TestApp extends App<G> {
  TestApp(super.backend) {
    addScene(TestScene(app));
  }
}

void main() {
  group('Persistence', () {
    late TestApp app;

    setUp(() {
      testResetStates();

      app = .new(HeadlessBackend())..init();
    });

    test('pre/post comp update/draw', () {
      expect(states, isEmpty);

      app.frame();

      expect(states, contains(ID_PRE_ENTITY_UPDATE));
      expect(testState(ID_PRE_ENTITY_UPDATE), equals(1), reason: ID_PRE_ENTITY_UPDATE);
      expect(states, contains(ID_POST_ENTITY_UPDATE));
      expect(testState(ID_POST_ENTITY_UPDATE), equals(1), reason: ID_POST_ENTITY_UPDATE);
      expect(states, contains(ID_PRE_ENTITY_DRAW));
      expect(testState(ID_PRE_ENTITY_DRAW), equals(1), reason: ID_PRE_ENTITY_DRAW);
      expect(states, contains(ID_POST_ENTITY_DRAW));
      expect(testState(ID_POST_ENTITY_DRAW), equals(1), reason: ID_POST_ENTITY_DRAW);

      expect(states, contains(ID_PRE_COMP_UPDATE));
      expect(testState(ID_PRE_COMP_UPDATE), equals(1), reason: ID_PRE_COMP_UPDATE);
      expect(states, contains(ID_POST_COMP_UPDATE));
      expect(testState(ID_POST_COMP_UPDATE), equals(1), reason: ID_POST_COMP_UPDATE);
      expect(states, contains(ID_PRE_COMP_DRAW));
      expect(testState(ID_PRE_COMP_DRAW), equals(1), reason: ID_PRE_COMP_DRAW);
      expect(states, contains(ID_POST_COMP_DRAW));
      expect(testState(ID_POST_COMP_DRAW), equals(1), reason: ID_POST_COMP_DRAW);
    });
  });
}