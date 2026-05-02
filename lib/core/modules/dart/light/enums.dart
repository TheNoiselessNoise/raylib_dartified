part of '../../../raylib.dart';

enum LightType {
  LIGHT_DIRECTIONAL(0),
  LIGHT_POINT(1);

  final int value;
  const LightType(this.value);

  static LightType fromValue(int value) => switch (value) {
    0 => LIGHT_DIRECTIONAL,
    1 => LIGHT_POINT,
    _ => throw ArgumentError('Unknown value for LightType: $value'),
  };
}
