// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../../raylib.dart';

extension QuaternionCLike on QuaternionC {
  double distance(QuaternionC o) => math.sqrt(distanceSqr(o));
  double distanceSqr(QuaternionC o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y) + (z - o.z)*(z - o.z) + (w - o.w)*(w - o.w);
  double dotProduct(QuaternionC o) => x * o.x + y * o.y + z * o.z + w * o.w;
  double get length => math.sqrt(lengthSqr);
  double get lengthSqr => x * x + y * y + z * z + w * w;
  String format([int x0 = 0, int? y0, int? z0, int? w0])
    => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)}, ${z.toStringAsFixed(z0 ?? x0)}, ${w.toStringAsFixed(w0 ?? x0)} ]';
}

extension QuaternionDLike on QuaternionD {
  double distance(QuaternionD o) => math.sqrt(distanceSqr(o));
  double distanceSqr(QuaternionD o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y) + (z - o.z)*(z - o.z) + (w - o.w)*(w - o.w);
  double dotProduct(QuaternionD o) => x * o.x + y * o.y + z * o.z + w * o.w;
  double get length => math.sqrt(lengthSqr);
  double get lengthSqr => x * x + y * y + z * z + w * w;
  String format([int x0 = 0, int? y0, int? z0, int? w0])
    => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)}, ${z.toStringAsFixed(z0 ?? x0)}, ${w.toStringAsFixed(w0 ?? x0)} ]';
}

extension QuaternionCPEx on Pointer<QuaternionC> {
  Pointer<QuaternionC> setC(QuaternionC o) {
    ref.setC(o);
    return this;
  }

  Pointer<QuaternionC> setD(QuaternionD o) {
    ref.setD(o);
    return this;
  }

  Pointer<QuaternionC> set(num x, num y, num z, num w) {
    ref.set(x, y, z, w);
    return this;
  }

  QuaternionD toD() => ref.toD(this);

  Pointer<QuaternionC> add(Pointer<QuaternionC> o) { ref.add(o.ref); return this; }
  Pointer<QuaternionC> sub(Pointer<QuaternionC> o) { ref.sub(o.ref); return this; }
  Pointer<QuaternionC> scale(num o) { ref.scale(o); return this; }
  Pointer<QuaternionC> mul(Pointer<QuaternionC> o) { ref.mul(o.ref); return this; }
  Pointer<QuaternionC> divideBy(num o) { ref.divideBy(o); return this; }
  Pointer<QuaternionC> div(Pointer<QuaternionC> o) { ref.div(o.ref); return this; }

  double distance(Pointer<QuaternionC> o) => ref.distance(o.ref);
  double distanceSqr(Pointer<QuaternionC> o) => ref.distanceSqr(o.ref);
  double dotProduct(Pointer<QuaternionC> o) => ref.dotProduct(o.ref);
  double get length => ref.length;
  String format([int x0 = 0, int? y0, int? z0, int? w0]) => ref.format(x0, y0, z0, w0);
}

extension QuaternionCEx on QuaternionC {
  QuaternionC setC(QuaternionC o) => set(o.x, o.y, o.z, o.w);

  QuaternionC setD(QuaternionD o) => set(o.x, o.y, o.z, o.w);
  
  QuaternionC set(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
    return this;
  }

  QuaternionD toD([Pointer<QuaternionC>? ptr]) => .new(
    originalPointer: ptr,
    x: x,
    y: y,
    z: z,
    w: w,
  );

  QuaternionC add(QuaternionC o) => set(x + o.x, y + o.y, z + o.z, w + o.w);
  QuaternionC sub(QuaternionC o) => set(x - o.x, y - o.y, z - o.z, w - o.w);
  QuaternionC scale(num o) => set(x * o, y * o, z * o, z * w);
  QuaternionC mul(QuaternionC o) => set(x * o.x, y * o.y, z * o.z, w * o.w);
  QuaternionC divideBy(num o) => scale(1 / o);
  QuaternionC div(QuaternionC o) => set(x / o.x, y / o.y, z / o.z, w / o.w);
}

class QuaternionD extends StructDLiteral<QuaternionC, QuaternionD> with QuaternionBase {
  @override
  double x, y, z, w;

