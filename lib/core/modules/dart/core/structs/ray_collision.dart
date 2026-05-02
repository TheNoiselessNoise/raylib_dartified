part of '../../../../raylib.dart';

extension RayCollisionCPEx on Pointer<RayCollisionC> {
  Pointer<RayCollisionC> setC(RayCollisionC o) {
    ref.setC(o);
    return this;
  }
  
  Pointer<RayCollisionC> setD(RayCollisionD o) {
    ref.setD(o);
    return this;
  }

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

class RayCollisionD extends StructDLiteral<RayCollisionD, RayCollisionC> {
  bool hit;
  double distance;
  Vector3D point;
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
    originalPointer ??= o.originalPointer;
    hit = o.hit;
    distance = o.distance;
    point.setD(o.point);
    normal.setD(o.normal);
    return this;
  }

  @override
  Pointer<RayCollisionC> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => temp.RayCollision$.At(key, count);

  @override
  void allocateInto(RaylibTemp temp, Pointer<RayCollisionC> p, String key)
    => writeInto(p.ref);

  @override
  void writeInto(RayCollisionC p) {
    p.hit = hit;
    p.distance = distance;
    point.writeInto(p.point);
    normal.writeInto(p.normal);
  }

  @override
  String signature() => '$structName(hit: $hit, distance: $distance, point: $point, normal: $normal)';

  @override
  RayCollisionD clone() => .new(
    originalPointer: originalPointer,
    hit: hit,
    distance: distance,
    point: point.clone(),
    normal: normal.clone()
  );
}