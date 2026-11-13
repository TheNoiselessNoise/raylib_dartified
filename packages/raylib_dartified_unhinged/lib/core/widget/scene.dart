part of '../raylib_dartified_unhinged.dart';

class FWidgetScene<T extends App<T>> extends DrawScene<T> {
  FWidgetScene(super.app, {super.key}) {
    addSystem(FValidateWidgetsSystem(app));
    addSystem(FMouseSystem(app));
    addSystem(FWidgetDebugSystem(app));
  }

  FMouseSystem<T> get mouseSystem => getSystem()!;
  FValidateWidgetsSystem<T> get validateSystem => getSystem()!;
  FWidgetDebugSystem<T> get debugSystem => getSystem()!;

  FWidget<T>? getRootControl() => QueryEntity.On<FWidget<T>>().FirstOrNull as FWidget<T>?;

  E? findControl<E extends FWidget<T>>() {
    final root = getRootControl();
    if (root is E) return root;
    return root?.findChildControl<E>();
  }

  FWidget<T>? findControlByKey(String key) {
    final root = getRootControl();
    if (root?.key == key) return root;
    return root?.findChildControlByKey(key);
  }

  @override
  @mustCallSuper
  bool addEntity(Entity<T> entity) {
    if (!super.addEntity(entity)) return false;

    // we need to wait on whole tree to be populated
    callback(() => validateSystem.validate(entity));

    return true;
  }
}