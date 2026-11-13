part of '../../raylib_dartified_base.dart';

/// Re-exports [RaylibLightConstants] values as instance members,
/// so constants are accessible directly on the module without a class qualifier.
mixin RaylibLightModuleExtras<R extends RaylibBase> on RaylibModule<R> {

  /// See [RaylibLightConstants.MAX_LIGHTS].
  int get MAX_LIGHTS => RaylibLightConstants.MAX_LIGHTS;

}

/// Backend-agnostic contract for the Raylib Light module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibLightFlat<R extends RaylibBase> extends RaylibModule<R> with RaylibLightModuleExtras<R> {

  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = _RaylibLightDartCaptureIds();

  RaylibLightFlat(super.rl);

  /// Create a light and get its shader locations
  Light CreateLight(
    int type,
    Vector3 position,
    Vector3 target,
    Color color,
    Shader shader,
  );

  /// Send light properties to shader
  void UpdateLightValues(
    Shader shader,
    Light light,
  );

}
