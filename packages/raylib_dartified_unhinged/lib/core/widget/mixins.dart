part of '../raylib_dartified_unhinged.dart';

final class FWidgetClickState {
  int framesHeld = 0;
  double secondsHeld = 0;
  double secondsUntilHeld = 0.5;

  bool hovered = false;
  bool clicked = false;
  bool held = false;
}

typedef IsAnyWidgetDisableable<T extends App<T>> = IsWidgetDisableable<T, FWidget<T>>;

mixin IsWidgetDisableable<T extends App<T>, E extends FWidget<T>> on FWidget<T> {
  bool _isWidgetDisabled = false;
  bool get isWidgetDisabled => _isWidgetDisabled;

  void widgetDisable() {
    _isWidgetDisabled = !_isWidgetDisabled;
    onWidgetDisable();
  }

  void onWidgetDisable() {}
}

typedef IsAnyWidgetClickable<T extends App<T>> = IsWidgetClickable<T, FWidget<T>>;

mixin IsWidgetClickable<T extends App<T>, E extends FWidget<T>> on FWidget<T> {
  E get _self => this as E;

  // double click detection
  final double _doubleClickWindowSeconds = 0.35;
  double _lastClickTime = -1;
  bool _pendingSingleClick = false;
  double _pendingSingleClickTime = -1;

  // callback deduplication guards
  bool _clickCallbackAdded = false;
  bool _doubleClickCallbackAdded = false;

  FWidgetClickState clickState = .new();

  void onWidgetClick() {}
  void onWidgetDoubleClick() {}
  void onWidgetClickHold(int framesHeld, double secondsHeld) {}

  List<void Function(E self)> _onWidgetClickFns = [];

  @nonVirtual
  E listenOnWidgetClick(void Function(E self) fn) {
    _onWidgetClickFns.add(fn);
    return _self;
  }

  @nonVirtual
  void _doWidgetClick() {
    _onWidgetClickFns.forEach((f) => f(_self));
    onWidgetClick();
  }

  List<void Function(E self)> _onWidgetDoubleClickFns = [];

  @nonVirtual
  E listenOnWidgetDoubleClick(void Function(E self) fn) {
    _onWidgetDoubleClickFns.add(fn);
    return _self;
  }

  @nonVirtual
  void _doWidgetDoubleClick() {
    _onWidgetDoubleClickFns.forEach((f) => f(_self));
    onWidgetDoubleClick();
  }

  List<void Function(E self, int framesHeld, double secondsHeld)> _onWidgetClickHoldFns = [];

  @nonVirtual
  E listenOnWidgetClickHold(void Function(E self, int framesHeld, double secondsHeld) fn) {
    _onWidgetClickHoldFns.add(fn);
    return _self;
  }

  @nonVirtual
  void _doWidgetClickHold(int framesHeld, double secondsHeld) {
    _onWidgetClickHoldFns.forEach((f) => f(_self, framesHeld, secondsHeld));
    onWidgetClickHold(framesHeld, secondsHeld);
  }

  void _IsWidgetClickable_updateState({
    required bool hovered,
    required bool usePendingSingleClickMethod,
    required double dt,
  }) {
    final clicked = backend.mouse.btnLeft.pressed;
    final held = backend.mouse.btnLeft.down;

    clickState.clicked = hovered && clicked;
    clickState.hovered = hovered;
    clickState.held = false;

    if (hovered) {
      mouseSystem?.cursor = .MOUSE_CURSOR_POINTING_HAND;
    }

    if (hovered && held) {
      clickState.framesHeld++;
      clickState.secondsHeld += dt;
    } else {
      clickState.framesHeld = 0;
      clickState.secondsHeld = 0;
    }

    if (clickState.secondsHeld >= clickState.secondsUntilHeld) {
      clickState.held = true;
    }

    // click / double click
    if (usePendingSingleClickMethod) {
      if (!clickState.clicked) {
        _clickCallbackAdded = false;
      }

      if (clickState.clicked && !_clickCallbackAdded) {
        _clickCallbackAdded = true;

        final currentTime = app.time.time;
        final isDoubleClick =
          _lastClickTime >= 0 &&
          (currentTime - _lastClickTime) <= _doubleClickWindowSeconds;

        if (isDoubleClick) {
          _pendingSingleClick = false;
          _lastClickTime = -1;
          callback(() {
            _doWidgetDoubleClick();
            emit(EventWidgetDoubleClicked(app, this));
          });
        } else {
          _lastClickTime = currentTime;
          _pendingSingleClickTime = currentTime;
          _pendingSingleClick = true;
        }
      }

      // deferred single click, fires once the double click window expires
      if (_pendingSingleClick && (app.time.time - _pendingSingleClickTime) > _doubleClickWindowSeconds) {
        _pendingSingleClick = false;
        callback(() {
          _doWidgetClick();
          emit(EventWidgetClicked(app, this));
        });
      }
    }
    else
    {
      // immediate method, single click fires right away, double click will also fire single click
      if (!clickState.clicked) {
        _clickCallbackAdded = false;
        _doubleClickCallbackAdded = false;
      }

      if (clickState.clicked && !_clickCallbackAdded) {
        _clickCallbackAdded = true;

        final currentTime = app.time.time;
        final isDoubleClick =
          _lastClickTime >= 0 &&
          (currentTime - _lastClickTime) <= _doubleClickWindowSeconds &&
          !_doubleClickCallbackAdded;

        if (isDoubleClick) {
          _doubleClickCallbackAdded = true;
          _lastClickTime = -1; // no triple
          callback(() {
            _doWidgetDoubleClick();
            emit(EventWidgetDoubleClicked(app, this));
          });
        } else {
          _lastClickTime = currentTime;
          callback(() {
            _doWidgetClick();
            emit(EventWidgetClicked(app, this));
          });
        }
      }
    }

    // hold
    if (clickState.held) {
      callback(() {
        final secondsHeld = clickState.secondsHeld - clickState.secondsUntilHeld;
        final framesHeld = clickState.framesHeld;
        _doWidgetClickHold(framesHeld, secondsHeld);
        emit(EventWidgetClickHeld(app, this, framesHeld, secondsHeld));
      });
    }
  }
}