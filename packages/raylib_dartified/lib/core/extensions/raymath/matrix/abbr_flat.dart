import 'package:raylib_dartified/raylib_dartified.dart';

RaylibMatrixFlatExt get _module => Raylib.instance.module();

/// See [RaylibMatrixFlatExtImpl.MatrixDeterminant].
double MatrixDeterminant(
  Matrix mat,
) => _module.MatrixDeterminant(mat);

/// See [RaylibMatrixFlatExtImpl.MatrixTrace].
double MatrixTrace(
  Matrix mat,
) => _module.MatrixTrace(mat);

/// See [RaylibMatrixFlatExtImpl.MatrixTranspose].
Matrix MatrixTranspose(
  Matrix mat,
) => _module.MatrixTranspose(mat);

/// See [RaylibMatrixFlatExtImpl.MatrixInvert].
Matrix MatrixInvert(
  Matrix mat,
) => _module.MatrixInvert(mat);

/// See [RaylibMatrixFlatExtImpl.MatrixIdentity].
Matrix MatrixIdentity() => _module.MatrixIdentity();

/// See [RaylibMatrixFlatExtImpl.MatrixAdd].
Matrix MatrixAdd(
  Matrix left,
  Matrix right,
) => _module.MatrixAdd(left, right);

/// See [RaylibMatrixFlatExtImpl.MatrixSubtract].
Matrix MatrixSubtract(
  Matrix left,
  Matrix right,
) => _module.MatrixSubtract(left, right);

/// See [RaylibMatrixFlatExtImpl.MatrixMultiply].
Matrix MatrixMultiply(
  Matrix left,
  Matrix right,
) => _module.MatrixMultiply(left, right);

/// See [RaylibMatrixFlatExtImpl.MatrixMultiplyValue].
Matrix MatrixMultiplyValue(
  Matrix left,
  double value,
) => _module.MatrixMultiplyValue(left, value);

/// See [RaylibMatrixFlatExtImpl.MatrixTranslate].
Matrix MatrixTranslate(
  double x,
  double y,
  double z,
) => _module.MatrixTranslate(x, y, z);

/// See [RaylibMatrixFlatExtImpl.MatrixRotate].
Matrix MatrixRotate(
  Vector3 axis,
  double angle,
) => _module.MatrixRotate(axis, angle);

/// See [RaylibMatrixFlatExtImpl.MatrixRotateX].
Matrix MatrixRotateX(
  double angle,  
) => _module.MatrixRotateX(angle);

/// See [RaylibMatrixFlatExtImpl.MatrixRotateY].
Matrix MatrixRotateY(
  double angle,
) => _module.MatrixRotateY(angle);

/// See [RaylibMatrixFlatExtImpl.MatrixRotateZ].
Matrix MatrixRotateZ(
  double angle,
) => _module.MatrixRotateZ(angle);

/// See [RaylibMatrixFlatExtImpl.MatrixRotateXYZ].
Matrix MatrixRotateXYZ(
  Vector3 angle,
) => _module.MatrixRotateXYZ(angle);

/// See [RaylibMatrixFlatExtImpl.MatrixRotateZYX].
Matrix MatrixRotateZYX(
  Vector3 angle,
) => _module.MatrixRotateZYX(angle);

/// See [RaylibMatrixFlatExtImpl.MatrixScale].
Matrix MatrixScale(
  double x,
  double y,
  double z,
) => _module.MatrixScale(x, y, z);

/// See [RaylibMatrixFlatExtImpl.MatrixFrustum].
Matrix MatrixFrustum(
  double left,
  double right,
  double bottom,
  double top,
  double nearPlane,
  double farPlane,
) => _module.MatrixFrustum(left, right, bottom, top, nearPlane, farPlane);

/// See [RaylibMatrixFlatExtImpl.MatrixPerspective].
Matrix MatrixPerspective(
  double fovY,
  double aspect,
  double nearPlane,
  double farPlane,
) => _module.MatrixPerspective(fovY, aspect, nearPlane, farPlane);

/// See [RaylibMatrixFlatExtImpl.MatrixOrtho].
Matrix MatrixOrtho(
  double left,
  double right,
  double bottom,
  double top,
  double nearPlane,
  double farPlane,
) => _module.MatrixOrtho(left, right, bottom, top, nearPlane, farPlane);

/// See [RaylibMatrixFlatExtImpl.MatrixLookAt].
Matrix MatrixLookAt(
  Vector3 eye,
  Vector3 target,
  Vector3 up,
) => _module.MatrixLookAt(eye, target, up);

/// See [RaylibMatrixFlatExtImpl.MatrixToFloatV].
float16 MatrixToFloatV(
  Matrix mat,
) => _module.MatrixToFloatV(mat);

/// See [RaylibMatrixFlatExtImpl.MatrixCompose].
Matrix MatrixCompose(
  Vector3 translation,
  Quaternion rotation,
  Vector3 scale,
) => _module.MatrixCompose(translation, rotation, scale);

/// See [RaylibMatrixFlatExtImpl.MatrixDecompose].
void MatrixDecompose(
  Matrix mat,
  XStructPtr<Vector3> translation,
  XStructPtr<Quaternion> rotation,
  XStructPtr<Vector3> scale,
) => _module.MatrixDecompose(mat, translation, rotation, scale);