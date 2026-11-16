part of '../../../../raylib_dartified_web.dart';

final class RaylibMatrixExt extends RaylibModuleWasm {
  /// Compute matrix determinant
  late final XF1<double> MatrixDeterminant;
  /// Get the trace of the matrix (sum of the values along the diagonal)
  late final XF1<double> MatrixTrace;
  /// Transposes provided matrix
  late final XF2<void> MatrixTranspose;
  /// Invert provided matrix
  late final XF2<void> MatrixInvert;
  /// Get identity matrix
  late final XF1<void> MatrixIdentity;
  /// Add two matrices
  late final XF3<void> MatrixAdd;
  /// Subtract two matrices (left - right)
  late final XF3<void> MatrixSubtract;
  /// Get two matrix multiplication
  /// 
  /// NOTE: When multiplying matrices... the order matters!
  late final XF3<void> MatrixMultiply;
  /// Multiply matrix components by value
  late final XF3<void> MatrixMultiplyValue;
  /// Get translation matrix
  late final XF4<void> MatrixTranslate;
  /// Create rotation matrix from axis and angle
  /// 
  /// NOTE: Angle should be provided in radians
  late final XF3<void> MatrixRotate;
  /// Get x-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  late final XF2<void> MatrixRotateX;
  /// Get y-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  late final XF2<void> MatrixRotateY;
  /// Get z-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  late final XF2<void> MatrixRotateZ;
  /// Get xyz-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  late final XF2<void> MatrixRotateXYZ;
  /// Get zyx-rotation matrix
  /// 
  /// NOTE: Angle must be provided in radians
  late final XF2<void> MatrixRotateZYX;
  /// Get scaling matrix
  late final XF4<void> MatrixScale;
  /// Get perspective projection matrix
  late final XF7<void> MatrixFrustum;
  /// Get perspective projection matrix
  ///
  /// NOTE: Fovy angle must be provided in radians
  late final XF5<void> MatrixPerspective;
  /// Get orthographic projection matrix
  late final XF7<void> MatrixOrtho;
  /// Get camera look-at matrix (view matrix)
  late final XF4<void> MatrixLookAt;
  /// Get float array of matrix data
  late final XF2<void> MatrixToFloatV;
  /// Compose a transformation matrix from rotational, translational and scaling components
  late final XF4<void> MatrixCompose;
  /// Decompose a transformation matrix into its rotational, translational and scaling components and remove shear
  late final XF4<void> MatrixDecompose;

  RaylibMatrixExt(super.rl) {
    MatrixDeterminant   = dwrap1('MatrixDeterminant');
    MatrixTrace         = dwrap1('MatrixTrace');
    MatrixTranspose     = swrap1('MatrixTranspose');
    MatrixInvert        = swrap1('MatrixInvert');
    MatrixIdentity      = swrap0('MatrixIdentity');
    MatrixAdd           = swrap2('MatrixAdd');
    MatrixSubtract      = swrap2('MatrixSubtract');
    MatrixMultiply      = swrap2('MatrixMultiply');
    MatrixMultiplyValue = swrap2('MatrixMultiplyValue');
    MatrixTranslate     = swrap3('MatrixTranslate');
    MatrixRotate        = swrap2('MatrixRotate');
    MatrixRotateX       = swrap1('MatrixRotateX');
    MatrixRotateY       = swrap1('MatrixRotateY');
    MatrixRotateZ       = swrap1('MatrixRotateZ');
    MatrixRotateXYZ     = swrap1('MatrixRotateXYZ');
    MatrixRotateZYX     = swrap1('MatrixRotateZYX');
    MatrixScale         = swrap3('MatrixScale');
    MatrixFrustum       = swrap6('MatrixFrustum');
    MatrixPerspective   = swrap4('MatrixPerspective');
    MatrixOrtho         = swrap6('MatrixOrtho');
    MatrixLookAt        = swrap3('MatrixLookAt');
    MatrixToFloatV      = swrap1('MatrixToFloatV');
    MatrixCompose       = swrap3('MatrixCompose');
    MatrixDecompose     = dwrap4('MatrixDecompose');
  }
}