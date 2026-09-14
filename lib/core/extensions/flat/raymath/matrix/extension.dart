part of '../../../../raylib_dartified.dart';

class RaylibMatrixExtFlat extends RaylibMatrixFlatExt<Raylib> {
  RaylibMatrixExtFlat(super.rl);

  RaylibMatrixExt get _ffi => rl.module();

  @override
  double MatrixDeterminant(
    MatrixD mat,
  ) => _ffi.MatrixDeterminant(
    rl.Temp.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
  );

  @override
  double MatrixTrace(
    MatrixD mat,
  ) => _ffi.MatrixTrace(
    rl.Temp.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
  );

  @override
  MatrixD MatrixTranspose(
    MatrixD mat,
  ) => rl.Temp.Matrix$.Extract2(
    (p) => _ffi.MatrixTranspose(
      rl.Temp.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixInvert(
    MatrixD mat,
  ) => rl.Temp.Matrix$.Extract2(
    (p) => _ffi.MatrixInvert(
      rl.Temp.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixIdentity() => rl.Temp.Matrix$.Extract1(
    (p) => _ffi.MatrixIdentity().toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixAdd(
    MatrixD left,
    MatrixD right,
  ) => rl.Temp.Matrix$.Extract3(
    (p) => _ffi.MatrixAdd(
      rl.Temp.Matrix$.Ref1(left).asNativePointer<MatrixC>().ref,
      rl.Temp.Matrix$.Ref2(right).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixSubtract(
    MatrixD left,
    MatrixD right,
  ) => rl.Temp.Matrix$.Extract3(
    (p) => _ffi.MatrixSubtract(
      rl.Temp.Matrix$.Ref1(left).asNativePointer<MatrixC>().ref,
      rl.Temp.Matrix$.Ref2(right).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixMultiply(
    MatrixD left,
    MatrixD right,
  ) => rl.Temp.Matrix$.Extract3(
    (p) => _ffi.MatrixMultiply(
      rl.Temp.Matrix$.Ref1(left).asNativePointer<MatrixC>().ref,
      rl.Temp.Matrix$.Ref2(right).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixMultiplyValue(
    MatrixD left,
    double value,
  ) => rl.Temp.Matrix$.Extract2(
    (p) => _ffi.MatrixMultiplyValue(
      rl.Temp.Matrix$.Ref1(left).asNativePointer<MatrixC>().ref,
      value,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixTranslate(
    double x,
    double y,
    double z,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => _ffi.MatrixTranslate(
      x,
      y,
      z,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixRotate(
    Vector3D axis,
    double angle,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => _ffi.MatrixRotate(
      rl.Temp.Vector3$.Ref1(axis).asNativePointer<Vector3C>().ref,
      angle,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixRotateX(
    double angle,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => _ffi.MatrixRotateX(
      angle,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixRotateY(
    double angle,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => _ffi.MatrixRotateY(
      angle,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixRotateZ(
    double angle,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => _ffi.MatrixRotateZ(
      angle,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixRotateXYZ(
    Vector3D angle,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => _ffi.MatrixRotateXYZ(
      rl.Temp.Vector3$.Ref1(angle).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixRotateZYX(
    Vector3D angle,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => _ffi.MatrixRotateZYX(
      rl.Temp.Vector3$.Ref1(angle).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixScale(
    double x,
    double y,
    double z,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => _ffi.MatrixScale(
      x,
      y,
      z,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => rl.Temp.Matrix$.Extract1(
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
  MatrixD MatrixPerspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => _ffi.MatrixPerspective(
      fovY,
      aspect,
      nearPlane,
      farPlane,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => rl.Temp.Matrix$.Extract1(
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
  MatrixD MatrixLookAt(
    Vector3D eye,
    Vector3D target,
    Vector3D up,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => _ffi.MatrixLookAt(
      rl.Temp.Vector3$.Ref1(eye).asNativePointer<Vector3C>().ref,
      rl.Temp.Vector3$.Ref2(target).asNativePointer<Vector3C>().ref,
      rl.Temp.Vector3$.Ref3(up).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  float16D MatrixToFloatV(
    MatrixD mat,
  ) => rl.Temp.float16$.Extract1(
    (p) => _ffi.MatrixToFloatV(
      rl.Temp.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD MatrixCompose(
    Vector3D translation,
    QuaternionD rotation,
    Vector3D scale,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => _ffi.MatrixCompose(
      rl.Temp.Vector3$.Ref1(translation).asNativePointer<Vector3C>().ref,
      rl.Temp.Quaternion$.Ref1(rotation).asNativePointer<QuaternionC>().ref,
      rl.Temp.Vector3$.Ref2(scale).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void MatrixDecompose(
    MatrixD mat,
    StructPointer<Vector3D> translation,
    StructPointer<QuaternionD> rotation,
    StructPointer<Vector3D> scale,
  ) => _ffi.MatrixDecompose(
    rl.Temp.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    translation.asNativePointer(),
    rotation.asNativePointer(),
    scale.asNativePointer(),
  );
}
