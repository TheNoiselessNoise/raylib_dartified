part of '../../raylib_dartified_unhinged.dart';

typedef ParticleFactory<T extends App<T>, E extends Entity<T>> = E Function();
typedef ParticleTransform<T extends App<T>, E extends Entity<T>> = void Function(E instance);

/// See [CParticleEmitter].
typedef CAnyParticleEmitter<T extends App<T>> = CParticleEmitter<T, Entity<T>>;

/// ***WARNING***:
/// CParticleEmitter cannot be fully restored from persistable data because
/// its factory is a closure.
/// 
/// Either:
/// - Extend this class and override `onRestorePersistableData` to reassign
/// `factory` there.
/// 
/// - Listen on `factories.comp` (see [App.factories], [ECSFactoryRegistry.comp])
///   and reassign `factory` when the restored instance matches your type.
/// 
/// ```dart
/// MyApp(super.backend) {
///   factories.comp.listen((typeId, instance) {
///     if (instance is MyParticleEmitter) {
///       instance.factory = ...;
///     }
///   });
/// }
/// ```
class CParticleEmitter<T extends App<T>, E extends Entity<T>> extends Comp<T> {
  static const double _defaultRate = 0;
  
  double rate;
  ParticleFactory<T, E>? factory;
  double _acc = 0;

  CParticleEmitter(super.app, {
    super.populateDefaults,
    this.rate = _defaultRate,
    this.factory,
  });

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('rate', DoubleFieldDescriptor.value(
      () => rate,
      (v) => rate = v,
    ));

    descriptor.addField('factory', ObjectFieldDescriptor.value(
      () => factory,
      (v) => factory = v,
    ));
  }

  void spawn({
    int count = 1,
    ParticleFactory<T, E>? factory,
    ParticleTransform<T, E>? transform,
  }) {
    if (isDisabled) return;
    final f = factory ?? this.factory;
    if (f == null) return;
    for (var i = 0; i < count; i++) _spawnOne(
      factory: f,
      transform: transform,
    );
  }

  @override
  void onPostUpdate(double dt) {
    if (isDisabled) return;
    _acc += dt * rate;
    while (_acc >= 1) {
      _acc -= 1;
      if (factory == null) continue;
      _spawnOne(factory: factory!);
    }
  }

  void _spawnOne({
    required ParticleFactory<T, E> factory,
    ParticleTransform<T, E>? transform,
  }) {
    if (isDisabled) return;
    final instance = factory();
    transform?.call(instance);
    callback(() => scene.addEntity(instance));
  }

  // clone

  @override
  CParticleEmitter<T, E> createInstance() => .new(app);

  // state

  @override
  CParticleEmitterSnapshot<T, E> createSnapshot() {
    final snapshot = CParticleEmitterSnapshot<T, E>(namedId);
    snapshot.rate = rate;
    snapshot.factory = factory;
    snapshot._acc = _acc;
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CParticleEmitterSnapshot<T, E> snapshot) {
    super.restoreSnapshot(snapshot);
    
    rate = snapshot.rate;
    factory = snapshot.factory;
    _acc = snapshot._acc;
  }

  // persistence

  static const typeId = '__comp__CParticleEmitter';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'rate': rate,
    '_acc': _acc,
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    rate = data.getDouble('rate', _defaultRate);
    _acc = data.getDouble('_acc');
  }
}

class CParticleEmitterSnapshot<T extends App<T>, E extends Entity<T>> extends CompSnapshot<T, CParticleEmitter<T, E>> {
  late double rate;
  late ParticleFactory<T, E>? factory;
  late double _acc;
  
  CParticleEmitterSnapshot(super.id);

  @override
  CParticleEmitter<T, E> createInstance(T app) => .new(app);
}