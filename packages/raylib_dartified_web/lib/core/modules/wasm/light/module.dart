part of '../../../raylib_dartified_web.dart';

final class RaylibLight extends RaylibModuleWasm with RaylibLightModuleExtras<Raylib> {
  /// Create a light and get its shader locations
  late final XF6<void> CreateLight;
  /// Send light properties to shader
  late final XF2<void> UpdateLightValues;

  RaylibLight(super.rl) {
    CreateLight       = swrap5('CreateLight');
    UpdateLightValues = dwrap2('UpdateLightValues');
  }
}