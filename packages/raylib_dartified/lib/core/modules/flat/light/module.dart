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
      Vector3$.Ref1(position).asNative<Vector3C>().ref,
      Vector3$.Ref2(target).asNative<Vector3C>().ref,
      Color$.Ref1(color).asNative<ColorC>().ref,
      Shader$.Ref1(shader).asNative<ShaderC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  void UpdateLightValues(
    Shader shader,
    Light light,
  ) => _ffi.UpdateLightValues(
    Shader$.Ref1(shader).asNative<ShaderC>().ref,
    Light$.Ref1(light).asNative<LightC>().ref,
  );
}
