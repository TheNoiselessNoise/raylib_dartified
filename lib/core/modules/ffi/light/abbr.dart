import 'package:raylib_dartified/raylib_dartified.dart';

RaylibLight get _module => Raylib.instance.Light;

/// See [RaylibLight.CreateLight].
LightC CreateLight(
  int type,
  Vector3C position,
  Vector3C target,
  ColorC color,
  ShaderC shader,
) => _module.CreateLight(type, position, target, color, shader);

/// See [RaylibLight.UpdateLightValues].
void UpdateLightValues(ShaderC shader, LightC light) => _module.UpdateLightValues(shader, light);

