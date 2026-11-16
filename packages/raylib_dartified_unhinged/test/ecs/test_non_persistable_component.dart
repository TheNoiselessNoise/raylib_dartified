import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:test/test.dart';

typedef G = TestApp;

bool overrideMethodDisabled = false;
final Map<String, int> states = {};
void testResetStates() => states.clear();
void testAddState(String name) => states[name] = testState(name) + 1;
int testState(String name) => states.putIfAbsent(name, () => 0);
const String S_FIRST = 'first';
const String S_SECOND = 'second';
const int S_TRANS_WHEN = 10;
String enterId(String name) => '${name}_enter';
String updateId(String name) => '${name}_update';
String exitId(String name) => '${name}_exit';

void setupCustomStateMachine(CustomStateMachine c) {
  c.addState(S_FIRST,
    onEnter: (_) => testAddState(enterId(S_FIRST)),
    onUpdate: (_) => testAddState(updateId(S_FIRST)),
    onExit: (_) => testAddState(exitId(S_FIRST)),
  )
  .addState(S_SECOND,
    onEnter: (_) => testAddState(enterId(S_SECOND)),
    onUpdate: (_) => testAddState(updateId(S_SECOND)),
    onExit: (_) => testAddState(exitId(S_SECOND)),
  )
  .transition(S_FIRST, S_SECOND,
    when: (_) {
      return testState(updateId(S_FIRST)) >= S_TRANS_WHEN * testState(enterId(S_FIRST));
    },
  )
  .transition(S_SECOND, S_FIRST,
    when: (_) {
      return testState(updateId(S_SECOND)) >= S_TRANS_WHEN * testState(enterId(S_SECOND));
    },
  );
}

final class CustomStateMachine extends CStateMachine<G> {
  CustomStateMachine(super.app, {
    super.populateDefaults,
    super.states,
    super.transitions,
  });

  @override
  void onRestorePersistableData(MapTraversable data, {String? id}) {
    if (overrideMethodDisabled) return;
    setupCustomStateMachine(this);
  }

  // persistence

  static String get typeId => '$CustomStateMachine';
  
  @override
  String get persistentTypeId => typeId;
}

final class TestEntity extends Entity<G> {
  TestEntity(super.app, { super.populateDefaults }) {
    if (populateDefaults) {
      final comp = CustomStateMachine(app);
      setupCustomStateMachine(comp);
      add(comp);
    }
  }
  
  // persistence

  static String get typeId => '$TestEntity';
  
  @override
  String get persistentTypeId => typeId;
}

final class TestScene extends Scene<G> {
  TestScene(super.app, { super.populateDefaults }) {    
    if (populateDefaults) addEntity(TestEntity(app));
  }
  
  // persistence

  static String get typeId => '$TestScene';
  
  @override
  String get persistentTypeId => typeId;
}

final class TestApp extends App<G> {
  TestApp(super.backend, { super.populateDefaults }) {
    factories.scene.register(TestScene.typeId, TestScene.new);
    factories.entity.register(TestEntity.typeId, TestEntity.new);
    factories.comp.register(CustomStateMachine.typeId, CustomStateMachine.new);
    if (populateDefaults) addScene(TestScene(app));
  }

  CustomStateMachine get stateMachine => scene.getEntities().first.get<CustomStateMachine>()!;

  @override
  G createInstance() => .new(backend);
}

void testComponent(TestApp app) {
  final c = app.stateMachine..start(S_FIRST);

  expect(states, isEmpty);
  expect(c.currentState, equals(S_FIRST));

  for (int i = 0; i < S_TRANS_WHEN; i++) {
    app.frame();
    expect(states, contains(enterId(S_FIRST)));
    expect(states, contains(updateId(S_FIRST)));
    expect(states[enterId(S_FIRST)], equals(1));
    expect(states[updateId(S_FIRST)], equals(i + 1));
  }

  app.frame();
  expect(c.currentState, equals(S_SECOND));
  
  for (int i = 1; i < S_TRANS_WHEN; i++) { // from one
    app.frame();
    expect(states, contains(enterId(S_SECOND)));
    expect(states, contains(updateId(S_SECOND)));
    expect(states[enterId(S_SECOND)], equals(1));
    expect(states[updateId(S_SECOND)], equals(i + 1));
  }

  app.frame();
  expect(c.currentState, equals(S_FIRST));
}

void main() {
  group('Persistence', () {
    late TestApp app;

    setUp(() {
      overrideMethodDisabled = false;
      testResetStates();

      app = .new(HeadlessBackend())..init();
    });

    test('normal component', () => testComponent(app));

    test('restored via override', () {
      final data = app.getPersistableData();
      final newApp = TestApp(HeadlessBackend(), populateDefaults: false);
      newApp.restorePersistableData(.new(data));
      testComponent(newApp);
    });

    test('restored via factory', () {
      final data = app.getPersistableData();
      final newApp = TestApp(HeadlessBackend(), populateDefaults: false);
      newApp.factories.comp.listen((typeId, instance) {
        if (instance is CustomStateMachine) {
          setupCustomStateMachine(instance);
        }
      });
      // need to disable override method before restore
      // the factory listener will set it up
      overrideMethodDisabled = true;
      newApp.restorePersistableData(.new(data));
      testComponent(newApp);
    });
  });
}