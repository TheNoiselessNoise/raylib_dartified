part of '../raylib.dart';

extension RaylibVector2 on RaylibVectors {
  Vector2D Vector2Add(Vector2D v1, Vector2D v2)
    => v1.add(v2);

  Vector2D Vector2AddValue(Vector2D v, double add)
    => v.addValue(add);

  Vector2D Vector2Subtract(Vector2D v1, Vector2D v2)
    => v1.sub(v2);

  Vector2D Vector2SubtractValue(Vector2D v, double sub)
    => v.subValue(sub);

  double Vector2Length(Vector2D v)
    => v.length;

  double Vector2LengthSqr(Vector2D v)
    => v.lengthSqr;

  double Vector2DotProduct(Vector2D v1, Vector2D v2)
    => v1.dotProduct(v2);

  double Vector2Distance(Vector2D v1, Vector2D v2)
    => v1.distance(v2);

  double Vector2DistanceSqr(Vector2D v1, Vector2D v2)
    => v1.distanceSqr(v2);

  double Vector2Angle(Vector2D v1, Vector2D v2)
    => v1.angle(v2);

  double Vector2LineAngle(Vector2D start, Vector2D end)
    => start.lineAngle(end);

  Vector2D Vector2Scale(Vector2D v, double scale)
    => v.scale(scale);

  Vector2D Vector2Multiply(Vector2D v1, Vector2D v2)
    => v1.mul(v2);

  Vector2D Vector2Negate(Vector2D v)
    => v.negate();

  Vector2D Vector2Divide(Vector2D v1, Vector2D v2)
    => v1.div(v2);

  Vector2D Vector2Normalize(Vector2D v)
    => v.normalize();

  Vector2D Vector2Transform(Vector2D v, MatrixD mat)
    => v.transform(mat);

  Vector2D Vector2Lerp(Vector2D v1, Vector2D v2, double amount)
    => v1.lerp(v2, amount);

  Vector2D Vector2Reflect(Vector2D v, Vector2D normal)
    => v.reflect(normal);

  Vector2D Vector2Min(Vector2D v1, Vector2D v2)
    => v1.min(v2);

  Vector2D Vector2Max(Vector2D v1, Vector2D v2)
    => v1.max(v2);

  Vector2D Vector2Rotate(Vector2D v, double angle)
    => v.rotate(angle);

  Vector2D Vector2MoveTowards(Vector2D v, Vector2D target, double maxDistance)
    => v.moveTowards(target, maxDistance);

  Vector2D Vector2Invert(Vector2D v)
    => v.invert();

  Vector2D Vector2Clamp(Vector2D v, Vector2D min, Vector2D max)
    => v.clamp(min, max);

  Vector2D Vector2ClampValue(Vector2D v, double min, double max)
    => v.clampValue(min, max);

  bool Vector2Equals(Vector2D p, Vector2D q)
    => p.equals(q);

  Vector2D Vector2Refract(Vector2D v, Vector2D n, double r)
    => v.refract(n, r);
}

extension RaylibVector3 on RaylibVectors {
  Vector3D Vector3Add(Vector3D v1, Vector3D v2)
    => v1.add(v2);

  Vector3D Vector3AddValue(Vector3D v, double add)
    => v.addValue(add);

  Vector3D Vector3DSubtract(Vector3D v1, Vector3D v2)
    => v1.sub(v2);

  Vector3D Vector3SubtractValue(Vector3D v, double sub)
    => v.subValue(sub);

  Vector3D Vector3Scale(Vector3D v, double scalar)
    => v.scale(scalar);

  Vector3D Vector3Multiply(Vector3D v1, Vector3D v2)
    => v1.mul(v2);

  Vector3D Vector3CrossProduct(Vector3D v1, Vector3D v2)
    => v1.crossProduct(v2);

  Vector3D Vector3Perpendicular(Vector3D v)
    => .perpendicular(v);

  double Vector3Length(Vector3D v)
    => v.length;

  double Vector3LengthSqr(Vector3D v)
    => v.lengthSqr;

  double Vector3DotProduct(Vector3D v1, Vector3D v2)
    => v1.dotProduct(v2);

  double Vector3Distance(Vector3D v1, Vector3D v2)
    => v1.distance(v2);

  double Vector3DistanceSqr(Vector3D v1, Vector3D v2)
    => v1.distanceSqr(v2);

  double Vector3Angle(Vector3D v1, Vector3D v2)
    => v1.angle(v2);

  Vector3D Vector3Negate(Vector3D v)
    => v.negate();

  Vector3D Vector3Divide(Vector3D v1, Vector3D v2)
    => v1.div(v2);

