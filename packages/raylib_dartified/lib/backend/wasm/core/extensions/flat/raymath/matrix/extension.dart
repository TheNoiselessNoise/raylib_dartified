part of '../../../../backend.dart';

final class RaylibMatrixFlatExtWeb extends RaylibMatrixFlatExt {
  RaylibMatrixFlatExtWeb(super.pkg);

  RaylibMatrixExt get _wasm => pkg.module();

  @override
  double MatrixDeterminant(
    Matrix mat,
  ) => _wasm.MatrixDeterminant(
    Matrix$.Ref1(mat).toJS,
  );

  @override
  double MatrixTrace(
    Matrix mat,
  ) => _wasm.MatrixTrace(
    Matrix$.Ref1(mat).toJS,
  );

  @override
  Matrix MatrixTranspose(
    Matrix mat,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixTranspose(
      p.toJS,
      Matrix$.Ref1(mat).toJS,
    ),
  );

  @override
  Matrix MatrixInvert(
    Matrix mat,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixInvert(
      p.toJS,
      Matrix$.Ref1(mat).toJS,
    ),
  );

  @override
  Matrix MatrixIdentity() => Matrix$.Extract(
    (p) => _wasm.MatrixIdentity(
      p.toJS,
    ),
  );

  @override
  Matrix MatrixAdd(
    Matrix left,
    Matrix right,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixAdd(
      p.toJS,
      Matrix$.Ref1(left).toJS,
      Matrix$.Ref2(right).toJS,
    ),
  );

  @override
  Matrix MatrixSubtract(
    Matrix left,
    Matrix right,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixSubtract(
      p.toJS,
      Matrix$.Ref1(left).toJS,
      Matrix$.Ref2(right).toJS,
    ),
  );

  @override
  Matrix MatrixMultiply(
    Matrix left,
    Matrix right,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixMultiply(
      p.toJS,
      Matrix$.Ref1(left).toJS,
      Matrix$.Ref2(right).toJS,
    ),
  );

  @override
  Matrix MatrixMultiplyValue(
    Matrix left,
    double value,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixMultiplyValue(
      p.toJS,
      Matrix$.Ref1(left).toJS,
      value.toJS,
    ),
  );

  @override
  Matrix MatrixTranslate(
    double x,
    double y,
    double z,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixTranslate(
      p.toJS,
      x.toJS,
      y.toJS,
      z.toJS,
    ),
  );

  @override
  Matrix MatrixRotate(
    Vector3 axis,
    double angle,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixRotate(
      p.toJS,
      Vector3$.Ref1(axis).toJS,
      angle.toJS,
    ),
  );

  @override
  Matrix MatrixRotateX(
    double angle,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixRotateX(
      p.toJS,
      angle.toJS,
    ),
  );

  @override
  Matrix MatrixRotateY(
    double angle,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixRotateY(
      p.toJS,
      angle.toJS,
    ),
  );

  @override
  Matrix MatrixRotateZ(
    double angle,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixRotateZ(
      p.toJS,
      angle.toJS,
    ),
  );

  @override
  Matrix MatrixRotateXYZ(
    Vector3 angle,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixRotateXYZ(
      p.toJS,
      Vector3$.Ref1(angle).toJS,
    ),
  );

  @override
  Matrix MatrixRotateZYX(
    Vector3 angle,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixRotateZYX(
      p.toJS,
      Vector3$.Ref1(angle).toJS,
    ),
  );

  @override
  Matrix MatrixScale(
    double x,
    double y,
    double z,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixScale(
      p.toJS,
      x.toJS,
      y.toJS,
      z.toJS,
    ),
  );

  @override
  Matrix MatrixFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixFrustum(
      p.toJS,
      left.toJS,
      right.toJS,
      bottom.toJS,
      top.toJS,
      nearPlane.toJS,
      farPlane.toJS,
    ),
  );

  @override
  Matrix MatrixPerspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixPerspective(
      p.toJS,
      fovY.toJS,
      aspect.toJS,
      nearPlane.toJS,
      farPlane.toJS,
    ),
  );

  @override
  Matrix MatrixOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixOrtho(
      p.toJS,
      left.toJS,
      right.toJS,
      bottom.toJS,
      top.toJS,
      nearPlane.toJS,
      farPlane.toJS,
    ),
  );

  @override
  Matrix MatrixLookAt(
    Vector3 eye,
    Vector3 target,
    Vector3 up,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixLookAt(
      p.toJS,
      Vector3$.Ref1(eye).toJS,
      Vector3$.Ref2(target).toJS,
      Vector3$.Ref3(up).toJS,
    ),
  );

  @override
  float16 MatrixToFloatV(
    Matrix mat,
  ) => float16$.Extract(
    (p) => _wasm.MatrixToFloatV(
      p.toJS,
      Matrix$.Ref1(mat).toJS,
    ),
  );

  @override
  Matrix MatrixCompose(
    Vector3 translation,
    Quaternion rotation,
    Vector3 scale,
  ) => Matrix$.Extract(
    (p) => _wasm.MatrixCompose(
      p.toJS,
      Vector3$.Ref1(translation).toJS,
      Quaternion$.Ref1(rotation).toJS,
      Vector3$.Ref2(scale).toJS,
    ),
  );

  @override
  void MatrixDecompose(
    Matrix mat,
    XStructPtr<Vector3> translation,
    XStructPtr<Quaternion> rotation,
    XStructPtr<Vector3> scale,
  ) => _wasm.MatrixDecompose(
    Matrix$.Ref1(mat).toJS,
    translation.toJS,
    rotation.toJS,
    scale.toJS,
  );
}
