part of '../../../../raylib_dartified_web.dart';

class RaylibVector4ExtFlatWeb extends RaylibVector4FlatExt<Raylib> {
  RaylibVector4ExtFlatWeb(super.rl);

  RaylibVector4Ext get _wasm => rl.module();

  @override
  Vector4 Vector4Zero() => Vector4$.Extract(
    (p) => _wasm.Vector4Zero(
      p.toJS,
    ),
  );

  @override
  Vector4 Vector4One() => Vector4$.Extract(
    (p) => _wasm.Vector4One(
      p.toJS,
    ),
  );

  @override
  Vector4 Vector4Add(
    Vector4 v1,
    Vector4 v2,
  ) => Vector4$.Extract(
    (p) => _wasm.Vector4Add(
      p.toJS,
      Vector4$.Ref1(v1).toJS,
      Vector4$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector4 Vector4AddValue(
    Vector4 v,
    double add,
  ) => Vector4$.Extract(
    (p) => _wasm.Vector4AddValue(
      p.toJS,
      Vector4$.Ref1(v).toJS,
      add.toJS,
    ),
  );

  @override
  Vector4 Vector4Subtract(
    Vector4 v1,
    Vector4 v2,
  ) => Vector4$.Extract(
    (p) => _wasm.Vector4Subtract(
      p.toJS,
      Vector4$.Ref1(v1).toJS,
      Vector4$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector4 Vector4SubtractValue(
    Vector4 v,
    double add,
  ) => Vector4$.Extract(
    (p) => _wasm.Vector4SubtractValue(
      p.toJS,
      Vector4$.Ref1(v).toJS,
      add.toJS,
    ),
  );

  @override
  double Vector4Length(
    Vector4 v,
  ) => _wasm.Vector4Length(
    Vector4$.Ref1(v).toJS,
  );

  @override
  double Vector4LengthSqr(
    Vector4 v,
  ) => _wasm.Vector4LengthSqr(
    Vector4$.Ref1(v).toJS,
  );

  @override
  double Vector4DotProduct(
    Vector4 v1,
    Vector4 v2,
  ) => _wasm.Vector4DotProduct(
    Vector4$.Ref1(v1).toJS,
    Vector4$.Ref2(v2).toJS,
  );

  @override
  double Vector4Distance(
    Vector4 v1,
    Vector4 v2,
  ) => _wasm.Vector4Distance(
    Vector4$.Ref1(v1).toJS,
    Vector4$.Ref2(v2).toJS,
  );

  @override
  double Vector4DistanceSqr(
    Vector4 v1,
    Vector4 v2,
  ) => _wasm.Vector4DistanceSqr(
    Vector4$.Ref1(v1).toJS,
    Vector4$.Ref2(v2).toJS,
  );

  @override
  Vector4 Vector4Scale(
    Vector4 v,
    double scale,
  ) => Vector4$.Extract(
    (p) => _wasm.Vector4Scale(
      p.toJS,
      Vector4$.Ref1(v).toJS,
      scale.toJS,
    ),
  );

  @override
  Vector4 Vector4Multiply(
    Vector4 v1,
    Vector4 v2,
  ) => Vector4$.Extract(
    (p) => _wasm.Vector4Multiply(
      p.toJS,
      Vector4$.Ref1(v1).toJS,
      Vector4$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector4 Vector4Negate(
    Vector4 v,
  ) => Vector4$.Extract(
    (p) => _wasm.Vector4Negate(
      p.toJS,
      Vector4$.Ref1(v).toJS,
    ),
  );

  @override
  Vector4 Vector4Divide(
    Vector4 v1,
    Vector4 v2,
  ) => Vector4$.Extract(
    (p) => _wasm.Vector4Divide(
      p.toJS,
      Vector4$.Ref1(v1).toJS,
      Vector4$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector4 Vector4Normalize(
    Vector4 v,
  ) => Vector4$.Extract(
    (p) => _wasm.Vector4Normalize(
      p.toJS,
      Vector4$.Ref1(v).toJS,
    ),
  );

  @override
  Vector4 Vector4Min(
    Vector4 v1,
    Vector4 v2,
  ) => Vector4$.Extract(
    (p) => _wasm.Vector4Min(
      p.toJS,
      Vector4$.Ref1(v1).toJS,
      Vector4$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector4 Vector4Max(
    Vector4 v1,
    Vector4 v2,
  ) => Vector4$.Extract(
    (p) => _wasm.Vector4Max(
      p.toJS,
      Vector4$.Ref1(v1).toJS,
      Vector4$.Ref2(v2).toJS,
    ),
  );

  @override
  Vector4 Vector4Lerp(
    Vector4 v1,
    Vector4 v2,
    double amount,
  ) => Vector4$.Extract(
    (p) => _wasm.Vector4Lerp(
      p.toJS,
      Vector4$.Ref1(v1).toJS,
      Vector4$.Ref2(v2).toJS,
      amount.toJS,
    ),
  );

  @override
  Vector4 Vector4MoveTowards(
    Vector4 v,
    Vector4 target,
    double maxDistance,
  ) => Vector4$.Extract(
    (p) => _wasm.Vector4MoveTowards(
      p.toJS,
      Vector4$.Ref1(v).toJS,
      Vector4$.Ref2(target).toJS,
      maxDistance.toJS,
    ),
  );

  @override
  Vector4 Vector4Invert(
    Vector4 v,
  ) => Vector4$.Extract(
    (p) => _wasm.Vector4Invert(
      p.toJS,
      Vector4$.Ref1(v).toJS,
    ),
  );

  @override
  bool Vector4Equals(
    Vector4 p,
    Vector4 q,
  ) => _wasm.Vector4Equals(
    Vector4$.Ref1(p).toJS,
    Vector4$.Ref2(q).toJS,
  );
}
