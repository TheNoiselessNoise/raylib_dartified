// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

enum Vector3Field with XFields {
  x,
  y,
  z,
}

/// Vector3, 3 components
final class Vector3 extends XStruct<Vector3> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Vector3> struct = .createValue(
    factory: Vector3.new,
    layout: .aligned<Vector3Field>({
      .x: XFloat(), // Vector x component
      .y: XFloat(), // Vector y component
      .z: XFloat(), // Vector z component
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<Vector3Field> _l = struct.layoutOf();

  /// Field descriptor for [x].
  static final field_x = _l.float<XFloat>(.x);
  /// Field descriptor for [y].
  static final field_y = _l.float<XFloat>(.y);
  /// Field descriptor for [z].
  static final field_z = _l.float<XFloat>(.z);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  double _x;
  /// Vector x component
  double get x => _x = field_x.readOr(op, _x);
  set x(double value) => _x = field_x.writeOr(op, value);

  double _y;
  /// Vector y component
  double get y => _y = field_y.readOr(op, _y);
  set y(double value) => _y = field_y.writeOr(op, value);

  double _z;
  /// Vector z component
  double get z => _z = field_z.readOr(op, _z);
  set z(double value) => _z = field_z.writeOr(op, value);
  
  Vector3({
    super.op,
    this._x = 0,
    this._y = 0,
    this._z = 0,
  });

  factory Vector3.zero() => .vec3(0, 0, 0);

  factory Vector3.one() => .vec3(1, 1, 1);

  factory Vector3.vec3(
    num x,
    num y,
    num z,
  ) => .new(
    x: x.toDouble(),
    y: y.toDouble(),
    z: z.toDouble(),
  );

  @override
  Vector3 setDart(Vector3 o) => set(o.x, o.y, o.z);

  @override
  void structWriteInto(XPtr p) {
    field_x.write(p, x);
    field_y.write(p, y);
    field_z.write(p, z);
  }

  @override
  void structReadFrom(XPtr p) {
    x = field_x.read(p);
    y = field_y.read(p);
    z = field_z.read(p);
  }

  /// Creates a vector from [x], [y], [z] and immediately normalizes it.
  factory Vector3.normalized(num x, num y, num z) => .vec3(
    x.toDouble(),
    y.toDouble(),
    z.toDouble(),
  ).normalize();

  /// Returns a vector perpendicular to [o] by crossing it with its least-aligned cardinal axis.
  factory Vector3.perpendicular(Vector3 o) {
    double min = o.x.abs();
    Vector3 cardinalAxis = .vec3(1.0, 0.0, 0.0);

    if ((o.y).abs() < min) {
      min = (o.y).abs();
      cardinalAxis = .vec3(0.0, 1.0, 0.0);
    }

    if ((o.z).abs() < min) {
      cardinalAxis = .vec3(0.0, 0.0, 1.0);
    }

    return o.crossProduct(cardinalAxis);
  }

  /// Computes the barycentric coordinates of point [p] relative to triangle ([a], [b], [c]).
  factory Vector3.barycenter(Vector3 p, Vector3 a, Vector3 b, Vector3 c) {
    final v0 = b.sub(a);
    final v1 = c.sub(a);
    final v2 = p.sub(a);
    final d00 = v0.dotProduct(v0);
    final d01 = v0.dotProduct(v1);
    final d11 = v1.dotProduct(v1);
    final d20 = v2.dotProduct(v0);
    final d21 = v2.dotProduct(v1);
    final denom = d00*d11 - d01*d01;
    final y = (d11*d20 - d01*d21)/denom;
    final z = (d00*d21 - d01*d20)/denom;
    final x = 1.0 - (z + y);
    return .vec3(x, y, z);
  }

  /// Sets all components at once.
  /// 
  /// Values are converted using [num.toDouble].
  Vector3 set(num x, num y, num z) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    return this;
  }

  /// Euclidean distance between this vector and [o].
  double distance(Vector3 o) => math.sqrt(distanceSqr(o));
  
  /// Squared Euclidean distance between this vector and [o].
  ///
  /// Prefer over [distance] when only relative comparison is needed.
  double distanceSqr(Vector3 o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y) + (z - o.z)*(z - o.z);
  
  /// Dot product of this vector and [o].
  double dotProduct(Vector3 o) => x * o.x + y * o.y + z * o.z;
  
  /// Euclidean length (magnitude) of this vector.
  double get length => math.sqrt(lengthSqr);
  
  /// Squared length of this vector.
  ///
  /// Prefer over [length] when only relative comparison is needed.
  double get lengthSqr => x * x + y * y + z * z;
  
  /// Angle between this vector and [o] in radians, in the range `[0, π]`.
  ///
  /// Computed via `atan2(|cross|, dot)` for numerical stability.
  double angle(Vector3 o) {
    final Vector3 cross = .vec3(
      y*o.z - z*o.y,
      z*o.x - x*o.z,
      x*o.y - y*o.x
    );
    return math.atan2(cross.length, dotProduct(o));
  }

  /// Returns a formatted string representation of this vector.
  ///
  /// [x0] sets the default precision for all components; individual overrides
  /// can be provided via [y0] and [z0].
  ///
  /// Example: `[ <x>, <y>, <z> ]`
  String format([int x0 = 0, int? y0, int? z0]) =>
    '[ '
      '${x.toStringAsFixed(x0)}, '
      '${y.toStringAsFixed(y0 ?? x0)}, '
      '${z.toStringAsFixed(z0 ?? x0)} '
    ']';
  
  /// Returns a new vector that is the component-wise sum of this and [o].
  Vector3 add(Vector3 o) => .vec3(x + o.x, y + o.y, z + o.z);
  
  /// Returns a new vector with [value] added to each component.
  Vector3 addValue(num value) => .vec3(x + value, y + value, z + value);
  
  /// Returns a new vector that is the component-wise difference of this and [o].
  Vector3 sub(Vector3 o) => .vec3(x - o.x, y - o.y, z - o.z);
  
  /// Returns a new vector with [value] subtracted from each component.
  Vector3 subValue(num value) => .vec3(x - value, y - value, z - value);
  
  /// Returns a new vector with all components scaled by [o].
  Vector3 scale(num o) => .vec3(x * o, y * o, z * o);
  
  /// Returns a new vector that is the component-wise product of this and [o].
  Vector3 mul(Vector3 o) => .vec3(x * o.x, y * o.y, z * o.z);
  
  /// Returns a new vector with all components divided by [o].
  Vector3 divideBy(num o) => scale(1 / o);
  
  /// Returns a new vector that is the component-wise quotient of this and [o].
  Vector3 div(Vector3 o) => .vec3(x / o.x, y / o.y, z / o.z);
  
  /// Returns a new vector with all components negated.
  Vector3 negate() => .vec3(-x, -y, -z);
  
  /// Transforms this vector by matrix [o].
  ///
  /// Applies the full 4x4 affine transformation; the W component is
  /// implicitly treated as 1 (i.e. the translation column is applied).
  Vector3 transform(Matrix o) => .vec3(
    o.m0*x + o.m4*y + o.m8*z + o.m12,
    o.m1*x + o.m5*y + o.m9*z + o.m13,
    o.m2*x + o.m6*y + o.m10*z + o.m14,
  );

  /// Projects this vector onto [o].
  ///
  /// Returns the component of this vector that is parallel to [o].
  Vector3 project(Vector3 o) {
    final v1dv2 = (x*o.x + y*o.y + z*o.z);
    final v2dv2 = (o.x*o.x + o.y*o.y + o.z*o.z);
    final mag = v1dv2/v2dv2;
    return .vec3(
      o.x*mag,
      o.y*mag,
      o.z*mag,
    );
  }

  /// Rejects [o] from this vector.
  ///
  /// Returns the component of this vector that is perpendicular to [o].
  /// Complement of [project]: `project(o).add(reject(o)) == this`.
  Vector3 reject(Vector3 o) {
    final v1dv2 = (x*o.x + y*o.y + z*o.z);
    final v2dv2 = (o.x*o.x + o.y*o.y + o.z*o.z);
    final mag = v1dv2/v2dv2;
    return .vec3(
      x - (o.x*mag),
      y - (o.y*mag),
      z - (o.z*mag),
    );
  }

  /// Reflects this vector off a surface with the given [normal].
  ///
  /// [normal] is assumed to be normalized.
  Vector3 reflect(Vector3 normal) {
    final dot = dotProduct(normal);
    return .vec3(
      x - (2.0*normal.x)*dot,
      y - (2.0*normal.y)*dot,
      z - (2.0*normal.z)*dot,
    );
  }

  /// Returns a new vector with each component being the component-wise minimum of this and [o].
  Vector3 min(Vector3 o) => .vec3(
    math.min(x, o.x),
    math.min(y, o.y),
    math.min(z, o.z),
  );

  /// Returns a new vector with each component being the component-wise maximum of this and [o].
  Vector3 max(Vector3 o) => .vec3(
    math.max(x, o.x),
    math.max(y, o.y),
    math.max(z, o.z),
  );

  /// Cross product of this vector and [o].
  ///
  /// Returns a vector perpendicular to both, following the right-hand rule.
  Vector3 crossProduct(Vector3 o) => .vec3(
    y*o.z - z*o.y,
    z*o.x - x*o.z,
    x*o.y - y*o.x
  );

  /// Returns a normalized (unit-length) copy of this vector.
  ///
  /// Returns a copy of this vector unchanged if [length] is zero.
  Vector3 normalize() {
    final length = this.length;
    if (length != 0.0)
    {
      final ilength = 1.0/length;
      return .vec3(
        x * ilength,
        y * ilength,
        z * ilength,
      );
    }

    return .vec3(x, y, z);
  }

  /// Orthonormalizes this vector against [o] using the Gram-Schmidt process.
  ///
  /// Normalizes `this` in place via [setDart], then returns a vector
  /// perpendicular to the normalized `this` in the plane of `this` and [o].
  Vector3 orthoNormalize(Vector3 o) {
    final n1 = normalize();
    final vn1 = n1.crossProduct(o).normalize();
    setDart(n1);
    return vn1.crossProduct(n1);
  }

  /// Rotates this vector around [axis] by [angle] radians.
  ///
  /// Uses the Rodrigues rotation formula via quaternion half-angle.
  /// [axis] is normalized internally.
  Vector3 rotateByAxisAngle(Vector3 axis, double angle) {
    final w = axis.normalize().scale(math.sin(angle / 2.0));
    final wv = w.crossProduct(this);
    final wwv = w.crossProduct(wv).scale(2);
    return add(wv.scale(2 * math.cos(angle / 2.0))).add(wwv);
  }

  /// Moves this vector towards [target] by at most [maxDistance].
  ///
  /// Returns [target] directly if already within [maxDistance].
  Vector3 moveTowards(Vector3 target, double maxDistance) {
    final dx = target.x - x;
    final dy = target.y - y;
    final dz = target.z - z;
    final value = (dx*dx) + (dy*dy) + (dz*dz);

    if (
      (value == 0) ||
      ((maxDistance >= 0) && (value <= maxDistance*maxDistance))
    ) return target;

    final dist = math.sqrt(value);

    return .vec3(
      x + dx/dist*maxDistance,
      y + dy/dist*maxDistance,
      z + dz/dist*maxDistance,
    );
  }

  /// Linear interpolation between this and [o] by [amount].
  ///
  /// [amount] should be in the range `[0.0, 1.0]`.
  Vector3 lerp(Vector3 o, double amount) => .vec3(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
    z + amount*(o.z - z),
  );

  /// Clamps each component of this vector between the corresponding components of [min] and [max].
  Vector3 clamp(Vector3 min, Vector3 max) => .vec3(
    math.min(max.x, math.max(min.x, x)),
    math.min(max.y, math.max(min.y, y)),
    math.min(max.z, math.max(min.z, z)),
  );

  /// Clamps the length of this vector to the range `[min, max]`.
  ///
  /// Returns `this` unchanged if [lengthSqr] is zero.
  Vector3 clampValue(double min, double max) {
    double length = lengthSqr;
    if (length > 0.0) {
      length = math.sqrt(length);

      double scale = 1;
      if (length < min) {
        scale = min/length;
      } else if (length > max) {
        scale = max/length;
      }

      return this.scale(scale);
    }

    return this;
  }

  /// Returns `true` if this vector is approximately equal to [o].
  ///
  /// Uses epsilon-based per-component comparison scaled to the magnitude
  /// of the compared values.
  bool equals(Vector3 o) =>
    (((x - o.x).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs())))) &&
    (((z - o.z).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((z).abs(), (o.z).abs()))));

  /// Interpolates along a cubic Hermite spline between this and [v2].
  ///
  /// [tangent1] is the outgoing tangent at this point,
  /// [tangent2] is the incoming tangent at [v2],
  Vector3 cubicHermite(Vector3 tangent1, Vector3 v2, Vector3 tangent2, double amount) {
    final p2 = amount*amount;
    final p3 = amount*amount*amount;

    return .vec3(
      (2*p3 - 3*p2 + 1)*x + (p3 - 2*p2 + amount)*tangent1.x + (-2*p3 + 3*p2)*v2.x + (p3 - p2)*tangent2.x,
      (2*p3 - 3*p2 + 1)*y + (p3 - 2*p2 + amount)*tangent1.y + (-2*p3 + 3*p2)*v2.y + (p3 - p2)*tangent2.y,
      (2*p3 - 3*p2 + 1)*z + (p3 - 2*p2 + amount)*tangent1.z + (-2*p3 + 3*p2)*v2.z + (p3 - p2)*tangent2.z,
    );
  }

  /// Returns a new vector with `this` rotated by quaternion [q].
  Vector3 rotateByQuaternion(Quaternion q) => .vec3(
    x*(q.x*q.x + q.w*q.w - q.y*q.y - q.z*q.z) + y*(2*q.x*q.y - 2*q.w*q.z) + z*(2*q.x*q.z + 2*q.w*q.y),
    x*(2*q.w*q.z + 2*q.x*q.y) + y*(q.w*q.w - q.x*q.x + q.y*q.y - q.z*q.z) + z*(-2*q.w*q.x + 2*q.y*q.z),
    x*(-2*q.w*q.y + 2*q.x*q.z) + y*(2*q.w*q.x + 2*q.y*q.z)+ z*(q.w*q.w - q.x*q.x - q.y*q.y + q.z*q.z),
  );

  /// Returns a new vector with each component replaced by its reciprocal (`1/x`, `1/y`, `1/z`).
  Vector3 invert() => .vec3(1.0/x, 1.0/y, 1.0/z);

  /// Refracts this vector through a surface with normal [n] and ratio [r].
  ///
  /// [r] is the ratio of indices of refraction (`n1 / n2`).
  /// Returns `this` unchanged if total internal reflection occurs
  /// (i.e. the discriminant is negative).
  Vector3 refract(Vector3 n, double r) {
    final dot = dotProduct(n);
    double d = 1.0 - r*r*(1.0 - dot*dot);

    if (d >= 0.0) {
      d = math.sqrt(d);
      return .vec3(
        r*x - (r*dot + d)*n.x,
        r*y - (r*dot + d)*n.y,
        r*z - (r*dot + d)*n.z,
      );
    }

    return this;
  }

  /// Unprojects this screen-space vector back into world space.
  ///
  /// [projection] and [view] are the camera's projection and view matrices.
  /// Internally multiplies and inverts the combined view-projection matrix,
  /// then applies a perspective divide.
  Vector3 unproject(Matrix projection, Matrix view) {
    final matViewProj = view.mul(projection).invert();
    final Quaternion qtransformed = .quat(x, y, z, 1.0).transform(matViewProj);
    return .vec3(
      qtransformed.x/qtransformed.w,
      qtransformed.y/qtransformed.w,
      qtransformed.z/qtransformed.w,
    );
  }

  /// Returns the components as a new double list.
  ///
  /// Order: `[x, y, z]`
  List<double> toArray() => [x, y, z];

  /// Returns the components as a [float3].
  ///
  /// Order: `[x, y, z]`
  float3 toFloatV()
    => .new(v: toArray());

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, z: ${z.f1})';
}