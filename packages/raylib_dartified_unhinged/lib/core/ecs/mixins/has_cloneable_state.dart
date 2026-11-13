part of '../../raylib_dartified_unhinged.dart';

/// Identifies a piece of state that can be accessed and copied between
/// ECS instances.
///
/// Each key is uniquely identified by its [family] and [name], combined
/// into a [fullId].
///
/// Optional [get] and [set] callbacks define how the associated state
/// is read and written. Both must be provided for state copying to work.
final class ECSStateKey<S> {
  /// The family or category to which this state key belongs.
  final String family;

  /// The name identifying this state within its family.
  final String name;

  /// Reads the current value of the associated state.
  ///
  /// Required when copying state from this key to another key.
  final S Function()? get;

  /// Writes a value to the associated state.
  ///
  /// Required when copying state into this key.
  final void Function(S)? set;

  /// Creates a state key identified by [family] and [name].
  ///
  /// Optionally accepts callbacks for reading and writing the associated
  /// state.
  const ECSStateKey(this.family, this.name, {
    this.get,
    this.set,
  });

  /// Copies the state value from [other] into this key.
  ///
  /// Uses [other.get] to retrieve the value and [set] to apply it.
  ///
  /// Does nothing if neither key provides the required callbacks for
  /// copying. Throws a [StateError] if only one of the required callbacks
  /// is missing.
  void copyFrom(ECSStateKey<S> other) {
    if (set == null && other.get == null) return;
    if (set != null && other.get == null) throw StateError("Key '$fullId' is missing a getter.");
    if (set == null && other.get != null) throw StateError("Key '$fullId' is missing a setter.");
    set!(other.get!());
  }

  /// The fully qualified identifier of this key, in `family.name` format.
  String get fullId => '$family.$name';

  /// Whether [other] is a state key of the same type with the same [fullId].
  @override
  bool operator ==(Object other)
    => other is ECSStateKey<S> && other.fullId == fullId;

  /// Generates a hash code from the state type and [fullId].
  @override
  int get hashCode => Object.hash(S, fullId);

  /// Returns the [fullId] of this key.
  @override
  String toString() => fullId;
}

/// A state key used to identify a state tag without an associated value.
///
/// Unlike [ECSStateKey], a tag key represents the presence of a state
/// rather than a value that needs to be read or written.
final class ECSStateTagKey extends ECSStateKey<void> {
  /// Creates a state tag key identified by [family] and [name].
  ECSStateTagKey(super.family, super.name);
}

/// Provides registration and copying of state that can be cloned between
/// ECS instances.
///
/// Registered state keys are used to identify corresponding state in the
/// source and target instances. State is copied only when the key is
/// registered in both instances and permitted by the supplied filter.
mixin HasCloneableState<T extends App<T>> {
  final Map<ECSStateKey, ECSStateKey> _cloneableStates = {};

  /// Exposes the registered cloneable state keys for development and testing.
  ///
  /// The map associates each registered key with its state descriptor.
  Map<ECSStateKey, ECSStateKey> get devTestCloneableStates => _cloneableStates;

  /// Registers built-in state keys.
  ///
  /// Override this method to register additional built-in keys.
  @mustCallSuper
  void _registerBuiltinStateKeys() {}

  /// Registers [key] as state that can be copied during cloning.
  ///
  /// The key is used both as the registration identifier and as the
  /// descriptor providing access to the associated state.
  void registerStateKey<S>(ECSStateKey<S> key)
    => _cloneableStates[key] = key;

  /// Copies eligible registered state from this instance into [target].
  ///
  /// A state key is copied only if:
  /// - [allowed] permits the key.
  /// - The same key is registered in [target].
  ///
  /// The actual copying is performed by [ECSStateKey.copyFrom].
  void _copyStateTo(HasCloneableState<T> target, bool Function(ECSStateKey) allowed) {
    _cloneableStates.forEach((key, desc) {
      final targetDesc = target._cloneableStates[key];
      if (allowed(key) && targetDesc != null) {
        targetDesc.copyFrom(desc);
      }
    });
  }
}