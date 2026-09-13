part of '../../../raylib_dartified.dart';

// Light

extension LightCPEx on Pointer<LightC> {
  LightD toDart() => ref.toDart(this);
}

extension LightCEx on LightC {
  LightD toDart([Pointer<LightC>? ptr]) => .new(
    op: LightD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}