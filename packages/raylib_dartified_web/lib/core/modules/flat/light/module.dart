part of '../../../raylib_dartified_web.dart';

class RaylibLightFlatWeb extends RaylibLightFlat<Raylib> {

  RaylibLightFlatWeb(super.rl);

  RaylibLight get _wasm => rl.module();

  @override
  Light CreateLight(
    int type,
    Vector3 position,
    Vector3 target,
    Color color,
    Shader shader,
  ) => Light$.RefCapture(
    RaylibCaptureIds.CreateLight,
    (p) => _wasm.CreateLight(
      p.toJS,
      type.toJS,
      Vector3$.Ref1(position).toJS,
      Vector3$.Ref2(target).toJS,
      Color$.Ref1(color).toJS,
      Shader$.Ref1(shader).toJS,
    ),
  );

  @override
  void UpdateLightValues(
    Shader shader,
    Light light,
  ) => _wasm.UpdateLightValues(
    Shader$.Ref1(shader).toJS,
    Light$.Ref1(light).toJS,
  );
}
