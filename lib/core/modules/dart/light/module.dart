part of '../../../raylib_dartified.dart';

class RaylibLightD extends RaylibLightModuleBase<
  Raylib,
  
  // types
  ColorD,
  LightD,
  MatrixD,
  QuaternionD,
  ShaderD,
  Vector3D,
  Vector4D

> {
  
  RaylibLightD(super.rl);

  // NOTE: requirements
  NativeStructAlloc<ColorC, ColorD> get _Color$ => rl.Temp.getAllocatorOrThrow();
  NativeStructAlloc<LightC, LightD> get _Light$ => rl.Temp.getAllocatorOrThrow();
  NativeStructAlloc<ShaderC, ShaderD> get _Shader$ => rl.Temp.getAllocatorOrThrow();
  NativeStructAlloc<Vector3C, Vector3D> get _Vector3$ => rl.Temp.getAllocatorOrThrow();

  @override
  LightD CreateLight(
    LightType type,
    Vector3D position,
    Vector3D target,
    ColorD color,
    ShaderD shader,
  ) => run(
    () => RaylibDebugLabels.CreateLight(type, position, target, color, shader),
    () => rl.Light.CreateLight(
      type.value,
      _Vector3$.Ref1(position).ref,
      _Vector3$.Ref2(target).ref,
      _Color$.Ref1(color).ref,
      _Shader$.Ref1(shader).ref,
    ).toD(),
  );

  @override
  void UpdateLightValues(
    ShaderD shader,
    LightD light,
  ) => run(
    () => RaylibDebugLabels.UpdateLightValues(shader, light),
    () => _Light$.RefUpdate1(light,
      (pl) => rl.Light.UpdateLightValues(
        _Shader$.Ref1(shader).ref,
        pl.ref
      ),
    ),
  );
}