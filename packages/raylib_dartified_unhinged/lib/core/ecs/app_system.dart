part of '../raylib_dartified_unhinged.dart';

abstract class AppService<T extends App<T>> extends ECSBase<T> with
  Self<AppService<T>>,
  IsDisposable<T, AppService<T>>
{

  @override
  final T app;

  AppService(this.app);
}

class AppSystem<T extends App<T>> extends ECSBase<T> with

  // identity
  Self<AppSystem<T>>,

  // has
  HasOwnParent<T, AppSystem<T>>,
  HasVars<T, AppSystem<T>>,

  // is
  IsAddable<T, AppSystem<T>>,
  IsBeginEndFrameable<T, AppSystem<T>>,
  IsCloneable<T, AppSystem<T>>,
  IsDisposable<T, AppSystem<T>>,
  IsEventSubscriber<T>,
  IsEventEmittable<T, AppSystem<T>>,
  IsEventHistoryHolder<T, AppSystem<T>>,
  IsInputHandleable<T, AppSystem<T>>,
  IsMorphable<T, AppSystem<T>>,
  IsRemovable<T, AppSystem<T>>,
  IsStateHolder<T, AppSystem<T>, AnyAppSystemSnapshot<T>>,
  IsPersistable<T, AppSystem<T>, AnyAppSystemSnapshot<T>>,

  // special
  IsDebuggable<T, AppSystem<T>>

{
  @override
  final T app;
  
  AppSystem(this.app, {
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
    if (_doEventVisitedCheck(event)) return true;
    if (event.isStopped) return true;

    if (_doEventSelfCheck(event)) return true;
    if (event.isStopped) return true;

    // `local` check
    if (event.scope == .local) {
      if (event.origin == self) {
        _doOnEvent(event);
  
        return true;
      }
    }

    if (
      event.scope != .scene &&
      event.scope != .sceneOnly
    ) _doOnEvent(event);

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
  void _doOnClone(AppSystem<T> copy, [ClonePolicy<T>? policy]) {
    app._doOnEvent(EventAppSystemCloning(app, self, copy));
    super._doOnClone(copy, policy);
  }

  @override
  @nonVirtual
  void _doCloneAfter(AppSystem<T> target, [ClonePolicy<T>? policy]) {
    super._doCloneAfter(target, policy);
    app._doOnEvent(EventAppSystemCloned(app, self, target));
  }

  // clone

  @override
  AppSystem<T> createInstance() => .new(app);

  // state

  @override
  AnyAppSystemSnapshot<T> createSnapshot() => .new(namedId);  

  @override
  @nonVirtual
  AnyAppSystemSnapshot<T> captureSnapshot() => createSnapshot();

  @override
  @mustCallSuper
  void restoreSnapshot(covariant AnyAppSystemSnapshot<T> snapshot) {}

  // persistence

  static const typeId = '__appSystem__';
  
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

typedef AnyAppSystemSnapshot<T extends App<T>> = AppSystemSnapshot<T, AppSystem<T>>;

class AppSystemSnapshot<T extends App<T>, S extends AppSystem<T>> extends StateSnapshot<T, S> {
  AppSystemSnapshot(super.id);

  @override
  S createInstance(T app) => AppSystem<T>(app) as S;
}