  QuaternionD({
    super.originalPointer,
    this.x = 0,
    this.y = 0,
    this.z = 0,
    this.w = 0,
  });

  factory QuaternionD.zero() => .new();
  factory QuaternionD.one() => .quat(1, 1, 1, 1);

  factory QuaternionD.quat(
    num x,
    num y,
    num z,
    num w,
  ) => .new(
    x: x.toDouble(),
    y: y.toDouble(),
    z: z.toDouble(),
    w: w.toDouble(),
  );

  @override
  QuaternionD setC(QuaternionC o) => set(o.x, o.y, o.z, o.w);

  @override
  QuaternionD setD(QuaternionD o) {
    originalPointer ??= o.originalPointer;
    return set(o.x, o.y, o.z, o.w);
  }

  QuaternionD set(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.Quaternion$;

  @override
  void nativeWriteInto(QuaternionC p) {
    p.x = x;
    p.y = y;
    p.z = z;
    p.w = w;
  }

  List<double> toArray() => [x, y, z, w];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, z: ${z.f1}, w: ${w.f1})';

  @override
  QuaternionD clone() => .new(
    originalPointer: originalPointer,
    x: x,
    y: y,
    z: z,
    w: w,
  );

  factory QuaternionD.identity() => .quat(0.0, 0.0, 0.0, 1.0);

  factory QuaternionD.fromVector3ToVector3(Vector3D from, Vector3D to) {
    final cross = from.crossProduct(to);
    return .quat(
      cross.x,
      cross.y,
      cross.z,
      1.0 + from.dotProduct(to),
    ).normalize();
  }

  QuaternionD add(QuaternionD o) => .quat(x + o.x, y + o.y, z + o.z, w + o.w);
  QuaternionD addValue(num value) => .quat(x + value, y + value, z + value, w + value);
  QuaternionD sub(QuaternionD o) => .quat(x - o.x, y - o.y, z - o.z, w - o.w);
  QuaternionD subValue(num value) => .quat(x - value, y - value, z - value, w - value);
  QuaternionD scale(num o) => .quat(x * o, y * o, z * o, z * w);
  QuaternionD mul(QuaternionD o) => .quat(
    x*o.w + w*o.x + y*o.z - z*o.y,
    y*o.w + w*o.y + z*o.x - x*o.z,
    z*o.w + w*o.z + x*o.y - y*o.x,
    w*o.w - x*o.x - y*o.y - z*o.z,
  );
  QuaternionD divideBy(num o) => scale(1 / o);
  QuaternionD div(QuaternionD o) => .quat(x / o.x, y / o.y, z / o.z, w / o.w);
  QuaternionD negate() => .quat(-x, -y, -z, -w);
  QuaternionD normalize() {
    double length = this.length;
    if (length == 0.0) length = 1.0;
    final ilength = 1.0/length;
    return .quat(
      x*ilength,
      y*ilength,
      z*ilength,
      w*ilength,
    );
  }
  QuaternionD min(QuaternionD o) => .quat(
    math.min(x, o.x),
    math.min(y, o.y),
    math.min(z, o.z),
    math.min(w, o.w),
  );
  QuaternionD max(QuaternionD o) => .quat(
    math.max(x, o.x),
    math.max(y, o.y),
    math.max(z, o.z),
    math.max(w, o.w),
  );
  QuaternionD lerp(QuaternionD o, double amount) => .quat(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
    z + amount*(o.z - z),
    w + amount*(o.w - w),
  );

