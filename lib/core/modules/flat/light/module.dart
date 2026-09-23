part of '../../../raylib_dartified.dart';

class RaylibLightFlatNative extends RaylibLightFlat<Raylib> {

  RaylibLightFlatNative(super.rl);

  RaylibLight get _ffi => rl.module();

  @override
  LightD CreateLight(
    int type,
    Vector3D position,
    Vector3D target,
    ColorD color,
    ShaderD shader,
  ) => $.Light$.RefCapture(
    RaylibCaptureIds.CreateLight,
    (p) => _ffi.CreateLight(
      type,
      $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(target).asNativePointer<Vector3C>().ref,
      $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
      $.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void UpdateLightValues(
    ShaderD shader,
    LightD light,
  ) => _ffi.UpdateLightValues(
    $.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    $.Light$.Ref1(light).asNativePointer<LightC>().ref,
  );
}
