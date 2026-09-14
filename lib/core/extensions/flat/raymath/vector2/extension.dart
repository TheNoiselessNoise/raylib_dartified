part of '../../../../raylib_dartified.dart';

class RaylibVector2ExtFlat extends RaylibVector2FlatExt<Raylib> {
  RaylibVector2ExtFlat(super.rl);

  RaylibVector2Ext get _ffi => rl.module();

  @override
  Vector2D Vector2Zero() => rl.Temp.Vector2$.Extract1(
    (p) => _ffi.Vector2Zero().toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2One() => rl.Temp.Vector2$.Extract1(
    (p) => _ffi.Vector2One().toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2Add(
    Vector2D v1,
    Vector2D v2,
  ) => rl.Temp.Vector2$.Extract3(
    (p) => _ffi.Vector2Add(
      rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2AddValue(
    Vector2D v,
    double add,
  ) => rl.Temp.Vector2$.Extract2(
    (p) => _ffi.Vector2AddValue(
      rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
      add,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2Subtract(
    Vector2D v1,
    Vector2D v2,
  ) => rl.Temp.Vector2$.Extract3(
    (p) => _ffi.Vector2Subtract(
      rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2SubtractValue(
    Vector2D v,
    double sub,
  ) => rl.Temp.Vector2$.Extract2(
    (p) => _ffi.Vector2SubtractValue(
      rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
      sub,
    ).toDart(p.asNativePointer()),
  );

  @override
  double Vector2Length(
    Vector2D v,
  ) => _ffi.Vector2Length(
    rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
  );

  @override
  double Vector2LengthSqr(
    Vector2D v,
  ) => _ffi.Vector2LengthSqr(
    rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
  );

  @override
  double Vector2DotProduct(
    Vector2D v1,
    Vector2D v2,
  ) => _ffi.Vector2DotProduct(
    rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
  );

  @override
  double Vector2CrossProduct(
    Vector2D v1,
    Vector2D v2,
  ) => _ffi.Vector2CrossProduct(
    rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
  );

  @override
  double Vector2Distance(
    Vector2D v1,
    Vector2D v2,
  ) => _ffi.Vector2Distance(
    rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
  );

  @override
  double Vector2DistanceSqr(
    Vector2D v1,
    Vector2D v2,
  ) => _ffi.Vector2DistanceSqr(
    rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
  );

  @override
  double Vector2Angle(
    Vector2D v1,
    Vector2D v2,
  ) => _ffi.Vector2Angle(
    rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
  );

  @override
  double Vector2LineAngle(
    Vector2D start,
    Vector2D end,
  ) => _ffi.Vector2LineAngle(
    rl.Temp.Vector2$.Ref1(start).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(end).asNativePointer<Vector2C>().ref,
  );

  @override
  Vector2D Vector2Scale(
    Vector2D v,
    double scale,
  ) => rl.Temp.Vector2$.Extract2(
    (p) => _ffi.Vector2Scale(
      rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
      scale,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2Multiply(
    Vector2D v1,
    Vector2D v2,
  ) => rl.Temp.Vector2$.Extract3(
    (p) => _ffi.Vector2Multiply(
      rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2Negate(
    Vector2D v,
  ) => rl.Temp.Vector2$.Extract2(
    (p) => _ffi.Vector2Negate(
      rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2Divide(
    Vector2D v1,
    Vector2D v2,
  ) => rl.Temp.Vector2$.Extract3(
    (p) => _ffi.Vector2Divide(
      rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2Normalize(
    Vector2D v,
  ) => rl.Temp.Vector2$.Extract2(
    (p) => _ffi.Vector2Normalize(
      rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2Transform(
    Vector2D v,
    MatrixD mat,
  ) => rl.Temp.Vector2$.Extract2(
    (p) => _ffi.Vector2Transform(
      rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
      rl.Temp.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2Lerp(
    Vector2D v1,
    Vector2D v2,
    double amount,
  ) => rl.Temp.Vector2$.Extract3(
    (p) => _ffi.Vector2Lerp(
      rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
      amount,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2Reflect(
    Vector2D v,
    Vector2D normal,
  ) => rl.Temp.Vector2$.Extract3(
    (p) => _ffi.Vector2Reflect(
      rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(normal).asNativePointer<Vector2C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2Min(
    Vector2D v1,
    Vector2D v2,
  ) => rl.Temp.Vector2$.Extract3(
    (p) => _ffi.Vector2Min(
      rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2Max(
    Vector2D v1,
    Vector2D v2,
  ) => rl.Temp.Vector2$.Extract3(
    (p) => _ffi.Vector2Max(
      rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2Rotate(
    Vector2D v,
    double angle,
  ) => rl.Temp.Vector2$.Extract2(
    (p) => _ffi.Vector2Rotate(
      rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
      angle,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2MoveTowards(
    Vector2D v,
    Vector2D target,
    double maxDistance,
  ) => rl.Temp.Vector2$.Extract3(
    (p) => _ffi.Vector2MoveTowards(
      rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(target).asNativePointer<Vector2C>().ref,
      maxDistance,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2Invert(
    Vector2D v,
  ) => rl.Temp.Vector2$.Extract2(
    (p) => _ffi.Vector2Invert(
      rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2Clamp(
    Vector2D v,
    Vector2D min,
    Vector2D max,
  ) => rl.Temp.Vector2$.Extract4(
    (p) => _ffi.Vector2Clamp(
      rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(min).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref3(max).asNativePointer<Vector2C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D Vector2ClampValue(
    Vector2D v,
    double min,
    double max,
  ) => rl.Temp.Vector2$.Extract2(
    (p) => _ffi.Vector2ClampValue(
      rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
      min,
      max,
    ).toDart(p.asNativePointer()),
  );

  @override
  bool Vector2Equals(
    Vector2D p,
    Vector2D q,
  ) => _ffi.Vector2Equals(
    rl.Temp.Vector2$.Ref1(p).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(q).asNativePointer<Vector2C>().ref,
  );

  @override
  Vector2D Vector2Refract(
    Vector2D v,
    Vector2D n,
    double r,
  ) => rl.Temp.Vector2$.Extract3(
    (p) => _ffi.Vector2Refract(
      rl.Temp.Vector2$.Ref1(v).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(n).asNativePointer<Vector2C>().ref,
      r,
    ).toDart(p.asNativePointer()),
  );
}
