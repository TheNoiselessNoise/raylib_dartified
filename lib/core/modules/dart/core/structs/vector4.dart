// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../../raylib.dart';

extension Vector4CLike on Vector4C {
  double distance(Vector4C o) => math.sqrt(distanceSqr(o));
  double distanceSqr(Vector4C o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y) + (z - o.z)*(z - o.z) + (w - o.w)*(w - o.w);
  double dotProduct(Vector4C o) => x * o.x + y * o.y + z * o.z + w * o.w;
  double get length => math.sqrt(lengthSqr);
  double get lengthSqr => x * x + y * y + z * z + w * w;
  String format([int x0 = 0, int? y0, int? z0, int? w0])
    => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)}, ${z.toStringAsFixed(z0 ?? x0)}, ${w.toStringAsFixed(w0 ?? x0)} ]';
}

extension Vector4DLike on Vector4D {
  double distance(Vector4D o) => math.sqrt(distanceSqr(o));
  double distanceSqr(Vector4D o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y) + (z - o.z)*(z - o.z) + (w - o.w)*(w - o.w);
  double dotProduct(Vector4D o) => x * o.x + y * o.y + z * o.z + w * o.w;
  double get length => math.sqrt(lengthSqr);
  double get lengthSqr => x * x + y * y + z * z + w * w;
  String format([int x0 = 0, int? y0, int? z0, int? w0])
    => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)}, ${z.toStringAsFixed(z0 ?? x0)}, ${w.toStringAsFixed(w0 ?? x0)} ]';
}

extension Vector4CPEx on Pointer<Vector4C> {
  Pointer<Vector4C> setC(Vector4C o) {
    ref.setC(o);
    return this;
  }

  Pointer<Vector4C> setD(Vector4D o) {
    ref.setD(o);
    return this;
  }

  Pointer<Vector4C> set(num x, num y, num z, num w) {
    ref.set(x, y, z, w);
    return this;
  }

  Vector4D toD() => ref.toD(this);

  Pointer<Vector4C> add(Pointer<Vector4C> o) { ref.add(o.ref); return this; }
  Pointer<Vector4C> sub(Pointer<Vector4C> o) { ref.sub(o.ref); return this; }
  Pointer<Vector4C> scale(num o) { ref.scale(o); return this; }
  Pointer<Vector4C> mul(Pointer<Vector4C> o) { ref.mul(o.ref); return this; }
  Pointer<Vector4C> divideBy(num o) { ref.divideBy(o); return this; }
  Pointer<Vector4C> div(Pointer<Vector4C> o) { ref.div(o.ref); return this; }

  double distance(Pointer<Vector4C> o) => ref.distance(o.ref);
  double distanceSqr(Pointer<Vector4C> o) => ref.distanceSqr(o.ref);
  double dotProduct(Pointer<Vector4C> o) => ref.dotProduct(o.ref);
  double get length => ref.length;
  String format([int x0 = 0, int? y0, int? z0, int? w0]) => ref.format(x0, y0, z0, w0);
}

extension Vector4CEx on Vector4C {
  Vector4C setC(Vector4C o) => set(o.x, o.y, o.z, o.w);

  Vector4C setD(Vector4D o) => set(o.x, o.y, o.z, o.w);
  
  Vector4C set(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
    return this;
  }

  Vector4D toD([Pointer<Vector4C>? ptr]) => .new(
    originalPointer: ptr,
    x: x,
    y: y,
    z: z,
    w: w,
  );

  Vector4C add(Vector4C o) => set(x + o.x, y + o.y, z + o.z, w + o.w);
  Vector4C sub(Vector4C o) => set(x - o.x, y - o.y, z - o.z, w - o.w);
  Vector4C scale(num o) => set(x * o, y * o, z * o, z * w);
  Vector4C mul(Vector4C o) => set(x * o.x, y * o.y, z * o.z, w * o.w);
  Vector4C divideBy(num o) => scale(1 / o);
  Vector4C div(Vector4C o) => set(x / o.x, y / o.y, z / o.z, w / o.w);
}

class Vector4D extends StructDLiteral<Vector4C, Vector4D> with Vector4Base {
  @override
  double x, y, z, w;

  Vector4D({
    super.originalPointer,
    this.x = 0,
    this.y = 0,
    this.z = 0,
    this.w = 0,
  });

  factory Vector4D.zero() => .new();
  factory Vector4D.one() => .vec4(1, 1, 1, 1);

  factory Vector4D.vec4(
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
  Vector4D setC(Vector4C o) => set(o.x, o.y, o.z, o.w);

  @override
  Vector4D setD(Vector4D o) {
    originalPointer ??= o.originalPointer;
    return set(o.x, o.y, o.z, o.w);
  }

  Vector4D set(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.Vector4$;

  @override
  void nativeWriteInto(Vector4C p) {
    p.x = x;
    p.y = y;
    p.z = z;
    p.w = w;
  }

  Vector4D add(Vector4D o) => .vec4(x + o.x, y + o.y, z + o.z, w + o.w);
  Vector4D addValue(num value) => .vec4(x + value, y + value, z + value, w + value);
  Vector4D sub(Vector4D o) => .vec4(x - o.x, y - o.y, z - o.z, w - o.w);
  Vector4D subValue(num value) => .vec4(x - value, y - value, z - value, w - value);
  Vector4D scale(num o) => .vec4(x * o, y * o, z * o, z * w);
  Vector4D mul(Vector4D o) => .vec4(x * o.x, y * o.y, z * o.z, w * o.w);
  Vector4D divideBy(num o) => scale(1 / o);
  Vector4D div(Vector4D o) => .vec4(x / o.x, y / o.y, z / o.z, w / o.w);
  Vector4D negate() => .vec4(-x, -y, -z, -w);
  Vector4D normalize() {
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
  Vector4D min(Vector4D o) => .vec4(
    math.min(x, o.x),
    math.min(y, o.y),
    math.min(z, o.z),
    math.min(w, o.w),
  );
  Vector4D max(Vector4D o) => .vec4(
    math.max(x, o.x),
    math.max(y, o.y),
    math.max(z, o.z),
    math.max(w, o.w),
  );
  Vector4D lerp(Vector4D o, double amount) => .vec4(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
    z + amount*(o.z - z),
    w + amount*(o.w - w),
  );
  Vector4D moveTowards(Vector4D target, double maxDistance) {
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
  Vector4D invert() => .vec4(1.0/x, 1.0/y, 1.0/z, 1.0/w);

  bool equals(Vector4D o) =>
    (((x - o.x).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs())))) &&
    (((z - o.z).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((z).abs(), (o.z).abs())))) &&
    (((w - o.w).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((w).abs(), (o.w).abs()))));

  factory Vector4D.colorNormalize(ColorD color) => .vec4(
    color.r/255.0,
    color.g/255.0,
    color.b/255.0,
    color.a/255.0,
  );

  factory Vector4D.fromAxisAngle(Vector3D axis, double angle)
  {
    Vector4D result = .vec4(0, 0, 0, 1);

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

  List<double> toArray() => [x, y, z, w];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, z: ${z.f1}, w: ${w.f1})';

  @override
  Vector4D clone() => .new(
    originalPointer: originalPointer,
    x: x,
    y: y,
    z: z,
    w: w,
  );

  QuaternionD toQuaternion() => .fromVector4(this);
  factory Vector4D.fromQuaternion(QuaternionD q) => .new(
    x: q.x,
    y: q.y,
    z: q.z,
    w: q.w,
  );
}
