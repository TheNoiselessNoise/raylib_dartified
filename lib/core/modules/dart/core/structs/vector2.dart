// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../../raylib.dart';

extension Vector2CLike on Vector2C {
  double distance(Vector2C o) => math.sqrt(distanceSqr(o));
  double distanceSqr(Vector2C o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y);
  double dotProduct(Vector2C o) => x * o.x + y * o.y;
  double get length => math.sqrt(lengthSqr);
  double get lengthSqr => x * x + y * y;
  double angle(Vector2C o) => math.atan2(x*o.y - y*o.x, x*o.x + y*o.y);
  double lineAngle(Vector2C o) => -math.atan2(o.y - y, o.x - x);
  String format([int x0 = 0, int? y0]) => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)} ]';
}

extension Vector2DLike on Vector2D {
  double distance(Vector2D o) => math.sqrt(distanceSqr(o));
  double distanceSqr(Vector2D o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y);
  double dotProduct(Vector2D o) => x * o.x + y * o.y;
  double get length => math.sqrt(lengthSqr);
  double get lengthSqr => x * x + y * y;
  double angle(Vector2D o) => math.atan2(x*o.y - y*o.x, x*o.x + y*o.y);
  double lineAngle(Vector2D o) => -math.atan2(o.y - y, o.x - x);
  String format([int x0 = 0, int? y0]) => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)} ]';
}

extension Vector2CPEx on Pointer<Vector2C> {
  Pointer<Vector2C> setC(Vector2C o) {
    ref.setC(o);
    return this;
  }

  Pointer<Vector2C> setD(Vector2D o) {
    ref.setD(o);
    return this;
  }

  Pointer<Vector2C> set(num x, num y) {
    ref.set(x, y);
    return this;
  }

  Vector2D toD() => ref.toD(this);

  Pointer<Vector2C> add(Pointer<Vector2C> o) { ref.add(o.ref); return this; }
  Pointer<Vector2C> sub(Pointer<Vector2C> o) { ref.sub(o.ref); return this; }
  Pointer<Vector2C> scale(num o) { ref.scale(o); return this; }
  Pointer<Vector2C> negate() { ref.negate(); return this; }
  Pointer<Vector2C> mul(Pointer<Vector2C> o) { ref.mul(o.ref); return this; }
  Pointer<Vector2C> divideBy(num o) { ref.divideBy(o); return this; }
  Pointer<Vector2C> div(Pointer<Vector2C> o) { ref.div(o.ref); return this; }
  Pointer<Vector2C> transform(Pointer<MatrixC> o) { ref.transform(o.ref); return this; }
  Pointer<Vector2C> normalize() { ref.normalize(); return this; }

  double distance(Pointer<Vector2C> o) => ref.distance(o.ref);
  double distanceSqr(Pointer<Vector2C> o) => ref.distanceSqr(o.ref);
  double dotProduct(Pointer<Vector2C> o) => ref.dotProduct(o.ref);
  double get length => ref.length;
  double angle(Pointer<Vector2C> o) => ref.angle(o.ref);
  double lineAngle(Pointer<Vector2C> o) => ref.lineAngle(o.ref);
  String format([int x0 = 0, int? y0]) => ref.format(x0, y0);
}

extension Vector2CEx on Vector2C {
  Vector2C setC(Vector2C o) => set(o.x, o.y);

  Vector2C setD(Vector2D o) => set(o.x, o.y);
  
  Vector2C set(num x, num y) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    return this;
  }

  Vector2D toD([Pointer<Vector2C>? ptr]) => .new(
    originalPointer: ptr,
    x: x,
    y: y,
  );

  Vector2C add(Vector2C o) => set(x + o.x, y + o.y);
  Vector2C sub(Vector2C o) => set(x - o.x, y - o.y);
  Vector2C scale(num o) => set(x * o, y * o);
  Vector2C negate() => set(-x, -y);
  Vector2C mul(Vector2C o) => set(x * o.x, y * o.y);
  Vector2C divideBy(num o) => scale(1 / o);
  Vector2C div(Vector2C o) => set(x / o.x, y / o.y);
  Vector2C transform(MatrixC o) => set(
    o.m0*x + o.m4*y + o.m8*0 + o.m12,
    o.m1*x + o.m5*y + o.m9*0 + o.m13
  );
  Vector2C normalize()
  {
    double length = this.length;
    if (length > 0) {
      double ilength = 1.0/length;
      return set(x*ilength, y*ilength);
    }
    return set(0, 0);
  }
}

