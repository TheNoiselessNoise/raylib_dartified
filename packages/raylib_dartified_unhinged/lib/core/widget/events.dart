part of '../raylib_dartified_unhinged.dart';

class EventWidgetClicked<T extends App<T>> extends Event<T> {
  final FWidget<T> control;

  EventWidgetClicked(super.app, this.control);
}

class EventWidgetDoubleClicked<T extends App<T>> extends Event<T> {
  final FWidget<T> control;

  EventWidgetDoubleClicked(super.app, this.control);
}

class EventWidgetClickHeld<T extends App<T>> extends Event<T> {
  final FWidget<T> control;
  final int framesHeld;
  final double secondsHeld;

  EventWidgetClickHeld(super.app, this.control, this.framesHeld, this.secondsHeld);
}