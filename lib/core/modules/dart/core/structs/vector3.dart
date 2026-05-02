// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../../raylib.dart';

extension Vector3CLike on Vector3C {
  double distance(Vector3C o) => math.sqrt(distanceSqr(o));
  double distanceSqr(Vector3C o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y) + (z - o.z)*(z - o.z);
  double dotProduct(Vector3C o) => x * o.x + y * o.y + z * o.z;
  double get length => math.sqrt(lengthSqr);
  double get lengthSqr => x * x + y * y + z * z;
  double angle(Vector3C o) {
    Vector3D cross = .vec3(
      y*o.z - z*o.y,
      z*o.x - x*o.z,
      x*o.y - y*o.x
    );
    return math.atan2(cross.length, dotProduct(o));
  }
  String format([int x0 = 0, int? y0, int? z0])
    => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)}, ${z.toStringAsFixed(z0 ?? x0)} ]';
}

extension Vector3DLike on Vector3D {
  double distance(Vector3D o) => math.sqrt(distanceSqr(o));
  double distanceSqr(Vector3D o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y) + (z - o.z)*(z - o.z);
  double dotProduct(Vector3D o) => x * o.x + y * o.y + z * o.z;
  double get length => math.sqrt(lengthSqr);
  double get lengthSqr => x * x + y * y + z * z;
  double angle(Vector3D o) {
    Vector3D cross = .vec3(
      y*o.z - z*o.y,
      z*o.x - x*o.z,
      x*o.y - y*o.x
    );
    return math.atan2(cross.length, dotProduct(o));
  }
  String format([int x0 = 0, int? y0, int? z0])
    => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)}, ${z.toStringAsFixed(z0 ?? x0)} ]';
}

extension Vector3CPEx on Pointer<Vector3C> {
  Pointer<Vector3C> setC(Vector3C o) {
    ref.setC(o);
    return this;
  }

  Pointer<Vector3C> setD(Vector3D o) {
    ref.setD(o);
    return this;
  }

  Pointer<Vector3C> set(num x, num y, num z) {
    ref.set(x, y, z);
    return this;
  }

  Vector3D toD() => ref.toD(this);

  Pointer<Vector3C> add(Pointer<Vector3C> o) { ref.add(o.ref); return this; }
  Pointer<Vector3C> sub(Pointer<Vector3C> o) { ref.sub(o.ref); return this; }
  Pointer<Vector3C> scale(num o) { ref.scale(o); return this; }
  Pointer<Vector3C> mul(Pointer<Vector3C> o) { ref.mul(o.ref); return this; }
  Pointer<Vector3C> divideBy(num o) { ref.divideBy(o); return this; }
  Pointer<Vector3C> div(Pointer<Vector3C> o) { ref.div(o.ref); return this; }
  Pointer<Vector3C> negate() { ref.negate(); return this; }
  Pointer<Vector3C> transform(Pointer<MatrixC> o) { ref.transform(o.ref); return this; }
  Pointer<Vector3C> crossProduct(Pointer<Vector3C> o) { ref.crossProduct(o.ref); return this; }
  Pointer<Vector3C> normalize() { ref.normalize(); return this; }
  Pointer<Vector3C> rotateByAxisAngle(Pointer<Vector3C> axis, double angle) {
    ref.rotateByAxisAngle(axis.ref, angle); return this;
  }
  Pointer<Vector3C> lerp(Pointer<Vector3C> axis, double angle) {
    ref.lerp(axis.ref, angle); return this;
  }

  double distance(Pointer<Vector3C> o) => ref.distance(o.ref);
  double distanceSqr(Pointer<Vector3C> o) => ref.distanceSqr(o.ref);
  double dotProduct(Pointer<Vector3C> o) => ref.dotProduct(o.ref);
  double get length => ref.length;
  double angle(Vector3C o) => ref.angle(o);
  String format([int x0 = 0, int? y0, int? z0]) => ref.format(x0, y0, z0);
}

extension Vector3CEx on Vector3C {
  Vector3C setC(Vector3C o) => set(o.x, o.y, o.z);

  Vector3C setD(Vector3D o) => set(o.x, o.y, o.z);
  
