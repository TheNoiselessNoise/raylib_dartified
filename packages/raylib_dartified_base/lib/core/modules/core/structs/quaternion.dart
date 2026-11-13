// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

enum QuaternionField with XFields {
  x,
  y,
  z,
  w,
}

/// Quaternion, 4 components
/// 
/// A unit quaternion representing a 3D rotation as `xi + yj + zk + w`.
class Quaternion extends XStruct<Quaternion> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructType<Quaternion> struct = .createValue(
    factory: Quaternion.new,
    layout: .aligned<QuaternionField>({
      .x: XFloat(), // Imaginary i component
      .y: XFloat(), // Imaginary j component
      .z: XFloat(), // Imaginary k component
      .w: XFloat(), // Real (scalar) component
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<QuaternionField> _l = struct.layoutOf();

  /// Field descriptor for [x].
  static final field_x = _l.float<XFloat>(.x);
  /// Field descriptor for [y].
  static final field_y = _l.float<XFloat>(.y);
  /// Field descriptor for [z].
  static final field_z = _l.float<XFloat>(.z);
  /// Field descriptor for [w].
  static final field_w = _l.float<XFloat>(.w);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  double _x;
  /// Imaginary i component
  double get x => _x = field_x.readOr(op, _x);
  set x(double value) => _x = field_x.writeOr(op, value);

  double _y;
  /// Imaginary j component
  double get y => _y = field_y.readOr(op, _y);
  set y(double value) => _y = field_y.writeOr(op, value);

  double _z;
  /// Imaginary k component
  double get z => _z = field_z.readOr(op, _z);
  set z(double value) => _z = field_z.writeOr(op, value);

  double _w;
  /// Real (scalar) component
  double get w => _w = field_w.readOr(op, _w);
  set w(double value) => _w = field_w.writeOr(op, value);

  Quaternion({
    super.op,
    double x = 0,
    double y = 0,
    double z = 0,
    double w = 0,
  }) :
    _x = x,
    _y = y,
    _z = z,
    _w = w;

  factory Quaternion.zero() => .new();

  factory Quaternion.quat(
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
  Quaternion setDart(Quaternion o) => set(o.x, o.y, o.z, o.w);

  @override
  void structWriteInto(XPtr p) {
    field_x.write(p, x);
    field_y.write(p, y);
    field_z.write(p, z);
    field_w.write(p, w);
  }

  @override
  void structReadFrom(XPtr p) {
    x = field_x.read(p);
    y = field_y.read(p);
    z = field_z.read(p);
    w = field_w.read(p);
  }

  /// Returns the identity quaternion `(0, 0, 0, 1)`.
  factory Quaternion.identity() => .quat(0.0, 0.0, 0.0, 1.0);

  /// Returns the shortest-arc quaternion rotating [from] to [to].
  factory Quaternion.fromVector3ToVector3(Vector3 from, Vector3 to) {
    final cross = from.crossProduct(to);
    return .quat(
      cross.x,
      cross.y,
      cross.z,
      1.0 + from.dotProduct(to),
    ).normalize();
  }

  /// Returns the quaternion equivalent of rotation matrix [mat].
  factory Quaternion.fromMatrix(Matrix mat) {
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

  /// Returns a quaternion from [pitch], [yaw], [roll] Euler angles (in radians).
  factory Quaternion.fromEuler(double pitch, double yaw, double roll) {
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

  /// Returns a quaternion representing a rotation of [angle] radians around [axis].
  factory Quaternion.fromAxisAngle(Vector3 axis, double angle)
  {
    Quaternion result = .identity();

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

  /// Returns a quaternion from the raw XYZW components of [v].
  factory Quaternion.fromVector4(Vector4 v) => .quat(
    v.x,
    v.y,
    v.z,
    v.w,
  );

  /// Sets all components at once.
  /// 
  /// Values are converted using [num.toDouble].
  Quaternion set(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
    return this;
  }

  /// Euclidean distance between this quaternion and [o] in 4D space.
  double distance(Quaternion o) => math.sqrt(distanceSqr(o));

  /// Squared Euclidean distance between this quaternion and [o].
  ///
  /// Prefer over [distance] when only relative comparison is needed.
  double distanceSqr(Quaternion o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y) + (z - o.z)*(z - o.z) + (w - o.w)*(w - o.w);

  /// Dot product of this quaternion and [o].
  double dotProduct(Quaternion o) => x * o.x + y * o.y + z * o.z + w * o.w;

  /// Euclidean length (magnitude) of this quaternion.
  double get length => math.sqrt(lengthSqr);

  /// Squared length of this quaternion.
  ///
  /// Prefer over [length] when only relative comparison is needed.
  double get lengthSqr => x * x + y * y + z * z + w * w;

  /// Returns a formatted string representation of this quaternion.
  ///
  /// [x0] sets the default precision for all components; individual overrides
  /// can be provided via [y0], [z0], and [w0].
  ///
  /// Example: `[ <x>, <y>, <z>, <w> ]`
  String format([int x0 = 0, int? y0, int? z0, int? w0]) =>
    '[ '
      '${x.toStringAsFixed(x0)}, '
      '${y.toStringAsFixed(y0 ?? x0)}, '
      '${z.toStringAsFixed(z0 ?? x0)}, '
      '${w.toStringAsFixed(w0 ?? x0)} '
    ']';

  /// Returns a new quaternion that is the component-wise sum of this and [o].
  Quaternion add(Quaternion o) => .quat(x + o.x, y + o.y, z + o.z, w + o.w);

  /// Returns a new quaternion with [value] added to each component.
  Quaternion addValue(num value) => .quat(x + value, y + value, z + value, w + value);

  /// Returns a new quaternion that is the component-wise difference of this and [o].
  Quaternion sub(Quaternion o) => .quat(x - o.x, y - o.y, z - o.z, w - o.w);

  /// Returns a new quaternion with [value] subtracted from each component.
  Quaternion subValue(num value) => .quat(x - value, y - value, z - value, w - value);

  /// Returns a new quaternion with all components scaled by [o].
  Quaternion scale(num o) => .quat(x * o, y * o, z * o, w * o);

  /// Returns the Hamilton product of this quaternion and [o].
  ///
  /// Not commutative: `a.mul(b) != b.mul(a)`.
  Quaternion mul(Quaternion o) => .quat(
    x*o.w + w*o.x + y*o.z - z*o.y,
    y*o.w + w*o.y + z*o.x - x*o.z,
    z*o.w + w*o.z + x*o.y - y*o.x,
    w*o.w - x*o.x - y*o.y - z*o.z,
  );

  /// Returns a new quaternion with all components divided by [o].
  Quaternion divideBy(num o) => scale(1 / o);

  /// Returns a new quaternion that is the component-wise quotient of this and [o].
  Quaternion div(Quaternion o) => .quat(x / o.x, y / o.y, z / o.z, w / o.w);

  /// Returns a new quaternion with all components negated.
  Quaternion negate() => .quat(-x, -y, -z, -w);

  /// Returns a normalized (unit-length) copy of this quaternion.
  ///
  /// If [length] is zero, treats it as 1 to avoid division by zero.
  Quaternion normalize() {
    double length = this.length;
    if (length == 0.0) length = 1.0;
    final ilength = 1.0/length;
    return .quat(x*ilength, y*ilength, z*ilength, w*ilength);
  }

  /// Returns a new quaternion with each component being the component-wise minimum of this and [o].
  Quaternion min(Quaternion o) => .quat(
    math.min(x, o.x),
    math.min(y, o.y),
    math.min(z, o.z),
    math.min(w, o.w),
  );

  /// Returns a new quaternion with each component being the component-wise maximum of this and [o].
  Quaternion max(Quaternion o) => .quat(
    math.max(x, o.x),
    math.max(y, o.y),
    math.max(z, o.z),
    math.max(w, o.w),
  );

  /// Linear interpolation between this and [o] by [amount] (component-wise).
  ///
  /// [amount] should be in the range `[0.0, 1.0]`.
  Quaternion lerp(Quaternion o, double amount) => .quat(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
    z + amount*(o.z - z),
    w + amount*(o.w - w),
  );

  /// Returns the inverse (conjugate divided by squared length) of this quaternion.
  ///
  /// Returns `this` unchanged if the squared length is zero.
  Quaternion invert() {
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

  /// Normalized linear interpolation between this and [o] by [amount].
  ///
  /// Faster than [sLerp] but does not maintain constant angular velocity.
  Quaternion nLerp(Quaternion o, double amount) => lerp(o, amount).normalize();

  /// Spherical linear interpolation between this and [o] by [amount].
  ///
  /// Maintains constant angular velocity along the shortest arc.
  /// Falls back to [nLerp] when the quaternions are nearly parallel
  /// (cosine > 0.95), and to a simple average when `sinHalfTheta` is
  /// near zero.
  ///
  /// [amount] should be in the range `[0.0, 1.0]`.
  Quaternion sLerp(Quaternion o, double amount) {
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

      if (sinHalfTheta.abs() < RaylibConstants.EPSILON)
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

  /// Interpolates along a cubic Hermite spline between this and [q2].
  ///
  /// [outTangent1] is the outgoing tangent at this point,
  /// [inTangent2] is the incoming tangent at [q2],
  /// [t] is the interpolation parameter in `[0.0, 1.0]`.
  ///
  /// Result is normalized.
  Quaternion cubicHermiteSpline(
    Quaternion outTangent1,
    Quaternion q2,
    Quaternion inTangent2,
    double t,
  ) {
    final t2 = t*t;
    final t3 = t2*t;
    final h00 = 2*t3 - 3*t2 + 1;
    final h10 = t3 - 2*t2 + t;
    final h01 = -2*t3 + 3*t2;
    final h11 = t3 - t2;

    final p0 = scale(h00);
    final m0 = outTangent1.scale(h10);
    final p1 = q2.scale(h01);
    final m1 = inTangent2.scale(h11);

    return p0.add(m0).add(p1).add(m1).normalize();
  }

  /// Converts this quaternion to an equivalent rotation matrix.
  Matrix toMatrix() {
    Matrix result = .identity();

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

  /// Decomposes this quaternion into an axis–angle representation.
  ///
  /// Returns `(axis, angle)` where [angle] is in radians.
  /// If the quaternion represents a zero rotation, the axis defaults to `(1, 0, 0)`.
  (Vector3 outAxis, double outAngle) toAxisAngle() {
    final q = w.abs() > 1.0 ? normalize() : this;

    Vector3 resAxis = .zero();
    final resAngle = 2.0*math.acos(q.w);
    final den = math.sqrt(1.0 - q.w*q.w);

    if (den > RaylibConstants.EPSILON) {
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

  /// Converts this quaternion to Euler angles `(roll, pitch, yaw)` in radians.
  ///
  /// - X = roll (rotation around X axis)
  /// - Y = pitch (rotation around Y axis)
  /// - Z = yaw (rotation around Z axis)
  Vector3 toEuler() {
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

  /// Transforms this quaternion by the given matrix [mat].
  Quaternion transform(Matrix mat) => .quat(
    mat.m0*x + mat.m4*y + mat.m8*z + mat.m12*w,
    mat.m1*x + mat.m5*y + mat.m9*z + mat.m13*w,
    mat.m2*x + mat.m6*y + mat.m10*z + mat.m14*w,
    mat.m3*x + mat.m7*y + mat.m11*z + mat.m15*w,
  );

  /// Returns `true` if this quaternion is approximately equal to [o].
  ///
  /// Uses epsilon-based comparison per component, and also considers
  /// `q == -q` as equal (both represent the same rotation).
  bool equals(Quaternion o) => (
    (((x - o.x).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs())))) &&
    (((z - o.z).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((z).abs(), (o.z).abs())))) &&
    (((w - o.w).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((w).abs(), (o.w).abs()))))
  ) || (
    (((x + o.x).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y + o.y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs())))) &&
    (((z + o.z).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((z).abs(), (o.z).abs())))) &&
    (((w + o.w).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((w).abs(), (o.w).abs()))))
  );

  /// Converts this quaternion to a [V4] with the same `(x, y, z, w)` components.
  Vector4 toVector4() => .vec4(x, y, z, w);

  /// Returns the components as a new double list.
  ///
  /// Order: `[x, y, z, w]`
  List<double> toArray() => [x, y, z, w];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, z: ${z.f1}, w: ${w.f1})';
}