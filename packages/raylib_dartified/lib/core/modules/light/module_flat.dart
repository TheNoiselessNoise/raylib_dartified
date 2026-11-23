part of '../../raylib_dartified.dart';

/// Re-exports [RaylibLightConstants] values as instance members,
/// so constants are accessible directly on the module without a class qualifier.
mixin RaylibLightModuleExtras on XPackageModule<Raylib> {

  /// See [RaylibLightConstants.MAX_LIGHTS].
  int get MAX_LIGHTS => RaylibLightConstants.MAX_LIGHTS;

}

/// Backend-agnostic contract for the Raylib Light module.
///
/// Concrete platform implementations extend this to provide
/// the full API surface across different backends.
abstract class RaylibLightFlat extends XPackageModule<Raylib> with RaylibLightModuleExtras {

  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = _RaylibLightDartCaptureIds();

  RaylibLightFlat(super.pkg);

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
