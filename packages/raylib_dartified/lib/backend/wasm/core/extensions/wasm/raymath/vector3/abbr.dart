import 'package:raylib_dartified/backend/wasm/abbr/wasm.dart';

RaylibVector3Ext get _module => Raylib.instance.module();

/// See [RaylibVector3Ext.Vector3Add].
XF3<void> get Vector3Add => _module.Vector3Add;

/// See [RaylibVector3Ext.Vector3AddValue].
XF3<void> get Vector3AddValue => _module.Vector3AddValue;

/// See [RaylibVector3Ext.Vector3Angle].
XF2<double> get Vector3Angle => _module.Vector3Angle;

/// See [RaylibVector3Ext.Vector3Barycenter].
XF5<void> get Vector3Barycenter => _module.Vector3Barycenter;

/// See [RaylibVector3Ext.Vector3Clamp].
XF4<void> get Vector3Clamp => _module.Vector3Clamp;

/// See [RaylibVector3Ext.Vector3ClampValue].
XF4<void> get Vector3ClampValue => _module.Vector3ClampValue;

/// See [RaylibVector3Ext.Vector3CrossProduct].
XF3<void> get Vector3CrossProduct => _module.Vector3CrossProduct;

/// See [RaylibVector3Ext.Vector3CubicHermite].
XF6<void> get Vector3CubicHermite => _module.Vector3CubicHermite;

/// See [RaylibVector3Ext.Vector3Distance].
XF2<double> get Vector3Distance => _module.Vector3Distance;

/// See [RaylibVector3Ext.Vector3DistanceSqr].
XF2<double> get Vector3DistanceSqr => _module.Vector3DistanceSqr;

/// See [RaylibVector3Ext.Vector3Divide].
XF3<void> get Vector3Divide => _module.Vector3Divide;

/// See [RaylibVector3Ext.Vector3DotProduct].
XF2<double> get Vector3DotProduct => _module.Vector3DotProduct;

/// See [RaylibVector3Ext.Vector3Equals].
XF2<bool> get Vector3Equals => _module.Vector3Equals;

/// See [RaylibVector3Ext.Vector3Invert].
XF2<void> get Vector3Invert => _module.Vector3Invert;

/// See [RaylibVector3Ext.Vector3Length].
XF1<double> get Vector3Length => _module.Vector3Length;

/// See [RaylibVector3Ext.Vector3LengthSqr].
XF1<double> get Vector3LengthSqr => _module.Vector3LengthSqr;

/// See [RaylibVector3Ext.Vector3Lerp].
XF4<void> get Vector3Lerp => _module.Vector3Lerp;

/// See [RaylibVector3Ext.Vector3Max].
XF3<void> get Vector3Max => _module.Vector3Max;

/// See [RaylibVector3Ext.Vector3Min].
XF3<void> get Vector3Min => _module.Vector3Min;

/// See [RaylibVector3Ext.Vector3MoveTowards].
XF4<void> get Vector3MoveTowards => _module.Vector3MoveTowards;

/// See [RaylibVector3Ext.Vector3Multiply].
XF3<void> get Vector3Multiply => _module.Vector3Multiply;

/// See [RaylibVector3Ext.Vector3Negate].
XF2<void> get Vector3Negate => _module.Vector3Negate;

/// See [RaylibVector3Ext.Vector3Normalize].
XF2<void> get Vector3Normalize => _module.Vector3Normalize;

/// See [RaylibVector3Ext.Vector3One].
XF1<void> get Vector3One => _module.Vector3One;

/// See [RaylibVector3Ext.Vector3OrthoNormalize].
XF2<void> get Vector3OrthoNormalize => _module.Vector3OrthoNormalize;

/// See [RaylibVector3Ext.Vector3Perpendicular].
XF2<void> get Vector3Perpendicular => _module.Vector3Perpendicular;

/// See [RaylibVector3Ext.Vector3Project].
XF3<void> get Vector3Project => _module.Vector3Project;

/// See [RaylibVector3Ext.Vector3Reflect].
XF3<void> get Vector3Reflect => _module.Vector3Reflect;

/// See [RaylibVector3Ext.Vector3Refract].
XF4<void> get Vector3Refract => _module.Vector3Refract;

/// See [RaylibVector3Ext.Vector3Reject].
XF3<void> get Vector3Reject => _module.Vector3Reject;

/// See [RaylibVector3Ext.Vector3RotateByAxisAngle].
XF4<void> get Vector3RotateByAxisAngle => _module.Vector3RotateByAxisAngle;

/// See [RaylibVector3Ext.Vector3RotateByQuaternion].
XF3<void> get Vector3RotateByQuaternion => _module.Vector3RotateByQuaternion;

/// See [RaylibVector3Ext.Vector3Scale].
XF3<void> get Vector3Scale => _module.Vector3Scale;

/// See [RaylibVector3Ext.Vector3Subtract].
XF3<void> get Vector3Subtract => _module.Vector3Subtract;

/// See [RaylibVector3Ext.Vector3SubtractValue].
XF3<void> get Vector3SubtractValue => _module.Vector3SubtractValue;

/// See [RaylibVector3Ext.Vector3ToFloatV].
XF2<void> get Vector3ToFloatV => _module.Vector3ToFloatV;

/// See [RaylibVector3Ext.Vector3Transform].
XF3<void> get Vector3Transform => _module.Vector3Transform;

/// See [RaylibVector3Ext.Vector3Unproject].
XF4<void> get Vector3Unproject => _module.Vector3Unproject;

/// See [RaylibVector3Ext.Vector3Zero].
XF1<void> get Vector3Zero => _module.Vector3Zero;