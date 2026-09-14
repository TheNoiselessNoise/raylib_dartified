part of '../../../../raylib_dartified.dart';

class RaylibVector4ExtFlat extends RaylibVector4FlatExt<Raylib> {
  RaylibVector4ExtFlat(super.rl);

  RaylibVector4Ext get _ffi => rl.module();

  @override
  Vector4D Vector4Zero() => rl.Temp.Vector4$.Extract1(
    (p) => _ffi.Vector4Zero().toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4One() => rl.Temp.Vector4$.Extract1(
    (p) => _ffi.Vector4One().toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Add(
    Vector4D v1,
    Vector4D v2,
  ) => rl.Temp.Vector4$.Extract3(
    (p) => _ffi.Vector4Add(
      rl.Temp.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
      rl.Temp.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4AddValue(
    Vector4D v,
    double add,
  ) => rl.Temp.Vector4$.Extract3(
    (p) => _ffi.Vector4AddValue(
      rl.Temp.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
      add,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Subtract(
    Vector4D v1,
    Vector4D v2,
  ) => rl.Temp.Vector4$.Extract3(
    (p) => _ffi.Vector4Subtract(
      rl.Temp.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
      rl.Temp.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4SubtractValue(
    Vector4D v,
    double add,
  ) => rl.Temp.Vector4$.Extract3(
    (p) => _ffi.Vector4SubtractValue(
      rl.Temp.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
      add,
    ).toDart(p.asNativePointer()),
  );

  @override
  double Vector4Length(
    Vector4D v,
  ) => _ffi.Vector4Length(
    rl.Temp.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
  );

  @override
  double Vector4LengthSqr(
    Vector4D v,
  ) => _ffi.Vector4LengthSqr(
    rl.Temp.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
  );

  @override
  double Vector4DotProduct(
    Vector4D v1,
    Vector4D v2,
  ) => _ffi.Vector4DotProduct(
    rl.Temp.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
    rl.Temp.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
  );

  @override
  double Vector4Distance(
    Vector4D v1,
    Vector4D v2,
  ) => _ffi.Vector4Distance(
    rl.Temp.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
    rl.Temp.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
  );

  @override
  double Vector4DistanceSqr(
    Vector4D v1,
    Vector4D v2,
  ) => _ffi.Vector4DistanceSqr(
    rl.Temp.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
    rl.Temp.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
  );

  @override
  Vector4D Vector4Scale(
    Vector4D v,
    double scale,
  ) => rl.Temp.Vector4$.Extract2(
    (p) => _ffi.Vector4Scale(
      rl.Temp.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
      scale,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Multiply(
    Vector4D v1,
    Vector4D v2,
  ) => rl.Temp.Vector4$.Extract3(
    (p) => _ffi.Vector4Multiply(
      rl.Temp.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
      rl.Temp.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Negate(
    Vector4D v,
  ) => rl.Temp.Vector4$.Extract2(
    (p) => _ffi.Vector4Negate(
      rl.Temp.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Divide(
    Vector4D v1,
    Vector4D v2,
  ) => rl.Temp.Vector4$.Extract3(
    (p) => _ffi.Vector4Divide(
      rl.Temp.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
      rl.Temp.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Normalize(
    Vector4D v,
  ) => rl.Temp.Vector4$.Extract2(
    (p) => _ffi.Vector4Normalize(
      rl.Temp.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Min(
    Vector4D v1,
    Vector4D v2,
  ) => rl.Temp.Vector4$.Extract3(
    (p) => _ffi.Vector4Min(
      rl.Temp.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
      rl.Temp.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Max(
    Vector4D v1,
    Vector4D v2,
  ) => rl.Temp.Vector4$.Extract3(
    (p) => _ffi.Vector4Max(
      rl.Temp.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
      rl.Temp.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Lerp(
    Vector4D v1,
    Vector4D v2,
    double amount,
  ) => rl.Temp.Vector4$.Extract3(
    (p) => _ffi.Vector4Lerp(
      rl.Temp.Vector4$.Ref1(v1).asNativePointer<Vector4C>().ref,
      rl.Temp.Vector4$.Ref2(v2).asNativePointer<Vector4C>().ref,
      amount,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4MoveTowards(
    Vector4D v,
    Vector4D target,
    double maxDistance,
  ) => rl.Temp.Vector4$.Extract3(
    (p) => _ffi.Vector4MoveTowards(
      rl.Temp.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
      rl.Temp.Vector4$.Ref2(target).asNativePointer<Vector4C>().ref,
      maxDistance,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector4D Vector4Invert(
    Vector4D v,
  ) => rl.Temp.Vector4$.Extract2(
    (p) => _ffi.Vector4Invert(
      rl.Temp.Vector4$.Ref1(v).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  bool Vector4Equals(
    Vector4D p,
    Vector4D q,
  ) => _ffi.Vector4Equals(
    rl.Temp.Vector4$.Ref1(p).asNativePointer<Vector4C>().ref,
    rl.Temp.Vector4$.Ref2(q).asNativePointer<Vector4C>().ref,
  );
}
