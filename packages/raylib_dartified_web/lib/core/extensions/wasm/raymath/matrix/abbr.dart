import 'package:raylib_dartified_web/raylib_dartified_web.dart';

RaylibMatrixExt get _module => Raylib.instance.module();

/// See [RaylibMatrixExt.MatrixDeterminant].
XF1<double> get MatrixDeterminant => _module.MatrixDeterminant;
/// See [RaylibMatrixExt.MatrixTrace].
XF1<double> get MatrixTrace => _module.MatrixTrace;
/// See [RaylibMatrixExt.MatrixTranspose].
XF2<void> get MatrixTranspose => _module.MatrixTranspose;
/// See [RaylibMatrixExt.MatrixInvert].
XF2<void> get MatrixInvert => _module.MatrixInvert;
/// See [RaylibMatrixExt.MatrixIdentity].
XF1<void> get MatrixIdentity => _module.MatrixIdentity;
/// See [RaylibMatrixExt.MatrixAdd].
XF3<void> get MatrixAdd => _module.MatrixAdd;
/// See [RaylibMatrixExt.MatrixSubtract].
XF3<void> get MatrixSubtract => _module.MatrixSubtract;
/// See [RaylibMatrixExt.MatrixMultiply].
XF3<void> get MatrixMultiply => _module.MatrixMultiply;
/// See [RaylibMatrixExt.MatrixMultiplyValue].
XF3<void> get MatrixMultiplyValue => _module.MatrixMultiplyValue;
/// See [RaylibMatrixExt.MatrixTranslate].
XF4<void> get MatrixTranslate => _module.MatrixTranslate;
/// See [RaylibMatrixExt.MatrixRotate].
XF3<void> get MatrixRotate => _module.MatrixRotate;
/// See [RaylibMatrixExt.MatrixRotateX].
XF2<void> get MatrixRotateX => _module.MatrixRotateX;
/// See [RaylibMatrixExt.MatrixRotateY].
XF2<void> get MatrixRotateY => _module.MatrixRotateY;
/// See [RaylibMatrixExt.MatrixRotateZ].
XF2<void> get MatrixRotateZ => _module.MatrixRotateZ;
/// See [RaylibMatrixExt.MatrixRotateXYZ].
XF2<void> get MatrixRotateXYZ => _module.MatrixRotateXYZ;
/// See [RaylibMatrixExt.MatrixRotateZYX].
XF2<void> get MatrixRotateZYX => _module.MatrixRotateZYX;
/// See [RaylibMatrixExt.MatrixScale].
XF4<void> get MatrixScale => _module.MatrixScale;
/// See [RaylibMatrixExt.MatrixFrustum].
XF7<void> get MatrixFrustum => _module.MatrixFrustum;
/// See [RaylibMatrixExt.MatrixPerspective].
XF5<void> get MatrixPerspective => _module.MatrixPerspective;
/// See [RaylibMatrixExt.MatrixOrtho].
XF7<void> get MatrixOrtho => _module.MatrixOrtho;
/// See [RaylibMatrixExt.MatrixLookAt].
XF4<void> get MatrixLookAt => _module.MatrixLookAt;
/// See [RaylibMatrixExt.MatrixToFloatV].
XF2<void> get MatrixToFloatV => _module.MatrixToFloatV;
/// See [RaylibMatrixExt.MatrixCompose].
XF4<void> get MatrixCompose => _module.MatrixCompose;
/// See [RaylibMatrixExt.MatrixDecompose].
XF4<void> get MatrixDecompose => _module.MatrixDecompose;