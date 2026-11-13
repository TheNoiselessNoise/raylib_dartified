import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibMatrixExtDart get _module => RaylibBase.instance.module();

/// See [RaylibMatrixExtDart.MatrixDeterminant].
double MatrixDeterminant(
  Matrix mat,
) => _module.MatrixDeterminant(mat);

/// See [RaylibMatrixExtDart.MatrixTrace].
double MatrixTrace(
  Matrix mat,
) => _module.MatrixTrace(mat);

/// See [RaylibMatrixExtDart.MatrixTranspose].
Matrix MatrixTranspose(
  Matrix mat,
) => _module.MatrixTranspose(mat);

/// See [RaylibMatrixExtDart.MatrixInvert].
Matrix MatrixInvert(
  Matrix mat,
) => _module.MatrixInvert(mat);

/// See [RaylibMatrixExtDart.MatrixIdentity].
Matrix MatrixIdentity() => _module.MatrixIdentity();

/// See [RaylibMatrixExtDart.MatrixAdd].
Matrix MatrixAdd(
  Matrix left,
  Matrix right,
) => _module.MatrixAdd(left, right);

/// See [RaylibMatrixExtDart.MatrixSubtract].
Matrix MatrixSubtract(
  Matrix left,
  Matrix right,
) => _module.MatrixSubtract(left, right);

/// See [RaylibMatrixExtDart.MatrixMultiply].
Matrix MatrixMultiply(
  Matrix left,
  Matrix right,
) => _module.MatrixMultiply(left, right);

/// See [RaylibMatrixExtDart.MatrixMultiplyValue].
Matrix MatrixMultiplyValue(
  Matrix left,
  double value,
) => _module.MatrixMultiplyValue(left, value);

/// See [RaylibMatrixExtDart.MatrixTranslate].
Matrix MatrixTranslate(
  double x,
  double y,
  double z,
) => _module.MatrixTranslate(x, y, z);

/// See [RaylibMatrixExtDart.MatrixRotate].
Matrix MatrixRotate(
  Vector3 axis,
  double angle,
) => _module.MatrixRotate(axis, angle);

/// See [RaylibMatrixExtDart.MatrixRotateX].
Matrix MatrixRotateX(
  double angle,
) => _module.MatrixRotateX(angle);

/// See [RaylibMatrixExtDart.MatrixRotateY].
Matrix MatrixRotateY(
  double angle,
) => _module.MatrixRotateY(angle);

/// See [RaylibMatrixExtDart.MatrixRotateZ].
Matrix MatrixRotateZ(
  double angle,
) => _module.MatrixRotateZ(angle);

/// See [RaylibMatrixExtDart.MatrixRotateXYZ].
Matrix MatrixRotateXYZ(
  Vector3 angle,
) => _module.MatrixRotateXYZ(angle);

/// See [RaylibMatrixExtDart.MatrixRotateZYX].
Matrix MatrixRotateZYX(
  Vector3 angle,
) => _module.MatrixRotateZYX(angle);

/// See [RaylibMatrixExtDart.MatrixScale].
Matrix MatrixScale(
  double x,
  double y,
  double z,
) => _module.MatrixScale(x, y, z);

/// See [RaylibMatrixExtDart.MatrixFrustum].
Matrix MatrixFrustum(
  double left,
  double right,
  double bottom,
  double top,
  double nearPlane,
  double farPlane,
) => _module.MatrixFrustum(left, right, bottom, top, nearPlane, farPlane);

/// See [RaylibMatrixExtDart.MatrixPerspective].
Matrix MatrixPerspective(
  double fovY,
  double aspect,
  double nearPlane,
  double farPlane,
) => _module.MatrixPerspective(fovY, aspect, nearPlane, farPlane);

/// See [RaylibMatrixExtDart.MatrixOrtho].
Matrix MatrixOrtho(
  double left,
  double right,
  double bottom,
  double top,
  double nearPlane,
  double farPlane,
) => _module.MatrixOrtho(left, right, bottom, top, nearPlane, farPlane);

/// See [RaylibMatrixExtDart.MatrixLookAt].
Matrix MatrixLookAt(
  Vector3 eye,
  Vector3 target,
  Vector3 up,
) => _module.MatrixLookAt(eye, target, up);

/// See [RaylibMatrixExtDart.MatrixToFloatV].
float16 MatrixToFloatV(
  Matrix mat,
) => _module.MatrixToFloatV(mat);

/// See [RaylibMatrixExtDart.MatrixCompose].
Matrix MatrixCompose(
  Vector3 translation,
  Quaternion rotation,
  Vector3 scale,
) => _module.MatrixCompose(translation, rotation, scale);

/// See [RaylibMatrixExtDart.MatrixDecompose].
(Vector3 translation, Quaternion rotation, Vector3 scale) MatrixDecompose(
  Matrix mat,
) => _module.MatrixDecompose(mat);