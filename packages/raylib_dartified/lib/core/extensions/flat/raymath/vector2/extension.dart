part of '../../../../raylib_dartified.dart';

final class RaylibVector2ExtFlatNative extends RaylibVector2FlatExt<Raylib> {
  RaylibVector2ExtFlatNative(super.rl);

  RaylibVector2Ext get _ffi => rl.module();

  @override
  Vector2 Vector2Zero() => Vector2$.Extract(
    (p) => _ffi.Vector2Zero().toDart(p.asNative()),
  );

  @override
  Vector2 Vector2One() => Vector2$.Extract(
    (p) => _ffi.Vector2One().toDart(p.asNative()),
  );

  @override
  Vector2 Vector2Add(
    Vector2 v1,
    Vector2 v2,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Add(
      Vector2$.Ref1(v1).asNative<Vector2C>().ref,
      Vector2$.Ref2(v2).asNative<Vector2C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2AddValue(
    Vector2 v,
    double add,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2AddValue(
      Vector2$.Ref1(v).asNative<Vector2C>().ref,
      add,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2Subtract(
    Vector2 v1,
    Vector2 v2,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Subtract(
      Vector2$.Ref1(v1).asNative<Vector2C>().ref,
      Vector2$.Ref2(v2).asNative<Vector2C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2SubtractValue(
    Vector2 v,
    double sub,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2SubtractValue(
      Vector2$.Ref1(v).asNative<Vector2C>().ref,
      sub,
    ).toDart(p.asNative()),
  );

  @override
  double Vector2Length(
    Vector2 v,
  ) => _ffi.Vector2Length(
    Vector2$.Ref1(v).asNative<Vector2C>().ref,
  );

  @override
  double Vector2LengthSqr(
    Vector2 v,
  ) => _ffi.Vector2LengthSqr(
    Vector2$.Ref1(v).asNative<Vector2C>().ref,
  );

  @override
  double Vector2DotProduct(
    Vector2 v1,
    Vector2 v2,
  ) => _ffi.Vector2DotProduct(
    Vector2$.Ref1(v1).asNative<Vector2C>().ref,
    Vector2$.Ref2(v2).asNative<Vector2C>().ref,
  );

  @override
  double Vector2CrossProduct(
    Vector2 v1,
    Vector2 v2,
  ) => _ffi.Vector2CrossProduct(
    Vector2$.Ref1(v1).asNative<Vector2C>().ref,
    Vector2$.Ref2(v2).asNative<Vector2C>().ref,
  );

  @override
  double Vector2Distance(
    Vector2 v1,
    Vector2 v2,
  ) => _ffi.Vector2Distance(
    Vector2$.Ref1(v1).asNative<Vector2C>().ref,
    Vector2$.Ref2(v2).asNative<Vector2C>().ref,
  );

  @override
  double Vector2DistanceSqr(
    Vector2 v1,
    Vector2 v2,
  ) => _ffi.Vector2DistanceSqr(
    Vector2$.Ref1(v1).asNative<Vector2C>().ref,
    Vector2$.Ref2(v2).asNative<Vector2C>().ref,
  );

  @override
  double Vector2Angle(
    Vector2 v1,
    Vector2 v2,
  ) => _ffi.Vector2Angle(
    Vector2$.Ref1(v1).asNative<Vector2C>().ref,
    Vector2$.Ref2(v2).asNative<Vector2C>().ref,
  );

  @override
  double Vector2LineAngle(
    Vector2 start,
    Vector2 end,
  ) => _ffi.Vector2LineAngle(
    Vector2$.Ref1(start).asNative<Vector2C>().ref,
    Vector2$.Ref2(end).asNative<Vector2C>().ref,
  );

  @override
  Vector2 Vector2Scale(
    Vector2 v,
    double scale,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Scale(
      Vector2$.Ref1(v).asNative<Vector2C>().ref,
      scale,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2Multiply(
    Vector2 v1,
    Vector2 v2,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Multiply(
      Vector2$.Ref1(v1).asNative<Vector2C>().ref,
      Vector2$.Ref2(v2).asNative<Vector2C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2Negate(
    Vector2 v,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Negate(
      Vector2$.Ref1(v).asNative<Vector2C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2Divide(
    Vector2 v1,
    Vector2 v2,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Divide(
      Vector2$.Ref1(v1).asNative<Vector2C>().ref,
      Vector2$.Ref2(v2).asNative<Vector2C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2Normalize(
    Vector2 v,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Normalize(
      Vector2$.Ref1(v).asNative<Vector2C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2Transform(
    Vector2 v,
    Matrix mat,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Transform(
      Vector2$.Ref1(v).asNative<Vector2C>().ref,
      Matrix$.Ref1(mat).asNative<MatrixC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2Lerp(
    Vector2 v1,
    Vector2 v2,
    double amount,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Lerp(
      Vector2$.Ref1(v1).asNative<Vector2C>().ref,
      Vector2$.Ref2(v2).asNative<Vector2C>().ref,
      amount,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2Reflect(
    Vector2 v,
    Vector2 normal,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Reflect(
      Vector2$.Ref1(v).asNative<Vector2C>().ref,
      Vector2$.Ref2(normal).asNative<Vector2C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2Min(
    Vector2 v1,
    Vector2 v2,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Min(
      Vector2$.Ref1(v1).asNative<Vector2C>().ref,
      Vector2$.Ref2(v2).asNative<Vector2C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2Max(
    Vector2 v1,
    Vector2 v2,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Max(
      Vector2$.Ref1(v1).asNative<Vector2C>().ref,
      Vector2$.Ref2(v2).asNative<Vector2C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2Rotate(
    Vector2 v,
    double angle,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Rotate(
      Vector2$.Ref1(v).asNative<Vector2C>().ref,
      angle,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2MoveTowards(
    Vector2 v,
    Vector2 target,
    double maxDistance,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2MoveTowards(
      Vector2$.Ref1(v).asNative<Vector2C>().ref,
      Vector2$.Ref2(target).asNative<Vector2C>().ref,
      maxDistance,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2Invert(
    Vector2 v,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Invert(
      Vector2$.Ref1(v).asNative<Vector2C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2Clamp(
    Vector2 v,
    Vector2 min,
    Vector2 max,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Clamp(
      Vector2$.Ref1(v).asNative<Vector2C>().ref,
      Vector2$.Ref2(min).asNative<Vector2C>().ref,
      Vector2$.Ref3(max).asNative<Vector2C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 Vector2ClampValue(
    Vector2 v,
    double min,
    double max,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2ClampValue(
      Vector2$.Ref1(v).asNative<Vector2C>().ref,
      min,
      max,
    ).toDart(p.asNative()),
  );

  @override
  bool Vector2Equals(
    Vector2 p,
    Vector2 q,
  ) => _ffi.Vector2Equals(
    Vector2$.Ref1(p).asNative<Vector2C>().ref,
    Vector2$.Ref2(q).asNative<Vector2C>().ref,
  );

  @override
  Vector2 Vector2Refract(
    Vector2 v,
    Vector2 n,
    double r,
  ) => Vector2$.Extract(
    (p) => _ffi.Vector2Refract(
      Vector2$.Ref1(v).asNative<Vector2C>().ref,
      Vector2$.Ref2(n).asNative<Vector2C>().ref,
      r,
    ).toDart(p.asNative()),
  );
}