  Vector3C set(num x, num y, num z) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    return this;
  }

  Vector3D toD([Pointer<Vector3C>? ptr]) => .new(
    originalPointer: ptr,
    x: x,
    y: y,
    z: z,
  );

  Vector3C add(Vector3C o) => set(x + o.x, y + o.y, z + o.z);
  Vector3C sub(Vector3C o) => set(x - o.x, y - o.y, z - o.z);
  Vector3C scale(num o) => set(x * o, y * o, z * o);
  Vector3C mul(Vector3C o) => set(x * o.x, y * o.y, z * o.z);
  Vector3C divideBy(num o) => scale(1 / o);
  Vector3C div(Vector3C o) => set(x / o.x, y / o.y, z / o.z);
  Vector3C negate() => set(-x, -y, -z);
  Vector3C transform(MatrixC o) => set(
    o.m0*x + o.m4*y + o.m8*z + o.m12,
    o.m1*x + o.m5*y + o.m9*z + o.m13,
    o.m2*x + o.m6*y + o.m10*z + o.m14,
  );
  Vector3C crossProduct(Vector3C o) => set(
    y*o.z - z*o.y,
    z*o.x - x*o.z,
    x*o.y - y*o.x
  );
  Vector3C normalize() {
    final newVec = toD().normalize();
    return set(newVec.x, newVec.y, newVec.z);
  }
  Vector3C rotateByAxisAngle(Vector3C axis, double angle)
  {
    final newVec = toD().rotateByAxisAngle(axis.toD(), angle);
    return set(newVec.x, newVec.y, newVec.z);
  }
  Vector3C lerp(Vector3C o, double amount) => set(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
    z + amount*(o.z - z),
  );
}

class Vector3D extends StructDLiteral<Vector3D, Vector3C> {
  double x, y, z;

  Vector3D({
    super.originalPointer,
    this.x = 0,
    this.y = 0,
    this.z = 0,
  });

  factory Vector3D.zero() => .new();
  factory Vector3D.one() => .vec3(1, 1, 1);

  factory Vector3D.vec3(
    num x,
    num y,
    num z,
  ) => .new(
    x: x.toDouble(),
    y: y.toDouble(),
    z: z.toDouble(),
  );

  factory Vector3D.vec3Normalized(
    num x,
    num y,
    num z,
  ) => .new(
    x: x.toDouble(),
    y: y.toDouble(),
    z: z.toDouble(),
  ).normalize();

  @override
  Vector3D setC(Vector3C o) => set(o.x, o.y, o.z);

  @override
  Vector3D setD(Vector3D o) {
    originalPointer ??= o.originalPointer;
    return set(o.x, o.y, o.z);
  }

