part of '../../raylib_dartified_unhinged.dart';

class CLifetime<T extends App<T>> extends Comp<T> {
  static const double _defaultTimeLeft = 0;

  double timeLeft;
  bool _enqueued = false;

  CLifetime(super.app, {
    super.populateDefaults,
    this.timeLeft = _defaultTimeLeft,
  });

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('timeLeft', DoubleFieldDescriptor.value(
      () => timeLeft,
      (v) => timeLeft = v,
    ));
  }

  @override
  void onPostUpdate(double dt) {
    if (_enqueued) return;
    timeLeft -= dt;
    if (timeLeft <= 0) {
      _enqueued = true;
      callback(() => scene.removeEntity(entity));
    }
  }

  // clone

  @override
  CLifetime<T> createInstance() => .new(app,
    timeLeft: timeLeft,
  );

  // state

  @override
  CLifetimeSnapshot<T> createSnapshot() {
    final snapshot = CLifetimeSnapshot<T>(namedId);
    snapshot.timeLeft = timeLeft;
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CLifetimeSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    timeLeft = snapshot.timeLeft;
  }

  // persistence

  static const typeId = '__comp__CLifetime';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'timeLeft': timeLeft,
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    timeLeft = data.getDouble('timeLeft', _defaultTimeLeft);
  }
}

class CLifetimeSnapshot<T extends App<T>> extends CompSnapshot<T, CLifetime<T>> {
  late double timeLeft;
  
  CLifetimeSnapshot(super.id);

  @override
  CLifetime<T> createInstance(T app) => .new(app);
}