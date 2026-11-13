part of '../../../raylib_dartified_base.dart';

/// Exposes Raylib's matrix math API as module-level functions by delegating
/// to the corresponding [Matrix] methods/factories.
/// Exists purely for Raylib API symmetry.
class RaylibMatrixExtDart<R extends RaylibBase> extends RaylibModule<R> {

  final _debugLabels = _RaylibMatrixExtDartDebugLabels();

  RaylibMatrixExtDart(super.rl);

  /// See [Matrix.determinant].
  double MatrixDeterminant(
    Matrix mat,
  ) => debugRun(
    () => _debugLabels.MatrixDeterminant(mat),
    () => mat.determinant(),
  );

  /// See [Matrix.trace].
  double MatrixTrace(
    Matrix mat,
  ) => debugRun(
    () => _debugLabels.MatrixTrace(mat),
    () => mat.trace(),
  );

  /// See [Matrix.transpose].
  Matrix MatrixTranspose(
    Matrix mat,
  ) => debugRun(
    () => _debugLabels.MatrixTranspose(mat),
    () => mat.transpose(),
  );

  /// See [Matrix.invert].
  Matrix MatrixInvert(
    Matrix mat,
  ) => debugRun(
    () => _debugLabels.MatrixInvert(mat),
    () => mat.invert(),
  );

  /// See [Matrix.identity].
  Matrix MatrixIdentity() => debugRun(
    () => _debugLabels.MatrixIdentity(),
    () => .identity(),
  );

  /// See [Matrix.add].
  Matrix MatrixAdd(
    Matrix left,
    Matrix right,
  ) => debugRun(
    () => _debugLabels.MatrixAdd(left, right),
    () => left.add(right),
  );

  /// See [Matrix.sub].
  Matrix MatrixSubtract(
    Matrix left,
    Matrix right,
  ) => debugRun(
    () => _debugLabels.MatrixSubtract(left, right),
    () => left.sub(right),
  );

  /// See [Matrix.mul].
  Matrix MatrixMultiply(
    Matrix left,
    Matrix right,
  ) => debugRun(
    () => _debugLabels.MatrixMultiply(left, right),
    () => left.mul(right),
  );

  /// See [Matrix.mulValue].
  Matrix MatrixMultiplyValue(
    Matrix left,
    double value,
  ) => debugRun(
    () => _debugLabels.MatrixMultiplyValue(left, value),
    () => left.mulValue(value),
  );

  /// See [Matrix.translate].
  Matrix MatrixTranslate(
    double x,
    double y,
    double z,
  ) => debugRun(
    () => _debugLabels.MatrixTranslate(x, y, z),
    () => .translate(x, y, z),
  );

  /// See [Matrix.rotateAngle].
  Matrix MatrixRotate(
    Vector3 axis,
    double angle,
  ) => debugRun(
    () => _debugLabels.MatrixRotate(axis, angle),
    () => .rotateAngle(axis, angle),
  );

  /// See [Matrix.rotateX].
  Matrix MatrixRotateX(
    double angle,
  ) => debugRun(
    () => _debugLabels.MatrixRotateX(angle),
    () => .rotateX(angle),
  );

  /// See [Matrix.rotateY].
  Matrix MatrixRotateY(
    double angle,
  ) => debugRun(
    () => _debugLabels.MatrixRotateY(angle),
    () => .rotateY(angle),
  );

  /// See [Matrix.rotateZ].
  Matrix MatrixRotateZ(
    double angle,
  ) => debugRun(
    () => _debugLabels.MatrixRotateZ(angle),
    () => .rotateZ(angle),
  );

  /// See [Matrix.rotateXYZ].
  Matrix MatrixRotateXYZ(
    Vector3 angle,
  ) => debugRun(
    () => _debugLabels.MatrixRotateXYZ(angle),
    () => .rotateXYZ(angle),
  );

  /// See [Matrix.rotateZYX].
  Matrix MatrixRotateZYX(
    Vector3 angle,
  ) => debugRun(
    () => _debugLabels.MatrixRotateZYX(angle),
    () => .rotateZYX(angle),
  );

  /// See [Matrix.scale].
  Matrix MatrixScale(
    double x,
    double y,
    double z,
  ) => debugRun(
    () => _debugLabels.MatrixScale(x, y, z),
    () => .scale(x, y, z),
  );

  /// See [Matrix.frustum].
  Matrix MatrixFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => debugRun(
    () => _debugLabels.MatrixFrustum(left, right, bottom, top, nearPlane, farPlane),
    () => .frustum(left, right, bottom, top, nearPlane, farPlane),
  );

  /// See [Matrix.perspective].
  Matrix MatrixPerspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  ) => debugRun(
    () => _debugLabels.MatrixPerspective(fovY, aspect, nearPlane, farPlane),
    () => .perspective(fovY, aspect, nearPlane, farPlane),
  );

  /// See [Matrix.ortho].
  Matrix MatrixOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  ) => debugRun(
    () => _debugLabels.MatrixOrtho(left, right, bottom, top, nearPlane, farPlane),
    () => .ortho(left, right, bottom, top, nearPlane, farPlane),
  );

  /// See [Matrix.lookAt].
  Matrix MatrixLookAt(
    Vector3 eye,
    Vector3 target,
    Vector3 up,
  ) => debugRun(
    () => _debugLabels.MatrixLookAt(eye, target, up),
    () => .lookAt(eye, target, up),
  );
  
  /// See [Matrix.toFloatV].
  float16 MatrixToFloatV(
    Matrix mat,
  ) => debugRun(
    () => _debugLabels.MatrixToFloatV(mat),
    () => mat.toFloatV(),
  );

  /// See [Matrix.compose].
  Matrix MatrixCompose(
    Vector3 translation,
    Quaternion rotation, 
    Vector3 scale,
  ) => debugRun(
    () => _debugLabels.MatrixCompose(translation, rotation, scale),
    () => .compose(translation, rotation, scale),
  );

  /// See [Matrix.decompose].
  (Vector3 translation, Quaternion rotation, Vector3 scale) MatrixDecompose(
    Matrix mat,
  ) => debugRun(
    () => _debugLabels.MatrixDecompose(mat),
    () => mat.decompose(),
  );
}