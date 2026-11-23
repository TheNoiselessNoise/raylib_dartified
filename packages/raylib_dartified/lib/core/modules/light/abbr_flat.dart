import 'package:raylib_dartified/raylib_dartified.dart';

RaylibLightFlat get _module => Raylib.instance.module();

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

