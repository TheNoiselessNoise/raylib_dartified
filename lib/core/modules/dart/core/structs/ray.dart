part of '../../../../raylib_dartified.dart';

extension RayCPEx on Pointer<RayC> {
  Pointer<RayC> setC(RayC o) { ref.setC(o); return this; }
  Pointer<RayC> setD(RayD o) { ref.setD(o); return this; }
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

class RayD extends StructDLiteral<RayC, RayD> with RayBase<
  RayD,
  Vector3D,
  MatrixD,
  QuaternionD,
  Vector4D
> {
  @override
  Vector3D position;

  @override
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
  RayD setD(RayD o) {
    position.setD(o.position);
    direction.setD(o.direction);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<RayC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<RayC> p, int index) => p[index];

  @override
  void nativeWriteInto(RayC p) {
    position.nativeWriteInto(p.position);
    direction.nativeWriteInto(p.direction);
  }

  @override
  void nativeReadFrom(RayC p) {
    position.nativeReadFrom(p.position);
    direction.nativeReadFrom(p.direction);
  }

  @override
  RayD clone() => .new(
    originalPointer: originalPointer,
    position: position.clone(),
    direction: direction.clone(),
  );
}