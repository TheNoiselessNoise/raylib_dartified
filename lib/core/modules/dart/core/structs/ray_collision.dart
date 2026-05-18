part of '../../../../raylib_dartified.dart';

extension RayCollisionCPEx on Pointer<RayCollisionC> {
  Pointer<RayCollisionC> setC(RayCollisionC o) { ref.setC(o); return this; }
  Pointer<RayCollisionC> setD(RayCollisionD o) { ref.setD(o); return this; }
  RayCollisionD toD() => ref.toD(this);
}

extension RayCollisionCEx on RayCollisionC {
  RayCollisionC setC(RayCollisionC o) {
    hit = o.hit;
    distance = o.distance;
    point.setC(o.point);
    normal.setC(o.normal);
    return this;
  }

  RayCollisionC setD(RayCollisionD o) {
    hit = o.hit;
    distance = o.distance;
    point.setD(o.point);
    normal.setD(o.normal);
    return this;
  }

  RayCollisionD toD([Pointer<RayCollisionC>? ptr]) => .new(
    originalPointer: ptr,
    hit: hit,
    distance: distance,
    point: point.toD(),
    normal: normal.toD()
  );
}

class RayCollisionD extends StructDLiteral<RayCollisionC, RayCollisionD> with RayCollisionBase<
  RayCollisionD,
  Vector3D,
  MatrixD,
  QuaternionD,
  Vector4D
> {
  @override
  bool hit;

  @override
  double distance;

  @override
  Vector3D point;

  @override
  Vector3D normal;

  RayCollisionD({
    super.originalPointer,
    this.hit = false,
    this.distance = 0,
    Vector3D? point,
    Vector3D? normal
  }) :
    point = point ?? .zero(),
    normal = normal ?? .zero();

  factory RayCollisionD.zero() => .new();

  @override
  RayCollisionD setC(RayCollisionC o) {
    hit = o.hit;
    distance = o.distance;
    point.setC(o.point);
    normal.setC(o.normal);
    return this;
  }

  @override
  RayCollisionD setD(RayCollisionD o) {
    hit = o.hit;
    distance = o.distance;
    point.setD(o.point);
    normal.setD(o.normal);
    return this;
  }

  @override
  getReference(Pointer<RayCollisionC> p) => p.ref;

  @override
  void nativeWriteInto(RayCollisionC p) {
    p.hit = hit;
    p.distance = distance;
    point.nativeWriteInto(p.point);
    normal.nativeWriteInto(p.normal);
  }

  @override
  RayCollisionD clone() => .new(
    originalPointer: originalPointer,
    hit: hit,
    distance: distance,
    point: point.clone(),
    normal: normal.clone()
  );
}