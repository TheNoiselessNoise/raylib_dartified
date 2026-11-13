import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibMatrixFlatExt get _module => RaylibBase.instance.module();

/// See [RaylibMatrixFlatExt.MatrixDeterminant].
double MatrixDeterminant(
  Matrix mat,
) => _module.MatrixDeterminant(mat);

/// See [RaylibMatrixFlatExt.MatrixTrace].
double MatrixTrace(
  Matrix mat,
) => _module.MatrixTrace(mat);

/// See [RaylibMatrixFlatExt.MatrixTranspose].
Matrix MatrixTranspose(
  Matrix mat,
) => _module.MatrixTranspose(mat);

/// See [RaylibMatrixFlatExt.MatrixInvert].
Matrix MatrixInvert(
  Matrix mat,
) => _module.MatrixInvert(mat);

/// See [RaylibMatrixFlatExt.MatrixIdentity].
Matrix MatrixIdentity() => _module.MatrixIdentity();

/// See [RaylibMatrixFlatExt.MatrixAdd].
Matrix MatrixAdd(
  Matrix left,
  Matrix right,
) => _module.MatrixAdd(left, right);

/// See [RaylibMatrixFlatExt.MatrixSubtract].
Matrix MatrixSubtract(
  Matrix left,
  Matrix right,
) => _module.MatrixSubtract(left, right);

/// See [RaylibMatrixFlatExt.MatrixMultiply].
Matrix MatrixMultiply(
  Matrix left,
  Matrix right,
) => _module.MatrixMultiply(left, right);

/// See [RaylibMatrixFlatExt.MatrixMultiplyValue].
Matrix MatrixMultiplyValue(
  Matrix left,
  double value,
) => _module.MatrixMultiplyValue(left, value);

/// See [RaylibMatrixFlatExt.MatrixTranslate].
Matrix MatrixTranslate(
  double x,
  double y,
  double z,
) => _module.MatrixTranslate(x, y, z);

/// See [RaylibMatrixFlatExt.MatrixRotate].
Matrix MatrixRotate(
  Vector3 axis,
  double angle,
) => _module.MatrixRotate(axis, angle);

/// See [RaylibMatrixFlatExt.MatrixRotateX].
Matrix MatrixRotateX(
  double angle,  
) => _module.MatrixRotateX(angle);

/// See [RaylibMatrixFlatExt.MatrixRotateY].
Matrix MatrixRotateY(
  double angle,
) => _module.MatrixRotateY(angle);

/// See [RaylibMatrixFlatExt.MatrixRotateZ].
Matrix MatrixRotateZ(
  double angle,
) => _module.MatrixRotateZ(angle);

/// See [RaylibMatrixFlatExt.MatrixRotateXYZ].
Matrix MatrixRotateXYZ(
  Vector3 angle,
) => _module.MatrixRotateXYZ(angle);

/// See [RaylibMatrixFlatExt.MatrixRotateZYX].
Matrix MatrixRotateZYX(
  Vector3 angle,
) => _module.MatrixRotateZYX(angle);

/// See [RaylibMatrixFlatExt.MatrixScale].
Matrix MatrixScale(
  double x,
  double y,
  double z,
) => _module.MatrixScale(x, y, z);

/// See [RaylibMatrixFlatExt.MatrixFrustum].
Matrix MatrixFrustum(
  double left,
  double right,
  double bottom,
  double top,
  double nearPlane,
  double farPlane,
) => _module.MatrixFrustum(left, right, bottom, top, nearPlane, farPlane);

/// See [RaylibMatrixFlatExt.MatrixPerspective].
Matrix MatrixPerspective(
  double fovY,
  double aspect,
  double nearPlane,
  double farPlane,
) => _module.MatrixPerspective(fovY, aspect, nearPlane, farPlane);

/// See [RaylibMatrixFlatExt.MatrixOrtho].
Matrix MatrixOrtho(
  double left,
  double right,
  double bottom,
  double top,
  double nearPlane,
  double farPlane,
) => _module.MatrixOrtho(left, right, bottom, top, nearPlane, farPlane);

/// See [RaylibMatrixFlatExt.MatrixLookAt].
Matrix MatrixLookAt(
  Vector3 eye,
  Vector3 target,
  Vector3 up,
) => _module.MatrixLookAt(eye, target, up);

/// See [RaylibMatrixFlatExt.MatrixToFloatV].
float16 MatrixToFloatV(
  Matrix mat,
) => _module.MatrixToFloatV(mat);

/// See [RaylibMatrixFlatExt.MatrixCompose].
Matrix MatrixCompose(
  Vector3 translation,
  Quaternion rotation,
  Vector3 scale,
) => _module.MatrixCompose(translation, rotation, scale);

/// See [RaylibMatrixFlatExt.MatrixDecompose].
void MatrixDecompose(
  Matrix mat,
  XStructPtr<Vector3> translation,
  XStructPtr<Quaternion> rotation,
  XStructPtr<Vector3> scale,
) => _module.MatrixDecompose(mat, translation, rotation, scale);