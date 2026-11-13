import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibLightFlat get _module => RaylibBase.instance.module();

/// See [RaylibLightFlat.CreateLight].
Light CreateLight(
  int type,
  Vector3 position,
  Vector3 target,
  Color color,
  Shader shader,
) => _module.CreateLight(type, position, target, color, shader);

/// See [RaylibLightFlat.UpdateLightValues].
void UpdateLightValues(
  Shader shader,
  Light light,
) => _module.UpdateLightValues(shader, light);

