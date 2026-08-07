import 'package:raylib_dartified/raylib_dartified.dart';

RaylibLightD get _module => Raylib.instance.LightD;

/// See [RaylibLightD.CreateLight].
LightD CreateLight(
  LightType type,
  Vector3D position,
  Vector3D target,
  ColorD color,
  ShaderD shader,
) => _module.CreateLight(type, position, target, color, shader);

/// See [RaylibLightD.UpdateLightValues].
void UpdateLightValues(
  ShaderD shader,
  LightD light,
) => _module.UpdateLightValues(shader, light);

