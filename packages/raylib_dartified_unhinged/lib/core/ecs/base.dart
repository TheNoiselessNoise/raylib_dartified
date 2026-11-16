part of '../raylib_dartified_unhinged.dart';

/// Per-type monotonic ID counter, used by [ECSBase] to assign unique IDs.
final class _GlobalIdCounter {
  static final Map<Type, int> _counters = {};

  /// Returns the next ID for [type], incrementing its counter.
  static int nextIdForType(Type type)
    => _counters[type] = _counters.putIfAbsent(type, () => 0) + 1;
}

/// Base class for all ECS objects.
///
/// Provides a per-type auto-incrementing [id] and a default [name] derived from it
/// and an optional [parent] reference for tree traversal.
abstract class ECSBase<T extends App<T>> with
  HasAppAccess<T>,
  HasSceneAccess<T>,
  HasCloneableState<T>,
  HasExternalHooks<T>
{
  /// State key for [ECSBase]'s identity.
  late final stateKey_identity = ECSStateTagKey(
    '$ECSBase', 'identity',
  );

  /// See [id].
  late int _id;

  /// Per-type unique identifier, auto-assigned in the constructor.
  int get id => _id;

  /// See [namedId].
  late String _namedId;

  /// Per-type unique String identifier, auto-assigned in the constructor.
  /// Defaults to `<runtimeType>:<id>`.
  String get namedId => _namedId;

  /// Human-readable name, defaults to `<runtimeType>:<id>`.
  late String name;

  /// Returns a key namespaced to this object's [namedId].
  ///
  /// Useful for storing per-instance data in a flat map without collisions.
  String uniqKey(String key) => '$_namedId.$key';

  /// The parent object in the ECS tree, if any.
  ECSBase<T>? parent;

  ECSBase() {
    _id = _GlobalIdCounter.nextIdForType(runtimeType);
    _namedId = '$runtimeType:$id';
    name = _namedId;
    _registerBuiltinStateKeys();
    onInstantiation();
  }

  bool isSelfOrDescendantOf(Object? target) => target == this || parent == target;

  /* descriptable */

  late final ObjectDescriptor<T> _objectDescriptor = .new();

  bool _isObjectDescriptorRegistered = false;

  /// Declares the [ObjectDescriptor] for this object.
  @mustCallSuper
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    if (_isObjectDescriptorRegistered) {
      throw StateError('Object descriptor for $runtimeType is already registered.');
    }
    _isObjectDescriptorRegistered = true;
  }

  /// Returns the [ObjectDescriptor] that describes this object.
  ///
  /// Called once during instantiation. Usually there is no need to override
  /// this; declare fields in [registerObjectDescriptor] instead.
  @nonVirtual
  ObjectDescriptor<T> getObjectDescriptor() => _objectDescriptor;

  /// Called from the [ECSBase] constructor, before subclass field
  /// initializers have run.
  ///
  /// Override to react during the instantiation phase. Do not read subclass
  /// fields here; they are not initialized yet.
  @mustCallSuper
  void onInstantiation() => registerObjectDescriptor(getObjectDescriptor());

  @override
  String toString() => '$runtimeType(id=$id)';
}

final class Bounds {
  double top;
  double left;
  double bottom;
  double right;

  Bounds(this.top, this.left, this.bottom, this.right);

  double get width => (right - left).abs();
  double get height => (bottom - top).abs();

  double get hCenter => left + (width / 2);
  double get vCenter => top + (height / 2);

  factory Bounds.zero() => .new(0, 0, 0, 0);

  factory Bounds.bounds(num top, num left, num bottom, num right) => .new(
    top.toDouble(),
    left.toDouble(),
    bottom.toDouble(),
    right.toDouble(),
  );

  factory Bounds.fromRectangle(Rectangle rect) => .new(
    rect.y, // top
    rect.x, // left
    rect.y + rect.height, // bottom
    rect.x + rect.width, // right
  );

  Bounds set(num top, num left, num bottom, num right) {
    this.top = top.toDouble();
    this.left = left.toDouble();
    this.bottom = bottom.toDouble();
    this.right = right.toDouble();
    return this;
  }

  Vector2 get position => .vec2(left, top);

  Vector2 get size => .vec2(width, height);
  
  Rectangle get rectangle => .rect(left, top, width, height);

  @override
  String toString() => '$runtimeType(top=$top, left=$left, bottom=$bottom, right=$right)';

  Bounds copy() => .new(top, left, bottom, right);

  List<double> getPersistableData() => [top, left, bottom, right];

  void setPersistableData(List<double> data) {
    // ignore: prefer_is_empty
    top = data.length < 1 ? 0 : data[0];
    left = data.length < 2 ? 0 : data[1];
    bottom = data.length < 3 ? 0 : data[2];
    right = data.length < 4 ? 0 : data[3];
  }
}