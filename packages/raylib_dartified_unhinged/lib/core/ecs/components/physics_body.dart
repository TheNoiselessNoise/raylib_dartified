part of '../../raylib_dartified_unhinged.dart';

// physics stuff
class CPhysicsBody<T extends App<T>> extends Comp<T> {
  static const double _defaultMass = 1;
  static const double _defaultRestitution = 1;
  static const bool _defaultTransferVelocity = true;

  /// 0 = infinite mass (immovable)
  double mass;

  /// Bounciness (0 = no bounce, 1 = perfect elastic)
  double restitution;

  // defaults to true for normal bodies, false for kinematic
  bool transferVelocity;

  CPhysicsBody(super.app, {
    super.populateDefaults,
    this.mass = _defaultMass,
    this.restitution = _defaultRestitution,
    this.transferVelocity = _defaultTransferVelocity,
  });

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('mass', DoubleFieldDescriptor.value(
      () => mass,
      (v) => mass = v,
    ));

    descriptor.addField('restitution', DoubleFieldDescriptor.value(
      () => restitution,
      (v) => restitution = v,
    ));

    descriptor.addField('transferVelocity', BoolFieldDescriptor(
      () => transferVelocity,
      (v) => transferVelocity = v,
    ));
  }

  factory CPhysicsBody.kinematic(T app, {
    double mass = 0.0,
    double restitution = 1.0,
    bool transferVelocity = false,
  }) => .new(app,
    mass: 0,
    restitution: restitution,
    transferVelocity: transferVelocity,
  );

  double get invMass => mass <= 0 ? 0.0 : 1.0 / mass;

  // clone

  @override
  CPhysicsBody<T> createInstance() => .new(app,
    mass: mass,
    restitution: restitution,
    transferVelocity: transferVelocity,
  );

  // state

  @override
  CPhysicsBodySnapshot<T> createSnapshot() {
    final snapshot = CPhysicsBodySnapshot<T>(namedId);
    snapshot.mass = mass;
    snapshot.restitution = restitution;
    snapshot.transferVelocity = transferVelocity;
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CPhysicsBodySnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    mass = snapshot.mass;
    restitution = snapshot.restitution;
    transferVelocity = snapshot.transferVelocity;
  }

  // persistence

  static const typeId = '__comp__CPhysicsBody';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'mass': mass,
    'restitution': restitution,
    'transferVelocity': transferVelocity,
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    mass = data.getDouble('mass', _defaultMass);
    restitution = data.getDouble('restitution', _defaultRestitution);
    transferVelocity = data.getBool('transferVelocity', _defaultTransferVelocity);
  }
}

class CPhysicsBodySnapshot<T extends App<T>> extends CompSnapshot<T, CPhysicsBody<T>> {
  late double mass;
  late double restitution;
  late bool transferVelocity;
  
  CPhysicsBodySnapshot(super.id);

  @override
  CPhysicsBody<T> createInstance(T app) => .new(app);
}