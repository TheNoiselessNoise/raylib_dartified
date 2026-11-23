part of '../../../backend.dart';

// Light
extension LightCPEx on Pointer<LightC> { Light toDart() => .struct.ptr(XNativePtr(this)).ref; }
extension LightCEx on LightC { Light toDart(Pointer<LightC> ptr) => .struct.ptr(XNativePtr(ptr..ref = this)).ref; }