import 'dart:ffi';
import 'package:raylib_dartified/raylib_dartified.dart';

RaylibMatrixExt get _module => Raylib.instance.module();

/// See [RaylibMatrixExt.MatrixDeterminant].
double MatrixDeterminant(MatrixC mat)
  => _module.MatrixDeterminant(mat);

/// See [RaylibMatrixExt.MatrixTrace].
double MatrixTrace(MatrixC mat)
  => _module.MatrixTrace(mat);

/// See [RaylibMatrixExt.MatrixTranspose].
MatrixC MatrixTranspose(MatrixC mat)
  => _module.MatrixTranspose(mat);

/// See [RaylibMatrixExt.MatrixInvert].
MatrixC MatrixInvert(MatrixC mat)
  => _module.MatrixInvert(mat);

/// See [RaylibMatrixExt.MatrixIdentity].
MatrixC MatrixIdentity()
  => _module.MatrixIdentity();

/// See [RaylibMatrixExt.MatrixAdd].
MatrixC MatrixAdd(MatrixC left, MatrixC right)
  => _module.MatrixAdd(left, right);

/// See [RaylibMatrixExt.MatrixSubtract].
MatrixC MatrixSubtract(MatrixC left, MatrixC right)
  => _module.MatrixSubtract(left, right);

/// See [RaylibMatrixExt.MatrixMultiply].
MatrixC MatrixMultiply(MatrixC left, MatrixC right)
  => _module.MatrixMultiply(left, right);

/// See [RaylibMatrixExt.MatrixMultiplyValue].
MatrixC MatrixMultiplyValue(MatrixC left, double value)
  => _module.MatrixMultiplyValue(left, value);

/// See [RaylibMatrixExt.MatrixTranslate].
MatrixC MatrixTranslate(double x, double y, double z)
  => _module.MatrixTranslate(x, y, z);

/// See [RaylibMatrixExt.MatrixRotate].
MatrixC MatrixRotate(Vector3C axis, double angle)
  => _module.MatrixRotate(axis, angle);

/// See [RaylibMatrixExt.MatrixRotateX].
MatrixC MatrixRotateX(double angle)
  => _module.MatrixRotateX(angle);

/// See [RaylibMatrixExt.MatrixRotateY].
MatrixC MatrixRotateY(double angle)
  => _module.MatrixRotateY(angle);

/// See [RaylibMatrixExt.MatrixRotateZ].
MatrixC MatrixRotateZ(double angle)
  => _module.MatrixRotateZ(angle);

/// See [RaylibMatrixExt.MatrixRotateXYZ].
MatrixC MatrixRotateXYZ(Vector3C angle)
  => _module.MatrixRotateXYZ(angle);

/// See [RaylibMatrixExt.MatrixRotateZYX].
MatrixC MatrixRotateZYX(Vector3C angle)
  => _module.MatrixRotateZYX(angle);

/// See [RaylibMatrixExt.MatrixScale].
MatrixC MatrixScale(double x, double y, double z)
  => _module.MatrixScale(x, y, z);

/// See [RaylibMatrixExt.MatrixFrustum].
MatrixC MatrixFrustum(double left, double right, double bottom, double top, double nearPlane, double farPlane)
  => _module.MatrixFrustum(left, right, bottom, top, nearPlane, farPlane);

/// See [RaylibMatrixExt.MatrixPerspective].
MatrixC MatrixPerspective(double fovY, double aspect, double nearPlane, double farPlane)
  => _module.MatrixPerspective(fovY, aspect, nearPlane, farPlane);

/// See [RaylibMatrixExt.MatrixOrtho].
MatrixC MatrixOrtho(double left, double right, double bottom, double top, double nearPlane, double farPlane)
  => _module.MatrixOrtho(left, right, bottom, top, nearPlane, farPlane);

/// See [RaylibMatrixExt.MatrixLookAt].
MatrixC MatrixLookAt(Vector3C eye, Vector3C target, Vector3C up)
  => _module.MatrixLookAt(eye, target, up);

/// See [RaylibMatrixExt.MatrixToFloatV].
float16C MatrixToFloatV(MatrixC mat)
  => _module.MatrixToFloatV(mat);

/// See [RaylibMatrixExt.MatrixCompose].
MatrixC MatrixCompose(Vector3C translation, QuaternionC rotation, Vector3C scale)
  => _module.MatrixCompose(translation, rotation, scale);

/// See [RaylibMatrixExt.MatrixDecompose].
void MatrixDecompose(MatrixC mat, Pointer<Vector3C> translation, Pointer<QuaternionC> rotation, Pointer<Vector3C> scale)
  => _module.MatrixDecompose(mat, translation, rotation, scale);
