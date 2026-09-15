part of '../../../../raylib_dartified.dart';

class RaylibVector4ExtFlat extends RaylibVector4FlatExt<Raylib> {
  RaylibVector4ExtFlat(super.rl);

  RaylibVector4Ext get _ffi => rl.module();

  @override
  Vector4D Vector4Zero() => $.Vector4$.Extract1(
    (p) => _ffi.Vector4Zero().toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4One() => $.Vector4$.Extract1(
    (p) => _ffi.Vector4One().toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Add(
    Vector4D v1,
    Vector4D v2,
  ) => $.Vector4$.Extract3(
    (p) => _ffi.Vector4Add(
      $.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
      $.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4AddValue(
    Vector4D v,
    double add,
  ) => $.Vector4$.Extract3(
    (p) => _ffi.Vector4AddValue(
      $.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
      add,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Subtract(
    Vector4D v1,
    Vector4D v2,
  ) => $.Vector4$.Extract3(
    (p) => _ffi.Vector4Subtract(
      $.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
      $.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4SubtractValue(
    Vector4D v,
    double add,
  ) => $.Vector4$.Extract3(
    (p) => _ffi.Vector4SubtractValue(
      $.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
      add,
    ).toDart(p.asNativePointer()),
  );

  @override
  double Vector4Length(
    Vector4D v,
  ) => _ffi.Vector4Length(
    $.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
  );

  @override
  double Vector4LengthSqr(
    Vector4D v,
  ) => _ffi.Vector4LengthSqr(
    $.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
  );

  @override
  double Vector4DotProduct(
    Vector4D v1,
    Vector4D v2,
  ) => _ffi.Vector4DotProduct(
    $.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
    $.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
  );

  @override
  double Vector4Distance(
    Vector4D v1,
    Vector4D v2,
  ) => _ffi.Vector4Distance(
    $.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
    $.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
  );

  @override
  double Vector4DistanceSqr(
    Vector4D v1,
    Vector4D v2,
  ) => _ffi.Vector4DistanceSqr(
    $.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
    $.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
  );

  @override
  Vector4D Vector4Scale(
    Vector4D v,
    double scale,
  ) => $.Vector4$.Extract2(
    (p) => _ffi.Vector4Scale(
      $.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
      scale,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Multiply(
    Vector4D v1,
    Vector4D v2,
  ) => $.Vector4$.Extract3(
    (p) => _ffi.Vector4Multiply(
      $.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
      $.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Negate(
    Vector4D v,
  ) => $.Vector4$.Extract2(
    (p) => _ffi.Vector4Negate(
      $.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Divide(
    Vector4D v1,
    Vector4D v2,
  ) => $.Vector4$.Extract3(
    (p) => _ffi.Vector4Divide(
      $.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
      $.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Normalize(
    Vector4D v,
  ) => $.Vector4$.Extract2(
    (p) => _ffi.Vector4Normalize(
      $.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Min(
    Vector4D v1,
    Vector4D v2,
  ) => $.Vector4$.Extract3(
    (p) => _ffi.Vector4Min(
      $.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
      $.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Max(
    Vector4D v1,
    Vector4D v2,
  ) => $.Vector4$.Extract3(
    (p) => _ffi.Vector4Max(
      $.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
      $.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Lerp(
    Vector4D v1,
    Vector4D v2,
    double amount,
  ) => $.Vector4$.Extract3(
    (p) => _ffi.Vector4Lerp(
      $.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
      $.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
      amount,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4MoveTowards(
    Vector4D v,
    Vector4D target,
    double maxDistance,
  ) => $.Vector4$.Extract3(
    (p) => _ffi.Vector4MoveTowards(
      $.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
      $.Vector4$.Ref2(target).asNativePointer<Vector4C>().ref,
      maxDistance,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Invert(
    Vector4D v,
  ) => $.Vector4$.Extract2(
    (p) => _ffi.Vector4Invert(
      $.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  bool Vector4Equals(
    Vector4D p,
    Vector4D q,
  ) => _ffi.Vector4Equals(
    $.Vector4$.Ref1(p).asNativePointer<Vector4C>().ref,
    $.Vector4$.Ref2(q).asNativePointer<Vector4C>().ref,
  );
}
