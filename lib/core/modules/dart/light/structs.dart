part of '../../../raylib_dartified.dart';

// Light

extension LightCPEx on Pointer<LightC> {
  LightD toD() => ref.toD(this);
}

extension LightCEx on LightC {
  LightD toD([Pointer<LightC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    type: .fromValue(type),
    enabled: enabled,
    position: position.toD(),
    target: target.toD(),
    color: color.toD(),
    attenuation: attenuation,
    enabledLoc: enabledLoc,
    typeLoc: typeLoc,
    positionLoc: positionLoc,
    targetLoc: targetLoc,
    colorLoc: colorLoc,
    attenuationLoc: attenuationLoc,
  );
}