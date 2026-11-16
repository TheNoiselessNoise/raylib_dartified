// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

enum Vector4Field with XFields {
  x,
  y,
  z,
  w,
}

/// Vector4, 4 components
final class Vector4 extends XStruct<Vector4> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Vector4> struct = .createValue(
    factory: Vector4.new,
    layout: .aligned<Vector4Field>({
      .x: XFloat(), // Vector x component
      .y: XFloat(), // Vector y component
      .z: XFloat(), // Vector z component
      .w: XFloat(), // Vector w component
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<Vector4Field> _l = struct.layoutOf();

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

  double _w;
  /// Vector w component
  double get w => _w = field_w.readOr(op, _w);
  set w(double value) => _w = field_w.writeOr(op, value);

  Vector4({
    super.op,
    this._x = 0,
    this._y = 0,
    this._z = 0,
    this._w = 0,
  });

  factory Vector4.zero() => .vec4(0, 0, 0, 0);

  factory Vector4.one() => .vec4(1, 1, 1, 1);

  factory Vector4.vec4(
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
  Vector4 setDart(Vector4 o) => set(o.x, o.y, o.z, o.w);

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

  /// Converts [color] RGBA channels from `0–255` to normalized `0.0–1.0` components.
  factory Vector4.colorNormalize(Color color) => .vec4(
    color.r/255.0,
    color.g/255.0,
    color.b/255.0,
    color.a/255.0,
  );

  /// Creates a quaternion from an [axis] and rotation [angle] (in radians).
  factory Vector4.fromAxisAngle(Vector3 axis, double angle)
  {
    Vector4 result = .vec4(0, 0, 0, 1);

    if (axis.length != 0.0)
    {
      angle *= 0.5;

      axis = axis.normalize();

      final sinres = math.sin(angle);
      final cosres = math.cos(angle);

      return .vec4(
        axis.x*sinres,
        axis.y*sinres,
        axis.z*sinres,
        cosres,
      ).normalize();
    }

    return result;
  }

  /// Creates a [Vector4] from the raw XYZW components of [q].
  factory Vector4.fromQuaternion(Quaternion q) => .vec4(
    q.x,
    q.y,
    q.z,
    q.w,
  );

  /// Sets all components at once.
  /// 
  /// Values are converted using [num.toDouble].
  Vector4 set(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
    return this;
  }

  /// Euclidean distance between this vector and [o].
  double distance(Vector4 o) => math.sqrt(distanceSqr(o));
  
  /// Squared Euclidean distance between this vector and [o].
  ///
  /// Prefer over [distance] when only relative comparison is needed.
  double distanceSqr(Vector4 o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y) + (z - o.z)*(z - o.z) + (w - o.w)*(w - o.w);
  
  /// Dot product of this vector and [o].
  double dotProduct(Vector4 o) => x * o.x + y * o.y + z * o.z + w * o.w;
  
  /// Euclidean length (magnitude) of this vector.
  double get length => math.sqrt(lengthSqr);
  
  /// Squared length of this vector.
  ///
  /// Prefer over [length] when only relative comparison is needed.
  double get lengthSqr => x * x + y * y + z * z + w * w;

  /// Returns a formatted string representation of this vector.
  ///
  /// [x0] sets the default precision for all components; individual overrides
  /// can be provided via [y0], [z0], and [w0].
  ///
  /// Example: `[ <x>, <y>, <z>, <w> ]`
  String format([int x0 = 0, int? y0, int? z0, int? w0]) => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)}, ${z.toStringAsFixed(z0 ?? x0)}, ${w.toStringAsFixed(w0 ?? x0)} ]';

  /// Returns a new vector that is the component-wise sum of this and [o].
  Vector4 add(Vector4 o) => .vec4(x + o.x, y + o.y, z + o.z, w + o.w);
  
  /// Returns a new vector with [value] added to each component.
  Vector4 addValue(num value) => .vec4(x + value, y + value, z + value, w + value);
  
  /// Returns a new vector that is the component-wise difference of this and [o].
  Vector4 sub(Vector4 o) => .vec4(x - o.x, y - o.y, z - o.z, w - o.w);
  
  /// Returns a new vector with [value] subtracted from each component.
  Vector4 subValue(num value) => .vec4(x - value, y - value, z - value, w - value);
  
  /// Returns a new vector with all components scaled by [o].
  Vector4 scale(num o) => .vec4(x * o, y * o, z * o, w * o);
  
  /// Returns a new vector that is the component-wise product of this and [o].
  Vector4 mul(Vector4 o) => .vec4(x * o.x, y * o.y, z * o.z, w * o.w);
  
  /// Returns a new vector with all components divided by [o].
  Vector4 divideBy(num o) => scale(1 / o);
  
  /// Returns a new vector that is the component-wise quotient of this and [o].
  Vector4 div(Vector4 o) => .vec4(x / o.x, y / o.y, z / o.z, w / o.w);
  
  /// Returns a new vector with all components negated.
  Vector4 negate() => .vec4(-x, -y, -z, -w);
  
  /// Returns a normalized (unit-length) copy of this vector.
  ///
  /// If [length] is zero, treats it as 1 to avoid division by zero.
  Vector4 normalize() {
    double length = this.length;
    if (length == 0.0) length = 1.0;
    final ilength = 1.0/length;
    return .vec4(
      x*ilength,
      y*ilength,
      z*ilength,
      w*ilength,
    );
  }

  /// Returns a new vector with each component being the component-wise minimum of this and [o].
  Vector4 min(Vector4 o) => .vec4(
    math.min(x, o.x),
    math.min(y, o.y),
    math.min(z, o.z),
    math.min(w, o.w),
  );

  /// Returns a new vector with each component being the component-wise maximum of this and [o].
  Vector4 max(Vector4 o) => .vec4(
    math.max(x, o.x),
    math.max(y, o.y),
    math.max(z, o.z),
    math.max(w, o.w),
  );

  /// Linear interpolation between this and [o] by [amount].
  ///
  /// [amount] should be in the range `[0.0, 1.0]`.
  Vector4 lerp(Vector4 o, double amount) => .vec4(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
    z + amount*(o.z - z),
    w + amount*(o.w - w),
  );

  /// Moves this vector towards [target] by at most [maxDistance].
  ///
  /// Returns [target] directly if already within [maxDistance].
  Vector4 moveTowards(Vector4 target, double maxDistance) {
    final dx = target.x - x;
    final dy = target.y - y;
    final dz = target.z - z;
    final dw = target.w - w;
    final value = (dx*dx) + (dy*dy) + (dz*dz) + (dw*dw);

    if (
      (value == 0) ||
      ((maxDistance >= 0) && (value <= maxDistance*maxDistance))
    ) return target;

    final dist = math.sqrt(value);

    return .vec4(
      x + dx/dist*maxDistance,
      y + dy/dist*maxDistance,
      z + dz/dist*maxDistance,
      w + dw/dist*maxDistance,
    );
  }

  /// Returns a new vector with each component replaced by its reciprocal.
  Vector4 invert() => .vec4(1.0/x, 1.0/y, 1.0/z, 1.0/w);

  /// Returns `true` if this vector is approximately equal to [o].
  ///
  /// Uses epsilon-based per-component comparison scaled to the magnitude
  /// of the compared values.
  bool equals(Vector4 o) =>
    (((x - o.x).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs())))) &&
    (((z - o.z).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((z).abs(), (o.z).abs())))) &&
    (((w - o.w).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((w).abs(), (o.w).abs()))));

  /// Converts this vector to a quaternion with the same `(x, y, z, w)` components.
  Quaternion toQuaternion() => .fromVector4(this);

  /// Returns the components as a new double list.
  ///
  /// Order: `[x, y, z, w]`
  List<double> toArray() => [x, y, z, w];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, z: ${z.f1}, w: ${w.f1})';
}