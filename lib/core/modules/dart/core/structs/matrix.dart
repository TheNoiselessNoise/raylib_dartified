// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../../raylib.dart';

extension MatrixCLike on MatrixC {
  String format([int x0 = 0])
    => '[ ${[
      [m0, m1, m2, m3].map((x) => x.toStringAsFixed(x0)).join(', '),
      [m4, m5, m6, m7].map((x) => x.toStringAsFixed(x0)).join(', '),
      [m8, m9, m10, m11].map((x) => x.toStringAsFixed(x0)).join(', '),
      [m12, m13, m14, m15].map((x) => x.toStringAsFixed(x0)).join(', '),
    ].join('\n')} ]';
}

extension MatrixCPEx on Pointer<MatrixC> {
  Pointer<MatrixC> setC(MatrixC o) {
    ref.setC(o);
    return this;
  }

  Pointer<MatrixC> setD(MatrixD o) {
    ref.setD(o);
    return this;
  }

  Pointer<MatrixC> set(
    num m0, num m1, num m2, num m3,
    num m4, num m5, num m6, num m7,
    num m8, num m9, num m10, num m11,
    num m12, num m13, num m14, num m15,
  ) {
    ref.set(
      m0, m1, m2, m3,
      m4, m5, m6, m7,
      m8, m9, m10, m11,
      m12, m13, m14, m15,
    );
    return this;
  }

  MatrixD toD() => ref.toD(this);
}

extension MatrixCEx on MatrixC {
  MatrixC setC(MatrixC o) => set(
    o.m0, o.m1, o.m2, o.m3,
    o.m4, o.m5, o.m6, o.m7,
    o.m8, o.m9, o.m10, o.m11,
    o.m12, o.m13, o.m14, o.m15,
  );

  MatrixC setD(MatrixD o) => set(
    o.m0, o.m1, o.m2, o.m3,
    o.m4, o.m5, o.m6, o.m7,
    o.m8, o.m9, o.m10, o.m11,
    o.m12, o.m13, o.m14, o.m15,
  );

  MatrixC set(
    num m0, num m1, num m2, num m3,
    num m4, num m5, num m6, num m7,
    num m8, num m9, num m10, num m11,
    num m12, num m13, num m14, num m15,
  ) {
    this.m0 = m0.toDouble(); this.m1 = m1.toDouble(); this.m2 = m2.toDouble(); this.m3 = m3.toDouble();
    this.m4 = m4.toDouble(); this.m5 = m5.toDouble(); this.m6 = m6.toDouble(); this.m7 = m7.toDouble();
    this.m8 = m8.toDouble(); this.m9 = m9.toDouble(); this.m10 = m10.toDouble(); this.m11 = m11.toDouble();
    this.m12 = m12.toDouble(); this.m13 = m13.toDouble(); this.m14 = m14.toDouble(); this.m15 = m15.toDouble();
    return this;
  }

  MatrixD toD([Pointer<MatrixC>? ptr]) => .new(
    originalPointer: ptr,
    m0: m0, m1: m1, m2: m2, m3: m3,
    m4: m4, m5: m5, m6: m6, m7: m7,
    m8: m8, m9: m9, m10: m10, m11: m11,
    m12: m12, m13: m13, m14: m14, m15: m15,
  );

  MatrixC add(MatrixC o) => set(
    m0+o.m0, m1+o.m1, m2+o.m2, m3+o.m3,
    m4+o.m4, m5+o.m5, m6+o.m6, m7+o.m7,
    m8+o.m8, m9+o.m9, m10+o.m10, m11+o.m11,
    m12+o.m12, m13+o.m13, m14+o.m14, m15+o.m15,
  );

  MatrixC sub(MatrixC o) => set(
    m0-o.m0, m1-o.m1, m2-o.m2, m3-o.m3,
    m4-o.m4, m5-o.m5, m6-o.m6, m7-o.m7,
    m8-o.m8, m9-o.m9, m10-o.m10, m11-o.m11,
    m12-o.m12, m13-o.m13, m14-o.m14, m15-o.m15,
  );

