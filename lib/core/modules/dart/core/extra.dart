part of '../../../raylib.dart';

final class MouseButtonInfoD {
  final bool up;
  final bool down;
  final bool pressed;
  final bool released;

  const MouseButtonInfoD({
    this.up = false,
    this.down = false,
    this.pressed = false,
    this.released = false,
  });
}

final class MouseInfoD {
  final Vector2D position;
  final Vector2D delta;
  final Vector2D wheel;
  final MouseButtonInfoD left;
  final MouseButtonInfoD middle;
  final MouseButtonInfoD right;
  final MouseButtonInfoD side;
  final MouseButtonInfoD extra;
  final MouseButtonInfoD forward;
  final MouseButtonInfoD back;

  MouseInfoD({
    Vector2D? position,
    Vector2D? delta,
    Vector2D? wheel,
    MouseButtonInfoD? left,
    MouseButtonInfoD? middle,
    MouseButtonInfoD? right,
    MouseButtonInfoD? side,
    MouseButtonInfoD? extra,
    MouseButtonInfoD? forward,
    MouseButtonInfoD? back,
  }) :
    position = position ?? .zero(),
    delta = delta ?? .zero(),
    wheel = wheel ?? .zero(),
    left = left ?? .new(),
    middle = middle ?? .new(),
    right = right ?? .new(),
    side = side ?? .new(),
    extra = extra ?? .new(),
    forward = forward ?? .new(),
    back = back ?? .new();
}

extension RaylibCoreDExtra on RaylibCoreD {
  MouseButtonInfoD GetMouseButtonInfo(MouseButton button) => .new(
    up: IsMouseButtonUp(button),
    down: IsMouseButtonDown(button),
    pressed: IsMouseButtonPressed(button),
    released: IsMouseButtonReleased(button),
  );

  MouseInfoD GetMouseInfo() => .new(
    position: GetMousePosition(),
    delta: GetMouseDelta(),
    wheel: GetMouseWheelMoveV(),
    left: GetMouseButtonInfo(.MOUSE_BUTTON_LEFT),
    middle: GetMouseButtonInfo(.MOUSE_BUTTON_MIDDLE),
    right: GetMouseButtonInfo(.MOUSE_BUTTON_RIGHT),
    side: GetMouseButtonInfo(.MOUSE_BUTTON_SIDE),
    extra: GetMouseButtonInfo(.MOUSE_BUTTON_EXTRA),
    forward: GetMouseButtonInfo(.MOUSE_BUTTON_FORWARD),
    back: GetMouseButtonInfo(.MOUSE_BUTTON_BACK),
  );
}
