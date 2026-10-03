part of '../../../raylib_dartified.dart';

class RaylibLightFlatNative extends RaylibLightFlat<Raylib> {

  RaylibLightFlatNative(super.rl);

  RaylibLight get _ffi => rl.module();

  @override
  Light CreateLight(
    int type,
    Vector3 position,
    Vector3 target,
    Color color,
    Shader shader,
  ) => Light$.RefCapture(
    RaylibCaptureIds.CreateLight,
    (p) => _ffi.CreateLight(
      type,
      Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
      Vector3$.Ref2(target).asNativePointer<Vector3C>().ref,
      Color$.Ref1(color).asNativePointer<ColorC>().ref,
      Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void UpdateLightValues(
    Shader shader,
    Light light,
  ) => _ffi.UpdateLightValues(
    Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    Light$.Ref1(light).asNativePointer<LightC>().ref,
  );
}