  factory QuaternionD.fromMatrix(MatrixD mat) {
    final fourWSquaredMinus1 = mat.m0  + mat.m5 + mat.m10;
    final fourXSquaredMinus1 = mat.m0  - mat.m5 - mat.m10;
    final fourYSquaredMinus1 = mat.m5  - mat.m0 - mat.m10;
    final fourZSquaredMinus1 = mat.m10 - mat.m0 - mat.m5;

    int biggestIndex = 0;
    double fourBiggestSquaredMinus1 = fourWSquaredMinus1;
    if (fourXSquaredMinus1 > fourBiggestSquaredMinus1) {
      fourBiggestSquaredMinus1 = fourXSquaredMinus1;
      biggestIndex = 1;
    }

    if (fourYSquaredMinus1 > fourBiggestSquaredMinus1) {
      fourBiggestSquaredMinus1 = fourYSquaredMinus1;
      biggestIndex = 2;
    }

    if (fourZSquaredMinus1 > fourBiggestSquaredMinus1) {
      fourBiggestSquaredMinus1 = fourZSquaredMinus1;
      biggestIndex = 3;
    }

    final biggestVal = math.sqrt(fourBiggestSquaredMinus1 + 1.0)*0.5;
    final mult = 0.25/biggestVal;

    return switch (biggestIndex) {
      0 => .quat(
        biggestVal,
        (mat.m6 - mat.m9)*mult,
        (mat.m8 - mat.m2)*mult,
        (mat.m1 - mat.m4)*mult,
      ),
      1 => .quat(
        biggestVal,
        (mat.m6 - mat.m9)*mult,
        (mat.m1 + mat.m4)*mult,
        (mat.m8 + mat.m2)*mult,
      ),
      2 => .quat(
        biggestVal,
        (mat.m8 - mat.m2)*mult,
        (mat.m1 + mat.m4)*mult,
        (mat.m6 + mat.m9)*mult,
      ),
      3 => .quat(
        biggestVal,
        (mat.m1 - mat.m4)*mult,
        (mat.m8 + mat.m2)*mult,
        (mat.m6 + mat.m9)*mult,
      ),
      _ => .zero(),
    };
  }

  factory QuaternionD.fromEuler(double pitch, double yaw, double roll) {
    final x0 = math.cos(pitch*0.5);
    final x1 = math.sin(pitch*0.5);
    final y0 = math.cos(yaw*0.5);
    final y1 = math.sin(yaw*0.5);
    final z0 = math.cos(roll*0.5);
    final z1 = math.sin(roll*0.5);

    return .quat(
      x1*y0*z0 - x0*y1*z1,
      x0*y1*z0 + x1*y0*z1,
      x0*y0*z1 - x1*y1*z0,
      x0*y0*z0 + x1*y1*z1,
    );
  }

  factory QuaternionD.fromAxisAngle(Vector3D axis, double angle)
  {
    QuaternionD result = .quat(0, 0, 0, 1);

    if (axis.length != 0.0)
    {
      angle *= 0.5;

      axis = axis.normalize();

      final sinres = math.sin(angle);
      final cosres = math.cos(angle);

      return .quat(
        axis.x*sinres,
        axis.y*sinres,
        axis.z*sinres,
        cosres,
      ).normalize();
    }

    return result;
  }

  QuaternionD invert() {
    final lengthSq = x*x + y*y + z*z + w*w;

    if (lengthSq != 0.0) {
      final invLength = 1.0/lengthSq;

      return .quat(
        x * -invLength,
        y * -invLength,
        z * -invLength,
        w * invLength,
      );
    }

    return this;
  }

  QuaternionD nLerp(QuaternionD o, double amount)
    => lerp(o, amount).normalize();

  QuaternionD sLerp(QuaternionD o, double amount) {
    double cosHalfTheta = x*o.x + y*o.y + z*o.z + w*o.w;

    if (cosHalfTheta < 0)
    {
      o = .quat(-o.x, -o.y, -o.z, -o.w);
      cosHalfTheta = -cosHalfTheta;
    }

    if (cosHalfTheta.abs() >= 1.0) return this;
    else if (cosHalfTheta > 0.95) return nLerp(o, amount);
    else
    {
      final halfTheta = math.acos(cosHalfTheta);
      final sinHalfTheta = math.sqrt(1.0 - cosHalfTheta*cosHalfTheta);

      if (sinHalfTheta.abs() < Raylib.instance.EPSILON)
      {
        return .quat(
          x*0.5 + o.x*0.5,
          y*0.5 + o.y*0.5,
          z*0.5 + o.z*0.5,
          w*0.5 + o.w*0.5,
        );
      }
      else
      {
        final ratioA = math.sin((1 - amount)*halfTheta)/sinHalfTheta;
        final ratioB = math.sin(amount*halfTheta)/sinHalfTheta;

        return .quat(
          x*ratioA + o.x*ratioB,
          y*ratioA + o.y*ratioB,
          z*ratioA + o.z*ratioB,
          w*ratioA + o.w*ratioB,
        );
      }
    }
  }

