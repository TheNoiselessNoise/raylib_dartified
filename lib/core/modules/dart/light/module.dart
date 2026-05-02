part of '../../../raylib.dart';

class RaylibLightD extends RaylibModuleD {
  RaylibLightD(super.lib);

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
      _refVector31(position).ref,
      _refVector32(target).ref,
      _refColor1(color).ref,
      _refShader1(shader).ref,
    ).toD(),
  );

  void UpdateLightValues(
    ShaderD shader,
    LightD light,
  ) => run(
    () => 'UpdateLightValues($shader, $light)',
    () => _refUpdateLight(light,
      (pl) => rl.Light.UpdateLightValues(
        _refShader1(shader).ref,
        pl.ref
      ),
    ),
  );
}