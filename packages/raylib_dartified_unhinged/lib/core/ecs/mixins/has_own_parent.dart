part of '../../raylib_dartified_unhinged.dart';

/// Adds on-parent-set lifecycle hooks to an ECS object.
///
/// The **on** phase only.
mixin HasOwnParent<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// Hook key for [HasOwnParent]'s [onParentSet] hooks.
  late final hookKey_onParentSet = ECSHookKey<void Function(E self, ECSBase<T>? parent)>(
    '$HasOwnParent', 'onParentSet'
  );

  /// Registers [fn] to be called at the start of each frame.
  @nonVirtual
  E listenOnParentSet(void Function(E self, ECSBase<T> parent) fn) {
    addHook(hookKey_onParentSet, fn);
    return self;
  }

  /// Notifies all begin-frame listeners and calls [onParentSet].
  @mustCallSuper
  void _doParentSet(ECSBase<T>? parent) {
    hooksOf(hookKey_onParentSet).forEach((f) => f(self, parent));
    onParentSet(parent);
  }

  /// Override to react at the start of each frame.
  ///
  /// Called after all registered [listenOnParentSet] listeners.
  void onParentSet(ECSBase<T>? parent) {}

  /// Returns [parent] cast to [P], or `null` if the cast would fail.
  P? parentAs<P extends ECSBase<T>>() => parent is P ? parent as P : null;

  /// Sets the [parent] of this ECS object.
  void setParent(ECSBase<T>? parent, {bool force = false}) {
    bool ok = true;

    if (force) {
      this.parent = parent;
    } else {
      if (this.parent != null) ok = false;
      this.parent ??= parent;
    }

    if (ok) _doParentSet(parent);
  }

  /// Returns the depth/level in the hierarchy.
  int getDepth() {
    int depth = 0;
    var current = parent;
    while (current != null) {
      depth++;
      current = current.parent;
    }
    return depth;
  }

  /// Returns the path from the root down to this one, inclusive.
  List<ECSBase<T>> getPath() {
    List<ECSBase<T>> path = [];
    ECSBase<T>? current = this;
    while (current != null) {
      path.insert(0, current);
      final parent = current.parent;
      if (parent != this) {
        current = parent;
      } else {
        break;
      }
    }
    return path;
  }

  /// Returns every ancestor of this component, from immediate parent up to the root.
  Iterable<ECSBase<T>> getAncestors() {
    List<ECSBase<T>> ancestors = [];
    var current = parent;
    while (current != null) {
      ancestors.add(current);
      current = current.parent;
    }
    return ancestors;
  }
}