// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

enum MatrixField with XFields {
  m0, m4, m8, m12,
  m1, m5, m9, m13,
  m2, m6, m10, m14,
  m3, m7, m11, m15,
}

/// Matrix, 4x4 components, column major, OpenGL style, right-handed
final class Matrix extends XStruct<Matrix> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Matrix> struct = .createValue(
    factory: Matrix.new,
    layout: .aligned<MatrixField>({
      .m0: XFloat(), .m4: XFloat(), .m8: XFloat(), .m12: XFloat(), // Matrix first row (4 components)
      .m1: XFloat(), .m5: XFloat(), .m9: XFloat(), .m13: XFloat(), // Matrix second row (4 components)
      .m2: XFloat(), .m6: XFloat(), .m10: XFloat(), .m14: XFloat(), // Matrix third row (4 components)
      .m3: XFloat(), .m7: XFloat(), .m11: XFloat(), .m15: XFloat(), // Matrix fourth row (4 components)
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<MatrixField> _l = struct.layoutOf();

  /// Field descriptor for [m0].
  static final field_m0 = _l.float<XFloat>(.m0);
  /// Field descriptor for [m4].
  static final field_m4 = _l.float<XFloat>(.m4);
  /// Field descriptor for [m8].
  static final field_m8 = _l.float<XFloat>(.m8);
  /// Field descriptor for [m12].
  static final field_m12 = _l.float<XFloat>(.m12);
  /// Field descriptor for [m1].
  static final field_m1 = _l.float<XFloat>(.m1);
  /// Field descriptor for [m5].
  static final field_m5 = _l.float<XFloat>(.m5);
  /// Field descriptor for [m9].
  static final field_m9 = _l.float<XFloat>(.m9);
  /// Field descriptor for [m13].
  static final field_m13 = _l.float<XFloat>(.m13);
  /// Field descriptor for [m2].
  static final field_m2 = _l.float<XFloat>(.m2);
  /// Field descriptor for [m6].
  static final field_m6 = _l.float<XFloat>(.m6);
  /// Field descriptor for [m10].
  static final field_m10 = _l.float<XFloat>(.m10);
  /// Field descriptor for [m14].
  static final field_m14 = _l.float<XFloat>(.m14);
  /// Field descriptor for [m3].
  static final field_m3 = _l.float<XFloat>(.m3);
  /// Field descriptor for [m7].
  static final field_m7 = _l.float<XFloat>(.m7);
  /// Field descriptor for [m11].
  static final field_m11 = _l.float<XFloat>(.m11);
  /// Field descriptor for [m15].
  static final field_m15 = _l.float<XFloat>(.m15);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  double _m0;
  /// Column 0, row 0
  double get m0 => _m0 = field_m0.readOr(op, _m0);
  set m0(double value) => _m0 = field_m0.writeOr(op, value);
  
  double _m1;
  /// Column 0, row 1
  double get m1 => _m1 = field_m1.readOr(op, _m1);
  set m1(double value) => _m1 = field_m1.writeOr(op, value);
  
  double _m2;
  /// Column 0, row 2
  double get m2 => _m2 = field_m2.readOr(op, _m2);
  set m2(double value) => _m2 = field_m2.writeOr(op, value);
  
  double _m3;
  /// Column 0, row 3
  double get m3 => _m3 = field_m3.readOr(op, _m3);
  set m3(double value) => _m3 = field_m3.writeOr(op, value);

  double _m4;
  /// Column 1, row 0
  double get m4 => _m4 = field_m4.readOr(op, _m4);
  set m4(double value) => _m4 = field_m4.writeOr(op, value);

  double _m5;
  /// Column 1, row 1
  double get m5 => _m5 = field_m5.readOr(op, _m5);
  set m5(double value) => _m5 = field_m5.writeOr(op, value);

  double _m6;
  /// Column 1, row 2
  double get m6 => _m6 = field_m6.readOr(op, _m6);
  set m6(double value) => _m6 = field_m6.writeOr(op, value);
  
  double _m7;
  /// Column 1, row 3
  double get m7 => _m7 = field_m7.readOr(op, _m7);
  set m7(double value) => _m7 = field_m7.writeOr(op, value);

  double _m8;
  /// Column 2, row 0
  double get m8 => _m8 = field_m8.readOr(op, _m8);
  set m8(double value) => _m8 = field_m8.writeOr(op, value);
  
  double _m9;
  /// Column 2, row 1
  double get m9 => _m9 = field_m9.readOr(op, _m9);
  set m9(double value) => _m9 = field_m9.writeOr(op, value);
  
  double _m10;
  /// Column 2, row 2
  double get m10 => _m10 = field_m10.readOr(op, _m10);
  set m10(double value) => _m10 = field_m10.writeOr(op, value);

  double _m11;
  /// Column 2, row 3
  double get m11 => _m11 = field_m11.readOr(op, _m11);
  set m11(double value) => _m11 = field_m11.writeOr(op, value);
  
  double _m12;
  /// Column 3, row 0 (translation X)
  double get m12 => _m12 = field_m12.readOr(op, _m12);
  set m12(double value) => _m12 = field_m12.writeOr(op, value);
  
  double _m13;
  /// Column 3, row 1 (translation Y)
  double get m13 => _m13 = field_m13.readOr(op, _m13);
  set m13(double value) => _m13 = field_m13.writeOr(op, value);
  
  double _m14;
  /// Column 3, row 2 (translation Z)
  double get m14 => _m14 = field_m14.readOr(op, _m14);
  set m14(double value) => _m14 = field_m14.writeOr(op, value);
  
  double _m15;
  /// Column 3, row 3
  double get m15 => _m15 = field_m15.readOr(op, _m15);
  set m15(double value) => _m15 = field_m15.writeOr(op, value);

  Matrix({
    super.op,
    this._m0 = 0, this._m1 = 0, this._m2 = 0, this._m3 = 0,
    this._m4 = 0, this._m5 = 0, this._m6 = 0, this._m7 = 0,
    this._m8 = 0, this._m9 = 0, this._m10 = 0, this._m11 = 0,
    this._m12 = 0, this._m13 = 0, this._m14 = 0, this._m15 = 0,
  });

  factory Matrix.zero() => .new();

  static double _d(num x) => x.toDouble();

  factory Matrix.mat4(
    num m0, num m1, num m2, num m3,
    num m4, num m5, num m6, num m7,
    num m8, num m9, num m10, num m11,
    num m12, num m13, num m14, num m15,
  ) => .new(
    m0:  _d(m0),   m1: _d(m1),   m2: _d(m2),   m3: _d(m3),
    m4:  _d(m4),   m5: _d(m5),   m6: _d(m6),   m7: _d(m7),
    m8:  _d(m8),   m9: _d(m9),  m10: _d(m10), m11: _d(m11),
    m12: _d(m12), m13: _d(m13), m14: _d(m14), m15: _d(m15),
  );

  factory Matrix.mat4RowMajor(
    num m0, num m4, num m8, num m12,
    num m1, num m5, num m9, num m13,
    num m2, num m6, num m10, num m14,
    num m3, num m7, num m11, num m15,
  ) => .new(
    m0:  _d(m0),   m1: _d(m1),   m2: _d(m2),   m3: _d(m3),
    m4:  _d(m4),   m5: _d(m5),   m6: _d(m6),   m7: _d(m7),
    m8:  _d(m8),   m9: _d(m9),  m10: _d(m10), m11: _d(m11),
    m12: _d(m12), m13: _d(m13), m14: _d(m14), m15: _d(m15),
  );

  @override
  Matrix setDart(Matrix o) {
    return set(
      o.m0, o.m1, o.m2, o.m3,
      o.m4, o.m5, o.m6, o.m7,
      o.m8, o.m9, o.m10, o.m11,
      o.m12, o.m13, o.m14, o.m15,
    );
  }

  @override
  void structWriteInto(XPtr p) {
    field_m0.write(p, m0);
    field_m4.write(p, m4);
    field_m8.write(p, m8);
    field_m12.write(p, m12);

    field_m1.write(p, m1);
    field_m5.write(p, m5);
    field_m9.write(p, m9);
    field_m13.write(p, m13);

    field_m2.write(p, m2);
    field_m6.write(p, m6);
    field_m10.write(p, m10);
    field_m14.write(p, m14);

    field_m3.write(p, m3);
    field_m7.write(p, m7);
    field_m11.write(p, m11);
    field_m15.write(p, m15);
  }

  @override
  void structReadFrom(XPtr p) {
    m0 = field_m0.read(p);
    m4 = field_m4.read(p);
    m8 = field_m8.read(p);
    m12 = field_m12.read(p);

    m1 = field_m1.read(p);
    m5 = field_m5.read(p);
    m9 = field_m9.read(p);
    m13 = field_m13.read(p);

    m2 = field_m2.read(p);
    m6 = field_m6.read(p);
    m10 = field_m10.read(p);
    m14 = field_m14.read(p);

    m3 = field_m3.read(p);
    m7 = field_m7.read(p);
    m11 = field_m11.read(p);
    m15 = field_m15.read(p);
  }

  /// Returns the 4x4 identity matrix.
  factory Matrix.identity() => .mat4(
    1, 0, 0, 0,
    0, 1, 0, 0,
    0, 0, 1, 0,
    0, 0, 0, 1,
  );

  /// Returns a view matrix oriented from [eye] toward [target], with [up] defining the vertical axis.
  factory Matrix.lookAt(Vector3 eye, Vector3 target, Vector3 up)
  {
    final vz = eye.sub(target).normalize();
    final vx = up.crossProduct(vz).normalize();
    final vy = vz.crossProduct(vx);

    final Matrix result = .zero();

    result.m0 = vx.x;
    result.m1 = vy.x;
    result.m2 = vz.x;

    result.m4 = vx.y;
    result.m5 = vy.y;
    result.m6 = vz.y;

    result.m8 = vx.z;
    result.m9 = vy.z;
    result.m10 = vz.z;

    result.m12 = -vx.dotProduct(eye);
    result.m13 = -vy.dotProduct(eye);
    result.m14 = -vz.dotProduct(eye);
    result.m15 = 1.0;

    return result;
  }

  /// Returns a scaling matrix for the given [x], [y], [z] factors.
  factory Matrix.scale(double x, double y, double z) => .mat4(
    x, 0, 0, 0,
    0, y, 0, 0,
    0, 0, z, 0,
    0, 0, 0, 1,
  );

  /// Returns a translation matrix for the given [x], [y], [z] offsets.
  factory Matrix.translate(num x, num y, num z) => .mat4(
    1, 0, 0, 0,
    0, 1, 0, 0,
    0, 0, 1, 0,
    _d(x), _d(y), _d(z), 1,
  );
  
  /// Returns a translation matrix from [v]'s components. Convenience wrapper for [translate].
  factory Matrix.translateVector3(Vector3 v) => .translate(v.x, v.y, v.z);

  /// Returns a rotation matrix around [axis] by [angle] radians.
  factory Matrix.rotateAngle(Vector3 axis, double angle) {
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

    final Matrix result = .zero();

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

  /// Returns a rotation matrix applied in X > Y > Z order from [angle]'s components (in radians).
  factory Matrix.rotateXYZ(Vector3 angle) {
    final Matrix result = .identity();

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

  /// Returns a rotation matrix applied in Z > Y > X order from [angle]'s components (in radians).
  factory Matrix.rotateZYX(Vector3 angle) {
    final Matrix result = .zero();

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

  /// Returns a perspective projection matrix defined by the given frustum planes.
  factory Matrix.frustum(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) {
    final Matrix result = .zero();

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

  /// Returns a perspective projection matrix from a vertical FOV [fovY] (in radians), [aspect] ratio, and clip planes.
  factory Matrix.perspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  ) {
    final top = nearPlane*math.tan(fovY*0.5);
    final right = top*aspect;
    return .frustum(-right, right, -top, top, nearPlane, farPlane);
  }

  /// Returns an orthographic projection matrix defined by the given clip planes.
  factory Matrix.ortho(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) {
    final Matrix result = .zero();

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

  /// Returns a rotation matrix around the X axis by [angle] radians.
  factory Matrix.rotateX(double angle) {
    final Matrix result = .identity();

    final cosres = math.cos(angle);
    final sinres = math.sin(angle);

    result.m5 = cosres;
    result.m6 = sinres;
    result.m9 = -sinres;
    result.m10 = cosres;

    return result;
  }

  /// Returns a rotation matrix around the Y axis by [angle] radians.
  factory Matrix.rotateY(double angle) {
    final Matrix result = .identity();

    final cosres = math.cos(angle);
    final sinres = math.sin(angle);

    result.m0 = cosres;
    result.m2 = -sinres;
    result.m8 = sinres;
    result.m10 = cosres;

    return result;
  }

  /// Returns a rotation matrix around the Z axis by [angle] radians.
  factory Matrix.rotateZ(double angle) {
    final Matrix result = .identity();

    final cosres = math.cos(angle);
    final sinres = math.sin(angle);

    result.m0 = cosres;
    result.m1 = sinres;
    result.m4 = -sinres;
    result.m5 = cosres;

    return result;
  }

  /// Returns a transformation matrix composed of a rotational, translational and scaling components.
  factory Matrix.compose(
    Vector3 translation,
    Quaternion rotation,
    Vector3 scale,
  ) {
    Vector3 right = .vec3(1.0, 0.0, 0.0);
    Vector3 up = .vec3(0.0, 1.0, 0.0);
    Vector3 forward = .vec3(0.0, 0.0, 1.0);

    right = right.scale(scale.x);
    up = up.scale(scale.y);
    forward = forward.scale(scale.z);

    right = right.rotateByQuaternion(rotation);
    up = up.rotateByQuaternion(rotation);
    forward = forward.rotateByQuaternion(rotation);

    return .mat4RowMajor(
      right.x, up.x, forward.x, translation.x,
      right.y, up.y, forward.y, translation.y,
      right.z, up.z, forward.z, translation.z,
      0.0, 0.0, 0.0, 1.0,
    );
  }

  /// Returns the rotation matrix equivalent of quaternion [q].
  factory Matrix.fromQuaternion(Quaternion q) {
    final Matrix result = .identity();

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

  /// Sets all components in column-major order at once.
  /// 
  /// Values are converted using [num.toDouble].
  Matrix set(
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

  /// Returns a formatted 4x4 matrix string with each row on its own line.
  ///
  /// [x0] controls the number of decimal places for all components.
  String format([int x0 = 0])
    => '[ ${[
      [m0, m1, m2, m3].map((x) => x.toStringAsFixed(x0)).join(', '),
      [m4, m5, m6, m7].map((x) => x.toStringAsFixed(x0)).join(', '),
      [m8, m9, m10, m11].map((x) => x.toStringAsFixed(x0)).join(', '),
      [m12, m13, m14, m15].map((x) => x.toStringAsFixed(x0)).join(', '),
    ].join('\n')} ]';

  /// Returns a new matrix that is the transpose of this one.
  Matrix transpose() => .mat4(
    m0, m4, m8, m12,
    m1, m5, m9, m13,
    m2, m6, m10, m14,
    m3, m7, m11, m15,
  );

  /// Returns a new matrix that is the inverse of this one.
  ///
  /// Uses the cofactor expansion method. Result is undefined if the matrix
  /// is singular (i.e. [determinant] is zero).
  Matrix invert() {
    final Matrix result = .zero();

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

  /// Returns a new matrix that is the component-wise sum of this and [o].
  Matrix add(Matrix o) => .mat4(
    m0+o.m0, m1+o.m1, m2+o.m2, m3+o.m3,
    m4+o.m4, m5+o.m5, m6+o.m6, m7+o.m7,
    m8+o.m8, m9+o.m9, m10+o.m10, m11+o.m11,
    m12+o.m12, m13+o.m13, m14+o.m14, m15+o.m15,
  );

  /// Returns a new matrix that is the component-wise difference of this and [o].
  Matrix sub(Matrix o) => .mat4(
    m0-o.m0, m1-o.m1, m2-o.m2, m3-o.m3,
    m4-o.m4, m5-o.m5, m6-o.m6, m7-o.m7,
    m8-o.m8, m9-o.m9, m10-o.m10, m11-o.m11,
    m12-o.m12, m13-o.m13, m14-o.m14, m15-o.m15,
  );

  /// Returns a new matrix that is the product of this and [o].
  ///
  /// Follows standard matrix multiplication rules; not commutative.
  Matrix mul(Matrix o) => .mat4(
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

  /// Returns a new matrix with components multiplied by [value].
  Matrix mulValue(double value) => .mat4(
    m0*value, m1*value, m2*value, m3*value,
    m4*value, m5*value, m6*value, m7*value,
    m8*value, m9*value, m10*value, m11*value,
    m12*value, m13*value, m14*value, m15*value,
  );

  /// Returns the determinant of this matrix.
  double determinant() =>
     m12*m9*m6*m3 -  m8*m13*m6*m3 - m12*m5*m10*m3 + m4*m13*m10*m3 +
     m8*m5*m14*m3 -  m4*m9*m14*m3 -  m12*m9*m2*m7 +  m8*m13*m2*m7 +
    m12*m1*m10*m7 - m0*m13*m10*m7 -  m8*m1*m14*m7 +  m0*m9*m14*m7 +
    m12*m5*m2*m11 - m4*m13*m2*m11 - m12*m1*m6*m11 + m0*m13*m6*m11 +
    m4*m1*m14*m11 - m0*m5*m14*m11 -  m8*m5*m2*m15 +  m4*m9*m2*m15 +
     m8*m1*m6*m15 -  m0*m9*m6*m15 - m4*m1*m10*m15 + m0*m5*m10*m15;

  /// Returns the trace of this matrix (sum of diagonal elements: m0 + m5 + m10 + m15).
  double trace() => m0 + m5 + m10 + m15;

  /// Decomposes this matrix into its translation, rotation, and scale components.
  ///
  /// Returns a record `(translation, rotation, scale)`. If the determinant
  /// is close to zero, [rotation] falls back to the identity quaternion.
  (Vector3 translation, Quaternion rotation, Vector3 scale) decompose() {
    late Vector3 translation;
    late Quaternion rotation;
    late Vector3 scale;

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
    Vector3 abc = .vec3(a, b, c);
    Vector3 def = .vec3(d, e, f);
    Vector3 ghi = .vec3(g, h, i);

    Vector3 s = .vec3(abc.length, def.length, ghi.length);
    if (det < 0) s = s.negate();
    scale = s;

    // Remove scale from the matrix if it is not close to zero
    Matrix clone = this.clone();
    if (!RaylibFunctions.FloatEquals(det, 0)) {
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

  /// Returns all 16 components as a flat list in column-major order by default.
  List<double> toArray({bool rowMajorOrder = false})
    => rowMajorOrder ? [
      m0, m4, m8, m12,
      m1, m5, m9, m13,
      m2, m6, m10, m14,
      m3, m7, m11, m15,
    ] : [
      m0, m1, m2, m3,
      m4, m5, m6, m7,
      m8, m9, m10, m11,
      m12, m13, m14, m15
    ];

  /// Returns all 16 components as a [float16] in column-major order by default.
  float16 toFloatV({bool rowMajorOrder = false})
    => .new(v: toArray(rowMajorOrder: rowMajorOrder));

  @override
  String signature() => '$structName(${toArray().map((x) => x.f1).join(', ')})';
}