  MatrixC mul(MatrixC o) => set(
    m0*o.m0 + m1*o.m4 + m2*o.m8 + m3*o.m12,
    m0*o.m1 + m1*o.m5 + m2*o.m9 + m3*o.m13,
    m0*o.m2 + m1*o.m6 + m2*o.m10 + m3*o.m14,
    m0*o.m3 + m1*o.m7 + m2*o.m11 + m3*o.m15,
    m4*o.m0 + m5*o.m4 + m6*o.m8 + m7*o.m12,
    m4*o.m1 + m5*o.m5 + m6*o.m9 + m7*o.m13,
    m4*o.m2 + m5*o.m6 + m6*o.m10 + m7*o.m14,
    m4*o.m3 + m5*o.m7 + m6*o.m11 + m7*o.m15,
    m8*o.m0 + m9*o.m4 + m10*o.m8 + m11*o.m12,
    m8*o.m1 + m9*o.m5 + m10*o.m9 + m11*o.m13,
    m8*o.m2 + m9*o.m6 + m10*o.m10 + m11*o.m14,
    m8*o.m3 + m9*o.m7 + m10*o.m11 + m11*o.m15,
    m12*o.m0 + m13*o.m4 + m14*o.m8 + m15*o.m12,
    m12*o.m1 + m13*o.m5 + m14*o.m9 + m15*o.m13,
    m12*o.m2 + m13*o.m6 + m14*o.m10 + m15*o.m14,
    m12*o.m3 + m13*o.m7 + m14*o.m11 + m15*o.m15,
  );

  MatrixC translate(num x, num y, num z) => set(
    1.0, 0.0, 0.0, x,
    0.0, 1.0, 0.0, y,
    0.0, 0.0, 1.0, z,
    0.0, 0.0, 0.0, 1.0
  );
  
  MatrixC translateVector(Vector3C v) => translate(v.x, v.y, v.z);
}

class MatrixD extends StructDLiteral<MatrixC, MatrixD> with MatrixBase {
  @override
  double
    m0, m1, m2, m3,
    m4, m5, m6, m7,
    m8, m9, m10, m11,
    m12, m13, m14, m15;

  MatrixD({
    super.originalPointer,
    this.m0 = 0, this.m1 = 0, this.m2 = 0, this.m3 = 0,
    this.m4 = 0, this.m5 = 0, this.m6 = 0, this.m7 = 0,
    this.m8 = 0, this.m9 = 0, this.m10 = 0, this.m11 = 0,
    this.m12 = 0, this.m13 = 0, this.m14 = 0, this.m15 = 0,
  });

  factory MatrixD.zero() => .new();

  static double _d(num x) => x.toDouble();

  factory MatrixD.mat4(
    num m0, num m1, num m2, num m3,
    num m4, num m5, num m6, num m7,
    num m8, num m9, num m10, num m11,
    num m12, num m13, num m14, num m15,
  ) {
    return .new(
      m0:  _d(m0),   m1: _d(m1),   m2: _d(m2),   m3: _d(m3),
      m4:  _d(m4),   m5: _d(m5),   m6: _d(m6),   m7: _d(m7),
      m8:  _d(m8),   m9: _d(m9),  m10: _d(m10), m11: _d(m11),
      m12: _d(m12), m13: _d(m13), m14: _d(m14), m15: _d(m15),
    );
  }

  factory MatrixD.lookAt(Vector3D eye, Vector3D target, Vector3D up)
  {
    final vz = eye.sub(target).normalize();
    final vx = up.crossProduct(vz).normalize();
    final vy = vz.crossProduct(vx);

    MatrixD result = .zero();

    result.m0 = vx.x;
    result.m1 = vy.x;
    result.m2 = vz.x;

    result.m4 = vx.y;
    result.m5 = vy.y;
    result.m6 = vz.y;

    result.m8 = vx.z;
    result.m9 = vy.z;
    result.m10 = vz.z;

    result.m12 = vx.dotProduct(eye);
    result.m13 = vy.dotProduct(eye);
    result.m14 = vz.dotProduct(eye);
    result.m15 = 1.0;

    return result;
  }

