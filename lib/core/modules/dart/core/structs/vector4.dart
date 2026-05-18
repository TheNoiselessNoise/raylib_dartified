// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../../raylib_dartified.dart';

extension Vector4CPEx on Pointer<Vector4C> {
  Pointer<Vector4C> setC(Vector4C o) { ref.setC(o); return this; }
  Pointer<Vector4C> setD(Vector4D o) { ref.setD(o); return this; }
  Pointer<Vector4C> set(num x, num y, num z, num w) { ref.set(x, y, z, w); return this; }
  Vector4D toD() => ref.toD(this);
}

extension Vector4CEx on Vector4C {
  Vector4C setC(Vector4C o) => set(o.x, o.y, o.z, o.w);

  Vector4C setD(Vector4D o) => set(o.x, o.y, o.z, o.w);

  Vector4C set(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
    return this;
  }

  Vector4D toD([Pointer<Vector4C>? ptr]) => .new(
    originalPointer: ptr,
    x: x,
    y: y,
    z: z,
    w: w,
  );
}

class Vector4D extends StructDLiteral<Vector4C, Vector4D> with Vector4Base<
  Vector4D,
  QuaternionD,
  MatrixD,
  Vector3D
> {
  @override
  double x, y, z, w;

  Vector4D({
    super.originalPointer,
    this.x = 0,
    this.y = 0,
    this.z = 0,
    this.w = 0,
  });

  factory Vector4D.zero() => .new();
  factory Vector4D.one() => .vec4(1, 1, 1, 1);

  factory Vector4D.vec4(
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
  Vector4D setC(Vector4C o) => set(o.x, o.y, o.z, o.w);

  @override
  Vector4D setD(Vector4D o) => set(o.x, o.y, o.z, o.w);

  @override
  getReference(Pointer<Vector4C> p) => p.ref;

  @override
  void nativeWriteInto(Vector4C p) {
    p.x = x;
    p.y = y;
    p.z = z;
    p.w = w;
  }

  @override
  Vector4D clone() => .new(
    originalPointer: originalPointer,
    x: x,
    y: y,
    z: z,
    w: w,
  );

  factory Vector4D.colorNormalize(ColorD color)
    => RaylibVector4Factories.colorNormalize(color) as Vector4D;

  factory Vector4D.fromAxisAngle(Vector3D axis, double angle)
    => RaylibVector4Factories.fromAxisAngle(axis, angle) as Vector4D;

  factory Vector4D.fromQuaternion(QuaternionD q)
    => RaylibVector4Factories.fromQuaternion(q) as Vector4D;
}