class Vector2D extends StructDLiteral<Vector2C, Vector2D> with Vector2Base {
  @override
  double x, y;

  Vector2D({
    super.originalPointer,
    this.x = 0,
    this.y = 0,
  });

  factory Vector2D.zero() => .new();
  factory Vector2D.one() => .vec2(1, 1);

  factory Vector2D.vec2(
    num x,
    num y,
  ) => .new(
    x: x.toDouble(),
    y: y.toDouble(),
  );

  @override
  Vector2D setC(Vector2C o) => set(o.x, o.y);

  @override
  Vector2D setD(Vector2D o) {
    originalPointer ??= o.originalPointer;
    return set(o.x, o.y);
  }
  
  Vector2D set(num x, num y) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.Vector2$;

  @override
  void nativeWriteInto(Vector2C p) {
    p.x = x;
    p.y = y;
  }

  Vector2D add(Vector2D o) => .vec2(x + o.x, y + o.y);
  Vector2D addValue(num value) => .vec2(x + value, y + value);
  Vector2D sub(Vector2D o) => .vec2(x - o.x, y - o.y);
  Vector2D subValue(num value) => .vec2(x - value, y - value);
  Vector2D scale(num o) => .vec2(x * o, y * o);
  Vector2D negate() => .vec2(-x, -y);
  Vector2D mul(Vector2D o) => .vec2(x * o.x, y * o.y);
  Vector2D divideBy(num o) => scale(1 / o);
  Vector2D div(Vector2D o) => .vec2(x / o.x, y / o.y);
  Vector2D transform(MatrixD o) => .vec2(
    o.m0*x + o.m4*y + o.m8*0 + o.m12,
    o.m1*x + o.m5*y + o.m9*0 + o.m13
  );
  Vector2D normalize()
  {
    double length = this.length;
    if (length > 0) {
      double ilength = 1.0/length;
      return .vec2(x*ilength, y*ilength);
    }
    return .zero();
  }
  Vector2D lerp(Vector2D o, double amount) => .vec2(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
  );
  Vector2D reflect(Vector2D normal) {
    double dot = dotProduct(normal);
    return .vec2(
      x - (2.0*normal.x)*dot,
      y - (2.0*normal.y)*dot,
    );
  }
  Vector2D min(Vector2D o) => .vec2(
    math.min(x, o.x),
    math.min(y, o.y),
  );
  Vector2D max(Vector2D o) => .vec2(
    math.max(x, o.x),
    math.max(y, o.y),
  );
  Vector2D clamp(Vector2D min, Vector2D max) => .vec2(
    math.min(max.x, math.max(min.x, x)),
    math.min(max.y, math.max(min.y, y)),
  );
  Vector2D clampValue(double min, double max) {
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
  Vector2D rotate(double angle) {
    final cosres = math.cos(angle);
    final sinres = math.sin(angle);
    return .vec2(
      x*cosres - y*sinres,
      x*sinres + y*cosres,
    );
  }
  Vector2D moveTowards(Vector2D target, double maxDistance) {
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

  Vector2D refract(Vector2D n, double r) {
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

  Vector2D invert() => .vec2(1.0/x, 1.0/y);

  bool equals(Vector2D o) =>
    (((x - o.x).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs()))));

  Vector2D operator -(Vector2D other) => .vec2(x - other.x, y - other.y);
  Vector2D operator +(Vector2D other) => .vec2(x + other.x, y + other.y);
  Vector2D operator *(Vector2D other) => .vec2(x * other.x, y * other.y);
  Vector2D operator /(Vector2D other) => .vec2(x / other.x, y / other.y);

  List<double> toArray() => [x, y];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1})';

  @override
  Vector2D clone() => .new(
    originalPointer: originalPointer,
    x: x,
    y: y,
  );
}