  MatrixD transpose() => .mat4(
    m0, m4, m8, m12,
    m1, m5, m9, m13,
    m2, m6, m10, m14,
    m3, m7, m11, m15,
  );

  MatrixD invert() {
    MatrixD result = .zero();

    final a00 = m0, a01 = m1, a02 = m2, a03 = m3;
    final a10 = m4, a11 = m5, a12 = m6, a13 = m7;
    final a20 = m8, a21 = m9, a22 = m10, a23 = m11;
    final a30 = m12, a31 = m13, a32 = m14, a33 = m15;

    final b00 = a00*a11 - a01*a10;
    final b01 = a00*a12 - a02*a10;
    final b02 = a00*a13 - a03*a10;
    final b03 = a01*a12 - a02*a11;
    final b04 = a01*a13 - a03*a11;
    final b05 = a02*a13 - a03*a12;
    final b06 = a20*a31 - a21*a30;
    final b07 = a20*a32 - a22*a30;
    final b08 = a20*a33 - a23*a30;
    final b09 = a21*a32 - a22*a31;
    final b10 = a21*a33 - a23*a31;
    final b11 = a22*a33 - a23*a32;

    final invDet = 1.0/(b00*b11 - b01*b10 + b02*b09 + b03*b08 - b04*b07 + b05*b06);

    result.m0 = (a11*b11 - a12*b10 + a13*b09)*invDet;
    result.m1 = (-a01*b11 + a02*b10 - a03*b09)*invDet;
    result.m2 = (a31*b05 - a32*b04 + a33*b03)*invDet;
    result.m3 = (-a21*b05 + a22*b04 - a23*b03)*invDet;
    result.m4 = (-a10*b11 + a12*b08 - a13*b07)*invDet;
    result.m5 = (a00*b11 - a02*b08 + a03*b07)*invDet;
    result.m6 = (-a30*b05 + a32*b02 - a33*b01)*invDet;
    result.m7 = (a20*b05 - a22*b02 + a23*b01)*invDet;
    result.m8 = (a10*b10 - a11*b08 + a13*b06)*invDet;
    result.m9 = (-a00*b10 + a01*b08 - a03*b06)*invDet;
    result.m10 = (a30*b04 - a31*b02 + a33*b00)*invDet;
    result.m11 = (-a20*b04 + a21*b02 - a23*b00)*invDet;
    result.m12 = (-a10*b09 + a11*b07 - a12*b06)*invDet;
    result.m13 = (a00*b09 - a01*b07 + a02*b06)*invDet;
    result.m14 = (-a30*b03 + a31*b01 - a32*b00)*invDet;
    result.m15 = (a20*b03 - a21*b01 + a22*b00)*invDet;

    return result;
  }

  factory MatrixD.identity() => .new(
    m0: 1.0, /*------------------------*/
    /*----*/ m5: 1.0, /*---------------*/
    /*-------------*/ m10: 1.0, /*-----*/
    /*-----------------------*/ m15: 1.0,
  );

  factory MatrixD.scale(double x, double y, double z) => .new(
    m0: x, /*--------------------*/
    /*--*/ m5: y, /*-------------*/
    /*---------*/ m10: z, /*-----*/
    /*-----------------*/ m15: 1.0,
  );

  @override
  MatrixD setC(MatrixC o) => set(
    o.m0, o.m1, o.m2, o.m3,
    o.m4, o.m5, o.m6, o.m7,
    o.m8, o.m9, o.m10, o.m11,
    o.m12, o.m13, o.m14, o.m15,
  );

  @override
  MatrixD setD(MatrixD o) {
    originalPointer ??= o.originalPointer;
    return set(
      o.m0, o.m1, o.m2, o.m3,
      o.m4, o.m5, o.m6, o.m7,
      o.m8, o.m9, o.m10, o.m11,
      o.m12, o.m13, o.m14, o.m15,
    );
  }

