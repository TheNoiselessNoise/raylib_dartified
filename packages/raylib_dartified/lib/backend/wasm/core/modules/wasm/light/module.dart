part of '../../../backend.dart';

final class RaylibLight extends XPackageModuleWasm<Raylib> with RaylibLightModuleExtras {
  /// Create a light and get its shader locations
  late final XF6<void> CreateLight;
  /// Send light properties to shader
  late final XF2<void> UpdateLightValues;

  RaylibLight(super.pkg) {
    CreateLight       = swrap5('CreateLight');
    UpdateLightValues = dwrap2('UpdateLightValues');
  }
}