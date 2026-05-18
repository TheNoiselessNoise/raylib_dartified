// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../../raylib_dartified.dart';

extension Vector3CPEx on Pointer<Vector3C> {
  Pointer<Vector3C> setC(Vector3C o) { ref.setC(o); return this; }
  Pointer<Vector3C> setD(Vector3D o) { ref.setD(o); return this; }
  Pointer<Vector3C> set(num x, num y, num z) { ref.set(x, y, z); return this; }
  Vector3D toD() => ref.toD(this);
}

extension Vector3CEx on Vector3C {
  Vector3C setC(Vector3C o) => set(o.x, o.y, o.z);

  Vector3C setD(Vector3D o) => set(o.x, o.y, o.z);
  
  Vector3C set(num x, num y, num z) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    return this;
  }

  Vector3D toD([Pointer<Vector3C>? ptr]) => .new(
    originalPointer: ptr,
    x: x,
    y: y,
    z: z,
  );
}

class Vector3D extends StructDLiteral<Vector3C, Vector3D> with Vector3Base<
  Vector3D,
  MatrixD,
  QuaternionD,
  Vector4D
> {
  @override
  double x, y, z;

  Vector3D({
    super.originalPointer,
    this.x = 0,
    this.y = 0,
    this.z = 0,
  });

  factory Vector3D.zero() => .new();
  factory Vector3D.one() => .vec3(1, 1, 1);

  factory Vector3D.vec3(
    num x,
    num y,
    num z,
  ) => .new(
    x: x.toDouble(),
    y: y.toDouble(),
    z: z.toDouble(),
  );

  @override
  Vector3D setC(Vector3C o) => set(o.x, o.y, o.z);

  @override
  Vector3D setD(Vector3D o) => set(o.x, o.y, o.z);

  @override
  getReference(Pointer<Vector3C> p) => p.ref;

  @override
  void nativeWriteInto(Vector3C p) {
    p.x = x;
    p.y = y;
    p.z = z;
  }

  @override
  Vector3D clone() => .new(
    originalPointer: originalPointer,
    x: x,
    y: y,
    z: z,
  );

  factory Vector3D.vec3Normalized(num x, num y, num z)
    => RaylibVector3Factories.normalized(x, y, z) as Vector3D;

  factory Vector3D.perpendicular(Vector3D o)
    => RaylibVector3Factories.perpendicular(o) as Vector3D;

  factory Vector3D.barycenter(Vector3D p, Vector3D a, Vector3D b, Vector3D c)
    => RaylibVector3Factories.barycenter(p, a, b, c) as Vector3D;
}