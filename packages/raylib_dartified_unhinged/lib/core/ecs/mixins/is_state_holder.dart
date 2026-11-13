part of '../../raylib_dartified_unhinged.dart';

enum SnapshotMissingPolicy {
  /// Ignore snapshot entries that have no matching live origin.
  skip,

  /// Recreate the entry from its snapshot and re-add it to the parent.
  recreate,
}

enum SnapshotExtraPolicy {
  /// Leave live entries that aren't referenced by the snapshot untouched.
  keep,

  /// Remove live entries that aren't referenced by the snapshot.
  remove,
}

typedef AnyStateSnapshot<T extends App<T>> = StateSnapshot<T, ECSBase<T>>;

abstract class StateSnapshot<T extends App<T>, E extends ECSBase<T>> with HasExternalHooks<T> {
  late String sourceId;

  StateSnapshot(this.sourceId);

  SnapshotMissingPolicy onMissing = .skip;

  SnapshotExtraPolicy onExtra = .keep;

  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██   ░██         
  // ░██████████ ░██     ░██ ░██     ░██ ░███████     ░████████  
  // ░██     ░██ ░██     ░██ ░██     ░██ ░██   ░██           ░██ 
  // ░██     ░██  ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██  
  // ░██     ░██   ░██████     ░██████   ░██     ░██   ░██████   

  /// Hook key for [StateSnapshot]'s [onShouldRecreateMissing] hooks.
  late final hookKey_onShouldRecreateMissing = ECSHookKey<bool Function(String sourceId)>(
    '$StateSnapshot', 'onShouldRecreateMissing'
  );

  /// Hook key for [StateSnapshot]'s [onShouldDeleteExtra] hooks.
  late final hookKey_onShouldDeleteExtra = ECSHookKey<bool Function(ECSBase<T> target)>(
    '$StateSnapshot', 'onShouldDeleteExtra'
  );

  /// Registers [fn] as a should-recreate-missing listener.
  ///
  /// [fn] returning `false` cancels the recreation of missing.
  @nonVirtual
  StateSnapshot<T, E> listenOnShouldRecreateMissing(bool Function(String sourceId) fn) {
    addHook(hookKey_onShouldRecreateMissing, fn);
    return this;
  }

  /// Registers [fn] as a should-delete-extra listener.
  ///
  /// [fn] returning `false` cancels the deletion of extra.
  @nonVirtual
  StateSnapshot<T, E> listenOnShouldDeleteExtra(bool Function(ECSBase<T> target) fn) {
    addHook(hookKey_onShouldDeleteExtra, fn);
    return this;
  }

  /// Runs all should-recreate-missing listeners and [onShouldRecreateMissing].
  ///
  /// Returns `false` if any listener or the override cancels the recreation of missing.
  @mustCallSuper
  bool _doShouldRecreateMissing(String sourceId) {
    if (!hooksOf(hookKey_onShouldRecreateMissing).every((f) => f(sourceId))) return false;
    return onShouldRecreateMissing(sourceId);
  }

  /// Runs all should-delete-extra listeners and [onShouldDeleteExtra].
  ///
  /// Returns `false` if any listener or the override cancels the deletion of extra.
  @mustCallSuper
  bool _doShouldDeleteExtra(ECSBase<T> target) {
    if (!hooksOf(hookKey_onShouldDeleteExtra).every((f) => f(target))) return false;
    return onShouldDeleteExtra(target);
  }

  /// Override to cancel the recreation of missing from within the class.
  ///
  /// Return `false` to abort. Called after all registered [listenOnShouldRecreateMissing] listeners.
  bool onShouldRecreateMissing(String sourceId) => true;

  /// Override to cancel the deletion of extra from within the class.
  ///
  /// Return `false` to abort. Called after all registered [listenOnShouldDeleteExtra] listeners.
  bool onShouldDeleteExtra(ECSBase<T> target) => true;

  /// Bare instance.
  E createInstance(T app);
}

mixin _IsStateHolderBase<T extends App<T>> on ECSBase<T> {
  AnyStateSnapshot<T> createSnapshot();

  AnyStateSnapshot<T> captureSnapshot();
  
  void restoreSnapshot(covariant AnyStateSnapshot<T> snapshot);

  AnyStateSnapshot<T> bookmarkState(String name);
  
  void restoreBookmarkedState(String name, {
    SnapshotMissingPolicy onMissing = .skip,
    SnapshotExtraPolicy onExtra = .keep,
  });
}

typedef IsAnyStateHolder<T extends App<T>> = _IsStateHolderBase<T>;

mixin IsStateHolder<
  T extends App<T>,
  E extends IsStateHolder<T, E, S>,
  S extends StateSnapshot<T, E>
> on ECSBase<T> implements _IsStateHolderBase<T> {
  
  // ░██████░███     ░███ ░█████████  ░██         
  //   ░██  ░████   ░████ ░██     ░██ ░██         
  //   ░██  ░██░██ ░██░██ ░██     ░██ ░██         
  //   ░██  ░██ ░████ ░██ ░█████████  ░██         
  //   ░██  ░██  ░██  ░██ ░██         ░██         
  //   ░██  ░██       ░██ ░██         ░██         
  // ░██████░██       ░██ ░██         ░██████████ 
  
  final Map<String, S> _bookmarks = {};

  @override
  S createSnapshot();

  @override
  S captureSnapshot();

  X captureSnapshotAs<X extends S>() => captureSnapshot() as X;
  
  @override
  void restoreSnapshot(S snapshot);

  void _restoreSnapshotList<
    A extends IsAnyStateHolder<T>,
    X extends StateSnapshot<T, IsAnyStateHolder<T>>
  >({
    required AnyStateSnapshot<T> originSnapshot,
    required List<A> sourceList,
    required List<X> sourceSnapshots,
    required void Function(A) onRecreate,
    required void Function(A, X) onRestore,
    required void Function(A) onRemove,
  }) {
    final byId = {for (final c in sourceList) c.namedId: c};
    final restoredIds = <String>{};

    for (final snapshot in sourceSnapshots) {
      final origin = byId[snapshot.sourceId];

      if (origin == null) {
        switch (originSnapshot.onMissing) {
          case .skip:
            continue;
          case .recreate:
            if (!originSnapshot._doShouldRecreateMissing(snapshot.sourceId)) continue;
            final created = snapshot.createInstance(app);
            created.restoreSnapshot(snapshot);
            onRecreate(created as A);
            restoredIds.add(created.namedId);
        }
        continue;
      }

      restoredIds.add(origin.namedId);
      onRestore(origin, snapshot);
    }

    if (originSnapshot.onExtra == .remove) {
      final toRemoveStructures = sourceList
        .where((c) => !restoredIds.contains(c.namedId))
        .toList();

      for (final toRemove in toRemoveStructures) {
        if (!originSnapshot._doShouldDeleteExtra(toRemove)) continue;
        onRemove(toRemove);
      }
    }
  }

  @override
  S bookmarkState(String name) => _bookmarks[name] = captureSnapshot();
  
  @override
  void restoreBookmarkedState(String name, {
    SnapshotMissingPolicy onMissing = .skip,
    SnapshotExtraPolicy onExtra = .keep,
  }) {
    final snap = _bookmarks[name];
    if (snap != null) {
      snap.onMissing = onMissing;
      snap.onExtra = onExtra;
      restoreSnapshot(snap);
    }
  }
}