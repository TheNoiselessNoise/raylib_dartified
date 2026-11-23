import 'package:raylib_dartified/backend/wasm/abbr/wasm.dart';

RaylibVector4Ext get _module => Raylib.instance.module();

/// See [RaylibVector4Ext.Vector4Add].
XF3<void> get Vector4Add => _module.Vector4Add;

/// See [RaylibVector4Ext.Vector4AddValue].
XF3<void> get Vector4AddValue => _module.Vector4AddValue;

/// See [RaylibVector4Ext.Vector4Distance].
XF2<double> get Vector4Distance => _module.Vector4Distance;

/// See [RaylibVector4Ext.Vector4DistanceSqr].
XF2<double> get Vector4DistanceSqr => _module.Vector4DistanceSqr;

/// See [RaylibVector4Ext.Vector4Divide].
XF3<void> get Vector4Divide => _module.Vector4Divide;

/// See [RaylibVector4Ext.Vector4DotProduct].
XF2<double> get Vector4DotProduct => _module.Vector4DotProduct;

/// See [RaylibVector4Ext.Vector4Equals].
XF2<bool> get Vector4Equals => _module.Vector4Equals;

/// See [RaylibVector4Ext.Vector4Invert].
XF2<void> get Vector4Invert => _module.Vector4Invert;

/// See [RaylibVector4Ext.Vector4Length].
XF1<double> get Vector4Length => _module.Vector4Length;

/// See [RaylibVector4Ext.Vector4LengthSqr].
XF1<double> get Vector4LengthSqr => _module.Vector4LengthSqr;

/// See [RaylibVector4Ext.Vector4Lerp].
XF4<void> get Vector4Lerp => _module.Vector4Lerp;

/// See [RaylibVector4Ext.Vector4Max].
XF3<void> get Vector4Max => _module.Vector4Max;

/// See [RaylibVector4Ext.Vector4Min].
XF3<void> get Vector4Min => _module.Vector4Min;

/// See [RaylibVector4Ext.Vector4MoveTowards].
XF4<void> get Vector4MoveTowards => _module.Vector4MoveTowards;

/// See [RaylibVector4Ext.Vector4Multiply].
XF3<void> get Vector4Multiply => _module.Vector4Multiply;

/// See [RaylibVector4Ext.Vector4Negate].
XF2<void> get Vector4Negate => _module.Vector4Negate;

/// See [RaylibVector4Ext.Vector4Normalize].
XF2<void> get Vector4Normalize => _module.Vector4Normalize;

/// See [RaylibVector4Ext.Vector4One].
XF1<void> get Vector4One => _module.Vector4One;

/// See [RaylibVector4Ext.Vector4Scale].
XF3<void> get Vector4Scale => _module.Vector4Scale;

/// See [RaylibVector4Ext.Vector4Subtract].
XF3<void> get Vector4Subtract => _module.Vector4Subtract;

/// See [RaylibVector4Ext.Vector4SubtractValue].
XF3<void> get Vector4SubtractValue => _module.Vector4SubtractValue;

/// See [RaylibVector4Ext.Vector4Zero].
XF1<void> get Vector4Zero => _module.Vector4Zero;