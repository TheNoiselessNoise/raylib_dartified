part of '../../../raylib_dartified.dart';

/// Backend-agnostic contract for the Raylib Audio flat module.
///
/// Concrete platform implementations extend this to provide
/// the full API surface across different backends.
abstract class RaylibMatrixFlatExt extends XPackageModule<Raylib> {

  RaylibMatrixFlatExt(super.pkg);

  /// Compute matrix determinant
  double MatrixDeterminant(
    Matrix mat,
  );

  /// Get the trace of the matrix (sum of the values along the diagonal)
  double MatrixTrace(
    Matrix mat,
  );

  /// Transposes provided matrix
  Matrix MatrixTranspose(
    Matrix mat,
  );

  /// Invert provided matrix
  Matrix MatrixInvert(
    Matrix mat,
  );

  /// Get identity matrix
  Matrix MatrixIdentity();

  /// Add two matrices
  Matrix MatrixAdd(
    Matrix left,
    Matrix right,
  );

  /// Subtract two matrices (left - right)
  Matrix MatrixSubtract(
    Matrix left,
    Matrix right,
  );

  /// Get two matrix multiplication
  /// 
  /// NOTE: When multiplying matrices... the order matters!
  Matrix MatrixMultiply(
    Matrix left,
    Matrix right,
  );

  /// Multiply matrix components by value
  Matrix MatrixMultiplyValue(
    Matrix left,
    double value,
  );

  /// Get translation matrix
  Matrix MatrixTranslate(
    double x,
    double y,
    double z,
  );

  /// Create rotation matrix from axis and angle
  /// 
  /// NOTE: Angle should be provided in radians
  Matrix MatrixRotate(
    Vector3 axis,
    double angle,
  );

  /// Get x-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  Matrix MatrixRotateX(
    double angle,  
  );

  /// Get y-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  Matrix MatrixRotateY(
    double angle,
  );

  /// Get z-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  Matrix MatrixRotateZ(
    double angle,
  );

  /// Get xyz-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  Matrix MatrixRotateXYZ(
    Vector3 angle,
  );

  /// Get zyx-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  Matrix MatrixRotateZYX(
    Vector3 angle,
  );

  /// Get scaling matrix
  Matrix MatrixScale(
    double x,
    double y,
    double z,
  );

  /// Get perspective projection matrix
  Matrix MatrixFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  );

  /// Get perspective projection matrix
  ///
  /// NOTE: Fovy angle must be provided in radians
  Matrix MatrixPerspective(
    double fovY,
    double aspect,
    double nearPlane,
    double farPlane,
  );

  /// Get orthographic projection matrix
  Matrix MatrixOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double nearPlane,
    double farPlane,
  );

  /// Get camera look-at matrix (view matrix)
  Matrix MatrixLookAt(
    Vector3 eye,
    Vector3 target,
    Vector3 up,
  );

  /// Get float array of matrix data
  float16 MatrixToFloatV(
    Matrix mat,
  );

  /// Compose a transformation matrix from rotational, translational and scaling components
  Matrix MatrixCompose(
    Vector3 translation,
    Quaternion rotation,
    Vector3 scale,
  );

  /// Decompose a transformation matrix into its rotational, translational and scaling components and remove shear
  void MatrixDecompose(
    Matrix mat,
    XStructPtr<Vector3> translation,
    XStructPtr<Quaternion> rotation,
    XStructPtr<Vector3> scale,
  );
}