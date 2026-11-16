part of '../../raylib_dartified_unhinged.dart';

final class _TimestampedSnapshot<
  T extends App<T>,
  E extends ECSBase<T>,
  S extends StateSnapshot<T, E>
> {
  _TimestampedSnapshot(this.snapshot, this.simTime);
  final S snapshot;
  final double simTime;
}

mixin IsPersistableBase<T extends App<T>, E extends ECSBase<T>> on ECSBase<T> {
  MapData? storePersistable();

  AnyStateSnapshot<T>? persistAutoSave({
    required double interval,
    required int slots,
  });

  void persistAutoLoad({
    int? slot,
  });

  String get persistentId;
  set persistentId(String value);

  String get persistentTypeId;

  MapData getPersistableData({bool force = false});

  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id});

  void restorePersistableData(MapTraversable data, {String? id});
}

typedef IsAnyPersistable<T extends App<T>> = IsPersistableBase<T, ECSBase<T>>;

mixin IsPersistable<
  T extends App<T>,
  E extends IsPersistable<T, E, S>,
  S extends StateSnapshot<T, E>
> on
  Self<E>,
  IsStateHolder<T, E, S>
implements
  IsPersistableBase<T, E>
{

  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██   ░██         
  // ░██████████ ░██     ░██ ░██     ░██ ░███████     ░████████  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██           ░██ 
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   

  // NOTE: no `listen` hook available for `onRestorePersistableData`,
  //       since it happens only at new instance creation

  /// Override to react during the restoration of persistable data.
  void onRestorePersistableData(MapTraversable data, {String? id}) {}

  /// Hook key for [IsPersistable]'s [onBeforeStorePersistable] hooks.
  late final hookKey_onBeforeStorePersistable = ECSHookKey<bool Function(E self)>(
    '$IsPersistable', 'onBeforeStorePersistable'
  );

  /// Hook key for [IsPersistable]'s [onStorePersistable] hooks.
  late final hookKey_onStorePersistable = ECSHookKey<MapData Function(E self, MapData data)>(
    '$IsPersistable', 'onStorePersistable'
  );

  /// Registers [fn] as a before-persistence listener.
  ///
  /// [fn] returning `false` cancels the persistence.
  @nonVirtual
  E listenOnBeforeStorePersistable(bool Function(E self) fn) {
    addHook(hookKey_onBeforeStorePersistable, fn);
    return self;
  }

  /// Registers [fn] as an store persistable listener.
  ///
  /// Called when the persistence is about to happen and was not canceled.
  @nonVirtual
  E listenOnStorePersistable(MapData Function(E self, MapData data) fn) {
    addHook(hookKey_onStorePersistable, fn);
    return self;
  }

  /// Runs all before-persistence listeners and [onBeforeStorePersistable].
  ///
  /// Returns `false` if any listener or the override cancels the persistence.
  @mustCallSuper
  bool _doOnBeforeStorePersistable() {
    if (!hooksOf(hookKey_onBeforeStorePersistable).every((f) => f(self))) return false;
    return onBeforeStorePersistable();
  }

  /// Runs all persistence listeners and [onStorePersistable].
  MapData _doOnStorePersistable(MapData data) {
    for (final f in hooksOf(hookKey_onStorePersistable)) {
      data = f(self, data);
    }
    return onStorePersistable(data);
  }

  /// Override to cancel the persistence from within the class.
  ///
  /// Return `false` to abort. Called after all registered [listenOnBeforeStorePersistable] listeners.
  bool onBeforeStorePersistable() => true;

  /// Override to react when the persistence is about to complete.
  ///
  /// Called after all registered [listenOnStorePersistable] listeners.
  MapData onStorePersistable(MapData data) => data;

  @override
  MapData? storePersistable() {
    if (!_doOnBeforeStorePersistable()) return null;
    return _doOnStorePersistable(getPersistableData());
  }

  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 

  bool populateDefaults = true;
  
  String _getAutoSlotKey(int slot) => '_auto_$slot';

  final Map<String, _TimestampedSnapshot<T, E, S>> _savedSnapshots = {};

  double? _lastAutoSaveTime;
  int _autoSaveCounter = 0;

  @override
  S? persistAutoSave({
    required double interval,
    required int slots,
  }) {
    final double now = app.time.timeScaled;

    if (_lastAutoSaveTime != null && now - _lastAutoSaveTime! < interval) {
      return null;
    }

    final String key = _getAutoSlotKey(_autoSaveCounter % slots);
    final snap = captureSnapshot();
    _savedSnapshots[key] = .new(snap, now);

    _autoSaveCounter++;
    _lastAutoSaveTime = now;

    return snap;
  }

  @override
  void persistAutoLoad({
    int? slot,
  }) {
    if (_savedSnapshots.isEmpty) return;

    final _TimestampedSnapshot<T, E, S> target;

    if (slot != null) {
      final String key = _getAutoSlotKey(slot);
      final found = _savedSnapshots[key];
      if (found == null) return;
      target = found;
    } else {
      target = _savedSnapshots.values.reduce(
        (a, b) => a.simTime >= b.simTime ? a : b,
      );
    }

    restoreSnapshot(target.snapshot);
  }

  late String _persistentId = Uuid().v4();

  @override
  String get persistentId => _persistentId;

  @override
  set persistentId(String value) => _persistentId = value;

  @override
  String get persistentTypeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ECSPersistentKeys.id: persistentId,
    ECSPersistentKeys.type: persistentTypeId,
  };

  @override
  @nonVirtual
  void restorePersistableData(MapTraversable data, {String? id}) {
    setPersistableData(data, id: id);
    onRestorePersistableData(data, id: id);
  }

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    final extractedId = data.getStringOrNull(ECSPersistentKeys.id, id);
    if (extractedId != null) persistentId = extractedId;
  }

  MapData _storePersistableJsonObjectMap<A extends IsAnyPersistable<T>>(Iterable<A> list, {
    bool force = false,
  }) {
    final MapData jsonData = {};

    for (final instance in list) {
      MapData? instanceData;
      if (force) instanceData = instance.getPersistableData(force: force);
      else instanceData = instance.storePersistable();
      
      if (instanceData == null) continue;
      jsonData[instance.persistentId] = instanceData;
    }

    return jsonData;
  }

  void _restorePersistableJsonObjectMap<A extends ECSBase<T>>({
    required MapTraversable data,
    required String key,
    required ECSBaseFactoryRegistry<T, A> factory,
    required void Function(A) onRestored,
  }) {
    final listData = data.getMapTraversable<MapData>(key);

    for (final entry in listData.entries) {
      final MapTraversable objData = .new(entry.value);
      final typeId = objData.getString(ECSPersistentKeys.type);
      final instance = factory.create(typeId, app);

      if (instance is! IsAnyPersistable<T>) {
        throw StateError("Tried to instantiate $A, but it's not persistable.");
      }

      instance.restorePersistableData(objData, id: entry.key);
      onRestored(instance);
    }
  }
}

final class ECSPersistentKeys {
  ECSPersistentKeys._();
  
  static final String appSystems = '__appSystems__';
  static final String scenes = '__scenes__';
  static final String sceneSystems = '__sceneSystems__';
  static final String entities = '__entities__';
  static final String components = '__components__';

  // fields
  static final String id = '__id__';
  static final String type = '__type__';
}