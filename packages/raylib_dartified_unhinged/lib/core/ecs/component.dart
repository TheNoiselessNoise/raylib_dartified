part of '../raylib_dartified_unhinged.dart';

class Comp<T extends App<T>> extends ECSBase<T> with

  // identity
  Self<Comp<T>>,

  // has
  HasEntityAccess<T>,
  HasOwnParent<T, Comp<T>>,
  HasVars<T, Comp<T>>,

  // is
  IsAddable<T, Comp<T>>,
  IsCloneable<T, Comp<T>>,
  IsDisposable<T, Comp<T>>,
  IsDrawable<T, Comp<T>>,
  IsEnableable<T, Comp<T>>,
  IsEventSubscriber<T>,
  IsEventEmittable<T, Comp<T>>,
  IsEventHistoryHolder<T, Comp<T>>,
  IsMorphable<T, Comp<T>>,
  IsPanicable<T, Comp<T>>,
  IsRemovable<T, Comp<T>>,
  IsPrePostUpdatable<T, Comp<T>>, // pre components and post components

  // special
  IsComponentManagable<T, Comp<T>>,
  IsStateHolder<T, Comp<T>, AnyCompSnapshot<T>>,
  IsPersistable<T, Comp<T>, AnyCompSnapshot<T>>,
  IsDebuggable<T, Comp<T>>

{
  @override
  final T app;

  Comp(this.app, {
    bool populateDefaults = true,
  }) {
    this.populateDefaults = populateDefaults;
  }

  @override
  late Entity<T> entity;

  @override
  bool isSelfOrDescendantOf(Object? target) {
    for (Object? n = this; n != null; n = (n as ECSBase<T>).parent) {
      if (n == target) return true;
    }
    return false;
  }

  bool isAncestorOf(Comp<T> other) {
    var current = other.parent;
    while (current != null) {
      if (identical(current, this)) return true;
      current = current.parent;
    }
    return false;
  }

  bool isDescendantOf(Comp<T> other) {
    return other.isAncestorOf(this);
  }

  //   ░██████   ░██     ░██ ░██████████ ░█████████  ░██     ░██ 
  //  ░██   ░██  ░██     ░██ ░██         ░██     ░██  ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██         ░██     ░██   ░██ ░██   
  // ░██     ░██ ░██     ░██ ░█████████  ░█████████     ░████    
  // ░██     ░██ ░██     ░██ ░██         ░██   ░██       ░██     
  //  ░██   ░██   ░██   ░██  ░██         ░██    ░██      ░██     
  //   ░██████     ░██████   ░██████████ ░██     ░██     ░██     
  //        ░██                                                  

  /// Returns a fresh [QueryComponentComponent] scoped to this component's direct children.
  ///
  /// Entry point for the **Query-like DSL** over components.
  QueryComponentComponent<T> get QueryComp => .new(app, this);

  /// Returns a fresh [QueryComponentComponentDeep] that searches all descendant
  /// components recursively, including those on nested child components.
  QueryComponentComponentDeep<T> get QueryCompDeep => .new(app, this);

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  @override
  bool get _isInstanceDisabled => isDisabled || entity.isDisabled;

  /// Fires pre update listeners, advances all components by [dt], fires post update listeners.
  /// Skipped entirely when the component or the parent entity is disabled.
  @nonVirtual
  void _doComponentUpdate(double dt) => _runSafely(() {
    if (_isInstanceDisabled) return;
    final result = _doOnPreUpdate(dt);
    if (result == .cancel) return;
    if (_isInstanceDisabled) return;
    if (result == .proceed) _updateChildComponents(dt);
    if (_isInstanceDisabled) return;
    _doOnPostUpdate(dt);
  });

  @override
  @nonVirtual
  void _doDraw(double dt) => _runSafely(() {
    if (_isInstanceDisabled) return;
    _drawChildComponents(dt);
    if (_isInstanceDisabled) return;
    super._doDraw(dt);
  });

  @override
  @mustCallSuper
  void _doOnRemove() {
    super._doOnRemove();
    // NOTE: toList() is important
    _components.toList().forEach(_removeComponentInstance);
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
  void _doOnClone(Comp<T> copy, [ClonePolicy<T>? policy]) {
    copy.entity = entity;

    emit(EventCompCloning(app, self, copy));

    _components.forEach((childComp) {
      if (!(policy?.allowComp(copy, childComp) ?? true)) return;

      _doCloneComp(
        to: copy,
        what: childComp,
        policy: policy,
        replaceComponent: true,
      );
    });

    super._doOnClone(copy, policy);
  }

  @override
  @nonVirtual
  void _doCloneAfter(Comp<T> target, [ClonePolicy<T>? policy]) {
    super._doCloneAfter(target, policy);
    emit(EventCompCloned(app, self, target));
  }

  // clone

  @override
  Comp<T> createInstance() => .new(app);

  // state

  @override
  AnyCompSnapshot<T> createSnapshot() => .new(namedId);  

  @override
  @nonVirtual
  AnyCompSnapshot<T> captureSnapshot() {
    final snapshot = createSnapshot();
    snapshot.componentSnapshots = _components
      .map((c) => c.captureSnapshot())
      .toList();
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant AnyCompSnapshot<T> snapshot) {
    _restoreSnapshotList(
      originSnapshot: snapshot,
      sourceList: _components.toList(),
      sourceSnapshots: snapshot.componentSnapshots,
      onRecreate: (x) => add(x),
      onRestore: (x, s) => x.restoreSnapshot(s),
      onRemove: _removeComponentInstance,
    );
  }
  
  // persistence

  static const typeId = '__comp__';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),

    ECSPersistentKeys.components: _storePersistableJsonObjectMap(_components, force: force),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    _restorePersistableJsonObjectMap(
      data: data,
      key: ECSPersistentKeys.components,
      factory: app.factories.comp,
      onRestored: add,
    );
  }
}

typedef AnyCompSnapshot<T extends App<T>> = CompSnapshot<T, Comp<T>>;

class CompSnapshot<T extends App<T>, C extends Comp<T>> extends StateSnapshot<T, C> {
  late List<AnyCompSnapshot<T>> componentSnapshots;

  CompSnapshot(super.sourceId);

  @override
  C createInstance(T app) => Comp<T>(app) as C;
}
