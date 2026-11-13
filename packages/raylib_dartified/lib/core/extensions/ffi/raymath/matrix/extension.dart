part of '../../../../raylib_dartified.dart';

class RaylibMatrixExt extends RaylibModule<Raylib> {
  RaylibMatrixExt(super.rl);

  RaylibLookup get _lookup => rl.lookup<RaylibCore>();

  /// Compute matrix determinant
  double MatrixDeterminant(MatrixC mat)
    => _MatrixDeterminant(mat);
  late final _MatrixDeterminantPtr = _lookup<NativeFunction<Float Function(MatrixC)>>('MatrixDeterminant');
  late final _MatrixDeterminant = _MatrixDeterminantPtr.asFunction<double Function(MatrixC)>();

  /// Get the trace of the matrix (sum of the values along the diagonal)
  double MatrixTrace(MatrixC mat)
    => _MatrixTrace(mat);
  late final _MatrixTracePtr = _lookup<NativeFunction<Float Function(MatrixC)>>('MatrixTrace');
  late final _MatrixTrace = _MatrixTracePtr.asFunction<double Function(MatrixC)>();

  /// Transposes provided matrix
  MatrixC MatrixTranspose(MatrixC mat)
    => _MatrixTranspose(mat);
  late final _MatrixTransposePtr = _lookup<NativeFunction<MatrixC Function(MatrixC)>>('MatrixTranspose');
  late final _MatrixTranspose = _MatrixTransposePtr.asFunction<MatrixC Function(MatrixC)>();

  /// Invert provided matrix
  MatrixC MatrixInvert(MatrixC mat)
    => _MatrixInvert(mat);
  late final _MatrixInvertPtr = _lookup<NativeFunction<MatrixC Function(MatrixC)>>('MatrixInvert');
  late final _MatrixInvert = _MatrixInvertPtr.asFunction<MatrixC Function(MatrixC)>();

  /// Get identity matrix
  MatrixC MatrixIdentity()
    => _MatrixIdentity();
  late final _MatrixIdentityPtr = _lookup<NativeFunction<MatrixC Function()>>('MatrixIdentity');
  late final _MatrixIdentity = _MatrixIdentityPtr.asFunction<MatrixC Function()>();
  
  /// Add two matrices
  MatrixC MatrixAdd(MatrixC left, MatrixC right)
    => _MatrixAdd(left, right);
  late final _MatrixAddPtr = _lookup<NativeFunction<MatrixC Function(MatrixC, MatrixC)>>('MatrixAdd');
  late final _MatrixAdd = _MatrixAddPtr.asFunction<MatrixC Function(MatrixC, MatrixC)>();

  /// Subtract two matrices (left - right)
  MatrixC MatrixSubtract(MatrixC left, MatrixC right)
    => _MatrixSubtract(left, right);
  late final _MatrixSubtractPtr = _lookup<NativeFunction<MatrixC Function(MatrixC, MatrixC)>>('MatrixSubtract');
  late final _MatrixSubtract = _MatrixSubtractPtr.asFunction<MatrixC Function(MatrixC, MatrixC)>();

  /// Get two matrix multiplication
  /// 
  /// NOTE: When multiplying matrices... the order matters!
  MatrixC MatrixMultiply(MatrixC left, MatrixC right)
    => _MatrixMultiply(left, right);
  late final _MatrixMultiplyPtr = _lookup<NativeFunction<MatrixC Function(MatrixC, MatrixC)>>('MatrixMultiply');
  late final _MatrixMultiply = _MatrixMultiplyPtr.asFunction<MatrixC Function(MatrixC, MatrixC)>();

  /// Multiply matrix components by value
  MatrixC MatrixMultiplyValue(MatrixC left, double value)
    => _MatrixMultiplyValue(left, value);
  late final _MatrixMultiplyValuePtr = _lookup<NativeFunction<MatrixC Function(MatrixC, Float)>>('MatrixMultiplyValue');
  late final _MatrixMultiplyValue = _MatrixMultiplyValuePtr.asFunction<MatrixC Function(MatrixC, double)>();

  /// Get translation matrix
  MatrixC MatrixTranslate(double x, double y, double z)
    => _MatrixTranslate(x, y, z);
  late final _MatrixTranslatePtr = _lookup<NativeFunction<MatrixC Function(Float, Float, Float)>>('MatrixTranslate');
  late final _MatrixTranslate = _MatrixTranslatePtr.asFunction<MatrixC Function(double, double, double)>();

  /// Create rotation matrix from axis and angle
  /// 
  /// NOTE: Angle should be provided in radians
  MatrixC MatrixRotate(Vector3C axis, double angle)
    => _MatrixRotate(axis, angle);
  late final _MatrixRotatePtr = _lookup<NativeFunction<MatrixC Function(Vector3C, Float)>>('MatrixRotate');
  late final _MatrixRotate = _MatrixRotatePtr.asFunction<MatrixC Function(Vector3C, double)>();

  /// Get x-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  MatrixC MatrixRotateX(double angle)
    => _MatrixRotateX(angle);
  late final _MatrixRotateXPtr = _lookup<NativeFunction<MatrixC Function(Float)>>('MatrixRotateX');
  late final _MatrixRotateX = _MatrixRotateXPtr.asFunction<MatrixC Function(double)>();

  /// Get y-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  MatrixC MatrixRotateY(double angle)
    => _MatrixRotateY(angle);
  late final _MatrixRotateYPtr = _lookup<NativeFunction<MatrixC Function(Float)>>('MatrixRotateY');
  late final _MatrixRotateY = _MatrixRotateYPtr.asFunction<MatrixC Function(double)>();