  Vector3D set(num x, num y, num z) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    return this;
  }

  @override
  Pointer<Vector3C> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => temp.Vector3$.At(key, count);

  @override
  void allocateInto(RaylibTemp temp, Pointer<Vector3C> p, String key)
    => writeInto(p.ref);

  @override
  void writeInto(Vector3C p) {
    p.x = x;
    p.y = y;
    p.z = z;
  }

  Vector3D add(Vector3D o) => .vec3(x + o.x, y + o.y, z + o.z);
  Vector3D addValue(num value) => .vec3(x + value, y + value, z + value);
  Vector3D sub(Vector3D o) => .vec3(x - o.x, y - o.y, z - o.z);
  Vector3D subValue(num value) => .vec3(x - value, y - value, z - value);
  Vector3D scale(num o) => .vec3(x * o, y * o, z * o);
  Vector3D mul(Vector3D o) => .vec3(x * o.x, y * o.y, z * o.z);
  Vector3D divideBy(num o) => scale(1 / o);
  Vector3D div(Vector3D o) => .vec3(x / o.x, y / o.y, z / o.z);
  Vector3D negate() => .vec3(-x, -y, -z);
  Vector3D transform(MatrixD o) => .vec3(
    o.m0*x + o.m4*y + o.m8*z + o.m12,
    o.m1*x + o.m5*y + o.m9*z + o.m13,
    o.m2*x + o.m6*y + o.m10*z + o.m14,
  );
  Vector3D project(Vector3D o) {
    final v1dv2 = (x*o.x + y*o.y + z*o.z);
    final v2dv2 = (o.x*o.x + o.y*o.y + o.z*o.z);
    final mag = v1dv2/v2dv2;
    return .vec3(
      o.x*mag,
      o.y*mag,
      o.z*mag,
    );
  }
  Vector3D reject(Vector3D o) {
    final v1dv2 = (x*o.x + y*o.y + z*o.z);
    final v2dv2 = (o.x*o.x + o.y*o.y + o.z*o.z);
    final mag = v1dv2/v2dv2;
    return .vec3(
      x - (o.x*mag),
      y - (o.y*mag),
      z - (o.z*mag),
    );
  }
  Vector3D reflect(Vector3D normal) {
    final dot = dotProduct(normal);
    return .vec3(
      x - (2.0*normal.x)*dot,
      y - (2.0*normal.y)*dot,
      z - (2.0*normal.z)*dot,
    );
  }
  Vector3D min(Vector3D o) => .vec3(
    math.min(x, o.x),
    math.min(y, o.y),
    math.min(z, o.z),
  );
  Vector3D max(Vector3D o) => .vec3(
    math.max(x, o.x),
    math.max(y, o.y),
    math.max(z, o.z),
  );
  Vector3D crossProduct(Vector3D o) => .vec3(
    y*o.z - z*o.y,
    z*o.x - x*o.z,
    x*o.y - y*o.x
  );
  Vector3D normalize() {
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
  factory Vector3D.perpendicular(Vector3D o) {
    double min = o.x.abs();
    Vector3D cardinalAxis = .vec3(1.0, 0.0, 0.0);

    if ((o.y).abs() < min) {
      min = (o.y).abs();
      cardinalAxis = .vec3(0.0, 1.0, 0.0);
    }

    if ((o.z).abs() < min) {
      cardinalAxis = .vec3(0.0, 0.0, 1.0);
    }

    return o.crossProduct(cardinalAxis);
  }
  Vector3D orthoNormalize(Vector3D o) {
    final n1 = normalize();
    final vn1 = n1.crossProduct(o).normalize();
    setD(n1);
    return vn1.crossProduct(n1);
  }
  Vector3D rotateByAxisAngle(Vector3D axis, double angle) {
    final w = axis.normalize().scale(math.sin(angle / 2.0));
    final wv = w.crossProduct(this);
    final wwv = w.crossProduct(wv).scale(2);
    return add(wv.scale(2 * math.cos(angle / 2.0))).add(wwv);
  }
  Vector3D moveTowards(Vector3D target, double maxDistance) {
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
  Vector3D lerp(Vector3D o, double amount) => .vec3(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
    z + amount*(o.z - z),
  );
  Vector3D clamp(Vector3D min, Vector3D max) => .vec3(
    math.min(max.x, math.max(min.x, x)),
    math.min(max.y, math.max(min.y, y)),
    math.min(max.z, math.max(min.z, z)),
  );
  Vector3D clampValue(double min, double max) {
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

  bool equals(Vector3D o) =>
    (((x - o.x).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs())))) &&
    (((z - o.z).abs()) <= (Raylib.instance.EPSILON*math.max(1.0, math.max((z).abs(), (o.z).abs()))));

  Vector3D cubicHermite(Vector3D tangent1, Vector3D v2, Vector3D tangent2, double amount) {
    final p2 = amount*amount;
    final p3 = amount*amount*amount;

    return .vec3(
      (2*p3 - 3*p2 + 1)*x + (p3 - 2*p2 + amount)*tangent1.x + (-2*p3 + 3*p2)*v2.x + (p3 - p2)*tangent2.x,
      (2*p3 - 3*p2 + 1)*y + (p3 - 2*p2 + amount)*tangent1.y + (-2*p3 + 3*p2)*v2.y + (p3 - p2)*tangent2.y,
      (2*p3 - 3*p2 + 1)*z + (p3 - 2*p2 + amount)*tangent1.z + (-2*p3 + 3*p2)*v2.z + (p3 - p2)*tangent2.z,
    );
  }
  Vector3D rotateByQuaternion(QuaternionD q) => .vec3(
    x*(q.x*q.x + q.w*q.w - q.y*q.y - q.z*q.z) + y*(2*q.x*q.y - 2*q.w*q.z) + z*(2*q.x*q.z + 2*q.w*q.y),
    x*(2*q.w*q.z + 2*q.x*q.y) + y*(q.w*q.w - q.x*q.x + q.y*q.y - q.z*q.z) + z*(-2*q.w*q.x + 2*q.y*q.z),
    x*(-2*q.w*q.y + 2*q.x*q.z) + y*(2*q.w*q.x + 2*q.y*q.z)+ z*(q.w*q.w - q.x*q.x - q.y*q.y + q.z*q.z),
  );

  Vector3D invert() => .vec3(1.0/x, 1.0/y, 1.0/z);

  Vector3D refract(Vector3D n, double r) {
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

  Vector3D unproject(MatrixD projection, MatrixD view) {
    MatrixD matViewProj = view.mul(projection).invert();
    QuaternionD qtransformed = .quat(x, y, z, 1.0).qTransform(matViewProj);
    return .vec3(
      qtransformed.x/qtransformed.w,
      qtransformed.y/qtransformed.w,
      qtransformed.z/qtransformed.w,
    );
  }

  factory Vector3D.barycenter(Vector3D p, Vector3D a, Vector3D b, Vector3D c) {
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

  List<double> toArray() => [x, y, z];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, z: ${z.f1})';

  @override
  Vector3D clone() => .new(
    originalPointer: originalPointer,
    x: x,
    y: y,
    z: z,
  );
}