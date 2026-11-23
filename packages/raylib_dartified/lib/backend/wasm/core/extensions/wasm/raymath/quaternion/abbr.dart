import 'package:raylib_dartified/backend/wasm/abbr/wasm.dart';

RaylibQuaternionExt get _module => Raylib.instance.module();

/// See [RaylibQuaternionExt.QuaternionAdd].
XF3<void> get QuaternionAdd => _module.QuaternionAdd;
/// See [RaylibQuaternionExt.QuaternionAddValue].
XF3<void> get QuaternionAddValue => _module.QuaternionAddValue;
/// See [RaylibQuaternionExt.QuaternionCubicHermiteSpline].
XF6<void> get QuaternionCubicHermiteSpline => _module.QuaternionCubicHermiteSpline;
/// See [RaylibQuaternionExt.QuaternionDivide].
XF3<void> get QuaternionDivide => _module.QuaternionDivide;
/// See [RaylibQuaternionExt.QuaternionEquals].
XF2<bool> get QuaternionEquals => _module.QuaternionEquals;
/// See [RaylibQuaternionExt.QuaternionFromAxisAngle].
XF3<void> get QuaternionFromAxisAngle => _module.QuaternionFromAxisAngle;
/// See [RaylibQuaternionExt.QuaternionFromEuler].
XF4<void> get QuaternionFromEuler => _module.QuaternionFromEuler;
/// See [RaylibQuaternionExt.QuaternionFromMatrix].
XF2<void> get QuaternionFromMatrix => _module.QuaternionFromMatrix;
/// See [RaylibQuaternionExt.QuaternionFromVector3ToVector3].
XF3<void> get QuaternionFromVector3ToVector3 => _module.QuaternionFromVector3ToVector3;
/// See [RaylibQuaternionExt.QuaternionIdentity].
XF1<void> get QuaternionIdentity => _module.QuaternionIdentity;
/// See [RaylibQuaternionExt.QuaternionInvert].
XF2<void> get QuaternionInvert => _module.QuaternionInvert;
/// See [RaylibQuaternionExt.QuaternionLength].
XF1<double> get QuaternionLength => _module.QuaternionLength;
/// See [RaylibQuaternionExt.QuaternionLerp].
XF4<void> get QuaternionLerp => _module.QuaternionLerp;
/// See [RaylibQuaternionExt.QuaternionMultiply].
XF3<void> get QuaternionMultiply => _module.QuaternionMultiply;
/// See [RaylibQuaternionExt.QuaternionNlerp].
XF4<void> get QuaternionNlerp => _module.QuaternionNlerp;
/// See [RaylibQuaternionExt.QuaternionNormalize].
XF2<void> get QuaternionNormalize => _module.QuaternionNormalize;
/// See [RaylibQuaternionExt.QuaternionScale].
XF3<void> get QuaternionScale => _module.QuaternionScale;
/// See [RaylibQuaternionExt.QuaternionSlerp].
XF4<void> get QuaternionSlerp => _module.QuaternionSlerp;
/// See [RaylibQuaternionExt.QuaternionSubtract].
XF3<void> get QuaternionSubtract => _module.QuaternionSubtract;
/// See [RaylibQuaternionExt.QuaternionSubtractValue].
XF3<void> get QuaternionSubtractValue => _module.QuaternionSubtractValue;
/// See [RaylibQuaternionExt.QuaternionToAxisAngle].
XF3<void> get QuaternionToAxisAngle => _module.QuaternionToAxisAngle;
/// See [RaylibQuaternionExt.QuaternionToEuler].
XF2<void> get QuaternionToEuler => _module.QuaternionToEuler;
/// See [RaylibQuaternionExt.QuaternionToMatrix].
XF2<void> get QuaternionToMatrix => _module.QuaternionToMatrix;
/// See [RaylibQuaternionExt.QuaternionTransform].
XF3<void> get QuaternionTransform => _module.QuaternionTransform;