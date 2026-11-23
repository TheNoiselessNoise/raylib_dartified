part of '../../../backend.dart';

final class RaylibLightFlatWeb extends RaylibLightFlat {

  RaylibLightFlatWeb(super.pkg);

  RaylibLight get _wasm => pkg.module();

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
