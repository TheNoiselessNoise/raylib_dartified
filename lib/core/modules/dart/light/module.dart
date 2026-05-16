part of '../../../raylib.dart';

class RaylibLightD extends RaylibModule implements RaylibLightModuleBase<
  // types
  ColorD,
  LightD,
  ShaderD,
  Vector3D

> {
  
  RaylibLightD(super.rl);

  @override
  LightD CreateLight(
    LightType type,
    Vector3D position,
    Vector3D target,
    ColorD color,
    ShaderD shader,
  ) => run(
    () => 'CreateLight(${type.name}, $position, $target, $color, $shader)',
    () => rl.Light.CreateLight(
      type.value,
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Vector3$.Ref2(target).ref,
      rl.Temp.Color$.Ref1(color).ref,
      rl.Temp.Shader$.Ref1(shader).ref,
    ).toD(),
  );

  @override
  void UpdateLightValues(
    ShaderD shader,
    LightD light,
  ) => run(
    () => 'UpdateLightValues($shader, $light)',
    () => rl.Temp.Light$.RefUpdate1(light,
      (pl) => rl.Light.UpdateLightValues(
        rl.Temp.Shader$.Ref1(shader).ref,
        pl.ref
      ),
    ),
  );
}