  /// Get z-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  MatrixC MatrixRotateZ(double angle)
    => _MatrixRotateZ(angle);
  late final _MatrixRotateZPtr = _lookup<NativeFunction<MatrixC Function(Float)>>('MatrixRotateZ');
  late final _MatrixRotateZ = _MatrixRotateZPtr.asFunction<MatrixC Function(double)>();

  /// Get xyz-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  MatrixC MatrixRotateXYZ(Vector3C angle)
    => _MatrixRotateXYZ(angle);
  late final _MatrixRotateXYZPtr = _lookup<NativeFunction<MatrixC Function(Vector3C)>>('MatrixRotateXYZ');
  late final _MatrixRotateXYZ = _MatrixRotateXYZPtr.asFunction<MatrixC Function(Vector3C)>();

  /// Get zyx-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  MatrixC MatrixRotateZYX(Vector3C angle)
    => _MatrixRotateZYX(angle);
  late final _MatrixRotateZYXPtr = _lookup<NativeFunction<MatrixC Function(Vector3C)>>('MatrixRotateZYX');
  late final _MatrixRotateZYX = _MatrixRotateZYXPtr.asFunction<MatrixC Function(Vector3C)>();

  /// Get scaling matrix
  MatrixC MatrixScale(double x, double y, double z)
    => _MatrixScale(x, y, z);
  late final _MatrixScalePtr = _lookup<NativeFunction<MatrixC Function(Float, Float, Float)>>('MatrixScale');
  late final _MatrixScale = _MatrixScalePtr.asFunction<MatrixC Function(double, double, double)>();

  /// Get perspective projection matrix
  MatrixC MatrixFrustum(double left, double right, double bottom, double top, double nearPlane, double farPlane)
    => _MatrixFrustum(left, right, bottom, top, nearPlane, farPlane);
  late final _MatrixFrustumPtr = _lookup<NativeFunction<MatrixC Function(Double, Double, Double, Double, Double, Double)>>('MatrixFrustum');
  late final _MatrixFrustum = _MatrixFrustumPtr.asFunction<MatrixC Function(double, double, double, double, double, double)>();

  /// Get perspective projection matrix
  ///
  /// NOTE: Fovy angle must be provided in radians
  MatrixC MatrixPerspective(double fovY, double aspect, double nearPlane, double farPlane)
    => _MatrixPerspective(fovY, aspect, nearPlane, farPlane);
  late final _MatrixPerspectivePtr = _lookup<NativeFunction<MatrixC Function(Double, Double, Double, Double)>>('MatrixPerspective');
  late final _MatrixPerspective = _MatrixPerspectivePtr.asFunction<MatrixC Function(double, double, double, double)>();

  /// Get orthographic projection matrix
  MatrixC MatrixOrtho(double left, double right, double bottom, double top, double nearPlane, double farPlane)
    => _MatrixOrtho(left, right, bottom, top, nearPlane, farPlane);
  late final _MatrixOrthoPtr = _lookup<NativeFunction<MatrixC Function(Double, Double, Double, Double, Double, Double)>>('MatrixOrtho');
  late final _MatrixOrtho = _MatrixOrthoPtr.asFunction<MatrixC Function(double, double, double, double, double, double)>();

  /// Get camera look-at matrix (view matrix)
  MatrixC MatrixLookAt(Vector3C eye, Vector3C target, Vector3C up)
    => _MatrixLookAt(eye, target, up);
  late final _MatrixLookAtPtr = _lookup<NativeFunction<MatrixC Function(Vector3C, Vector3C, Vector3C)>>('MatrixLookAt');
  late final _MatrixLookAt = _MatrixLookAtPtr.asFunction<MatrixC Function(Vector3C, Vector3C, Vector3C)>();

  /// Get float array of matrix data
  float16C MatrixToFloatV(MatrixC mat)
    => _MatrixToFloatV(mat);
  late final _MatrixToFloatVPtr = _lookup<NativeFunction<float16C Function(MatrixC)>>('MatrixToFloatV');
  late final _MatrixToFloatV = _MatrixToFloatVPtr.asFunction<float16C Function(MatrixC)>();

  /// Compose a transformation matrix from rotational, translational and scaling components
  MatrixC MatrixCompose(Vector3C translation, QuaternionC rotation, Vector3C scale)
    => _MatrixCompose(translation, rotation, scale);
  late final _MatrixComposePtr = _lookup<NativeFunction<MatrixC Function(Vector3C, QuaternionC, Vector3C)>>('MatrixCompose');
  late final _MatrixCompose = _MatrixComposePtr.asFunction<MatrixC Function(Vector3C, QuaternionC, Vector3C)>();

  /// Decompose a transformation matrix into its rotational, translational and scaling components and remove shear
  void MatrixDecompose(MatrixC mat, Pointer<Vector3C> translation, Pointer<QuaternionC> rotation, Pointer<Vector3C> scale)
    => _MatrixDecompose(mat, translation, rotation, scale);
  late final _MatrixDecomposePtr = _lookup<NativeFunction<Void Function(MatrixC, Pointer<Vector3C>, Pointer<QuaternionC>, Pointer<Vector3C>)>>('MatrixDecompose');
  late final _MatrixDecompose = _MatrixDecomposePtr.asFunction<void Function(MatrixC, Pointer<Vector3C>, Pointer<QuaternionC>, Pointer<Vector3C>)>();
}
