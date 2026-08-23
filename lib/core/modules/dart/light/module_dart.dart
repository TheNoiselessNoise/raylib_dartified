part of '../../../raylib_dartified.dart';

class RaylibLightD extends RaylibLightModule<Raylib> {
  
  RaylibLightD(super.rl);

  @override
  LightD CreateLight(
    LightType type,
    Vector3D position,
    Vector3D target,
    ColorD color,
    ShaderD shader,
  ) => run(
    () => RaylibDebugLabels.CreateLight(type, position, target, color, shader),
    () => rl.LightFlat.CreateLight(
      type.value,
      position,
      target,
      color,
      shader,
    ),
  );

  @override
  void UpdateLightValues(
    ShaderD shader,
    LightD light,
  ) => run(
    () => RaylibDebugLabels.UpdateLightValues(shader, light),
    () => rl.LightFlat.UpdateLightValues(
      shader,
      light,
    ),
  );
}