import 'package:raylib_dartified_web/raylib_dartified_web.dart';

RaylibLight get _module => Raylib.instance.module();

/// See [RaylibLight.CreateLight].
XF6<void> get CreateLight => _module.CreateLight;
/// See [RaylibLight.UpdateLightValues].
XF2<void> get UpdateLightValues => _module.UpdateLightValues;