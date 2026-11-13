part of '../../../raylib_dartified_base.dart';

class _RaylibVector3ExtDartDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibVector3ExtDart.Vector3Zero].
  String Vector3Zero()
    => 'Vector3Zero()';

  /// Label for [RaylibVector3ExtDart.Vector3One].
  String Vector3One()
    => 'Vector3One()';

  /// Label for [RaylibVector3ExtDart.Vector3Add].
  String Vector3Add(
    Vector3 v1,
    Vector3 v2,
  ) => 'Vector3Add($v1, $v2)';

  /// Label for [RaylibVector3ExtDart.Vector3AddValue].
  String Vector3AddValue(
    Vector3 v,
    double add,
  ) => 'Vector3AddValue($v, $add)';

  /// Label for [RaylibVector3ExtDart.Vector3Subtract].
  String Vector3Subtract(
    Vector3 v1,
    Vector3 v2,
  ) => 'Vector3Subtract($v1, $v2)';

  /// Label for [RaylibVector3ExtDart.Vector3SubtractValue].
  String Vector3SubtractValue(
    Vector3 v,
    double sub,
  ) => 'Vector3SubtractValue($v, $sub)';

  /// Label for [RaylibVector3ExtDart.Vector3Scale].
  String Vector3Scale(
    Vector3 v,
    double scalar,
  ) => 'Vector3Scale($v, $scalar)';

  /// Label for [RaylibVector3ExtDart.Vector3Multiply].
  String Vector3Multiply(
    Vector3 v1,
    Vector3 v2,
  ) => 'Vector3Multiply($v1, $v2)';

  /// Label for [RaylibVector3ExtDart.Vector3CrossProduct].
  String Vector3CrossProduct(
    Vector3 v1,
    Vector3 v2,
  ) => 'Vector3CrossProduct($v1, $v2)';

  /// Label for [RaylibVector3ExtDart.Vector3Perpendicular].
  String Vector3Perpendicular(
    Vector3 v,
  ) => 'Vector3Perpendicular($v)';

  /// Label for [RaylibVector3ExtDart.Vector3Length].
  String Vector3Length(
    Vector3 v,
  ) => 'Vector3Length($v)';

  /// Label for [RaylibVector3ExtDart.Vector3LengthSqr].
  String Vector3LengthSqr(
    Vector3 v,
  ) => 'Vector3LengthSqr($v)';

  /// Label for [RaylibVector3ExtDart.Vector3DotProduct].
  String Vector3DotProduct(
    Vector3 v1,
    Vector3 v2,
  ) => 'Vector3DotProduct($v1, $v2)';

  /// Label for [RaylibVector3ExtDart.Vector3Distance].
  String Vector3Distance(
    Vector3 v1,
    Vector3 v2,
  ) => 'Vector3Distance($v1, $v2)';

  /// Label for [RaylibVector3ExtDart.Vector3DistanceSqr].
  String Vector3DistanceSqr(
    Vector3 v1,
    Vector3 v2,
  ) => 'Vector3DistanceSqr($v1, $v2)';

  /// Label for [RaylibVector3ExtDart.Vector3Angle].
  String Vector3Angle(
    Vector3 v1,
    Vector3 v2,
  ) => 'Vector3Angle($v1, $v2)';

  /// Label for [RaylibVector3ExtDart.Vector3Negate].
  String Vector3Negate(
    Vector3 v,
  ) => 'Vector3Negate($v)';

  /// Label for [RaylibVector3ExtDart.Vector3Divide].
  String Vector3Divide(
    Vector3 v1,
    Vector3 v2,
  ) => 'Vector3Divide($v1, $v2)';

  /// Label for [RaylibVector3ExtDart.Vector3Normalize].
  String Vector3Normalize(
    Vector3 v,
  ) => 'Vector3Normalize($v)';

  /// Label for [RaylibVector3ExtDart.Vector3Project].
  String Vector3Project(
    Vector3 v1,
    Vector3 v2,
  ) => 'Vector3Project($v1, $v2)';

  /// Label for [RaylibVector3ExtDart.Vector3Reject].
  String Vector3Reject(
    Vector3 v1,
    Vector3 v2,
  ) => 'Vector3Reject($v1, $v2)';

  /// Label for [RaylibVector3ExtDart.Vector3OrthoNormalize].
  String Vector3OrthoNormalize(
    Vector3 v1,
    Vector3 v2,
  ) => 'Vector3OrthoNormalize($v1, $v2)';

  /// Label for [RaylibVector3ExtDart.Vector3Transform].
  String Vector3Transform(
    Vector3 v,
    Matrix mat,
  ) => 'Vector3Transform($v, $mat)';

  /// Label for [RaylibVector3ExtDart.Vector3RotateByQuaternion].
  String Vector3RotateByQuaternion(
    Vector3 v,
    Quaternion q,
  ) => 'Vector3RotateByQuaternion($v, $q)';

  /// Label for [RaylibVector3ExtDart.Vector3RotateByAxisAngle].
  String Vector3RotateByAxisAngle(
    Vector3 v,
    Vector3 axis,
    double angle,
  ) => 'Vector3RotateByAxisAngle($v, $axis, $angle)';

  /// Label for [RaylibVector3ExtDart.Vector3MoveTowards].
  String Vector3MoveTowards(
    Vector3 v,
    Vector3 target,
    double maxDistance,
  ) => 'Vector3MoveTowards($v, $target, $maxDistance)';

  /// Label for [RaylibVector3ExtDart.Vector3Lerp].
  String Vector3Lerp(
    Vector3 v1,
    Vector3 v2,
    double amount,
  ) => 'Vector3Lerp($v1, $v2, $amount)';

  /// Label for [RaylibVector3ExtDart.Vector3CubicHermite].
  String Vector3CubicHermite(
    Vector3 v1,
    Vector3 tangent1,
    Vector3 v2,
    Vector3 tangent2,
    double amount,
  ) => 'Vector3CubicHermite($v1, $tangent1, $v2, $tangent2, $amount)';

  /// Label for [RaylibVector3ExtDart.Vector3Reflect].
  String Vector3Reflect(
    Vector3 v,
    Vector3 normal,
  ) => 'Vector3Reflect($v, $normal)';

  /// Label for [RaylibVector3ExtDart.Vector3Min].
  String Vector3Min(
    Vector3 v1,
    Vector3 v2,
  ) => 'Vector3Min($v1, $v2)';

  /// Label for [RaylibVector3ExtDart.Vector3Max].
  String Vector3Max(
    Vector3 v1,
    Vector3 v2,
  ) => 'Vector3Max($v1, $v2)';

  /// Label for [RaylibVector3ExtDart.Vector3Barycenter].
  String Vector3Barycenter(
    Vector3 p,
    Vector3 a,
    Vector3 b,
    Vector3 c,
  ) => 'Vector3Barycenter($p, $a, $b, $c)';

  /// Label for [RaylibVector3ExtDart.Vector3Unproject].
  String Vector3Unproject(
    Vector3 source,
    Matrix projection,
    Matrix view,
  ) => 'Vector3Unproject($source, $projection, $view)';

  /// Label for [RaylibVector3ExtDart.Vector3ToFloatV].
  String Vector3ToFloatV(
    Vector3 v,
  ) => 'Vector3ToFloatV($v)';

  /// Label for [RaylibVector3ExtDart.Vector3Invert].
  String Vector3Invert(
    Vector3 v,
  ) => 'Vector3Invert($v)';

  /// Label for [RaylibVector3ExtDart.Vector3Clamp].
  String Vector3Clamp(
    Vector3 v,
    Vector3 min,
    Vector3 max,
  ) => 'Vector3Clamp($v, $min, $max)';

  /// Label for [RaylibVector3ExtDart.Vector3ClampValue].
  String Vector3ClampValue(
    Vector3 v,
    double min,
    double max,
  ) => 'Vector3ClampValue($v, $min, $max)';

  /// Label for [RaylibVector3ExtDart.Vector3Equals].
  String Vector3Equals(
    Vector3 p,
    Vector3 q,
  ) => 'Vector3Equals($p, $q)';

  /// Label for [RaylibVector3ExtDart.Vector3Refract].
  String Vector3Refract(
    Vector3 v,
    Vector3 n,
    double r,
  ) => 'Vector3Refract($v, $n, $r)';
  
}
