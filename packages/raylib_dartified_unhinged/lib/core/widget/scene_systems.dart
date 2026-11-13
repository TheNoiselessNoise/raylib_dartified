part of '../raylib_dartified_unhinged.dart';

class FMouseSystem<T extends App<T>> extends SceneSystem<T> {
  FMouseSystem(super.app, {
    super.populateDefaults,
  });

  MouseCursor cursor = .MOUSE_CURSOR_DEFAULT;

  @override
  HookResult onPreUpdate(double dt) {
    cursor = .MOUSE_CURSOR_DEFAULT;
    return super.onPreUpdate(dt);
  }

  @override
  HookResult onPreDraw(double dt) {
    backend.setMouseCursor(cursor);
    return super.onPreDraw(dt);
  }

  // persistence

  static const typeId = '__sceneSystem__FMouseSystem';
  
  @override String get persistentTypeId => typeId;
}

class FWidgetDebugSystem<T extends App<T>> extends SceneSystem<T> {
  FWidgetDebugSystem(super.app, {
    super.populateDefaults,
  });

  void _enableDebugWidget(FWidget<T> widget, bool enable) {
    final rect = widget.widgetCollider;
    rect.debugColor = .GREEN;
    rect.debugDraw = enable;

    // children
    for (final child in widget.getEntities()) {
      _enableDebugWidget(child, enable);
    }
  }

  void enableWidgetDebug(bool enable) => scene.QueryEntity.DoForEach<FWidget<T>>((e) {
    _enableDebugWidget(e, enable);
  });

  // persistence

  static const typeId = '__sceneSystem__FWidgetDebugSystem';
  
  @override String get persistentTypeId => typeId;
}

class FValidateWidgetsSystem<T extends App<T>> extends SceneSystem<T> {
  FValidateWidgetsSystem(super.app, {
    super.populateDefaults,
  });

  bool _runOnce = false;

  String _cleanClassName(String type)
    => type.split('<').first.split('_').first;

  Iterable<String> _controlPath(FWidget<T> control) {
    final parentTree = control.getParentTree();

    return <String>[

      // control
      '(${control.getParentIndexOf()}) ${_cleanClassName(control.name)}',
      
      // parent tree
      ...parentTree.map((e) {
        final (c, i) = e;
        if (c.parentWidget == null) return _cleanClassName(c.name);
        return '($i) ${_cleanClassName(c.name)}';
      }),

      // NOTE: weird assumptions, but it should be okay
      
      // scene
      _cleanClassName(parentTree.last.$1.parent!.name),
      
      // app
      _cleanClassName(parentTree.last.$1.app.name),

    ].reversed;
  }

  void validate(Entity<T> entity) {
    if (entity is! FWidget<T>) return;
    _validateControl(entity);
  }

  void _validateControl(FWidget<T> control) {
    if (control is FButton<T>) {
      _validateButton(control);
      return;
    }
  }

  void _validateButton(FButton<T> button) {
    final anyLabelControl = button.QueryWidget.On<FLabel<T>>().IsNotEmpty;

    if (!anyLabelControl) {
      _throw(button, 'Button $button is missing any `FLabel` widget!');
    }
  }

  Never _throw(FWidget<T> source, String message) {
    throw StateError(
      'Invalid ${_cleanClassName(source.name)}: $message.\n'
      'Path: ${_controlPath(source).join(' > ')}'
    );
  }

  @override
  HookResult onPreUpdate(double dt) {
    if (_runOnce) return .proceed;
    _runOnce = true;

    scene.QueryEntity.DoForEach<FWidget<T>>(validate);

    return super.onPreUpdate(dt);
  }

  // persistence

  static const typeId = '__sceneSystem__FValidateWidgetsSystem';
  
  @override String get persistentTypeId => typeId;
}