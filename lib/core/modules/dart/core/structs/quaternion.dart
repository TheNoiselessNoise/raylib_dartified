// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../../raylib_dartified.dart';

extension QuaternionCPEx on Pointer<QuaternionC> {
  Pointer<QuaternionC> setC(QuaternionC o) { ref.setC(o); return this; }
  Pointer<QuaternionC> setD(QuaternionD o) { ref.setD(o); return this; }
  Pointer<QuaternionC> set(num x, num y, num z, num w) {
    ref.set(x, y, z, w);
    return this;
  }
  QuaternionD toD() => ref.toD(this);
}

extension QuaternionCEx on QuaternionC {
  QuaternionC setC(QuaternionC o) => set(o.x, o.y, o.z, o.w);

  QuaternionC setD(QuaternionD o) => set(o.x, o.y, o.z, o.w);
  
  QuaternionC set(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
    return this;
  }

  QuaternionD toD([Pointer<QuaternionC>? ptr]) => .new(
    originalPointer: ptr,
    x: x,
    y: y,
    z: z,
    w: w,
  );
}

class QuaternionD extends StructDLiteral<QuaternionC, QuaternionD> with QuaternionBase<
  QuaternionD,
  MatrixD,
  Vector3D,
  Vector4D
> {
  @override
  double x, y, z, w;

  QuaternionD({
    super.originalPointer,
    this.x = 0,
    this.y = 0,
    this.z = 0,
    this.w = 0,
  });

  factory QuaternionD.zero() => .new();
  factory QuaternionD.one() => .quat(1, 1, 1, 1);

  factory QuaternionD.quat(
    num x,
    num y,
    num z,
    num w,
  ) => .new(
    x: x.toDouble(),
    y: y.toDouble(),
    z: z.toDouble(),
    w: w.toDouble(),
  );

  @override
  QuaternionD setC(QuaternionC o) => set(o.x, o.y, o.z, o.w);

  @override
  QuaternionD setD(QuaternionD o) {
    return set(o.x, o.y, o.z, o.w);
  }

  @override
  getReference(Pointer<QuaternionC> p) => p.ref;

  @override
  void nativeWriteInto(QuaternionC p) {
    p.x = x;
    p.y = y;
    p.z = z;
    p.w = w;
  }

  @override
  QuaternionD clone() => .new(
    originalPointer: originalPointer,
    x: x,
    y: y,
    z: z,
    w: w,
  );

  factory QuaternionD.identity()
    => RaylibQuaternionFactories.identity() as QuaternionD;

  factory QuaternionD.fromVector3ToVector3(Vector3D from, Vector3D to)
    => RaylibQuaternionFactories.fromVector3ToVector3(from, to) as QuaternionD;

  factory QuaternionD.fromMatrix(MatrixD mat)
    => RaylibQuaternionFactories.fromMatrix(mat) as QuaternionD;

  factory QuaternionD.fromEuler(double pitch, double yaw, double roll)
    => RaylibQuaternionFactories.fromEuler(pitch, yaw, roll) as QuaternionD;

  factory QuaternionD.fromAxisAngle(Vector3D axis, double angle)
    => RaylibQuaternionFactories.fromAxisAngle(axis, angle) as QuaternionD;

  factory QuaternionD.fromVector4(Vector4D v)
    => RaylibQuaternionFactories.fromVector4(v) as QuaternionD;
}