part of '../../../raylib_dartified.dart';

class RaylibLightFlat extends RaylibLightFlatModule<Raylib> {

  RaylibLightFlat(super.rl);

  @override
  LightD CreateLight(
    int type,
    Vector3D position,
    Vector3D target,
    ColorD color,
    ShaderD shader,
  ) => rl.Temp.Light$.RefCapture(
    RaylibCaptureIds.CreateLight,
    (p) => rl.Light.CreateLight(
      type,
      rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
      rl.Temp.Vector3$.Ref2(target).asNativePointer<Vector3C>().ref,
      rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
      rl.Temp.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void UpdateLightValues(
    ShaderD shader,
    LightD light,
  ) => rl.Light.UpdateLightValues(
    rl.Temp.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    rl.Temp.Light$.Ref1(light).asNativePointer<LightC>().ref,
  );
}
