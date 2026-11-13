part of '../raylib_dartified_unhinged.dart';

class ECSBaseFactoryRegistry<
  T extends App<T>,
  E extends ECSBase<T>
> {
  final _factories = <String, E Function(T app, {bool populateDefaults})>{};

  final List<void Function(String typeId, E instance)> _listeners = [];

  void listen(void Function(String typeId, E instance) fn) => _listeners.add(fn);

  void register(String typeId, E Function(T app, {bool populateDefaults}) factory) {
    if (_factories.containsKey(typeId)) {
      throw StateError('BaseFactory $E: Duplicate factory registry typeId: $typeId');
    }

    _factories[typeId] = factory;
  }

  E create(String typeId, T app) {
    final factory = _factories[typeId];
    if (factory == null) throw StateError('BaseFactory $E: No factory registered for $typeId');
    final instance = factory(app, populateDefaults: false);
    _listeners.forEach((f) => f(typeId, instance));
    return instance;
  }
}

class ECSFactoryRegistry<T extends App<T>> {
  late final ECSBaseFactoryRegistry<T, AppSystem<T>> appSystem = .new();
  late final ECSBaseFactoryRegistry<T, Scene<T>> scene = .new();
  late final ECSBaseFactoryRegistry<T, SceneSystem<T>> sceneSystem = .new();
  late final ECSBaseFactoryRegistry<T, Entity<T>> entity = .new();
  late final ECSBaseFactoryRegistry<T, Comp<T>> comp = .new();

  void _registerBases() {
    appSystem.register(AppSystem.typeId, AppSystem<T>.new);
    scene.register(Scene.typeId, Scene<T>.new);
    sceneSystem.register(SceneSystem.typeId, SceneSystem<T>.new);
    entity.register(Entity.typeId, Entity<T>.new);
    comp.register(Comp.typeId, Comp<T>.new);
  }

  void _registerSceneSystems() {
    sceneSystem.register(CollisionResolverSystem.typeId, CollisionResolverSystem<T>.new);
    sceneSystem.register(GravitySystem.typeId, GravitySystem<T>.new);
    sceneSystem.register(ScreenBounceSystem.typeId, ScreenBounceSystem<T>.new);
    sceneSystem.register(TransformSyncSystem.typeId, TransformSyncSystem<T>.new);
    
    // widget
    sceneSystem.register(FMouseSystem.typeId, FMouseSystem<T>.new);
    sceneSystem.register(FWidgetDebugSystem.typeId, FWidgetDebugSystem<T>.new);
    sceneSystem.register(FValidateWidgetsSystem.typeId, FValidateWidgetsSystem<T>.new);
  }

  void _registerComponents() {
    // TODO: add CAnimation
    comp.register(CAnimator.typeId, CAnimator<T>.new);
    comp.register(CBoundsBounce.typeId, CBoundsBounce<T>.new);
    comp.register(CBoundsConstraint.typeId, CBoundsConstraint<T>.new);
    comp.register(CBoundsWrap.typeId, CBoundsWrap<T>.new);
    comp.register(CCircleCollider.typeId, CCircleCollider<T>.new);
    comp.register(CRectCollider.typeId, CRectCollider<T>.new);
    comp.register(CImage.typeId, CImage<T>.new);
    comp.register(CInput.typeId, CInput<T>.new);
    comp.register(CLifetime.typeId, CLifetime<T>.new);
    comp.register(CLocalTransform.typeId, CLocalTransform<T>.new);
    comp.register(COutOfBounds.typeId, COutOfBounds<T>.new);
    comp.register(CParticleEmitter.typeId, CAnyParticleEmitter<T>.new);
    comp.register(CPhysicsBody.typeId, CPhysicsBody<T>.new);
    comp.register(CPulse.typeId, CPulse<T>.new);
    comp.register(CRenderLayer.typeId, CRenderLayer<T>.new);
    comp.register(CSprite.typeId, CSprite<T>.new);
    comp.register(CStateMachine.typeId, CStateMachine<T>.new);
    comp.register(CTransform.typeId, CTransform<T>.new);
    comp.register(CVelocity.typeId, CVelocity<T>.new);
  }

  void _registerBuiltins() {
    _registerBases();
    _registerSceneSystems();
    _registerComponents();
  }
}