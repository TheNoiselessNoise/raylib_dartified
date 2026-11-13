part of '../raylib_dartified_unhinged.dart';

abstract class Task<T extends App<T>> extends ECSBase<T> with
  Self<Task<T>>,
  IsCancelable<T, Task<T>>
{

  @override
  final T app;
  
  Task(this.app);

  bool _hasStarted = false;

  bool _isQueued = false;

  bool update(double dt);

  @mustCallSuper
  bool _doUpdate(double dt) {
    if (isCanceled) return true;
    return update(dt);
  }

  /// Reset this task's cancellation state so it can be reused.
  void _reset() => _isCanceled = false;
}

class DelayTask<T extends App<T>> extends Task<T> {
  double remaining;
  final void Function(DelayTask<T> self) action;

  DelayTask(super.app, {
    double seconds = 0,
    required this.action,
  }) : remaining = seconds;

  @override
  bool update(double dt) {
    remaining -= dt;
    if (remaining <= 0) {
      action(this);
      return true;
    }
    return false;
  }
}

class DurationTask<T extends App<T>> extends Task<T> {
  double remaining;
  final void Function(DurationTask<T> self, double dt) actionUpdate;
  final void Function(DurationTask<T> self)? actionFinish;

  DurationTask(super.app, {
    double seconds = 0,
    required this.actionUpdate,
    this.actionFinish,
  }) : remaining = seconds;

  @override
  bool update(double dt) {
    actionUpdate(this, dt);
    remaining -= dt;

    if (remaining <= 0) {
      actionFinish?.call(this);
      return true;
    }

    return false;
  }
}

class IntervalTask<T extends App<T>> extends Task<T> {
  double? remaining; // null = runs until stopped externally
  final double interval; // seconds; ignored if frameInterval is set
  final int? frameInterval;
  final bool triggerImmediately;

  double _accum = 0;
  int _frames = 0;
  double _sinceLast = 0; // elapsed since last trigger

  final void Function(IntervalTask<T> self, double elapsed) actionUpdate;
  final void Function(IntervalTask<T> self)? actionFinish;

  IntervalTask(super.app, {
    this.remaining, // null by default = infinite
    this.interval = 0,
    this.frameInterval,
    this.triggerImmediately = false,
    required this.actionUpdate,
    this.actionFinish,
  }) :
    assert(
      frameInterval == null || interval == 0,
      'set either interval or frameInterval, not both'
    )
  {
    if (triggerImmediately) {
      _accum = interval;
      _frames = frameInterval ?? 0;
    }
  }

  @override
  bool update(double dt) {
    _accum += dt;
    _frames++;
    _sinceLast += dt;

    final trigger = frameInterval != null
      ? _frames >= frameInterval!
      : _accum >= interval;

    if (trigger) {
      actionUpdate(this, _sinceLast);
      _sinceLast = 0;
      _accum = frameInterval != null ? _accum : _accum - interval;
      _frames = 0;
    }

    if (remaining != null) {
      remaining = remaining! - dt;
      if (remaining! <= 0) {
        actionFinish?.call(this);
        return true;
      }
    }

    return false;
  }
}