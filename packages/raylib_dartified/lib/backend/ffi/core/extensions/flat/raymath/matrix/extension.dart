part of '../../../../backend.dart';

final class RaylibMatrixFlatExtNative extends RaylibMatrixFlatExt {
  RaylibMatrixFlatExtNative(super.pkg);

  RaylibMatrixExt get _ffi => pkg.module();

  @override
  double MatrixDeterminant(
    Matrix mat,
  ) => _ffi.MatrixDeterminant(
    Matrix$.Ref1(mat).asNative<MatrixC>().ref,
  );

  @override
  double MatrixTrace(
    Matrix mat,
  ) => _ffi.MatrixTrace(
    Matrix$.Ref1(mat).asNative<MatrixC>().ref,
  );

  @override
  Matrix MatrixTranspose(
    Matrix mat,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixTranspose(
      Matrix$.Ref1(mat).asNative<MatrixC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixInvert(
    Matrix mat,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixInvert(
      Matrix$.Ref1(mat).asNative<MatrixC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixIdentity() => Matrix$.Extract(
    (p) => _ffi.MatrixIdentity().toDart(p.asNative()),
  );

  @override
  Matrix MatrixAdd(
    Matrix left,
    Matrix right,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixAdd(
      Matrix$.Ref1(left).asNative<MatrixC>().ref,
      Matrix$.Ref2(right).asNative<MatrixC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixSubtract(
    Matrix left,
    Matrix right,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixSubtract(
      Matrix$.Ref1(left).asNative<MatrixC>().ref,
      Matrix$.Ref2(right).asNative<MatrixC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixMultiply(
    Matrix left,
    Matrix right,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixMultiply(
      Matrix$.Ref1(left).asNative<MatrixC>().ref,
      Matrix$.Ref2(right).asNative<MatrixC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixMultiplyValue(
    Matrix left,
    double value,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixMultiplyValue(
      Matrix$.Ref1(left).asNative<MatrixC>().ref,
      value,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixTranslate(
    double x,
    double y,
    double z,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixTranslate(
      x,
      y,
      z,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixRotate(
    Vector3 axis,
    double angle,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixRotate(
      Vector3$.Ref1(axis).asNative<Vector3C>().ref,
      angle,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixRotateX(
    double angle,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixRotateX(
      angle,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixRotateY(
    double angle,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixRotateY(
      angle,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixRotateZ(
    double angle,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixRotateZ(
      angle,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixRotateXYZ(
    Vector3 angle,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixRotateXYZ(
      Vector3$.Ref1(angle).asNative<Vector3C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixRotateZYX(
    Vector3 angle,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixRotateZYX(
      Vector3$.Ref1(angle).asNative<Vector3C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixScale(
    double x,
    double y,
    double z,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixScale(
      x,
      y,
      z,
    ).toDart(p.asNative()),
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
    (p) => _ffi.MatrixFrustum(
      left,
      right,
      bottom,
      top,
      nearPlane,
      farPlane,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixPerspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixPerspective(
      fovY,
      aspect,
      nearPlane,
      farPlane,
    ).toDart(p.asNative()),
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
    (p) => _ffi.MatrixOrtho(
      left,
      right,
      bottom,
      top,
      nearPlane,
      farPlane,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixLookAt(
    Vector3 eye,
    Vector3 target,
    Vector3 up,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixLookAt(
      Vector3$.Ref1(eye).asNative<Vector3C>().ref,
      Vector3$.Ref2(target).asNative<Vector3C>().ref,
      Vector3$.Ref3(up).asNative<Vector3C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  float16 MatrixToFloatV(
    Matrix mat,
  ) => float16$.Extract(
    (p) => _ffi.MatrixToFloatV(
      Matrix$.Ref1(mat).asNative<MatrixC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Matrix MatrixCompose(
    Vector3 translation,
    Quaternion rotation,
    Vector3 scale,
  ) => Matrix$.Extract(
    (p) => _ffi.MatrixCompose(
      Vector3$.Ref1(translation).asNative<Vector3C>().ref,
      Quaternion$.Ref1(rotation).asNative<QuaternionC>().ref,
      Vector3$.Ref2(scale).asNative<Vector3C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  void MatrixDecompose(
    Matrix mat,
    XStructPtr<Vector3> translation,
    XStructPtr<Quaternion> rotation,
    XStructPtr<Vector3> scale,
  ) => _ffi.MatrixDecompose(
    Matrix$.Ref1(mat).asNative<MatrixC>().ref,
    translation.asNative(),
    rotation.asNative(),
    scale.asNative(),
  );
}
