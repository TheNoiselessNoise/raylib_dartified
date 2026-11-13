part of '../../raylib_dartified_unhinged.dart';

/// Provides convenient access to top-level [App] subsystems.
///
/// Mixed into any object that holds an [app] reference, exposing commonly
/// used subsystems as direct getters rather than requiring `app.x` everywhere.
mixin HasAppAccess<T extends App<T>> {
  T get app;

  /// Shorthand for [App.backend].
  UnhingedBackend get backend => app.backend;
  
  /// Shorthand for [App.input].
  InputSystem<T> get input => app.input;

  /// Shorthand for [App.renderer].
  Renderer<T> get renderer => app.renderer;

  /// Shorthand for [App.draw].
  Drawers<T> get draw => app.draw;

  /// Shorthand for [App.currentScene].
  Scene<T> get scene => app.currentScene;

  /// Shorthand for [App.time].
  AppTime<T> get time => app.time;

  /// Shorthand for [App.screenSize].
  Vector2 get screenSize => app.screenSize;

  /// Shorthand for [App]'s width.
  double get screenWidth => screenSize.x;

  /// Shorthand for [App]'s height.
  double get screenHeight => screenSize.y;
}