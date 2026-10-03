part of '../../../raylib_dartified.dart';

// Light

extension LightCPEx on Pointer<LightC> {
  Light toDart() => ref.toDart(this);
}

extension LightCEx on LightC {
  Light toDart([Pointer<LightC>? ptr]) => .new(
    op: Light.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}