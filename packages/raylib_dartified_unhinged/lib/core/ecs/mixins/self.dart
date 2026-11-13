part of '../../raylib_dartified_unhinged.dart';

/// Provides a type-safe [self] reference and a fluent [onSelf] helper.
///
/// Mixed into ECS objects to avoid repeated `this as T` casts throughout the
/// codebase. The cast is safe as long as the concrete class declares `T` as
/// itself:
/// ```
/// class SomeClass<T extends App<T>> extends ECSBase<T> with Self<SomeClass<T>> {}
/// ```
mixin Self<T> {
  /// This object cast to [T].
  T get self => this as T;

  /// Calls [fn] with [self] and returns [self], for fluent chaining.
  T onSelf(void Function(T self) fn) {
    fn(self);
    return self;
  }
}