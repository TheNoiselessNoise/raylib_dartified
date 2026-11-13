part of '../../raylib_dartified_base.dart';

class _RaylibLightDartDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibLightDart.CreateLight].
  String CreateLight(
    LightType type,
    Vector3 position,
    Vector3 target,
    Color color,
    Shader shader,
  ) => 'CreateLight(${type.name}, $position, $target, $color, $shader)';

  /// Label for [RaylibLightDart.UpdateLightValues].
  String UpdateLightValues(
    Shader shader,
    Light light,
  ) => 'UpdateLightValues($shader, $light)';
  
}
