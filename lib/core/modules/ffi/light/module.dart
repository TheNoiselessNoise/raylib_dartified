part of '../../../raylib_dartified.dart';

// `rlights.h` is not part of the raylib core
//  it purely exists as an external file in raylib repo.
//  That's why we need to literally re-implement these two functions.

// NOTE: we don't use rl.Temp on purpose to not make the logs *suspicious*
class RaylibLight extends RaylibModule<Raylib> with RaylibLightModuleExtras<Raylib> {
  final List<Pointer<LightC>> _lights = [];

  final Pointer<Int8> _int8Ptr = ffi.calloc<Int8>();
  final Pointer<Float> _float4Ptr = ffi.calloc<Float>(4);
  
  RaylibLight(super.rl);

  RaylibCore get _coreFfi => rl.module();

  @override
  @DoNotAbbreviate()
  void dispose() {
    super.dispose();
    _lights.forEach(ffi.calloc.free);
    ffi.calloc.free(_int8Ptr);
    ffi.calloc.free(_float4Ptr);
  }

  /// Create a light and get its shader locations
  LightC CreateLight(
    int type,
    Vector3C position,
    Vector3C target,
    ColorC color,
    ShaderC shader,
  ) {
    final light = ffi.calloc<LightC>();
    light.ref.enabled = true;
    light.ref.type = type;
    light.ref.position = position;
    light.ref.target = target;
    light.ref.color = color;

    int index = _lights.length;
    light.ref.enabledLoc = _coreFfi.GetShaderLocation(shader, String$.Value("lights[$index].enabled").asNativePointer());
    light.ref.typeLoc = _coreFfi.GetShaderLocation(shader, String$.Value("lights[$index].type").asNativePointer());
    light.ref.positionLoc = _coreFfi.GetShaderLocation(shader, String$.Value("lights[$index].position").asNativePointer());
    light.ref.targetLoc = _coreFfi.GetShaderLocation(shader, String$.Value("lights[$index].target").asNativePointer());
    light.ref.colorLoc = _coreFfi.GetShaderLocation(shader, String$.Value("lights[$index].color").asNativePointer());

    UpdateLightValues(shader, light.ref);

    _lights.add(light);

    return light.ref;
  }

  /// Send light properties to shader
  void UpdateLightValues(ShaderC shader, LightC light) {
    _int8Ptr.value = light.enabled.toInt();
    _coreFfi.SetShaderValue(shader, light.enabledLoc, _int8Ptr.cast(), ShaderUniformDataType.SHADER_UNIFORM_INT.value);

    _int8Ptr.value = light.type;
    _coreFfi.SetShaderValue(shader, light.typeLoc, _int8Ptr.cast(), ShaderUniformDataType.SHADER_UNIFORM_INT.value);

    _float4Ptr[0] = light.position.x;
    _float4Ptr[1] = light.position.y;
    _float4Ptr[2] = light.position.z;
    _coreFfi.SetShaderValue(shader, light.positionLoc, _float4Ptr.cast(), ShaderUniformDataType.SHADER_UNIFORM_VEC3.value);

    _float4Ptr[0] = light.target.x;
    _float4Ptr[1] = light.target.y;
    _float4Ptr[2] = light.target.z;
    _coreFfi.SetShaderValue(shader, light.targetLoc, _float4Ptr.cast(), ShaderUniformDataType.SHADER_UNIFORM_VEC3.value);

    _float4Ptr[0] = light.color.r / 255;
    _float4Ptr[1] = light.color.g / 255;
    _float4Ptr[2] = light.color.b / 255;
    _float4Ptr[3] = light.color.a / 255;
    _coreFfi.SetShaderValue(shader, light.colorLoc, _float4Ptr.cast(), ShaderUniformDataType.SHADER_UNIFORM_VEC4.value);
  }
}