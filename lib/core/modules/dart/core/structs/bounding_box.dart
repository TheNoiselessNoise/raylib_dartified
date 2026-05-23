part of '../../../../raylib_dartified.dart';

extension BoundingBoxCPEx on Pointer<BoundingBoxC> {
  Pointer<BoundingBoxC> setC(BoundingBoxC o) { ref.setC(o); return this; }
  Pointer<BoundingBoxC> setD(BoundingBoxD o) { ref.setD(o); return this; }
  BoundingBoxD toD() => ref.toD(this);
}

extension BoundingBoxCEx on BoundingBoxC {
  BoundingBoxC setC(BoundingBoxC o) {
    min.setC(o.min);
    max.setC(o.max);
    return this;
  }

  BoundingBoxC setD(BoundingBoxD o) {
    min.setD(o.min);
    max.setD(o.max);
    return this;
  }

  BoundingBoxD toD([Pointer<BoundingBoxC>? ptr]) => .new(
    originalPointer: ptr,
    min: min.toD(),
    max: max.toD(),
  );
}

class BoundingBoxD extends StructDLiteral<BoundingBoxC, BoundingBoxD> with BoundingBoxBase<
  BoundingBoxD,
  Vector3D,
  MatrixD,
  QuaternionD,
  Vector4D
> {
  @override
  Vector3D min;
  
  @override
  Vector3D max;

  BoundingBoxD({
    super.originalPointer,
    Vector3D? min,
    Vector3D? max,
  }) :
    min = min ?? .zero(),
    max = max ?? .zero();

  factory BoundingBoxD.zero() => .new();

  factory BoundingBoxD.bbox(
    Vector3D min,
    Vector3D max,
  ) => .new(min: min, max: max);

  @override
  BoundingBoxD setD(BoundingBoxD o) {
    min.setD(o.min);
    max.setD(o.max);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<BoundingBoxC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<BoundingBoxC> p, int index) => p[index];
  
  @override
  void nativeWriteInto(BoundingBoxC p) {
    min.nativeWriteInto(p.min);
    max.nativeWriteInto(p.max);
  }

  @override
  void nativeReadFrom(BoundingBoxC p) {
    min.nativeReadFrom(p.min);
    max.nativeReadFrom(p.max);
  }

  @override
  BoundingBoxD clone() => .new(
    originalPointer: originalPointer,
    min: min.clone(),
    max: max.clone(),
  );
}