import 'package:raylib_dartified/backend/wasm/abbr/wasm.dart';

RaylibLight get _module => Raylib.instance.module();

/// See [RaylibLight.CreateLight].
XF6<void> get CreateLight => _module.CreateLight;
/// See [RaylibLight.UpdateLightValues].
XF2<void> get UpdateLightValues => _module.UpdateLightValues;