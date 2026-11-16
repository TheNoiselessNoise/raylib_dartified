part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's matrix math API as module-level functions by delegating
/// to the corresponding [Matrix] methods/factories.
/// Exists purely for Raylib API symmetry.
final class RaylibMatrixExtDart<R extends RaylibBase> extends RaylibModule<R> {

  RaylibMatrixExtDart(super.rl);

  /// See [Matrix.determinant].
  double MatrixDeterminant(
    Matrix mat,
  ) => debugRun(
    () => 'MatrixDeterminant($mat)',
    () => mat.determinant(),
  );

  /// See [Matrix.trace].
  double MatrixTrace(
    Matrix mat,
  ) => debugRun(
    () => 'MatrixTrace($mat)',
    () => mat.trace(),
  );

  /// See [Matrix.transpose].
  Matrix MatrixTranspose(
    Matrix mat,
  ) => debugRun(
    () => 'MatrixTranspose($mat)',
    () => mat.transpose(),
  );

  /// See [Matrix.invert].
  Matrix MatrixInvert(
    Matrix mat,
  ) => debugRun(
    () => 'MatrixInvert($mat)',
    () => mat.invert(),
  );

  /// See [Matrix.identity].
  Matrix MatrixIdentity() => debugRun(
    () => 'MatrixIdentity()',
    () => .identity(),
  );

  /// See [Matrix.add].
  Matrix MatrixAdd(
    Matrix left,
    Matrix right,
  ) => debugRun(
    () => 'MatrixAdd($left, $right)',
    () => left.add(right),
  );

  /// See [Matrix.sub].
  Matrix MatrixSubtract(
    Matrix left,
    Matrix right,
  ) => debugRun(
    () => 'MatrixSubtract($left, $right)',
    () => left.sub(right),
  );

  /// See [Matrix.mul].
  Matrix MatrixMultiply(
    Matrix left,
    Matrix right,
  ) => debugRun(
    () => 'MatrixMultiply($left, $right)',
    () => left.mul(right),
  );

  /// See [Matrix.mulValue].
  Matrix MatrixMultiplyValue(
    Matrix left,
    double value,
  ) => debugRun(
    () => 'MatrixMultiplyValue($left, $value)',
    () => left.mulValue(value),
  );

  /// See [Matrix.translate].
  Matrix MatrixTranslate(
    double x,
    double y,
    double z,
  ) => debugRun(
    () => 'MatrixTranslate($x, $y, $z)',
    () => .translate(x, y, z),
  );

  /// See [Matrix.rotateAngle].
  Matrix MatrixRotate(
    Vector3 axis,
    double angle,
  ) => debugRun(
    () => 'MatrixRotate($axis, $angle)',
    () => .rotateAngle(axis, angle),
  );

  /// See [Matrix.rotateX].
  Matrix MatrixRotateX(
    double angle,
  ) => debugRun(
    () => 'MatrixRotateX($angle)',
    () => .rotateX(angle),
  );

  /// See [Matrix.rotateY].
  Matrix MatrixRotateY(
    double angle,
  ) => debugRun(
    () => 'MatrixRotateY($angle)',
    () => .rotateY(angle),
  );

  /// See [Matrix.rotateZ].
  Matrix MatrixRotateZ(
    double angle,
  ) => debugRun(
    () => 'MatrixRotateZ($angle)',
    () => .rotateZ(angle),
  );

  /// See [Matrix.rotateXYZ].
  Matrix MatrixRotateXYZ(
    Vector3 angle,
  ) => debugRun(
    () => 'MatrixRotateXYZ($angle)',
    () => .rotateXYZ(angle),
  );

  /// See [Matrix.rotateZYX].
  Matrix MatrixRotateZYX(
    Vector3 angle,
  ) => debugRun(
    () => 'MatrixRotateZYX($angle)',
    () => .rotateZYX(angle),
  );

  /// See [Matrix.scale].
  Matrix MatrixScale(
    double x,
    double y,
    double z,
  ) => debugRun(
    () => 'MatrixScale($x, $y, $z)',
    () => .scale(x, y, z),
  );

  /// See [Matrix.frustum].
  Matrix MatrixFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => debugRun(
    () => 'MatrixFrustum($left, $right, $bottom, $top, $nearPlane, $farPlane)',
    () => .frustum(left, right, bottom, top, nearPlane, farPlane),
  );

  /// See [Matrix.perspective].
  Matrix MatrixPerspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  ) => debugRun(
    () => 'MatrixPerspective($fovY, $aspect, $nearPlane, $farPlane)',
    () => .perspective(fovY, aspect, nearPlane, farPlane),
  );

  /// See [Matrix.ortho].
  Matrix MatrixOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => debugRun(
    () => 'MatrixOrtho($left, $right, $bottom, $top, $nearPlane, $farPlane)',
    () => .ortho(left, right, bottom, top, nearPlane, farPlane),
  );

  /// See [Matrix.lookAt].
  Matrix MatrixLookAt(
    Vector3 eye,
    Vector3 target,
    Vector3 up,
  ) => debugRun(
    () => 'MatrixLookAt($eye, $target, $up)',
    () => .lookAt(eye, target, up),
  );
  
  /// See [Matrix.toFloatV].
  float16 MatrixToFloatV(
    Matrix mat,
  ) => debugRun(
    () => 'MatrixToFloatV($mat)',
    () => mat.toFloatV(),
  );

  /// See [Matrix.compose].
  Matrix MatrixCompose(
    Vector3 translation,
    Quaternion rotation, 
    Vector3 scale,
  ) => debugRun(
    () => 'MatrixCompose($translation, $rotation, $scale)',
    () => .compose(translation, rotation, scale),
  );

  /// See [Matrix.decompose].
  (Vector3 translation, Quaternion rotation, Vector3 scale) MatrixDecompose(
    Matrix mat,
  ) => debugRun(
    () => 'MatrixDecompose($mat)',
    () => mat.decompose(),
  );
}