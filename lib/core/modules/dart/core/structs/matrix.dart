// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../../raylib_dartified.dart';

extension MatrixCPEx on Pointer<MatrixC> {
  Pointer<MatrixC> setC(MatrixC o) { ref.setC(o); return this; }
  Pointer<MatrixC> setD(MatrixD o) { ref.setD(o); return this; }
  Pointer<MatrixC> set(
    num m0, num m1, num m2, num m3,
    num m4, num m5, num m6, num m7,
    num m8, num m9, num m10, num m11,
    num m12, num m13, num m14, num m15,
  ) {
    ref.set(
      m0, m1, m2, m3,
      m4, m5, m6, m7,
      m8, m9, m10, m11,
      m12, m13, m14, m15,
    );
    return this;
  }
  MatrixD toD() => ref.toD(this);
}

extension MatrixCEx on MatrixC {
  MatrixC setC(MatrixC o) => set(
    o.m0, o.m1, o.m2, o.m3,
    o.m4, o.m5, o.m6, o.m7,
    o.m8, o.m9, o.m10, o.m11,
    o.m12, o.m13, o.m14, o.m15,
  );

  MatrixC setD(MatrixD o) => set(
    o.m0, o.m1, o.m2, o.m3,
    o.m4, o.m5, o.m6, o.m7,
    o.m8, o.m9, o.m10, o.m11,
    o.m12, o.m13, o.m14, o.m15,
  );

  MatrixC set(
    num m0, num m1, num m2, num m3,
    num m4, num m5, num m6, num m7,
    num m8, num m9, num m10, num m11,
    num m12, num m13, num m14, num m15,
  ) {
    this.m0 = m0.toDouble(); this.m1 = m1.toDouble(); this.m2 = m2.toDouble(); this.m3 = m3.toDouble();
    this.m4 = m4.toDouble(); this.m5 = m5.toDouble(); this.m6 = m6.toDouble(); this.m7 = m7.toDouble();
    this.m8 = m8.toDouble(); this.m9 = m9.toDouble(); this.m10 = m10.toDouble(); this.m11 = m11.toDouble();
    this.m12 = m12.toDouble(); this.m13 = m13.toDouble(); this.m14 = m14.toDouble(); this.m15 = m15.toDouble();
    return this;
  }

  MatrixD toD([Pointer<MatrixC>? ptr]) => .new(
    originalPointer: ptr,
    m0: m0, m1: m1, m2: m2, m3: m3,
    m4: m4, m5: m5, m6: m6, m7: m7,
    m8: m8, m9: m9, m10: m10, m11: m11,
    m12: m12, m13: m13, m14: m14, m15: m15,
  );
}

class MatrixD extends StructDLiteral<MatrixC, MatrixD> with MatrixBase<
  MatrixD,
  Vector3D,
  QuaternionD,
  Vector4D
