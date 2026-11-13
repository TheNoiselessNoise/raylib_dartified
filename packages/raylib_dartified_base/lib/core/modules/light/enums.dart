part of '../../raylib_dartified_base.dart';

/// `LightType`
enum LightType with XEnum {
  /// `LIGHT_DIRECTIONAL`
  LIGHT_DIRECTIONAL(0),
  /// `LIGHT_POINT`
  LIGHT_POINT(1);

  const LightType(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [LightType] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static LightType fromValue(int value) => switch (value) {
    0 => LIGHT_DIRECTIONAL,
    1 => LIGHT_POINT,
    _ => throw ArgumentError('Unknown value for $LightType: $value'),
  };
}