  MatrixD set(
    num m0, num m1, num m2, num m3,
    num m4, num m5, num m6, num m7,
    num m8, num m9, num m10, num m11,
    num m12, num m13, num m14, num m15,
  ) {
    this.m0 = _d(m0); this.m1 = _d(m1); this.m2 = _d(m2); this.m3 = _d(m3);
    this.m4 = _d(m4); this.m5 = _d(m5); this.m6 = _d(m6); this.m7 = _d(m7);
    this.m8 = _d(m8); this.m9 = _d(m9); this.m10 = _d(m10); this.m11 = _d(m11);
    this.m12 = _d(m12); this.m13 = _d(m13); this.m14 = _d(m14); this.m15 = _d(m15);
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.Matrix$;

  @override
  void nativeWriteInto(MatrixC p) {
    p.m0 = m0; p.m1 = m1; p.m2 = m2; p.m3 = m3;
    p.m4 = m4; p.m5 = m5; p.m6 = m6; p.m7 = m7;
    p.m8 = m8; p.m9 = m9; p.m10 = m10; p.m11 = m11;
    p.m12 = m12; p.m13 = m13; p.m14 = m14; p.m15 = m15;
  }

  MatrixD add(MatrixD o) => .mat4(
    m0+o.m0, m1+o.m1, m2+o.m2, m3+o.m3,
    m4+o.m4, m5+o.m5, m6+o.m6, m7+o.m7,
    m8+o.m8, m9+o.m9, m10+o.m10, m11+o.m11,
    m12+o.m12, m13+o.m13, m14+o.m14, m15+o.m15,
  );

  MatrixD sub(MatrixD o) => .mat4(
    m0-o.m0, m1-o.m1, m2-o.m2, m3-o.m3,
    m4-o.m4, m5-o.m5, m6-o.m6, m7-o.m7,
    m8-o.m8, m9-o.m9, m10-o.m10, m11-o.m11,
    m12-o.m12, m13-o.m13, m14-o.m14, m15-o.m15,
  );

  MatrixD mul(MatrixD o) => .mat4(
    m0*o.m0 + m1*o.m4 + m2*o.m8 + m3*o.m12,
    m0*o.m1 + m1*o.m5 + m2*o.m9 + m3*o.m13,
    m0*o.m2 + m1*o.m6 + m2*o.m10 + m3*o.m14,
    m0*o.m3 + m1*o.m7 + m2*o.m11 + m3*o.m15,
    m4*o.m0 + m5*o.m4 + m6*o.m8 + m7*o.m12,
    m4*o.m1 + m5*o.m5 + m6*o.m9 + m7*o.m13,
    m4*o.m2 + m5*o.m6 + m6*o.m10 + m7*o.m14,
    m4*o.m3 + m5*o.m7 + m6*o.m11 + m7*o.m15,
    m8*o.m0 + m9*o.m4 + m10*o.m8 + m11*o.m12,
    m8*o.m1 + m9*o.m5 + m10*o.m9 + m11*o.m13,
    m8*o.m2 + m9*o.m6 + m10*o.m10 + m11*o.m14,
    m8*o.m3 + m9*o.m7 + m10*o.m11 + m11*o.m15,
    m12*o.m0 + m13*o.m4 + m14*o.m8 + m15*o.m12,
    m12*o.m1 + m13*o.m5 + m14*o.m9 + m15*o.m13,
    m12*o.m2 + m13*o.m6 + m14*o.m10 + m15*o.m14,
    m12*o.m3 + m13*o.m7 + m14*o.m11 + m15*o.m15,
  );

  double determinant() =>
     m12*m9*m6*m3 -  m8*m13*m6*m3 - m12*m5*m10*m3 + m4*m13*m10*m3 +
     m8*m5*m14*m3 -  m4*m9*m14*m3 -  m12*m9*m2*m7 +  m8*m13*m2*m7 +
    m12*m1*m10*m7 - m0*m13*m10*m7 -  m8*m1*m14*m7 +  m0*m9*m14*m7 +
    m12*m5*m2*m11 - m4*m13*m2*m11 - m12*m1*m6*m11 + m0*m13*m6*m11 +
    m4*m1*m14*m11 - m0*m5*m14*m11 -  m8*m5*m2*m15 +  m4*m9*m2*m15 +
     m8*m1*m6*m15 -  m0*m9*m6*m15 - m4*m1*m10*m15 + m0*m5*m10*m15;

  double trace() => m0 + m5 + m10 + m15;

  (Vector3D translation, QuaternionD rotation, Vector3D scale) decompose() {
    late Vector3D translation;
    late QuaternionD rotation;
    late Vector3D scale;

    // Extract translation.
    translation = .vec3(m12, m13, m14);

    // Extract upper-left for determinant computation
    final a = m0;
    final b = m4;
    final c = m8;
    final d = m1;
    final e = m5;
    final f = m9;
    final g = m2;
    final h = m6;
    final i = m10;
    final A = e*i - f*h;
    final B = f*g - d*i;
    final C = d*h - e*g;

    // Extract scale
    final det = a*A + b*B + c*C;
    Vector3D abc = .vec3(a, b, c);
    Vector3D def = .vec3(d, e, f);
    Vector3D ghi = .vec3(g, h, i);

    Vector3D s = .vec3(abc.length, def.length, ghi.length);
    if (det < 0) s = s.negate();
    scale = s;

    // Remove scale from the matrix if it is not close to zero
    MatrixD clone = this.clone();
    if (!Raylib.instance.FloatEquals(det, 0)) {
      clone.m0 /= s.x;
      clone.m4 /= s.x;
      clone.m8 /= s.x;
      clone.m1 /= s.y;
      clone.m5 /= s.y;
      clone.m9 /= s.y;
      clone.m2 /= s.z;
      clone.m6 /= s.z;
      clone.m10 /= s.z;

      // Extract rotation
      rotation = .fromMatrix(clone);
    } else {
      // Set to identity if close to zero
      rotation = .identity();
    }

    return (translation, rotation, scale);
  }

  factory MatrixD.translate(num x, num y, num z) => .new(
    m0: 1.0, /*--------------*/ m12: _d(x),
    /*----*/ m5: 1.0, /*-----*/ m13: _d(y),
    /*-------------*/ m10: 1.0, m14: _d(z),
    /*-----------------------*/ m15: 1.0,
  );
  
  factory MatrixD.translateVector3(Vector3D v) => .translate(v.x, v.y, v.z);

  factory MatrixD.rotateAngle(Vector3D axis, double angle) {
    double x = axis.x, y = axis.y, z = axis.z;

    final lengthSquared = x*x + y*y + z*z;

    if ((lengthSquared != 1.0) && (lengthSquared != 0.0))
    {
      final ilength = 1.0/math.sqrt(lengthSquared);
      x *= ilength;
      y *= ilength;
      z *= ilength;
    }

    final sinres = math.sin(angle);
    final cosres = math.cos(angle);
    final t = 1.0 - cosres;

    MatrixD result = .zero();

    result.m0 = x*x*t + cosres;
    result.m1 = y*x*t + z*sinres;
    result.m2 = z*x*t - y*sinres;

    result.m4 = x*y*t - z*sinres;
    result.m5 = y*y*t + cosres;
    result.m6 = z*y*t + x*sinres;

    result.m8 = x*z*t + y*sinres;
    result.m9 = y*z*t - x*sinres;
    result.m10 = z*z*t + cosres;

    result.m15 = 1.0;

    return result;
  }

  factory MatrixD.rotateXYZ(Vector3D angle) {
    MatrixD result = .identity();

    final cosz = math.cos(-angle.z);
    final sinz = math.sin(-angle.z);
    final cosy = math.cos(-angle.y);
    final siny = math.sin(-angle.y);
    final cosx = math.cos(-angle.x);
    final sinx = math.sin(-angle.x);

    result.m0 = cosz*cosy;
    result.m1 = (cosz*siny*sinx) - (sinz*cosx);
    result.m2 = (cosz*siny*cosx) + (sinz*sinx);

    result.m4 = sinz*cosy;
    result.m5 = (sinz*siny*sinx) + (cosz*cosx);
    result.m6 = (sinz*siny*cosx) - (cosz*sinx);

    result.m8 = -siny;
    result.m9 = cosy*sinx;
    result.m10= cosy*cosx;

    return result;
  }

  factory MatrixD.rotateZYX(Vector3D angle) {
    MatrixD result = .zero();

    final cz = math.cos(angle.z);
    final sz = math.sin(angle.z);
    final cy = math.cos(angle.y);
    final sy = math.sin(angle.y);
    final cx = math.cos(angle.x);
    final sx = math.sin(angle.x);

    result.m0 = cz*cy;
    result.m4 = cz*sy*sx - cx*sz;
    result.m8 = sz*sx + cz*cx*sy;

    result.m1 = cy*sz;
    result.m5 = cz*cx + sz*sy*sx;
    result.m9 = cx*sz*sy - cz*sx;

    result.m2 = -sy;
    result.m6 = cy*sx;
    result.m10 = cy*cx;

    result.m15 = 1;

    return result;
  }

  factory MatrixD.frustum(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) {
    MatrixD result = .zero();

    final rl = right - left;
    final tb = top - bottom;
    final fn = farPlane - nearPlane;

    result.m0 = (nearPlane*2.0)/rl;
    result.m5 = (nearPlane*2.0)/tb;
    result.m8 = (right + left)/rl;
    result.m9 = (top + bottom)/tb;
    result.m10 = -(farPlane + nearPlane)/fn;
    result.m11 = -1.0;
    result.m14 = -(farPlane*nearPlane*2.0)/fn;

    return result;
  }

  factory MatrixD.perspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  ) {
    final top = nearPlane*math.tan(fovY*0.5);
    final right = top*aspect;

    return .frustum(-right, right, -top, top, nearPlane, farPlane);
  }

