part of '../../raylib_dartified.dart';

/// Snapshot of a single mouse button's state for the current frame.
///
/// All fields default to `false`; only the relevant flags are set to `true`
/// when constructing via [RaylibCoreDart.GetMouseInfo].
final class MouseButtonInfo {
  /// `true` if the button is not held down this frame.
  final bool up;

  /// `true` if the button is held down this frame.
  final bool down;

  /// `true` if the button was just pressed this frame.
  final bool pressed;
  
  /// `true` if the button was just released this frame.
  final bool released;

  const MouseButtonInfo({
    this.up = false,
    this.down = false,
    this.pressed = false,
    this.released = false,
  });
}

/// Snapshot of the full mouse state for the current frame.
///
/// A convenience aggregate that collects position, movement, scroll, and all
/// button states into a single object. Avoids making individual Raylib calls
/// for each piece of mouse data per frame.
final class MouseInfo {

  /// Cursor position in screen space.
  final Vector2 position;

  /// Cursor movement since the last frame.
  final Vector2 delta;
  
  /// Scroll wheel movement since the last frame.
  final Vector2 wheel;
  
  /// State of the left mouse button ([MouseButton.MOUSE_BUTTON_LEFT]).
  final MouseButtonInfo btnLeft;
  
  /// State of the middle mouse button ([MouseButton.MOUSE_BUTTON_MIDDLE]).
  final MouseButtonInfo btnMiddle;
  
  /// State of the right mouse button ([MouseButton.MOUSE_BUTTON_RIGHT]).
  final MouseButtonInfo btnRight;
  
  /// State of the side mouse button ([MouseButton.MOUSE_BUTTON_SIDE]).
  final MouseButtonInfo btnSide;
  
  /// State of the extra mouse button ([MouseButton.MOUSE_BUTTON_EXTRA]).
  final MouseButtonInfo btnExtra;
  
  /// State of the forward mouse button ([MouseButton.MOUSE_BUTTON_FORWARD]).
  final MouseButtonInfo btnForward;
  
  /// State of the back mouse button ([MouseButton.MOUSE_BUTTON_BACK]).
  final MouseButtonInfo btnBack;

  MouseInfo({
    Vector2? position,
    Vector2? delta,
    Vector2? wheel,
    MouseButtonInfo? btnLeft,
    MouseButtonInfo? btnMiddle,
    MouseButtonInfo? btnRight,
    MouseButtonInfo? btnSide,
    MouseButtonInfo? btnExtra,
    MouseButtonInfo? btnForward,
    MouseButtonInfo? btnBack,
  }) :
    position = position ?? .zero(),
    delta = delta ?? .zero(),
    wheel = wheel ?? .zero(),
    btnLeft = btnLeft ?? .new(),
    btnMiddle = btnMiddle ?? .new(),
    btnRight = btnRight ?? .new(),
    btnSide = btnSide ?? .new(),
    btnExtra = btnExtra ?? .new(),
    btnForward = btnForward ?? .new(),
    btnBack = btnBack ?? .new();

  /// Returns the [MouseButtonInfo] for the given [button].
  MouseButtonInfo getButtonInfo(MouseButton button) => switch (button) {
    .MOUSE_BUTTON_LEFT => btnLeft,
    .MOUSE_BUTTON_RIGHT => btnRight,
    .MOUSE_BUTTON_MIDDLE => btnMiddle,
    .MOUSE_BUTTON_SIDE => btnSide,
    .MOUSE_BUTTON_EXTRA => btnExtra,
    .MOUSE_BUTTON_FORWARD => btnForward,
    .MOUSE_BUTTON_BACK => btnBack,
  };

  /// If the given [button] is pressed this frame.
  bool pressed(MouseButton button) => getButtonInfo(button).pressed;

  /// If the given [button] is down this frame.
  bool down(MouseButton button) => getButtonInfo(button).down;

  /// If the given [button] is released this frame.
  bool released(MouseButton button) => getButtonInfo(button).released;

  /// If the given [button] is up this frame.
  bool up(MouseButton button) => getButtonInfo(button).up;
}