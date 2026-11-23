part of '../../../../backend.dart';

final class RaylibVector4FlatExtNative extends RaylibVector4FlatExt {
  RaylibVector4FlatExtNative(super.pkg);

  RaylibVector4Ext get _ffi => pkg.module();

  @override
  Vector4 Vector4Zero() => Vector4$.Extract(
    (p) => _ffi.Vector4Zero().toDart(p.asNative()),
  );

  @override
  Vector4 Vector4One() => Vector4$.Extract(
    (p) => _ffi.Vector4One().toDart(p.asNative()),
  );

  @override
  Vector4 Vector4Add(
    Vector4 v1,
    Vector4 v2,
  ) => Vector4$.Extract(
    (p) => _ffi.Vector4Add(
      Vector4$.Ref1(v1).asNative<Vector4C>().ref,
      Vector4$.Ref2(v2).asNative<Vector4C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector4 Vector4AddValue(
    Vector4 v,
    double add,
  ) => Vector4$.Extract(
    (p) => _ffi.Vector4AddValue(
      Vector4$.Ref1(v).asNative<Vector4C>().ref,
      add,
    ).toDart(p.asNative()),
  );

  @override
  Vector4 Vector4Subtract(
    Vector4 v1,
    Vector4 v2,
  ) => Vector4$.Extract(
    (p) => _ffi.Vector4Subtract(
      Vector4$.Ref1(v1).asNative<Vector4C>().ref,
      Vector4$.Ref2(v2).asNative<Vector4C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector4 Vector4SubtractValue(
    Vector4 v,
    double add,
  ) => Vector4$.Extract(
    (p) => _ffi.Vector4SubtractValue(
      Vector4$.Ref1(v).asNative<Vector4C>().ref,
      add,
    ).toDart(p.asNative()),
  );

  @override
  double Vector4Length(
    Vector4 v,
  ) => _ffi.Vector4Length(
    Vector4$.Ref1(v).asNative<Vector4C>().ref,
  );

  @override
  double Vector4LengthSqr(
    Vector4 v,
  ) => _ffi.Vector4LengthSqr(
    Vector4$.Ref1(v).asNative<Vector4C>().ref,
  );

  @override
  double Vector4DotProduct(
    Vector4 v1,
    Vector4 v2,
  ) => _ffi.Vector4DotProduct(
    Vector4$.Ref1(v1).asNative<Vector4C>().ref,
    Vector4$.Ref2(v2).asNative<Vector4C>().ref,
  );

  @override
  double Vector4Distance(
    Vector4 v1,
    Vector4 v2,
  ) => _ffi.Vector4Distance(
    Vector4$.Ref1(v1).asNative<Vector4C>().ref,
    Vector4$.Ref2(v2).asNative<Vector4C>().ref,
  );

  @override
  double Vector4DistanceSqr(
    Vector4 v1,
    Vector4 v2,
  ) => _ffi.Vector4DistanceSqr(
    Vector4$.Ref1(v1).asNative<Vector4C>().ref,
    Vector4$.Ref2(v2).asNative<Vector4C>().ref,
  );

  @override
  Vector4 Vector4Scale(
    Vector4 v,
    double scale,
  ) => Vector4$.Extract(
    (p) => _ffi.Vector4Scale(
      Vector4$.Ref1(v).asNative<Vector4C>().ref,
      scale,
    ).toDart(p.asNative()),
  );

  @override
  Vector4 Vector4Multiply(
    Vector4 v1,
    Vector4 v2,
  ) => Vector4$.Extract(
    (p) => _ffi.Vector4Multiply(
      Vector4$.Ref1(v1).asNative<Vector4C>().ref,
      Vector4$.Ref2(v2).asNative<Vector4C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector4 Vector4Negate(
    Vector4 v,
  ) => Vector4$.Extract(
    (p) => _ffi.Vector4Negate(
      Vector4$.Ref1(v).asNative<Vector4C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector4 Vector4Divide(
    Vector4 v1,
    Vector4 v2,
  ) => Vector4$.Extract(
    (p) => _ffi.Vector4Divide(
      Vector4$.Ref1(v1).asNative<Vector4C>().ref,
      Vector4$.Ref2(v2).asNative<Vector4C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector4 Vector4Normalize(
    Vector4 v,
  ) => Vector4$.Extract(
    (p) => _ffi.Vector4Normalize(
      Vector4$.Ref1(v).asNative<Vector4C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector4 Vector4Min(
    Vector4 v1,
    Vector4 v2,
  ) => Vector4$.Extract(
    (p) => _ffi.Vector4Min(
      Vector4$.Ref1(v1).asNative<Vector4C>().ref,
      Vector4$.Ref2(v2).asNative<Vector4C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector4 Vector4Max(
    Vector4 v1,
    Vector4 v2,
  ) => Vector4$.Extract(
    (p) => _ffi.Vector4Max(
      Vector4$.Ref1(v1).asNative<Vector4C>().ref,
      Vector4$.Ref2(v2).asNative<Vector4C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector4 Vector4Lerp(
    Vector4 v1,
    Vector4 v2,
    double amount,
  ) => Vector4$.Extract(
    (p) => _ffi.Vector4Lerp(
      Vector4$.Ref1(v1).asNative<Vector4C>().ref,
      Vector4$.Ref2(v2).asNative<Vector4C>().ref,
      amount,
    ).toDart(p.asNative()),
  );

  @override
  Vector4 Vector4MoveTowards(
    Vector4 v,
    Vector4 target,
    double maxDistance,
  ) => Vector4$.Extract(
    (p) => _ffi.Vector4MoveTowards(
      Vector4$.Ref1(v).asNative<Vector4C>().ref,
      Vector4$.Ref2(target).asNative<Vector4C>().ref,
      maxDistance,
    ).toDart(p.asNative()),
  );

  @override
  Vector4 Vector4Invert(
    Vector4 v,
  ) => Vector4$.Extract(
    (p) => _ffi.Vector4Invert(
      Vector4$.Ref1(v).asNative<Vector4C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  bool Vector4Equals(
    Vector4 p,
    Vector4 q,
  ) => _ffi.Vector4Equals(
    Vector4$.Ref1(p).asNative<Vector4C>().ref,
    Vector4$.Ref2(q).asNative<Vector4C>().ref,
  );
}
