import 'package:raylib_dartified/raylib_dartified.dart';

RaylibLightFlatModule get _module => Raylib.instance.LightFlat;

/// See [RaylibLightFlat.CreateLight].
LightD CreateLight(
  int type,
  Vector3D position,
  Vector3D target,
  ColorD color,
  ShaderD shader,
) => _module.CreateLight(type, position, target, color, shader);

/// See [RaylibLightFlat.UpdateLightValues].
void UpdateLightValues(
  ShaderD shader,
  LightD light,
) => _module.UpdateLightValues(shader, light);

