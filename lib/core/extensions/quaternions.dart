part of '../raylib.dart';

class RaylibQuaternions extends RaylibModule {
  RaylibQuaternions(super.lib);

  QuaternionD QuaternionAdd(QuaternionD q1, QuaternionD q2)
    => q1.add(q2);

  QuaternionD QuaternionAddValue(QuaternionD q, double add)
    => q.addValue(add);

  QuaternionD QuaternionSubtract(QuaternionD q1, QuaternionD q2)
    => q1.sub(q2);

  QuaternionD QuaternionSubtractValue(QuaternionD q, double sub)
    => q.subValue(sub);

  QuaternionD QuaternionIdentity()
    => .qIdentity();

  double QuaternionLength(QuaternionD q)
    => q.length;

  QuaternionD QuaternionNormalize(QuaternionD q)
    => q.normalize();

  QuaternionD QuaternionInvert(QuaternionD q)
    => q.qInvert();

  QuaternionD QuaternionMultiply(QuaternionD q1, QuaternionD q2)
    => q1.qMul(q2);

  QuaternionD QuaternionScale(QuaternionD q, double mul)
    => q.scale(mul);

  QuaternionD QuaternionDivide(QuaternionD q1, QuaternionD q2)
    => q1.div(q2);

  QuaternionD QuaternionLerp(QuaternionD q1, QuaternionD q2, double amount)
    => q1.lerp(q2, amount);

  QuaternionD QuaternionNlerp(QuaternionD q1, QuaternionD q2, double amount)
    => q1.qNlerp(q2, amount);

  QuaternionD QuaternionSlerp(QuaternionD q1, QuaternionD q2, double amount)
    => q1.qSlerp(q2, amount);

  QuaternionD QuaternionCubicHermiteSpline(QuaternionD q1, QuaternionD outTangent1, QuaternionD q2, QuaternionD inTangent2, double t)
    => q1.qCubicHermiteSpline(outTangent1, q2, inTangent2, t);

  QuaternionD QuaternionFromVector3ToVector3(Vector3D from, Vector3D to)
    => .qFromVector3ToVector3(from, to);

  QuaternionD QuaternionFromMatrix(MatrixD mat)
    => .qFromMatrix(mat);

  MatrixD QuaternionToMatrix(QuaternionD q)
    => q.qToMatrix();

  QuaternionD QuaternionFromAxisAngle(Vector3D axis, double angle)
    => .fromAxisAngle(axis, angle);

  (Vector3D outAxis, double outAngle) QuaternionToAxisAngle(QuaternionD q)
    => q.qToAxisAngle();

  QuaternionD QuaternionFromEuler(double pitch, double yaw, double roll)
    => .qFromEuler(pitch, yaw, roll);

  Vector3D QuaternionToEuler(QuaternionD q)
    => q.qToEuler();

  QuaternionD QuaternionTransform(QuaternionD q, MatrixD mat)
    => q.qTransform(mat);

  bool QuaternionEquals(QuaternionD p, QuaternionD q)
    => p.qEquals(q);
}