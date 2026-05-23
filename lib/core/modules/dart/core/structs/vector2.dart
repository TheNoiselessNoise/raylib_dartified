// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../../raylib_dartified.dart';

extension Vector2CPEx on Pointer<Vector2C> {
  Pointer<Vector2C> setC(Vector2C o) { ref.setC(o); return this; }
  Pointer<Vector2C> setD(Vector2D o) { ref.setD(o); return this; }
  Pointer<Vector2C> set(num x, num y) { ref.set(x, y); return this; }
  Vector2D toD() => ref.toD(this);
}

extension Vector2CEx on Vector2C {
  Vector2C setC(Vector2C o) => set(o.x, o.y);

  Vector2C setD(Vector2D o) => set(o.x, o.y);

  Vector2C set(num x, num y) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    return this;
  }

  Vector2D toD([Pointer<Vector2C>? ptr]) => .new(
    originalPointer: ptr,
    x: x,
    y: y,
  );
}

class Vector2D extends StructDLiteral<Vector2C, Vector2D> with Vector2Base<
  Vector2D,
  MatrixD,
  Vector3D,
  QuaternionD,
  Vector4D
> {
  @override
  double x, y;

  Vector2D({
    super.originalPointer,
    this.x = 0,
    this.y = 0,
  });

  factory Vector2D.zero() => .new();
  factory Vector2D.one() => .vec2(1, 1);

  factory Vector2D.vec2(
    num x,
    num y,
  ) => .new(
    x: x.toDouble(),
    y: y.toDouble(),
  );

  @override
  Vector2D setD(Vector2D o) => set(o.x, o.y);
  
  @override
  nativeGetIndexedReference(Pointer<Vector2C> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<Vector2C> p, int index) => p[index];

  @override
  void nativeWriteInto(Vector2C p) {
    p.x = x;
    p.y = y;
  }

  @override
  void nativeReadFrom(Vector2C p) {
    x = p.x;
    y = p.y;
  }

  @override
  Vector2D clone() => .new(
    originalPointer: originalPointer,
    x: x,
    y: y,
  );
}