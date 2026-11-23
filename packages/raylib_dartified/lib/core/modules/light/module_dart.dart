part of '../../raylib_dartified.dart';

/// Backend-agnostic Raylib Light module.
final class RaylibLightDart extends XPackageModule<Raylib> with RaylibLightModuleExtras {

  RaylibLightDart(super.pkg);

  RaylibLightFlat get _flat => pkg.module();

  /// Create a light and get its shader locations
  Light CreateLight(
    LightType type,
    Vector3 position,
    Vector3 target,
    Color color,
    Shader shader,
  ) => _flat.CreateLight(
    type.value,
    position,
    target,
    color,
    shader,
  );

  /// Send light properties to shader
  void UpdateLightValues(
    Shader shader,
    Light light,
  ) => _flat.UpdateLightValues(
    shader,
    light,
  );

}
