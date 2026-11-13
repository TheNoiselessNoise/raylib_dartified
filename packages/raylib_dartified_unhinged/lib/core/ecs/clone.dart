part of '../raylib_dartified_unhinged.dart';

/// Identifies the broad category of an ECS object being cloned.
///
/// Used by [ClonePolicy] to apply coarse-grained allow/deny rules before
/// the finer-grained [ECSHookKey] and [ECSStateKey] checks.
enum CloneKind {
  /// [AppSystem]
  appSystem,
  /// [Scene]
  scene,
  /// [SceneSystem]
  sceneSystem,
  /// [Entity]
  entity,
  /// [Comp]
  component,
  /// Any registered [ECSHookKey] external hook.
  hook,
  /// Any object-specific [ECSStateKey] internal state.
  state,
}

/// Defines the allow/deny rules for a cloning operation.
///
/// Implement this to control which parts of an ECS object are copied during
/// cloning. The [allow] method is the single decision point, receiving a
/// [CloneKind] and optional [owner]/[payload] for context.
/// 
/// Default [allow] implementation allows everything except identity ([ECSBase.stateKey_identity]).
abstract class ClonePolicy<T extends App<T>> {
  bool allow(CloneKind kind, {ECSBase<T>? owner, Object? payload}) {
    if (kind == .state) {
      return payload != owner?.stateKey_identity;
    }

    return true;
  }

  /// Whether [appSystem] should be included in the clone of [owner].
  bool allowAppSystem(T owner, AppSystem<T> appSystem)
    => allow(.appSystem, owner: owner, payload: appSystem);

  /// Whether [scene] should be included in the clone of [owner].
  bool allowScene(T owner, Scene<T> scene)
    => allow(.scene, owner: owner, payload: scene);

  /// Whether [sceneSystem] should be included in the clone of [owner].
  bool allowSceneSystem(Scene<T> owner, SceneSystem<T> sceneSystem)
    => allow(.sceneSystem, owner: owner, payload: sceneSystem);

  /// Whether [entity] should be included in the clone.
  bool allowEntity(IsAnyEntityManagable<T> owner, Entity<T> entity)
    => allow(.entity, owner: owner, payload: entity);

  /// Whether [comp] should be included in the clone of [owner].
  bool allowComp(IsAnyComponentManagable<T> owner, Comp<T> comp)
    => allow(.component, owner: owner, payload: comp);

  /// Whether the listener/s identified by [type] should be copied to the clone.
  bool allowHook(ECSBase<T> owner, ECSHookKey type)
    => allow(.hook, owner: owner, payload: type);

  /// Whether the state category identified by [type] should be copied to the clone.
  bool allowState(ECSBase<T> owner, ECSStateKey type)
    => allow(.state, owner: owner, payload: type);
}
