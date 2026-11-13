import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibLightDart get _module => RaylibBase.instance.module();

/// See [RaylibLightDart.CreateLight].
Light CreateLight(
  LightType type,
  Vector3 position,
  Vector3 target,
  Color color,
  Shader shader,
) => _module.CreateLight(type, position, target, color, shader);

/// See [RaylibLightDart.UpdateLightValues].
void UpdateLightValues(
  Shader shader,
  Light light,
) => _module.UpdateLightValues(shader, light);
