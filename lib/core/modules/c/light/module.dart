// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib.dart';

// NOTE: we don't use rl.Temp on purpose to not make the logs *suspicious*

class RaylibLight extends RaylibModule {
  final List<Pointer<LightC>> _lights = [];

  final Pointer<Int8> _lightInt8ValuePtr = calloc<Int8>();
  final Pointer<Float> _lightFloat3ValuePtr = calloc<Float>(3);
  final Pointer<Float> _lightFloat4ValuePtr = calloc<Float>(4);
  
  RaylibLight(super.lib);

  @override
  void dispose() {
    super.dispose();
    _lights.forEach(calloc.free);
    calloc.free(_lightInt8ValuePtr);
    calloc.free(_lightFloat3ValuePtr);
    calloc.free(_lightFloat4ValuePtr);
  }

  LightC CreateLight(
    int type,
    Vector3C position,
    Vector3C target,
    ColorC color,
    ShaderC shader,
  ) {
    final light = calloc<LightC>();
    light.ref.enabled = true;
    light.ref.type = type;
    light.ref.position.setC(position);
    light.ref.target.setC(target);
    light.ref.color.setC(color);

    int index = _lights.length;
    light.ref.enabledLoc = rl.Core.GetShaderLocation(
      shader, rl.Temp.str("lights[$index].enabled"),
    );
    light.ref.typeLoc = rl.Core.GetShaderLocation(
      shader, rl.Temp.str("lights[$index].type"),
    );
    light.ref.positionLoc = rl.Core.GetShaderLocation(
      shader, rl.Temp.str("lights[$index].position"),
    );
    light.ref.targetLoc = rl.Core.GetShaderLocation(
      shader, rl.Temp.str("lights[$index].target"),
    );
    light.ref.colorLoc = rl.Core.GetShaderLocation(
      shader, rl.Temp.str("lights[$index].color"),
    );

    UpdateLightValues(shader, light.ref);

    _lights.add(light);

    return light.ref;
  }

  void UpdateLightValues(ShaderC shader, LightC light) {
    _lightInt8ValuePtr.value = light.enabled.toInt();
    rl.Core.SetShaderValue(
      shader,
      light.enabledLoc,
      _lightInt8ValuePtr.cast(),
      ShaderUniformDataType.SHADER_UNIFORM_INT.value
    );

    _lightInt8ValuePtr.value = light.type;
    rl.Core.SetShaderValue(
      shader,
      light.typeLoc,
      _lightInt8ValuePtr.cast(),
      ShaderUniformDataType.SHADER_UNIFORM_INT.value
    );

    _lightFloat3ValuePtr[0] = light.position.x;
    _lightFloat3ValuePtr[1] = light.position.y;
    _lightFloat3ValuePtr[2] = light.position.z;
    rl.Core.SetShaderValue(
      shader,
      light.positionLoc,
      _lightFloat3ValuePtr.cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value
    );

    _lightFloat3ValuePtr[0] = light.target.x;
    _lightFloat3ValuePtr[1] = light.target.y;
    _lightFloat3ValuePtr[2] = light.target.z;
    rl.Core.SetShaderValue(
      shader,
      light.targetLoc,
      _lightFloat3ValuePtr.cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value
    );

    _lightFloat4ValuePtr[0] = light.color.r / 255;
    _lightFloat4ValuePtr[1] = light.color.g / 255;
    _lightFloat4ValuePtr[2] = light.color.b / 255;
    _lightFloat4ValuePtr[3] = light.color.a / 255;
    rl.Core.SetShaderValue(
      shader,
      light.colorLoc,
      _lightFloat4ValuePtr.cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
    );
  }
}