  Vector3D Vector3Normalize(Vector3D v)
    => v.normalize();

  Vector3D Vector3Project(Vector3D v1, Vector3D v2)
    => v1.project(v2);

  Vector3D Vector3Reject(Vector3D v1, Vector3D v2)
    => v1.reject(v2);

  void Vector3OrthoNormalize(Vector3D v1, Vector3D v2)
    => v2.setD(v1.orthoNormalize(v2));

  Vector3D Vector3Transform(Vector3D v, MatrixD mat)
    => v.transform(mat);

  Vector3D Vector3RotateByQuaternion(Vector3D v, QuaternionD q)
    => v.rotateByQuaternion(q);

  Vector3D Vector3RotateByAxisAngle(Vector3D v, Vector3D axis, double angle)
    => v.rotateByAxisAngle(axis, angle);

  Vector3D Vector3MoveTowards(Vector3D v, Vector3D target, double maxDistance)
    => v.moveTowards(target, maxDistance);

  Vector3D Vector3Lerp(Vector3D v1, Vector3D v2, double amount)
    => v1.lerp(v2, amount);

  Vector3D Vector3CubicHermite(Vector3D v1, Vector3D tangent1, Vector3D v2, Vector3D tangent2, double amount)
    => v1.cubicHermite(tangent1, v2, tangent2, amount);

  Vector3D Vector3Reflect(Vector3D v, Vector3D normal)
    => v.reflect(normal);

  Vector3D Vector3Min(Vector3D v1, Vector3D v2)
    => v1.min(v2);

  Vector3D Vector3Max(Vector3D v1, Vector3D v2)
    => v1.max(v2);

  Vector3D Vector3Barycenter(Vector3D p, Vector3D a, Vector3D b, Vector3D c)
    => .barycenter(p, a, b, c);

  Vector3D Vector3Unproject(Vector3D source, MatrixD projection, MatrixD view)
    => source.unproject(projection, view);

  Vector3D Vector3Invert(Vector3D v)
    => v.invert();

  Vector3D Vector3Clamp(Vector3D v, Vector3D min, Vector3D max)
    => v.clamp(min, max);

  Vector3D Vector3ClampValue(Vector3D v, double min, double max)
    => v.clampValue(min, max);

  bool Vector3Equals(Vector3D p, Vector3D q)
    => p.equals(q);

  Vector3D Vector3Refract(Vector3D v, Vector3D n, double r)
    => v.refract(n, r);
}

extension RaylibVector4 on RaylibVectors {
  Vector4D Vector4Add(Vector4D v1, Vector4D v2)
    => v1.add(v2);

  Vector4D Vector4AddValue(Vector4D v, double add)
    => v.addValue(add);

  Vector4D Vector4Subtract(Vector4D v1, Vector4D v2)
    => v1.sub(v2);

  Vector4D Vector4SubtractValue(Vector4D v, double sub)
    => v.subValue(sub);

  double Vector4Length(Vector4D v)
    => v.length;

  double Vector4LengthSqr(Vector4D v)
    => v.lengthSqr;

  double Vector4DotProduct(Vector4D v1, Vector4D v2)
    => v1.dotProduct(v2);

  double Vector4Distance(Vector4D v1, Vector4D v2)
    => v1.distance(v2);

  double Vector4DistanceSqr(Vector4D v1, Vector4D v2)
    => v1.distanceSqr(v2);

  Vector4D Vector4Scale(Vector4D v, double scale)
    => v.scale(scale);

  Vector4D Vector4Multiply(Vector4D v1, Vector4D v2)
    => v1.mul(v2);

  Vector4D Vector4Negate(Vector4D v)
    => v.negate();

  Vector4D Vector4Divide(Vector4D v1, Vector4D v2)
    => v1.div(v2);

  Vector4D Vector4Normalize(Vector4D v)
    => v.normalize();

  Vector4D Vector4Min(Vector4D v1, Vector4D v2)
    => v1.min(v2);

  Vector4D Vector4Max(Vector4D v1, Vector4D v2)
    => v1.max(v2);

  Vector4D Vector4Lerp(Vector4D v1, Vector4D v2, double amount)
    => v1.lerp(v2, amount);

  Vector4D Vector4MoveTowards(Vector4D v, Vector4D target, double maxDistance)
    => v.moveTowards(target, maxDistance);

  Vector4D Vector4Invert(Vector4D v)
    => v.invert();

  bool Vector4Equals(Vector4D p, Vector4D q)
    => p.equals(q);
}

class RaylibVectors extends RaylibModule {
  RaylibVectors(super.lib);
}