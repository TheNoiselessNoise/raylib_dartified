part of '../../../../raylib_dartified_web.dart';

final class RaylibVector2ExtFlatWeb extends RaylibVector2FlatExt<Raylib> {
  RaylibVector2ExtFlatWeb(super.rl);

  RaylibVector2Ext get _wasm => rl.module();

  @override
  Vector2 Vector2Zero() => Vector2$.Extract(
    (p) => _wasm.Vector2Zero(
      p.toJS,
    ),
  );

  @override
  Vector2 Vector2One() => Vector2$.Extract(
    (p) => _wasm.Vector2One(
      p.toJS,
    ),
  );

  @override
  Vector2 Vector2Add(
    Vector2 v1,
    Vector2 v2,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Add(
      p.toJS,
      Vector2$.Ref1(v1).toJS,
      Vector2$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector2 Vector2AddValue(
    Vector2 v,
    double add,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2AddValue(
      p.toJS,
      Vector2$.Ref1(v).toJS,
      add.toJS,
    ),
  );

  @override
  Vector2 Vector2Subtract(
    Vector2 v1,
    Vector2 v2,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Subtract(
      p.toJS,
      Vector2$.Ref1(v1).toJS,
      Vector2$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector2 Vector2SubtractValue(
    Vector2 v,
    double sub,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2SubtractValue(
      p.toJS,
      Vector2$.Ref1(v).toJS,
      sub.toJS,
    ),
  );

  @override
  double Vector2Length(
    Vector2 v,
  ) => _wasm.Vector2Length(
    Vector2$.Ref1(v).toJS,
  );

  @override
  double Vector2LengthSqr(
    Vector2 v,
  ) => _wasm.Vector2LengthSqr(
    Vector2$.Ref1(v).toJS,
  );

  @override
  double Vector2DotProduct(
    Vector2 v1,
    Vector2 v2,
  ) => _wasm.Vector2DotProduct(
    Vector2$.Ref1(v1).toJS,
    Vector2$.Ref2(v2).toJS,
  );

  @override
  double Vector2CrossProduct(
    Vector2 v1,
    Vector2 v2,
  ) => _wasm.Vector2CrossProduct(
    Vector2$.Ref1(v1).toJS,
    Vector2$.Ref2(v2).toJS,
  );

  @override
  double Vector2Distance(
    Vector2 v1,
    Vector2 v2,
  ) => _wasm.Vector2Distance(
    Vector2$.Ref1(v1).toJS,
    Vector2$.Ref2(v2).toJS,
  );

  @override
  double Vector2DistanceSqr(
    Vector2 v1,
    Vector2 v2,
  ) => _wasm.Vector2DistanceSqr(
    Vector2$.Ref1(v1).toJS,
    Vector2$.Ref2(v2).toJS,
  );

  @override
  double Vector2Angle(
    Vector2 v1,
    Vector2 v2,
  ) => _wasm.Vector2Angle(
    Vector2$.Ref1(v1).toJS,
    Vector2$.Ref2(v2).toJS,
  );

  @override
  double Vector2LineAngle(
    Vector2 start,
    Vector2 end,
  ) => _wasm.Vector2LineAngle(
    Vector2$.Ref1(start).toJS,
    Vector2$.Ref2(end).toJS,
  );

  @override
  Vector2 Vector2Scale(
    Vector2 v,
    double scale,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Scale(
      p.toJS,
      Vector2$.Ref1(v).toJS,
      scale.toJS,
    ),
  );

  @override
  Vector2 Vector2Multiply(
    Vector2 v1,
    Vector2 v2,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Multiply(
      p.toJS,
      Vector2$.Ref1(v1).toJS,
      Vector2$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector2 Vector2Negate(
    Vector2 v,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Negate(
      p.toJS,
      Vector2$.Ref1(v).toJS,
    ),
  );

  @override
  Vector2 Vector2Divide(
    Vector2 v1,
    Vector2 v2,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Divide(
      p.toJS,
      Vector2$.Ref1(v1).toJS,
      Vector2$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector2 Vector2Normalize(
    Vector2 v,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Normalize(
      p.toJS,
      Vector2$.Ref1(v).toJS,
    ),
  );

  @override
  Vector2 Vector2Transform(
    Vector2 v,
    Matrix mat,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Transform(
      p.toJS,
      Vector2$.Ref1(v).toJS,
      Matrix$.Ref1(mat).toJS,
    ),
  );

  @override
  Vector2 Vector2Lerp(
    Vector2 v1,
    Vector2 v2,
    double amount,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Lerp(
      p.toJS,
      Vector2$.Ref1(v1).toJS,
      Vector2$.Ref2(v2).toJS,
      amount.toJS,
    ),
  );

  @override
  Vector2 Vector2Reflect(
    Vector2 v,
    Vector2 normal,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Reflect(
      p.toJS,
      Vector2$.Ref1(v).toJS,
      Vector2$.Ref2(normal).toJS,
    ),
  );

  @override
  Vector2 Vector2Min(
    Vector2 v1,
    Vector2 v2,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Min(
      p.toJS,
      Vector2$.Ref1(v1).toJS,
      Vector2$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector2 Vector2Max(
    Vector2 v1,
    Vector2 v2,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Max(
      p.toJS,
      Vector2$.Ref1(v1).toJS,
      Vector2$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector2 Vector2Rotate(
    Vector2 v,
    double angle,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Rotate(
      p.toJS,
      Vector2$.Ref1(v).toJS,
      angle.toJS,
    ),
  );

  @override
  Vector2 Vector2MoveTowards(
    Vector2 v,
    Vector2 target,
    double maxDistance,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2MoveTowards(
      p.toJS,
      Vector2$.Ref1(v).toJS,
      Vector2$.Ref2(target).toJS,
      maxDistance.toJS,
    ),
  );

  @override
  Vector2 Vector2Invert(
    Vector2 v,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Invert(
      p.toJS,
      Vector2$.Ref1(v).toJS,
    ),
  );

  @override
  Vector2 Vector2Clamp(
    Vector2 v,
    Vector2 min,
    Vector2 max,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Clamp(
      p.toJS,
      Vector2$.Ref1(v).toJS,
      Vector2$.Ref2(min).toJS,
      Vector2$.Ref3(max).toJS,
    ),
  );

  @override
  Vector2 Vector2ClampValue(
    Vector2 v,
    double min,
    double max,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2ClampValue(
      p.toJS,
      Vector2$.Ref1(v).toJS,
      min.toJS,
      max.toJS,
    ),
  );

  @override
  bool Vector2Equals(
    Vector2 p,
    Vector2 q,
  ) => _wasm.Vector2Equals(
    Vector2$.Ref1(p).toJS,
    Vector2$.Ref2(q).toJS,
  );

  @override
  Vector2 Vector2Refract(
    Vector2 v,
    Vector2 n,
    double r,
  ) => Vector2$.Extract(
    (p) => _wasm.Vector2Refract(
      p.toJS,
      Vector2$.Ref1(v).toJS,
      Vector2$.Ref2(n).toJS,
      r.toJS,
    ),
  );
}
