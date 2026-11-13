part of '../../raylib_dartified_base.dart';

/// Backend-agnostic Raylib Light module.
final class RaylibLightDart<R extends RaylibBase> extends RaylibModule<R> with RaylibLightModuleExtras<R> {

  final _debugLabels = _RaylibLightDartDebugLabels();

  RaylibLightDart(super.rl);

  RaylibLightFlat get _flat => rl.module();

  /// Create a light and get its shader locations
  Light CreateLight(
    LightType type,
    Vector3 position,
    Vector3 target,
    Color color,
    Shader shader,
  ) => debugRun(
    () => _debugLabels.CreateLight(type, position, target, color, shader),
    () => _flat.CreateLight(
      type.value,
      position,
      target,
      color,
      shader,
    ),
  );

  /// Send light properties to shader
  void UpdateLightValues(
    Shader shader,
    Light light,
  ) => debugRun(
    () => _debugLabels.UpdateLightValues(shader, light),
    () => _flat.UpdateLightValues(
      shader,
      light,
    ),
  );

}
