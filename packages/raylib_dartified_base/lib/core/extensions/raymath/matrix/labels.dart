part of '../../../raylib_dartified_base.dart';

class _RaylibMatrixExtDartDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibMatrixExtDart.MatrixDeterminant].
  String MatrixDeterminant(
    Matrix mat,
  ) => 'MatrixDeterminant($mat)';

  /// Label for [RaylibMatrixExtDart.MatrixTrace].
  String MatrixTrace(
    Matrix mat,
  ) => 'MatrixTrace($mat)';

  /// Label for [RaylibMatrixExtDart.MatrixTranspose].
  String MatrixTranspose(
    Matrix mat,
  ) => 'MatrixTranspose($mat)';

  /// Label for [RaylibMatrixExtDart.MatrixInvert].
  String MatrixInvert(
    Matrix mat,
  ) => 'MatrixInvert($mat)';

  /// Label for [RaylibMatrixExtDart.MatrixIdentity].
  String MatrixIdentity()
    => 'MatrixIdentity';

  /// Label for [RaylibMatrixExtDart.MatrixAdd].
  String MatrixAdd(
    Matrix left,
    Matrix right,
  ) => 'MatrixAdd($left, $right)';

  /// Label for [RaylibMatrixExtDart.MatrixSubtract].
  String MatrixSubtract(
    Matrix left,
    Matrix right,
  ) => 'MatrixSubtract($left, $right)';

  /// Label for [RaylibMatrixExtDart.MatrixMultiply].
  String MatrixMultiply(
    Matrix left,
    Matrix right,
  ) => 'MatrixMultiply($left, $right)';

  /// Label for [RaylibMatrixExtDart.MatrixMultiplyValue].
  String MatrixMultiplyValue(
    Matrix left,
    double value,
  ) => 'MatrixMultiplyValue($left, $value)';

  /// Label for [RaylibMatrixExtDart.MatrixTranslate].
  String MatrixTranslate(
    double x,
    double y,
    double z,
  ) => 'MatrixTranslate($x, $y, $z)';

  /// Label for [RaylibMatrixExtDart.MatrixRotate].
  String MatrixRotate(
    Vector3 axis,
    double angle,
  ) => 'MatrixRotate($axis, $angle)';

  /// Label for [RaylibMatrixExtDart.MatrixRotateX].
  String MatrixRotateX(
    double angle,
  ) => 'MatrixRotateX($angle)';

  /// Label for [RaylibMatrixExtDart.MatrixRotateY].
  String MatrixRotateY(
    double angle,
  ) => 'MatrixRotateY($angle)';

  /// Label for [RaylibMatrixExtDart.MatrixRotateZ].
  String MatrixRotateZ(
    double angle,
  ) => 'MatrixRotateZ($angle)';

  /// Label for [RaylibMatrixExtDart.MatrixRotateXYZ].
  String MatrixRotateXYZ(
    Vector3 angle,
  ) => 'MatrixRotateXYZ($angle)';

  /// Label for [RaylibMatrixExtDart.MatrixRotateZYX].
  String MatrixRotateZYX(
    Vector3 angle,
  ) => 'MatrixRotateZYX($angle)';

  /// Label for [RaylibMatrixExtDart.MatrixScale].
  String MatrixScale(
    double x,
    double y,
    double z,
  ) => 'MatrixScale($x, $y, $z)';

  /// Label for [RaylibMatrixExtDart.MatrixFrustum].
  String MatrixFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => 'MatrixFrustum($left, $right, $bottom, $top, $nearPlane, $farPlane)';

  /// Label for [RaylibMatrixExtDart.MatrixPerspective].
  String MatrixPerspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  ) => 'MatrixPerspective($fovY, $aspect, $nearPlane, $farPlane)';

  /// Label for [RaylibMatrixExtDart.MatrixOrtho].
  String MatrixOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => 'MatrixOrtho($left, $right, $bottom, $top, $nearPlane, $farPlane)';

  /// Label for [RaylibMatrixExtDart.MatrixLookAt].
  String MatrixLookAt(
    Vector3 eye,
    Vector3 target,
    Vector3 up,
  ) => 'MatrixLookAt($eye, $target, $up)';
  
  /// Label for [RaylibMatrixExtDart.MatrixToFloatV].
  String MatrixToFloatV(
    Matrix mat,
  ) => 'MatrixToFloatV($mat)';

  /// Label for [RaylibMatrixExtDart.MatrixCompose].
  String MatrixCompose(
    Vector3 translation,
    Quaternion rotation, 
    Vector3 scale,
  ) => 'MatrixCompose($translation, $rotation, $scale)';

  /// Label for [RaylibMatrixExtDart.MatrixDecompose].
  String MatrixDecompose(
    Matrix mat,
  ) => 'MatrixDecompose($mat)';
  
}
