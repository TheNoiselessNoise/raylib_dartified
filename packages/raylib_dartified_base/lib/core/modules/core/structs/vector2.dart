// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

enum Vector2Field with XFields {
  x,
  y,
}

/// Vector2, 2 components
final class Vector2 extends XStruct<Vector2> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Vector2> struct = .createValue(
    factory: Vector2.new,
    layout: .aligned<Vector2Field>({
      .x: XFloat(), // Vector x component
      .y: XFloat(), // Vector y component
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<Vector2Field> _l = struct.layoutOf();

  /// Field descriptor for [x].
  static final field_x = _l.float<XFloat>(.x);
  /// Field descriptor for [y].
  static final field_y = _l.float<XFloat>(.y);

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

  Vector2({
    super.op,
    this._x = 0,
    this._y = 0,
  });

  factory Vector2.zero() => .vec2(0, 0);

  factory Vector2.one() => .vec2(1, 1);

  factory Vector2.vec2(
    num x,
    num y,
  ) => .new(
    x: x.toDouble(),
    y: y.toDouble(),
  );

  @override
  Vector2 setDart(Vector2 o) => set(o.x, o.y);

  @override
  void structWriteInto(XPtr p) {
    field_x.write(p, x);
    field_y.write(p, y);
  }

  @override
  void structReadFrom(XPtr p) {
    x = field_x.read(p);
    y = field_y.read(p);
  }

  /// Euclidean distance between this vector and [o].
  double distance(Vector2 o) => math.sqrt(distanceSqr(o));

  /// Squared Euclidean distance between this vector and [o].
  ///
  /// Prefer over [distance] when only relative comparison is needed.
  double distanceSqr(Vector2 o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y);
  
  /// Dot product of this vector and [o].
  double dotProduct(Vector2 o) => x * o.x + y * o.y;

  /// Cross product of this vector and [o].
  double crossProduct(Vector2 o) => x*o.y - y*o.x;
  
  /// Euclidean length (magnitude) of this vector.
  double get length => math.sqrt(lengthSqr);
  
  /// Squared length of this vector.
  ///
  /// Prefer over [length] when only relative comparison is needed.
  double get lengthSqr => x * x + y * y;
  
  /// Angle between this vector and [o] in radians.
  ///
  /// Returns the signed angle measured from this vector to [o],
  /// in the range `(-π, π]`.
  double angle(Vector2 o) => math.atan2(x*o.y - y*o.x, x*o.x + y*o.y);
  
  /// Angle of the line from this point to [o], relative to the X axis.
  ///
  /// Equivalent to `-atan2(dy, dx)`. Useful for screen-space direction.
  double lineAngle(Vector2 o) => -math.atan2(o.y - y, o.x - x);
  
  /// Returns a formatted string representation of this vector.
  ///
  /// [x0] sets the default precision for all components; [y0] overrides
  /// the precision for the Y component.
  ///
  /// Example: `[ <x>, <y> ]`
  String format([int x0 = 0, int? y0]) =>
    '[ '
      '${x.toStringAsFixed(x0)}, '
      '${y.toStringAsFixed(y0 ?? x0)} '
    ']';

  /// Sets all components at once.
  /// 
  /// Values are converted using [num.toDouble].
  Vector2 set(num x, num y) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    return this;
  }

  /// Returns a new vector that is the component-wise sum of this and [o].
  Vector2 add(Vector2 o) => .vec2(x + o.x, y + o.y);

  /// Returns a new vector with [value] added to each component.
  Vector2 addValue(num value) => .vec2(x + value, y + value);
  
  /// Returns a new vector that is the component-wise difference of this and [o].
  Vector2 sub(Vector2 o) => .vec2(x - o.x, y - o.y);
  
  /// Returns a new vector with [value] subtracted from each component.
  Vector2 subValue(num value) => .vec2(x - value, y - value);
  
  /// Returns a new vector with all components scaled by [o].
  Vector2 scale(num o) => .vec2(x * o, y * o);
  
  /// Returns a new vector with all components negated.
  Vector2 negate() => .vec2(-x, -y);
  
  /// Returns a new vector that is the component-wise product of this and [o].
  Vector2 mul(Vector2 o) => .vec2(x * o.x, y * o.y);
  
  /// Returns a new vector with all components divided by [o].
  Vector2 divideBy(num o) => scale(1 / o);
  
  /// Returns a new vector that is the component-wise quotient of this and [o].
  Vector2 div(Vector2 o) => .vec2(x / o.x, y / o.y);
  
  /// Transforms this vector by matrix [o].
  ///
  /// Applies the 2D affine transformation encoded in the top-left 2x2 portion
  /// of [o] plus the translation column (`m12`, `m13`). The Z component is
  /// treated as 0.
  Vector2 transform(Matrix o) => .vec2(
    o.m0*x + o.m4*y + o.m8*0 + o.m12,
    o.m1*x + o.m5*y + o.m9*0 + o.m13
  );
  
  /// Returns a normalized (unit-length) copy of this vector.
  ///
  /// Returns the zero vector if [length] is 0.
  Vector2 normalize() {
    double length = this.length;
    if (length > 0) {
      double ilength = 1.0/length;
      return .vec2(x*ilength, y*ilength);
    }
    return .zero();
  }

  /// Linear interpolation between this and [o] by [amount].
  ///
  /// [amount] should be in the range `[0.0, 1.0]`.
  Vector2 lerp(Vector2 o, double amount) => .vec2(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
  );
  
  /// Reflects this vector off a surface with the given [normal].
  ///
  /// [normal] is assumed to be normalized.
  Vector2 reflect(Vector2 normal) {
    double dot = dotProduct(normal);
    return .vec2(
      x - (2.0*normal.x)*dot,
      y - (2.0*normal.y)*dot,
    );
  }
  
  /// Returns a new vector with each component being the component-wise minimum of this and [o].
  Vector2 min(Vector2 o) => .vec2(
    math.min(x, o.x),
    math.min(y, o.y),
  );
  
  /// Returns a new vector with each component being the component-wise maximum of this and [o].
  Vector2 max(Vector2 o) => .vec2(
    math.max(x, o.x),
    math.max(y, o.y),
  );
  
  /// Clamps each component of this vector between the corresponding components of [min] and [max].
  Vector2 clamp(Vector2 min, Vector2 max) => .vec2(
    math.min(max.x, math.max(min.x, x)),
    math.min(max.y, math.max(min.y, y)),
  );
  
  /// Clamps the length of this vector to the range `[min, max]`.
  ///
  /// Returns `this` unchanged if [lengthSqr] is zero.
  Vector2 clampValue(double min, double max) {
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
  
  /// Rotates this vector by [angle] radians around the origin.
  Vector2 rotate(double angle) {
    final cosres = math.cos(angle);
    final sinres = math.sin(angle);
    return .vec2(
      x*cosres - y*sinres,
      x*sinres + y*cosres,
    );
  }
  
  /// Moves this vector towards [target] by at most [maxDistance].
  ///
  /// Returns [target] directly if already within [maxDistance].
  Vector2 moveTowards(Vector2 target, double maxDistance) {
    final dx = target.x - x;
    final dy = target.y - y;
    final value = (dx*dx) + (dy*dy);

    if (
      (value == 0) ||
      ((maxDistance >= 0) && (value <= maxDistance*maxDistance))
    ) return target;

    final dist = math.sqrt(value);

    return .vec2(
      x + dx/dist*maxDistance,
      y + dy/dist*maxDistance,
    );
  }

  /// Refracts this vector through a surface with normal [n] and ratio [r].
  ///
  /// [r] is the ratio of indices of refraction (`n1 / n2`).
  /// Returns `this` unchanged if total internal reflection occurs
  /// (i.e. the discriminant is negative).
  Vector2 refract(Vector2 n, double r) {
    final dot = dotProduct(n);
    double d = 1.0 - r*r*(1.0 - dot*dot);

    if (d >= 0.0) {
      d = math.sqrt(d);
      return .vec2(
        r*x - (r*dot + d)*n.x,
        r*y - (r*dot + d)*n.y,
      );
    }

    return this;
  }

  /// Returns a new vector with each component replaced by its reciprocal (`1/x`, `1/y`).
  Vector2 invert() => .vec2(1.0/x, 1.0/y);

  /// Returns `true` if this vector is approximately equal to [o].
  ///
  /// Uses epsilon-based per-component comparison scaled to the magnitude
  /// of the compared values.
  bool equals(Vector2 o) =>
    (((x - o.x).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs()))));

  /// Returns the components as a new double list.
  ///
  /// Order: `[x, y]`
  List<double> toArray() => [x, y];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1})';
}