part of '../../../raylib_dartified.dart';

// Light

extension LightCPEx on Pointer<LightC> {
  LightD toD() => ref.toD(this);
}

extension LightCEx on LightC {
  LightD toD([Pointer<LightC>? ptr]) => .new(
    op: LightD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}