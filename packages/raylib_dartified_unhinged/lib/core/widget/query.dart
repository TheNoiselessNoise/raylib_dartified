part of '../raylib_dartified_unhinged.dart';

class QueryFWidget<T extends App<T>> extends QueryComponentManagable<T, Entity<T>, QueryFWidget<T>> {
  final FWidget<T> control;

  QueryFWidget(super.app, this.control);

  @override
  Iterable<FWidget<T>> get queryableList => control.getAllControls();
  
  @override
  QueryFWidget<T> createInstance() => .new(app, control);
}

class QueryFWidgetParent<T extends App<T>> extends QueryComponentManagable<T, Entity<T>, QueryFWidgetParent<T>> {
  final FWidget<T> control;

  QueryFWidgetParent(super.app, this.control);

  @override
  Iterable<FWidget<T>> get queryableList => control.getParentTree().map((e) => e.$1);
  
  @override
  QueryFWidgetParent<T> createInstance() => .new(app, control);
}