  QuaternionD cubicHermiteSpline(
    QuaternionD outTangent1,
    QuaternionD q2,
    QuaternionD inTangent2,
    double t,
  ) {
    final t2 = t*t;
    final t3 = t2*t;
    final h00 = 2*t3 - 3*t2 + 1;
    final h10 = t3 - 2*t2 + t;
    final h01 = -2*t3 + 3*t2;
    final h11 = t3 - t2;

    QuaternionD p0 = scale(h00);
    QuaternionD m0 = outTangent1.scale(h10);
    QuaternionD p1 = q2.scale(h01);
    QuaternionD m1 = inTangent2.scale(h11);

    return p0.add(m0).add(p1).add(m1).normalize();
  }

  MatrixD toMatrix() {
    MatrixD result = .identity();

    final a2 = x*x;
    final b2 = y*y;
    final c2 = z*z;
    final ac = x*z;
    final ab = x*y;
    final bc = y*z;
    final ad = w*x;
    final bd = w*y;
    final cd = w*z;

    result.m0 = 1 - 2*(b2 + c2);
    result.m1 = 2*(ab + cd);
    result.m2 = 2*(ac - bd);

    result.m4 = 2*(ab - cd);
    result.m5 = 1 - 2*(a2 + c2);
    result.m6 = 2*(bc + ad);

    result.m8 = 2*(ac + bd);
    result.m9 = 2*(bc - ad);
    result.m10 = 1 - 2*(a2 + b2);

    return result;
  }

  (Vector3D outAxis, double outAngle) toAxisAngle() {
    final q = w.abs() > 1.0 ? normalize() : this;

    Vector3D resAxis = .zero();
    final resAngle = 2.0*math.acos(q.w);
    final den = math.sqrt(1.0 - q.w*q.w);

    if (den > Raylib.instance.EPSILON) {
      resAxis.x = q.x/den;
      resAxis.y = q.y/den;
      resAxis.z = q.z/den;
    } else {
      // This occurs when the angle is zero.
      // Not a problem: just set an arbitrary normalized axis.
      resAxis.x = 1.0;
    }

    return (resAxis, resAngle);
  }

  Vector3D toEuler() {
    // Roll (x-axis rotation)
    final x0 = 2.0*(w*x + y*z);
    final x1 = 1.0 - 2.0*(x*x + y*y);

    // Pitch (y-axis rotation)
    double y0 = 2.0*(w*y - z*x);
    y0 = y0 > 1.0 ? 1.0 : y0;
    y0 = y0 < -1.0 ? -1.0 : y0;

    // Yaw (z-axis rotation)
    final z0 = 2.0*(w*z + x*y);
    final z1 = 1.0 - 2.0*(y*y + z*z);

    return .vec3(
      math.atan2(x0, x1),
      math.asin(y0),
      math.atan2(z0, z1),
    );
  }

  QuaternionD transform(MatrixD mat) => .quat(
    mat.m0*x + mat.m4*y + mat.m8*z + mat.m12*w,
    mat.m1*x + mat.m5*y + mat.m9*z + mat.m13*w,
    mat.m2*x + mat.m6*y + mat.m10*z + mat.m14*w,
    mat.m3*x + mat.m7*y + mat.m11*z + mat.m15*w,
  );

  bool equals(QuaternionD o) => (
    (((x - o.x).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs())))) &&
    (((z - o.z).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((z).abs(), (o.z).abs())))) &&
    (((w - o.w).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((w).abs(), (o.w).abs()))))
  ) || (
    (((x + o.x).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y + o.y).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs())))) &&
    (((z + o.z).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((z).abs(), (o.z).abs())))) &&
    (((w + o.w).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((w).abs(), (o.w).abs()))))
  );

  Vector4D toVector4() => .fromQuaternion(this);
  factory QuaternionD.fromVector4(Vector4D v) => .new(
    x: v.x,
    y: v.y,
    z: v.z,
    w: v.w,
  );
}