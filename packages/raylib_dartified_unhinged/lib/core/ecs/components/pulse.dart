part of '../../raylib_dartified_unhinged.dart';

mixin IsComponentScaleMutable<T extends App<T>> on Comp<T> {}

class CPulse<T extends App<T>> extends Comp<T> with
  IsComponentScaleMutable<T>
{
  static const double _defaultMinScale = 0.8;
  static const double _defaultMaxScale = 1.2;
  static const double _defaultSpeed = 2;

  double minScale;
  double maxScale;
  double speed;
  double pulseTime;

  double currentScale = 0;

  CPulse(super.app, {
    super.populateDefaults,
    this.minScale = _defaultMinScale,
    this.maxScale = _defaultMaxScale,
    this.speed = _defaultSpeed,
    double? time,
  }) : pulseTime = time ?? 0;

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('minScale', DoubleFieldDescriptor.value(
      () => minScale,
      (v) => minScale = v,
    ));

    descriptor.addField('maxScale', DoubleFieldDescriptor.value(
      () => maxScale,
      (v) => maxScale = v,
    ));

    descriptor.addField('speed', DoubleFieldDescriptor.value(
      () => speed,
      (v) => speed = v,
    ));

    descriptor.addField('pulseTime', DoubleFieldDescriptor.value(
      () => pulseTime,
      (v) => pulseTime = v,
    ));

    descriptor.addField('currentScale', DoubleFieldDescriptor.value(
      () => currentScale,
      (v) => currentScale = v,
    ));
  }

  @override
  void onPostUpdate(double dt) => entity.onTransform((t) {
    if (isDisabled) return;
    
    pulseTime += dt;

    currentScale = minScale + (maxScale - minScale) * (0.5 + 0.5 * math.sin(pulseTime * speed));

    t.scale.set(currentScale, currentScale);
  });

  // clone

  @override
  CPulse<T> createInstance() => .new(app);

  // state

  @override
  CPulseSnapshot<T> createSnapshot() {
    final snapshot = CPulseSnapshot<T>(namedId);
    snapshot.minScale = minScale;
    snapshot.maxScale = maxScale;
    snapshot.speed = speed;
    snapshot.pulseTime = pulseTime;
    snapshot.currentScale = currentScale;
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CPulseSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    minScale = snapshot.minScale;
    maxScale = snapshot.maxScale;
    speed = snapshot.speed;
    pulseTime = snapshot.pulseTime;
    currentScale = snapshot.currentScale;
  }

  // persistence

  static const typeId = '__comp__CPulse';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'minScale': minScale,
    'maxScale': maxScale,
    'speed': speed,
    'pulseTime': pulseTime,
    'currentScale': currentScale,
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    minScale = data.getDouble('minScale', _defaultMinScale);
    maxScale = data.getDouble('maxScale', _defaultMaxScale);
    speed = data.getDouble('speed', _defaultSpeed);
    pulseTime = data.getDouble('pulseTime');
    currentScale = data.getDouble('currentScale');
  }
}

class CPulseSnapshot<T extends App<T>> extends CompSnapshot<T, CPulse<T>> {
  late double minScale;
  late double maxScale;
  late double speed;
  late double pulseTime;
  late double currentScale;
  
  CPulseSnapshot(super.id);

  @override
  CPulse<T> createInstance(T app) => .new(app);
}
