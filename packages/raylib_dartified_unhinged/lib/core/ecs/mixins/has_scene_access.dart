part of '../../raylib_dartified_unhinged.dart';

/// Provides access to the [Scene] this object belongs to.
mixin HasSceneAccess<T extends App<T>> on HasAppAccess<T> {
  Bounds get sceneBounds => scene.sceneBounds;

  Vector2 get sceneSize => sceneBounds.size;

  double get sceneWidth => sceneBounds.width;

  double get sceneHeight => sceneBounds.height;

  void callback(void Function() callback) => scene.callback(callback);

  void task(Task<T> task) => scene.task(task);

  void run(Task<T> task) => scene.run(task);
}