  factory MatrixD.ortho(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) {
    MatrixD result = .zero();

    final rl = right - left;
    final tb = top - bottom;
    final fn = farPlane - nearPlane;

    result.m0 = 2.0/rl;
    result.m5 = 2.0/tb;
    result.m10 = -2.0/fn;
    result.m12 = -(left + right)/rl;
    result.m13 = -(top + bottom)/tb;
    result.m14 = -(farPlane + nearPlane)/fn;
    result.m15 = 1.0;

    return result;
  }

  factory MatrixD.rotateX(double angle) {
    MatrixD result = .identity();

    final cosres = math.cos(angle);
    final sinres = math.sin(angle);

    result.m5 = cosres;
    result.m6 = sinres;
    result.m9 = -sinres;
    result.m10 = cosres;

    return result;
  }

  factory MatrixD.rotateY(double angle) {
    MatrixD result = .identity();

    final cosres = math.cos(angle);
    final sinres = math.sin(angle);

    result.m0 = cosres;
    result.m2 = -sinres;
    result.m8 = sinres;
    result.m10 = cosres;

    return result;
  }

  factory MatrixD.rotateZ(double angle) {
    MatrixD result = .identity();

    final cosres = math.cos(angle);
    final sinres = math.sin(angle);

    result.m0 = cosres;
    result.m1 = sinres;
    result.m4 = -sinres;
    result.m5 = cosres;

    return result;
  }

  factory MatrixD.fromQuaternion(QuaternionD q) {
    MatrixD result = .identity();

    final a2 = q.x*q.x;
    final b2 = q.y*q.y;
    final c2 = q.z*q.z;
    final ac = q.x*q.z;
    final ab = q.x*q.y;
    final bc = q.y*q.z;
    final ad = q.w*q.x;
    final bd = q.w*q.y;
    final cd = q.w*q.z;

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

  List<double> toArray() => [
    m0, m1, m2, m3,
    m4, m5, m6, m7,
    m8, m9, m10, m11,
    m12, m13, m14, m15
  ];

  @override
  String signature() => '$structName(${toArray().map((x) => x.f1).join(', ')})';

  @override
  MatrixD clone() => .new(
    originalPointer: originalPointer,
    m0: m0, m1: m1, m2: m2, m3: m3,
    m4: m4, m5: m5, m6: m6, m7: m7,
    m8: m8, m9: m9, m10: m10, m11: m11,
    m12: m12, m13: m13, m14: m14, m15: m15,
  );
}