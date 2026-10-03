part of '../../../../raylib_dartified.dart';

class RaylibMatrixExtFlatNative extends RaylibMatrixFlatExt<Raylib> {
  RaylibMatrixExtFlatNative(super.rl);

  RaylibMatrixExt get _ffi => rl.module();

  @override
  double MatrixDeterminant(
    Matrix mat,
  ) => _ffi.MatrixDeterminant(
    Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
  );

  @override
  double MatrixTrace(
    Matrix mat,
  ) => _ffi.MatrixTrace(
    Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
  );

  @override
  Matrix MatrixTranspose(
    Matrix mat,
  ) => Matrix$.Extract2(
    (p) => _ffi.MatrixTranspose(
      Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixInvert(
    Matrix mat,
  ) => Matrix$.Extract2(
    (p) => _ffi.MatrixInvert(
      Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixIdentity() => Matrix$.Extract1(
    (p) => _ffi.MatrixIdentity().toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixAdd(
    Matrix left,
    Matrix right,
  ) => Matrix$.Extract3(
    (p) => _ffi.MatrixAdd(
      Matrix$.Ref1(left).asNativePointer<MatrixC>().ref,
      Matrix$.Ref2(right).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixSubtract(
    Matrix left,
    Matrix right,
  ) => Matrix$.Extract3(
    (p) => _ffi.MatrixSubtract(
      Matrix$.Ref1(left).asNativePointer<MatrixC>().ref,
      Matrix$.Ref2(right).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixMultiply(
    Matrix left,
    Matrix right,
  ) => Matrix$.Extract3(
    (p) => _ffi.MatrixMultiply(
      Matrix$.Ref1(left).asNativePointer<MatrixC>().ref,
      Matrix$.Ref2(right).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixMultiplyValue(
    Matrix left,
    double value,
  ) => Matrix$.Extract2(
    (p) => _ffi.MatrixMultiplyValue(
      Matrix$.Ref1(left).asNativePointer<MatrixC>().ref,
      value,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixTranslate(
    double x,
    double y,
    double z,
  ) => Matrix$.Extract1(
    (p) => _ffi.MatrixTranslate(
      x,
      y,
      z,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixRotate(
    Vector3 axis,
    double angle,
  ) => Matrix$.Extract1(
    (p) => _ffi.MatrixRotate(
      Vector3$.Ref1(axis).asNativePointer<Vector3C>().ref,
      angle,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixRotateX(
    double angle,
  ) => Matrix$.Extract1(
    (p) => _ffi.MatrixRotateX(
      angle,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixRotateY(
    double angle,
  ) => Matrix$.Extract1(
    (p) => _ffi.MatrixRotateY(
      angle,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixRotateZ(
    double angle,
  ) => Matrix$.Extract1(
    (p) => _ffi.MatrixRotateZ(
      angle,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixRotateXYZ(
    Vector3 angle,
  ) => Matrix$.Extract1(
    (p) => _ffi.MatrixRotateXYZ(
      Vector3$.Ref1(angle).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixRotateZYX(
    Vector3 angle,
  ) => Matrix$.Extract1(
    (p) => _ffi.MatrixRotateZYX(
      Vector3$.Ref1(angle).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixScale(
    double x,
    double y,
    double z,
  ) => Matrix$.Extract1(
    (p) => _ffi.MatrixScale(
      x,
      y,
      z,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => Matrix$.Extract1(
    (p) => _ffi.MatrixFrustum(
      left,
      right,
      bottom,
      top,
      nearPlane,
      farPlane,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixPerspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  ) => Matrix$.Extract1(
    (p) => _ffi.MatrixPerspective(
      fovY,
      aspect,
      nearPlane,
      farPlane,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => Matrix$.Extract1(
    (p) => _ffi.MatrixOrtho(
      left,
      right,
      bottom,
      top,
      nearPlane,
      farPlane,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixLookAt(
    Vector3 eye,
    Vector3 target,
    Vector3 up,
  ) => Matrix$.Extract1(
    (p) => _ffi.MatrixLookAt(
      Vector3$.Ref1(eye).asNativePointer<Vector3C>().ref,
      Vector3$.Ref2(target).asNativePointer<Vector3C>().ref,
      Vector3$.Ref3(up).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  float16 MatrixToFloatV(
    Matrix mat,
  ) => float16$.Extract1(
    (p) => _ffi.MatrixToFloatV(
      Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix MatrixCompose(
    Vector3 translation,
    Quaternion rotation,
    Vector3 scale,
  ) => Matrix$.Extract1(
    (p) => _ffi.MatrixCompose(
      Vector3$.Ref1(translation).asNativePointer<Vector3C>().ref,
      Quaternion$.Ref1(rotation).asNativePointer<QuaternionC>().ref,
      Vector3$.Ref2(scale).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void MatrixDecompose(
    Matrix mat,
    StructPointer<Vector3> translation,
    StructPointer<Quaternion> rotation,
    StructPointer<Vector3> scale,
  ) => _ffi.MatrixDecompose(
    Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    translation.asNativePointer(),
    rotation.asNativePointer(),
    scale.asNativePointer(),
  );
}
