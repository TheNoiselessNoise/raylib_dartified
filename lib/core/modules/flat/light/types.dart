part of '../../../raylib_dartified.dart';

// Light

extension LightCPEx on Pointer<LightC> {
  Light toDart() => .new(
    op: Light.struct.ptr(NativeMemoryPointer(this)),
  );
}

extension LightCEx on LightC {
  Light toDart(Pointer<LightC> ptr) => .new(
    op: Light.struct.ptr(NativeMemoryPointer(ptr..ref = this)),
  );
}