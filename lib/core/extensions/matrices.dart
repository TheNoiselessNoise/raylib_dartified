part of '../raylib.dart';

class RaylibMatrices extends RaylibModule {
  RaylibMatrices(super.rl);

  double MatrixDeterminant(MatrixD mat) => mat.determinant();

  double MatrixTrace(MatrixD mat) => mat.trace();

  MatrixD MatrixTranspose(MatrixD mat) => mat.transpose();

  MatrixD MatrixInvert(MatrixD mat) => mat.invert();

  MatrixD MatrixIdentity() => .identity();

  MatrixD MatrixAdd(MatrixD left, MatrixD right) => left.add(right);

  MatrixD MatrixSubtract(MatrixD left, MatrixD right) => left.sub(right);

  MatrixD MatrixMultiply(MatrixD left, MatrixD right) => left.mul(right);

  MatrixD MatrixTranslate(double x, double y, double z) => .translate(x, y, z);

  MatrixD MatrixRotate(Vector3D axis, double angle) => .rotateAngle(axis, angle);

  MatrixD MatrixRotateX(double angle) => .rotateX(angle);

  MatrixD MatrixRotateY(double angle) => .rotateY(angle);

  MatrixD MatrixRotateZ(double angle) => .rotateZ(angle);

  MatrixD MatrixRotateXYZ(Vector3D angle) => .rotateXYZ(angle);

  MatrixD MatrixRotateZYX(Vector3D angle) => .rotateZYX(angle);

  MatrixD MatrixScale(double x, double y, double z) => .scale(x, y, z);

  MatrixD MatrixFrustum(double left, double right, double bottom, double top, double nearPlane, double farPlane)
    => .frustum(left, right, bottom, top, nearPlane, farPlane);

  MatrixD MatrixPerspective(double fovY, double aspect, double nearPlane, double farPlane)
    => .perspective(fovY, aspect, nearPlane, farPlane);

  MatrixD MatrixOrtho(double left, double right, double bottom, double top, double nearPlane, double farPlane)
    => .ortho(left, right, bottom, top, nearPlane, farPlane);

  MatrixD MatrixLookAt(Vector3D eye, Vector3D target, Vector3D up)
    => .lookAt(eye, target, up);

  (Vector3D translation, QuaternionD rotation, Vector3D scale) MatrixDecompose(MatrixD mat)
    => mat.decompose();
}