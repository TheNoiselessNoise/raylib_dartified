part of '../../raylib_dartified_unhinged.dart';

// velocity
class CVelocity<T extends App<T>> extends Comp<T> {
  static const double _defaultAngularVelocity = 0;
  static const double _defaultLinearDamping = 0;
  static const double _defaultAngularDamping = 0;

  Vector2 velocity;      // units per second
  double angularVelocity; // radians per second

  /// Optional damping: 0 = no damping. Typical: 1..10 (per second).
  double linearDamping;
  double angularDamping;

  /// Optional speed limit (units per second). Null = unbounded.
  double? maxVelocity;

  CVelocity(super.app, {
    super.populateDefaults,
    Vector2? velocity,
    this.angularVelocity = _defaultAngularVelocity,
    this.linearDamping = _defaultLinearDamping,
    this.angularDamping = _defaultAngularDamping,
    this.maxVelocity,
  }) : velocity = velocity ?? .zero();

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('velocity', ObjectFieldDescriptor.value(
      () => velocity,
      (v) => velocity = v.copy(),
    ));

    descriptor.addField('angularVelocity', DoubleFieldDescriptor.value(
      () => angularVelocity,
      (v) => angularVelocity = v,
    ));

    descriptor.addField('linearDamping', DoubleFieldDescriptor.value(
      () => linearDamping,
      (v) => linearDamping = v,
    ));

    descriptor.addField('angularDamping', DoubleFieldDescriptor.value(
      () => angularDamping,
      (v) => angularDamping = v,
    ));

    descriptor.addField('maxVelocity', DoubleFieldDescriptor.nullable(
      () => maxVelocity,
      (v) => maxVelocity = v,
    ));
  }

  @override
  void onPostUpdate(double dt) => entity.onTransform((t) {
    // Integrate
    t.position = t.position.add(velocity.scale(dt));
    t.rotation += angularVelocity * dt;

    // Optional damping (stable-ish exponential decay)
    if (linearDamping > 0) {
      final k = math.exp(-linearDamping * dt);
      velocity.x *= k;
      velocity.y *= k;
    }
    if (angularDamping > 0) {
      angularVelocity *= math.exp(-angularDamping * dt);
    }

    // Optional clamp to max speed
    final max = maxVelocity;
    if (max != null) {
      final speedSq = velocity.x * velocity.x + velocity.y * velocity.y;
      if (speedSq > max * max && speedSq > 0) {
        final scale = max / math.sqrt(speedSq);
        velocity.x *= scale;
        velocity.y *= scale;
      }
    }
  });

  // clone

  @override
  CVelocity<T> createInstance() => .new(app,
    velocity: velocity.copy(),
    angularVelocity: angularVelocity,
    linearDamping: linearDamping,
    angularDamping: angularDamping,
    maxVelocity: maxVelocity,
  );

  // state

  @override
  CVelocitySnapshot<T> createSnapshot() {
    final snapshot = CVelocitySnapshot<T>(namedId);
    snapshot.velocity = velocity.copy();
    snapshot.angularVelocity = angularVelocity;
    snapshot.linearDamping = linearDamping;
    snapshot.angularDamping = angularDamping;
    snapshot.maxVelocity = maxVelocity;
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CVelocitySnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    velocity = snapshot.velocity.copy();
    angularVelocity = snapshot.angularVelocity;
    linearDamping = snapshot.linearDamping;
    angularDamping = snapshot.angularDamping;
    maxVelocity = snapshot.maxVelocity;
  }

  // persistence

  static const typeId = '__comp__CVelocity';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'velocity': velocity.getPersistableData(),
    'angularVelocity': angularVelocity,
    'linearDamping': linearDamping,
    'angularDamping': angularDamping,
    'maxVelocity': maxVelocity,
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    final velocityData = data.getList<double>('velocity');
    velocity.setPersistableData(velocityData);

    angularVelocity = data.getDouble('angularVelocity', _defaultAngularVelocity);
    linearDamping = data.getDouble('linearDamping', _defaultLinearDamping);
    angularDamping = data.getDouble('angularDamping', _defaultAngularDamping);
    maxVelocity = data.getDoubleOrNull('maxVelocity');
  }
}

class CVelocitySnapshot<T extends App<T>> extends CompSnapshot<T, CVelocity<T>> {
  late Vector2 velocity;
  late double angularVelocity;
  late double linearDamping;
  late double angularDamping;
  late double? maxVelocity;
  
  CVelocitySnapshot(super.id);

  @override
  CVelocity<T> createInstance(T app) => .new(app);
}