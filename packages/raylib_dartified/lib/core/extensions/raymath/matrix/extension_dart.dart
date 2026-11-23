part of '../../../raylib_dartified.dart';

/// Exposes Raylib's matrix math API as module-level functions by delegating
/// to the corresponding [Matrix] methods/factories.
/// Exists purely for Raylib API symmetry.
final class RaylibMatrixExtDart extends XPackageModule<Raylib> {

  RaylibMatrixExtDart(super.pkg);

  /// See [Matrix.determinant].
  double MatrixDeterminant(
    Matrix mat,
  ) => mat.determinant();

  /// See [Matrix.trace].
  double MatrixTrace(
    Matrix mat,
  ) => mat.trace();

  /// See [Matrix.transpose].
  Matrix MatrixTranspose(
    Matrix mat,
  ) => mat.transpose();

  /// See [Matrix.invert].
  Matrix MatrixInvert(
    Matrix mat,
  ) => mat.invert();

  /// See [Matrix.identity].
  Matrix MatrixIdentity()
    => .identity();

  /// See [Matrix.add].
  Matrix MatrixAdd(
    Matrix left,
    Matrix right,
  ) => left.add(right);

  /// See [Matrix.sub].
  Matrix MatrixSubtract(
    Matrix left,
    Matrix right,
  ) => left.sub(right);

  /// See [Matrix.mul].
  Matrix MatrixMultiply(
    Matrix left,
    Matrix right,
  ) => left.mul(right);

  /// See [Matrix.mulValue].
  Matrix MatrixMultiplyValue(
    Matrix left,
    double value,
  ) => left.mulValue(value);

  /// See [Matrix.translate].
  Matrix MatrixTranslate(
    double x,
    double y,
    double z,
  ) => .translate(x, y, z);

  /// See [Matrix.rotateAngle].
  Matrix MatrixRotate(
    Vector3 axis,
    double angle,
  ) => .rotateAngle(axis, angle);

  /// See [Matrix.rotateX].
  Matrix MatrixRotateX(
    double angle,
  ) => .rotateX(angle);

  /// See [Matrix.rotateY].
  Matrix MatrixRotateY(
    double angle,
  ) => .rotateY(angle);

  /// See [Matrix.rotateZ].
  Matrix MatrixRotateZ(
    double angle,
  ) => .rotateZ(angle);

  /// See [Matrix.rotateXYZ].
  Matrix MatrixRotateXYZ(
    Vector3 angle,
  ) => .rotateXYZ(angle);

  /// See [Matrix.rotateZYX].
  Matrix MatrixRotateZYX(
    Vector3 angle,
  ) => .rotateZYX(angle);

  /// See [Matrix.scale].
  Matrix MatrixScale(
    double x,
    double y,
    double z,
  ) => .scale(x, y, z);

  /// See [Matrix.frustum].
  Matrix MatrixFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => .frustum(left, right, bottom, top, nearPlane, farPlane);

  /// See [Matrix.perspective].
  Matrix MatrixPerspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  ) => .perspective(fovY, aspect, nearPlane, farPlane);

  /// See [Matrix.ortho].
  Matrix MatrixOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => .ortho(left, right, bottom, top, nearPlane, farPlane);

  /// See [Matrix.lookAt].
  Matrix MatrixLookAt(
    Vector3 eye,
    Vector3 target,
    Vector3 up,
  ) => .lookAt(eye, target, up);
  
  /// See [Matrix.toFloatV].
  float16 MatrixToFloatV(
    Matrix mat,
  ) => mat.toFloatV();

  /// See [Matrix.compose].
  Matrix MatrixCompose(
    Vector3 translation,
    Quaternion rotation, 
    Vector3 scale,
  ) => .compose(translation, rotation, scale);

  /// See [Matrix.decompose].
  (Vector3 translation, Quaternion rotation, Vector3 scale) MatrixDecompose(
    Matrix mat,
  ) => mat.decompose();
}