> {
  @override
  double
    m0, m1, m2, m3,
    m4, m5, m6, m7,
    m8, m9, m10, m11,
    m12, m13, m14, m15;

  MatrixD({
    super.originalPointer,
    this.m0 = 0, this.m1 = 0, this.m2 = 0, this.m3 = 0,
    this.m4 = 0, this.m5 = 0, this.m6 = 0, this.m7 = 0,
    this.m8 = 0, this.m9 = 0, this.m10 = 0, this.m11 = 0,
    this.m12 = 0, this.m13 = 0, this.m14 = 0, this.m15 = 0,
  });

  factory MatrixD.zero() => .new();

  factory MatrixD.mat4(
    num m0, num m1, num m2, num m3,
    num m4, num m5, num m6, num m7,
    num m8, num m9, num m10, num m11,
    num m12, num m13, num m14, num m15,
  ) {
    return .new(
      m0:  m0.toDouble(),   m1: m1.toDouble(),   m2: m2.toDouble(),   m3: m3.toDouble(),
      m4:  m4.toDouble(),   m5: m5.toDouble(),   m6: m6.toDouble(),   m7: m7.toDouble(),
      m8:  m8.toDouble(),   m9: m9.toDouble(),  m10: m10.toDouble(), m11: m11.toDouble(),
      m12: m12.toDouble(), m13: m13.toDouble(), m14: m14.toDouble(), m15: m15.toDouble(),
    );
  }

  @override
  MatrixD setD(MatrixD o) {
    return set(
      o.m0, o.m1, o.m2, o.m3,
      o.m4, o.m5, o.m6, o.m7,
      o.m8, o.m9, o.m10, o.m11,
      o.m12, o.m13, o.m14, o.m15,
    );
  }

  @override
  nativeGetIndexedReference(Pointer<MatrixC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<MatrixC> p, int index) => p[index];

  @override
  void nativeWriteInto(MatrixC p) {
    p.m0 = m0; p.m1 = m1; p.m2 = m2; p.m3 = m3;
    p.m4 = m4; p.m5 = m5; p.m6 = m6; p.m7 = m7;
    p.m8 = m8; p.m9 = m9; p.m10 = m10; p.m11 = m11;
    p.m12 = m12; p.m13 = m13; p.m14 = m14; p.m15 = m15;
  }

  @override
  void nativeReadFrom(MatrixC p) {
    m0 = p.m0; m1 = p.m1; m2 = p.m2; m3 = p.m3;
    m4 = p.m4; m5 = p.m5; m6 = p.m6; m7 = p.m7;
    m8 = p.m8; m9 = p.m9; m10 = p.m10; m11 = p.m11;
    m12 = p.m12; m13 = p.m13; m14 = p.m14; m15 = p.m15;
  }

  @override
  MatrixD clone() => .new(
    originalPointer: originalPointer,
    m0: m0, m1: m1, m2: m2, m3: m3,
    m4: m4, m5: m5, m6: m6, m7: m7,
    m8: m8, m9: m9, m10: m10, m11: m11,
    m12: m12, m13: m13, m14: m14, m15: m15,
  );

  factory MatrixD.identity()
    => RaylibMatrixFactories.identity() as MatrixD;

  factory MatrixD.lookAt(Vector3D eye, Vector3D target, Vector3D up)
    => RaylibMatrixFactories.lookAt(eye, target, up) as MatrixD;

  factory MatrixD.scale(double x, double y, double z)
    => RaylibMatrixFactories.scale(x, y, z) as MatrixD;

  factory MatrixD.translate(num x, num y, num z)
    => RaylibMatrixFactories.translate(x, y, z) as MatrixD;
  
  factory MatrixD.translateVector3(Vector3D v)
    => RaylibMatrixFactories.translateVector3(v) as MatrixD;

  factory MatrixD.rotateAngle(Vector3D axis, double angle)
    => RaylibMatrixFactories.rotateAngle(axis, angle) as MatrixD;

  factory MatrixD.rotateXYZ(Vector3D angle)
    => RaylibMatrixFactories.rotateXYZ(angle) as MatrixD;

  factory MatrixD.rotateZYX(Vector3D angle)
    => RaylibMatrixFactories.rotateZYX(angle) as MatrixD;

  factory MatrixD.frustum(double left, double right, double bottom, double top, double nearPlane, double farPlane)
    => RaylibMatrixFactories.frustum(left, right, bottom, top, nearPlane, farPlane) as MatrixD;

  factory MatrixD.perspective(double fovY, double aspect, double nearPlane, double farPlane)
    => RaylibMatrixFactories.perspective(fovY, aspect, nearPlane, farPlane) as MatrixD;

  factory MatrixD.ortho(double left, double right, double bottom, double top, double nearPlane, double farPlane)
    => RaylibMatrixFactories.ortho(left, right, bottom, top, nearPlane, farPlane) as MatrixD;

  factory MatrixD.rotateX(double angle)
    => RaylibMatrixFactories.rotateX(angle) as MatrixD;

  factory MatrixD.rotateY(double angle)
    => RaylibMatrixFactories.rotateY(angle) as MatrixD;

  factory MatrixD.rotateZ(double angle)
    => RaylibMatrixFactories.rotateZ(angle) as MatrixD;

  factory MatrixD.fromQuaternion(QuaternionD q)
    => RaylibMatrixFactories.fromQuaternion(q) as MatrixD;
}