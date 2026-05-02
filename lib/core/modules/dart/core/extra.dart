part of '../../../raylib.dart';

final class FMouseButtonInfoD {
  final bool up;
  final bool down;
  final bool pressed;
  final bool released;

  const FMouseButtonInfoD({
    this.up = false,
    this.down = false,
    this.pressed = false,
    this.released = false,
  });
}

final class FMouseInfoD {
  final Vector2D position;
  final Vector2D delta;
  final Vector2D wheel;
  final FMouseButtonInfoD left;
  final FMouseButtonInfoD middle;
  final FMouseButtonInfoD right;
  final FMouseButtonInfoD side;
  final FMouseButtonInfoD extra;
  final FMouseButtonInfoD forward;
  final FMouseButtonInfoD back;

  FMouseInfoD({
    Vector2D? position,
    Vector2D? delta,
    Vector2D? wheel,
    FMouseButtonInfoD? left,
    FMouseButtonInfoD? middle,
    FMouseButtonInfoD? right,
    FMouseButtonInfoD? side,
    FMouseButtonInfoD? extra,
    FMouseButtonInfoD? forward,
    FMouseButtonInfoD? back,
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
  FMouseButtonInfoD GetMouseButtonInfo(MouseButton button) => .new(
    up: IsMouseButtonUp(button),
    down: IsMouseButtonDown(button),
    pressed: IsMouseButtonPressed(button),
    released: IsMouseButtonReleased(button),
  );

  FMouseInfoD GetMouseInfo() => .new(
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
