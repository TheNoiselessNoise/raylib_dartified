part of '../../../raylib_dartified.dart';

// Light

extension LightCPEx on Pointer<LightC> {
  Light toDart() => .new(
    op: Light.struct.ptr(XNativePtr(this)),
  );
}

extension LightCEx on LightC {
  Light toDart(Pointer<LightC> ptr) => .new(
    op: Light.struct.ptr(XNativePtr(ptr..ref = this)),
  );
}