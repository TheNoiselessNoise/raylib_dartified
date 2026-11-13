part of '../../raylib_dartified_unhinged.dart';

class TransformSyncSystem<T extends App<T>> extends SceneSystem<T> {
  TransformSyncSystem(super.app, {
    super.populateDefaults,
  });

  void _syncGroup(AnyEntityGroup<T> group) {
    final groupTransform = group.transform;
    if (groupTransform == null) return;

    for (final child in group._entities) {
      final local = child.localTransform;
      final world = child.transform;
      if (local == null || world == null) continue;

      world.position = groupTransform.position.add(local.offset);
      world.rotation = groupTransform.rotation + local.rotation;
      world.scale = groupTransform.scale.mul(local.scale);

      // if this child is itself a group, recurse
      if (child is AnyEntityGroup<T>) {
        _syncGroup(child);
      }
    }
  }

  @override
  void onPostUpdate(double dt) {
    scene.QueryEntity.DoForEach<AnyEntityGroup<T>>((g) {
      // only start from root groups (those that are NOT themselves inside a group)
      if (g.parent is! AnyEntityGroup<T>) {
        _syncGroup(g);
      }
    });
  }

  // clone

  @override
  TransformSyncSystem<T> createInstance() => .new(app);
  
  // state

  @override
  TransformSyncSystemSnapshot<T> createSnapshot() => .new(namedId);

  // persistence
  
  static const typeId = '__sceneSystem__TransformSyncSystem';
  
  @override String get persistentTypeId => typeId;
}

class TransformSyncSystemSnapshot<T extends App<T>> extends SceneSystemSnapshot<T, TransformSyncSystem<T>> {
  TransformSyncSystemSnapshot(super.id);

  @override
  TransformSyncSystem<T> createInstance(T app) => .new(app);
}