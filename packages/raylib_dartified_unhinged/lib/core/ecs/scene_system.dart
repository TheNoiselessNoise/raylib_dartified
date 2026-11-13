part of '../raylib_dartified_unhinged.dart';

enum SystemPhase {
  preEntities,
  postEntities,
}

class SceneSystem<T extends App<T>> extends ECSBase<T> with

  // identity
  Self<SceneSystem<T>>,

  // has
  HasOwnParent<T, SceneSystem<T>>,
  HasVars<T, SceneSystem<T>>,
  
  // is
  IsAddable<T, SceneSystem<T>>,
  IsBeginEndFrameable<T, SceneSystem<T>>,
  IsCloneable<T, SceneSystem<T>>,
  IsDisposable<T, SceneSystem<T>>,
  IsEnableable<T, SceneSystem<T>>,
  IsEventSubscriber<T>,
  IsEventEmittable<T, SceneSystem<T>>,
  IsEventHistoryHolder<T, SceneSystem<T>>,
  IsInputHandleable<T, SceneSystem<T>>,
  IsMorphable<T, SceneSystem<T>>,
  IsPrePostDrawable<T, SceneSystem<T>>,
  IsPrePostUpdatable<T, SceneSystem<T>>, // pre entities and post entities
  IsRemovable<T, SceneSystem<T>>,
  IsAnySceneSystemStateHolder<T>,
  IsPersistable<T, SceneSystem<T>, AnySceneSystemSnapshot<T>>,

  // special
  IsDebuggable<T, SceneSystem<T>>

{
  @override
  final T app;

  SceneSystem(this.app, {
    bool populateDefaults = true,
  }) {
    this.populateDefaults = populateDefaults;
  }

  // ░██████████ ░██    ░██ ░██████████ ░███    ░██ ░██████████  ░██████   
  // ░██         ░██    ░██ ░██         ░████   ░██     ░██     ░██   ░██  
  // ░██         ░██    ░██ ░██         ░██░██  ░██     ░██    ░██         
  // ░█████████  ░██    ░██ ░█████████  ░██ ░██ ░██     ░██     ░████████  
  // ░██          ░██  ░██  ░██         ░██  ░██░██     ░██            ░██ 
  // ░██           ░██░██   ░██         ░██   ░████     ░██     ░██   ░██  
  // ░██████████    ░███    ░██████████ ░██    ░███     ░██      ░██████   

  @override
  @mustCallSuper
  bool _doEventLocal(Event<T> event) {
    if (event.scope == .root) return false;

    if (_doEventVisitedCheck(event)) return true;
    if (event.isStopped) return true;

    if (_doEventSelfCheck(event)) return true;
    if (event.isStopped) return true;

    if (event.scope == .local) {
      if (event.origin == self) {
        _doOnEvent(event);
  
        return true;
      }
    }

    if (event.isStopped) return true;
    _doOnEvent(event);

    if (event.isStopped) return true;

    return event.origin != self;
  }

  //   ░██████  ░██           ░██████   ░███    ░██ ░██████████ 
  //  ░██   ░██ ░██          ░██   ░██  ░████   ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██░██  ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██ ░██ ░██ ░█████████  
  // ░██        ░██         ░██     ░██ ░██  ░██░██ ░██         
  //  ░██   ░██ ░██          ░██   ░██  ░██   ░████ ░██         
  //   ░██████  ░██████████   ░██████   ░██    ░███ ░██████████ 

  @override
  @nonVirtual
  void _doOnClone(SceneSystem<T> copy, [ClonePolicy<T>? policy]) {
    emit(EventSceneSystemCloning(app, self, copy));
    super._doOnClone(copy, policy);
  }

  @override
  @nonVirtual
  void _doCloneAfter(SceneSystem<T> target, [ClonePolicy<T>? policy]) {
    super._doCloneAfter(target, policy);
    emit(EventSceneSystemCloned(app, self, target));
  }

  // clone

  @override
  SceneSystem<T> createInstance() => .new(app);

  // state

  @override
  AnySceneSystemSnapshot<T> createSnapshot() => .new(namedId);  

  @override
  @nonVirtual
  AnySceneSystemSnapshot<T> captureSnapshot() => createSnapshot();

  @override
  @mustCallSuper
  void restoreSnapshot(covariant AnySceneSystemSnapshot<T> snapshot) {}

  // persistence

  static const typeId = '__sceneSystem__';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);
  }
}

typedef IsAnySceneSystemStateHolder<T extends App<T>> = IsStateHolder<T, SceneSystem<T>, AnySceneSystemSnapshot<T>>;

typedef AnySceneSystemSnapshot<T extends App<T>> = SceneSystemSnapshot<T, SceneSystem<T>>;

class SceneSystemSnapshot<T extends App<T>, S extends SceneSystem<T>> extends StateSnapshot<T, S> {
  SceneSystemSnapshot(super.sourceId);

  @override
  S createInstance(T app) => SceneSystem<T>(app) as S;
}