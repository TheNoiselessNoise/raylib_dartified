import 'package:meta/meta.dart';
import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';

enum TestingEmitterType {
  app,
  appSystem,
  scene,
  sceneSystem,
  entity1,
  comp1,
  entity2,
  comp2,
  comp3,
}

typedef TestingOnEventHandler<T extends TestingApp<T>> = void Function(Event<T> event);

mixin TestingIsOnEventCallbackHandler<T extends TestingApp<T>, E extends ECSBase<T>> on IsEventEmittable<T, E> {
  TestingOnEventHandler<T>? _onEventHandler;

  @override
  @mustCallSuper
  void onEvent(Event<T> event) => _onEventHandler?.call(event);
}

final class TestingOnEventCallbackPackage<T extends TestingApp<T>> {
  final TestingOnEventHandler<T>? appOnEvent;
  final TestingOnEventHandler<T>? appSystemOnEvent;
  final TestingOnEventHandler<T>? sceneOnEvent;
  final TestingOnEventHandler<T>? sceneSystemOnEvent;
  final TestingOnEventHandler<T>? entity1OnEvent;
  final TestingOnEventHandler<T>? comp1OnEvent;
  final TestingOnEventHandler<T>? entity2OnEvent;
  final TestingOnEventHandler<T>? comp2OnEvent;
  final TestingOnEventHandler<T>? comp3OnEvent;

  TestingOnEventCallbackPackage({
    this.appOnEvent,
    this.appSystemOnEvent,
    this.sceneOnEvent,
    this.sceneSystemOnEvent,
    this.entity1OnEvent,
    this.comp1OnEvent,
    this.entity2OnEvent,
    this.comp2OnEvent,
    this.comp3OnEvent,
  });
}

final class TestingEvent<T extends App<T>> extends Event<T> {
  final String? source;

  TestingEvent(super.app, [this.source]);
}

class TestingApp<T extends TestingApp<T>> extends App<T> with TestingIsOnEventCallbackHandler<T, T> {
  final TestingOnEventCallbackPackage<T>? onEventCallbackPackage;
  TestingAppSystem<T> get appSystem => getSystem()!;
  TestingScene<T> get testScene => getScene()!;

  TestingApp(super.backend, {
    this.onEventCallbackPackage,
    super.populateDefaults,
  }) {
    if (populateDefaults) {
      addSystem(TestingAppSystem(app));
      addScene(TestingScene(app));
      
      _onEventHandler = onEventCallbackPackage?.appOnEvent;
      appSystem._onEventHandler = onEventCallbackPackage?.appSystemOnEvent;
      testScene._onEventHandler = onEventCallbackPackage?.sceneOnEvent;
      testScene.sceneSystem._onEventHandler = onEventCallbackPackage?.sceneSystemOnEvent;
      testScene.entity1._onEventHandler = onEventCallbackPackage?.entity1OnEvent;
      testScene.entity1.comp1._onEventHandler = onEventCallbackPackage?.comp1OnEvent;
      testScene.entity2._onEventHandler = onEventCallbackPackage?.entity2OnEvent;
      testScene.entity2.comp2._onEventHandler = onEventCallbackPackage?.comp2OnEvent;
      testScene.entity2.comp2.comp3._onEventHandler = onEventCallbackPackage?.comp3OnEvent;
    }
  }

  Map<TestingEmitterType, IsAnyEventHistoryHolder<T>> get eventHistoryHolders => {
    .app: app,
    .appSystem: app.appSystem,
    .scene: app.testScene,
    .sceneSystem: app.testScene.sceneSystem,
    .entity1: app.testScene.entity1,
    .comp1: app.testScene.entity1.comp1,
    .entity2: app.testScene.entity2,
    .comp2: app.testScene.entity2.comp2,
    .comp3: app.testScene.entity2.comp2.comp3,
  };

  @override
  T createInstance() => throw StateError('To support cloning of TestingApp, override `createInstance`.');
}

final class TestingAppSystem<T extends TestingApp<T>> extends AppSystem<T> with TestingIsOnEventCallbackHandler<T, AppSystem<T>> {
  TestingAppSystem(super.app);

  @override
  TestingAppSystem<T> createInstance() => .new(app);
}

final class TestingSceneSystem<T extends TestingApp<T>> extends SceneSystem<T> with TestingIsOnEventCallbackHandler<T, SceneSystem<T>> {
  TestingSceneSystem(super.app);

  @override
  TestingSceneSystem<T> createInstance() => .new(app);
}

final class TestingScene<T extends TestingApp<T>> extends Scene<T> with TestingIsOnEventCallbackHandler<T, Scene<T>> {
  late final TestingSceneSystem<T> sceneSystem;
  late final TestingEntity1<T> entity1;
  late final TestingEntity2<T> entity2;

  TestingScene(super.app) {
    addSystem(sceneSystem = .new(app));
    addEntity(entity1 = .new(app));
    addEntity(entity2 = .new(app));
  }

  @override
  TestingScene<T> createInstance() => .new(app);
}

final class TestingComponent1<T extends TestingApp<T>> extends Comp<T> with TestingIsOnEventCallbackHandler<T, Comp<T>> {
  TestingComponent1(super.app);

  @override
  TestingComponent1<T> createInstance() => .new(app);
}

final class TestingEntity1<T extends TestingApp<T>> extends Entity<T> with TestingIsOnEventCallbackHandler<T, Entity<T>> {
  late final TestingComponent1<T> comp1;

  TestingEntity1(super.app) {
    add(comp1 = .new(app));
  }

  @override
  TestingEntity1<T> createInstance() => .new(app);
}

final class TestingComponent2<T extends TestingApp<T>> extends Comp<T> with TestingIsOnEventCallbackHandler<T, Comp<T>> {
  late final TestingComponent3<T> comp3;

  TestingComponent2(super.app);

  @override
  TestingComponent2<T> createInstance() => .new(app);
}

final class TestingEntity2<T extends TestingApp<T>> extends Entity<T> with TestingIsOnEventCallbackHandler<T, Entity<T>> {
  late final TestingComponent2<T> comp2;

  TestingEntity2(super.app) {
    add(comp2 = .new(app));
    comp2.add(comp2.comp3 = .new(app));
  }
  
  @override
  TestingEntity2<T> createInstance() => .new(app);
}

final class TestingComponent3<T extends TestingApp<T>> extends Comp<T> with TestingIsOnEventCallbackHandler<T, Comp<T>> {
  TestingComponent3(super.app);

  @override
  TestingComponent3<T> createInstance() => .new(app);
}
