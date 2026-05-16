part of '../../../../raylib.dart';

extension BoundingBoxCPEx on Pointer<BoundingBoxC> {
  Pointer<BoundingBoxC> setC(BoundingBoxC o) {
    ref.setC(o);
    return this;
  }
  
  Pointer<BoundingBoxC> setD(BoundingBoxD o) {
    ref.setD(o);
    return this;
  }

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

class BoundingBoxD extends StructDLiteral<BoundingBoxD, BoundingBoxC> with BoundingBoxBase {
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
  BoundingBoxD setC(BoundingBoxC o) {
    min.setC(o.min);
    max.setC(o.max);
    return this;
  }

  @override
  BoundingBoxD setD(BoundingBoxD o) {
    originalPointer ??= o.originalPointer;
    min.setD(o.min);
    max.setD(o.max);
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.BoundingBox$;
  
  @override
  void nativeWriteInto(BoundingBoxC p) {
    min.nativeWriteInto(p.min);
    max.nativeWriteInto(p.max);
  }

  @override
  String signature() => '$structName(min: $min, max: $max)';
  
  @override
  BoundingBoxD clone() => .new(
    originalPointer: originalPointer,
    min: min.clone(),
    max: max.clone(),
  );
}