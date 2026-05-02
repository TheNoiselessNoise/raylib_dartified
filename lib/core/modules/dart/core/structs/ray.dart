part of '../../../../raylib.dart';

extension RayCPEx on Pointer<RayC> {
  Pointer<RayC> setC(RayC o) {
    ref.setC(o);
    return this;
  }

  Pointer<RayC> setD(RayD o) {
    ref.setD(o);
    return this;
  }

  RayD toD() => ref.toD(this);
}

extension RayCEx on RayC {
  RayC setC(RayC o) {
    position.setC(o.position);
    direction.setC(o.direction);
    return this;
  }

  RayC setD(RayD o) {
    position.setD(o.position);
    direction.setD(o.direction);
    return this;
  }

  RayD toD([Pointer<RayC>? ptr]) => .new(
    originalPointer: ptr,
    position: position.toD(),
    direction: direction.toD(),
  );
}

class RayD extends StructDLiteral<RayD, RayC> {
  Vector3D position;
  Vector3D direction;

  RayD({
    super.originalPointer,
    Vector3D? position,
    Vector3D? direction
  }) :
    position = position ?? .zero(),
    direction = direction ?? .zero();

  factory RayD.zero() => .new();

  @override
  RayD setC(RayC o) {
    position.setC(o.position);
    direction.setC(o.direction);
    return this;
  }

  @override
  RayD setD(RayD o) {
    originalPointer ??= o.originalPointer;
    position.setD(o.position);
    direction.setD(o.direction);
    return this;
  }

  @override
  Pointer<RayC> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => temp.Ray$.At(key, count);

  @override
  void allocateInto(RaylibTemp temp, Pointer<RayC> p, String key)
    => writeInto(p.ref);
  
  @override
  void writeInto(RayC p) {
    position.writeInto(p.position);
    direction.writeInto(p.direction);
  }

  @override
  String signature() => '$structName(position: $position, direction: $direction)';

  @override
  RayD clone() => .new(
    originalPointer: originalPointer,
    position: position.clone(),
    direction: direction.clone(),
  );
}